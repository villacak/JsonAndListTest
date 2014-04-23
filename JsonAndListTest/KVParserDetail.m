//
//  KVParserDetail.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVParserDetail.h"

@implementation KVParserDetail

@synthesize details, account, transactions, pending, mutableArray, tempDictionary;

- (KVDetailsJSON *)parseJSON:(NSString *)jsonStr
{
    
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonStr];
//    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    
    NSDictionary *accountDictionary = [json objectForKey:@"account"];
    NSDictionary *trasactionDictionary = [json objectForKey:@"transactions"];
    NSDictionary *pendingDictionary = [json objectForKey:@"pending"];
    
    details = [[KVDetailsJSON alloc] init];
    
    [self parseAccount:accountDictionary];
    [self parseTransactions:trasactionDictionary] ;
    [self parsePending:pendingDictionary];
    
    return details;
}


-(void) parseAccount:(NSDictionary *)jsonAccountDic
{
    account = [[KVAccount alloc] init];
    account.accountName = [jsonAccountDic valueForKey:@"accountName"];
    account.accountNumber = [jsonAccountDic valueForKey:@"accountNumber"];
    account.available = [jsonAccountDic valueForKey:@"available"];
    account.balance = [jsonAccountDic valueForKey:@"balance"];
    
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
            tempTransaction = [[KVTransactions alloc] init];
            tempTransaction.idTransaction = [trans valueForKey:@"id"];
            tempTransaction.description = [trans valueForKey:@"description"];
            tempTransaction.dateTransaction = [trans valueForKey:@"dateTransaction"];
            tempTransaction.amount = [trans valueForKey:@"amount"];
            [tempArray addObject:trans];
        }
        details.transactionsArray = [[NSArray alloc] initWithArray:tempArray];
        tempArray = nil;
        tempTransaction = nil;
        
    }
}


- (void)parsePending:(NSDictionary *)jsonPending
{
    if ([jsonPending count] > 0) {
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        KVPending *tempPending = nil;
        for (NSDictionary *tempDic in jsonPending) {
            tempPending = [[KVPending alloc] init];
            tempPending.idPending = [tempDic valueForKey:@"id"];
            tempPending.description = [tempDic valueForKey:@"description"];
            tempPending.dateTransaction = [tempDic valueForKey:@"dateTransaction"];
            tempPending.amount = [tempDic valueForKey:@"amount"];
            [tempArray addObject:tempPending];
        }
        details.pendingArray = [[NSArray alloc] initWithArray:tempArray];
        tempPending = nil;
        tempArray = nil;
    }
}

@end
