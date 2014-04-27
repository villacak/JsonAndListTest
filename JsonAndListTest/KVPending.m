//
//  KVPending.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVPending.h"

@implementation KVPending

-(id) initWithValueIdPending:(NSString *)idPending
            valueDescription:(NSString *)description
        valueDateTransaction:(NSString *)dateTransaction
                 valueAmount:(NSNumber *)amount
{
    self = [super init];
    if (self) {
        [self setIdPending:idPending];
        [self setDescription:description];
        [self setDateTransaction:dateTransaction];
        [self setAmount:amount];
    }
    return self;
}

@end
