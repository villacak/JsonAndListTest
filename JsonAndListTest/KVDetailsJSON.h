//
//  KVDetailsJSON.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVAccount.h"

@interface KVDetailsJSON : NSObject

@property KVAccount *account;
@property NSArray *transactionsArray;
@property NSArray *pendingArray;

-(id) initWithValueKVAccount:(KVAccount *)account
           valueTransactions:(NSArray *)transactionsArray
                valuePending:(NSArray *)pendingArry;

@end
