//
//  KVTransactionsTable.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 27/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVDetailsJSON.h"

@interface KVTransactionsTable : NSObject
{
    UITableView *transactionsTable;
    UITableViewCell *transactionCell;
    KVDetailsJSON *details;
}


-(NSDictionary *) createDictionaryMergingTransactions:(NSArray *)transactionArray andPendings:(NSArray *)pendingArray;

//-(NSDictionary *) createFlatDictionaryMergingTransactions:(NSArray *)transactionArray andPendings:(NSArray *)pendingArrays;



@end
