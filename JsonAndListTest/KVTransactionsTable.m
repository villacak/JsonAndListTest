//
//  KVTransactionsTable.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 27/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVTransactionsTable.h"
#import "KVTransactions.h"
#import "KVPending.h"
#import "KVStringUtil.h"

@implementation KVTransactionsTable


-(NSDictionary *) createDictionaryMergingTransactions:(NSArray *)transactionArray andPendings:(NSArray *)pendingArray
{
    NSMutableDictionary *dictionaryToReturn = [[NSMutableDictionary alloc] init];
    NSMutableArray *arrayGrouped;
    
    KVTransactions *kvTransactions = nil;
    KVPending *kvPendings = nil;
    
    NSString *tempDateAsSeconds = nil;
    NSDate *tempDate = nil;
    
    for (NSArray *transactionLoop in transactionArray) {
        kvTransactions = [[KVTransactions alloc] initWithValueIdTransaction:[transactionLoop valueForKey:@"idTransaction"]
                                                       valueDateTransaction:[transactionLoop valueForKey:@"dateTransaction"]
                                                           valueDescription:[transactionLoop valueForKey:@"description"]
                                                                valueAmount:[transactionLoop valueForKey:@"amount"]];
        
        tempDate = [KVStringUtil convertStringToDate:kvTransactions.dateTransaction];
        double intervalInSecs = [tempDate timeIntervalSince1970];
        tempDateAsSeconds = [NSString stringWithFormat:@"%f", intervalInSecs];
        if ([dictionaryToReturn objectForKey:tempDateAsSeconds] != nil) {
            arrayGrouped = [[NSMutableArray alloc] initWithArray:[dictionaryToReturn valueForKey:tempDateAsSeconds]];
            [arrayGrouped addObject:kvTransactions];
        } else {
            arrayGrouped = [[NSMutableArray alloc] init];
            [arrayGrouped addObject:kvTransactions];
        }
        [dictionaryToReturn setObject:arrayGrouped forKey:tempDateAsSeconds];
        tempDate = nil;
        tempDateAsSeconds = nil;
        arrayGrouped = nil;
        kvTransactions = nil;
    }
    
    
    for (NSArray *pendingLoop in pendingArray) {
        kvPendings = [[KVPending alloc] initWithValueIdPending:[pendingLoop valueForKey:@"idPending"]
                                              valueDescription:[pendingLoop valueForKey:@"description"]
                                          valueDateTransaction:[pendingLoop valueForKey:@"dateTransaction"]
                                                   valueAmount:[pendingLoop valueForKey:@"amount"]];
        
        tempDate = [KVStringUtil convertStringToDate:kvPendings.dateTransaction];
        double intervalInSecs = [tempDate timeIntervalSince1970];
        tempDateAsSeconds = [NSString stringWithFormat:@"%f", intervalInSecs];
        if ([dictionaryToReturn objectForKey:tempDateAsSeconds] != nil) {
            arrayGrouped = [[NSMutableArray alloc] initWithArray:[dictionaryToReturn valueForKey:tempDateAsSeconds]];
            [arrayGrouped addObject:kvPendings];
        } else {
            arrayGrouped = [[NSMutableArray alloc] init];
            [arrayGrouped addObject:kvPendings];
            
        }
        [dictionaryToReturn setObject:arrayGrouped forKey:tempDateAsSeconds];
        tempDate = nil;
        tempDateAsSeconds = nil;
        arrayGrouped = nil;
        kvPendings = nil;
    }
    return dictionaryToReturn;
}

@end
