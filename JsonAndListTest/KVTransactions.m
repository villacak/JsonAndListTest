//
//  KVTransactions.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVTransactions.h"

@implementation KVTransactions

-(id) initWithValueIdTransaction:(NSString *)idTransaction
            valueDateTransaction:(NSString *)dateTransaction
                valueDescription:(NSString *)description
                     valueAmount:(NSNumber *)amount
{
    self = [super init];
    if (self) {
        [self setIdTransaction:idTransaction];
        [self setDateTransaction:dateTransaction];
        [self setDescription:description];
        [self setAmount:amount];
    }
    return self;
}

@end
