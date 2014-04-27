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

@implementation KVTransactionsTable

//-(UITableViewCell *) pupulateCellWithTransactions:(NSArray *)transactionArray andPendings:(NSArray *)pendingArray
//{
//
//}

-(NSDictionary *) getDictionaryToOrderByDateMergingTransactions:(NSArray *)transactionArray andPendings:(NSArray *)pendingArray
{
    NSMutableDictionary *dictionaryToReturn = [[NSMutableDictionary alloc] init];
    NSMutableArray *arrayGrouped;
    
    for (KVTransactions *transaction in transactionArray) {
        if (![dictionaryToReturn valueForKey:transaction.dateTransaction]) {
            arrayGrouped = [[NSMutableArray alloc] init];
            [arrayGrouped addObject:transaction];
        } else {
            arrayGrouped = [[NSMutableArray alloc] initWithArray:[dictionaryToReturn valueForKey:transaction.dateTransaction]];
            [arrayGrouped addObject:transaction];
            
        }
        [dictionaryToReturn setObject:arrayGrouped forKey:transaction.dateTransaction];
        arrayGrouped = nil;
    }
    
    for (KVPending *pending in pendingArray) {
        if (![dictionaryToReturn valueForKey:pending.dateTransaction]) {
            arrayGrouped = [[NSMutableArray alloc] init];
            [arrayGrouped addObject:pending];
        } else {
            arrayGrouped = [[NSMutableArray alloc] initWithArray:[dictionaryToReturn valueForKey:pending.dateTransaction]];
            [arrayGrouped addObject:pending];
            
        }
        [dictionaryToReturn setObject:arrayGrouped forKey:pending.dateTransaction];
        arrayGrouped = nil;
    }
    [dictionaryToReturn setObject:nil forKey:nil];
    return dictionaryToReturn;
}

@end
