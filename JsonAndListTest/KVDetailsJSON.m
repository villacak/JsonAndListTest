//
//  KVDetailsJSON.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVDetailsJSON.h"

@implementation KVDetailsJSON

-(id) initWithValueKVAccount:(KVAccount *)account
           valueTransactions:(NSArray *)transactionsArray
                valuePending:(NSArray *)pendingArray
{
    self = [super init];
    if (self) {
        [self setAccount:account];
        [self setTransactionsArray:transactionsArray];
        [self setPendingArray:pendingArray];
    }
    return self;
}

@end
