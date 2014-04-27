//
//  KVParserDetail.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVParserDetail.h"

@implementation KVParserDetail

@synthesize details, account, transactions, pending;

- (KVDetailsJSON *)parseJSON:(NSString *)jsonStr
{
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonStr];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    
    NSDictionary *accountDictionary = [json objectForKey:@"account"];
    NSDictionary *trasactionDictionary = [json objectForKey:@"transactions"];
    NSDictionary *pendingDictionary = [json objectForKey:@"pending"];
    
    details = [[KVDetailsJSON alloc] init];
    
    [self parseAccount:accountDictionary];
    [self parseTransactions:trasactionDictionary] ;
    [self parsePending:pendingDictionary];
    
    pendingDictionary = nil;
    trasactionDictionary = nil;
    accountDictionary = nil;
    json = nil;
    jsonData = nil;
    
    return details;
}


-(void) parseAccount:(NSDictionary *)jsonAccountDic
{
    account = [[KVAccount alloc] initWithValueAccountName:[jsonAccountDic valueForKey:@"accountName"]
                                       valueAccountNumber:[jsonAccountDic valueForKey:@"accountNumber"]
                                           valueAvailable:[jsonAccountDic valueForKey:@"available"]
                                             valueBalance:[jsonAccountDic valueForKey:@"balance"]];
    
    if (account != nil && [account.accountNumber length] > 0 ) {
        details.account = account;
    }
    account = nil;
}


- (void)parseTransactions:(NSDictionary *)jsonTRansactions
{
    if ([jsonTRansactions count] > 0) {
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        KVTransactions *tempTransaction = nil;
        for (NSDictionary *trans in jsonTRansactions) {
            tempTransaction = [[KVTransactions alloc] initWithValueIdTransaction:[trans valueForKey:@"id"]
                                                            valueDateTransaction:[trans valueForKey:@"dateTransaction"]
                                                                valueDescription:[trans valueForKey:@"description"]
                                                                     valueAmount:[trans valueForKey:@"amount"]];
            [tempArray addObject:trans];
        }
        details.transactionsArray = [[NSArray alloc] initWithArray:tempArray];
        tempTransaction = nil;
        tempArray = nil;
        
    }
}


- (void)parsePending:(NSDictionary *)jsonPending
{
    if ([jsonPending count] > 0) {
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        KVPending *tempPending = nil;
        for (NSDictionary *tempDic in jsonPending) {
            tempPending = [[KVPending alloc] initWithValueIdPending:[tempDic valueForKey:@"id"]
                                                   valueDescription:[tempDic valueForKey:@"description"]
                                               valueDateTransaction:[tempDic valueForKey:@"dateTransaction"]
                                                        valueAmount:[tempDic valueForKey:@"amount"]];
            [tempArray addObject:tempPending];
        }
        details.pendingArray = [[NSArray alloc] initWithArray:tempArray];
        tempPending = nil;
        tempArray = nil;
    }
}

@end
