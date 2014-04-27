//
//  KVAccount.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVAccount.h"

@implementation KVAccount

-(id)initWithValueAccountName:(NSString *)accountName valueAccountNumber:(NSString *)accountNumber valueAvailable:(NSNumber *)available valueBalance:(NSNumber *)balance
{
    self = [super init];
    if (self) {
        [self setAccountName:accountName];
        [self setAccountNumber:accountNumber];
        [self setAvailable:available];
        [self setBalance:balance];
        
    }
    return self;
}

@end
