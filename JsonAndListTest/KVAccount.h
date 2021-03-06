//
//  KVAccount.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVAccount : NSObject

@property NSString *accountName;
@property NSString *accountNumber;
@property NSNumber *available;
@property NSNumber *balance;

-(id) initWithValueAccountName:(NSString *)accountName
             valueAccountNumber:(NSString *)accountNumber
                 valueAvailable:(NSNumber *)available
                  valueBalance:(NSNumber *)balance;

@end
