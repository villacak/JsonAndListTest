//
//  KVParserDetail.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 22/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVDetailsJSON.h"
#import "KVAccount.h"
#import "KVTransactions.h"
#import "KVPending.h"

@interface KVParserDetail : NSObject

@property KVDetailsJSON *details;
@property KVAccount *account;
@property KVTransactions *transactions;
@property KVPending *pending;

@property NSArray *mutableArray;
@property NSDictionary *tempDictionary;


-(KVDetailsJSON *)parseJSON:(NSString *)jsonStr;

-(void)parseAccount:(NSDictionary *)jsonAccount;
-(void)parseTransactions:(NSDictionary *)jsonTRansactions;
-(void)parsePending:(NSDictionary *)jsonPending;


@end
