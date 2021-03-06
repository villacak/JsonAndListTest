//
//  KVTransactions.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVTransactions : NSObject

@property NSString *idTransaction;
@property NSString *dateTransaction;
@property NSString *description;
@property NSNumber *amount;

-(id) initWithValueIdTransaction:(NSString *)idTransaction
            valueDateTransaction:(NSString *)dateTransaction
                valueDescription:(NSString *)description
                     valueAmount:(NSNumber *)amount;

@end
