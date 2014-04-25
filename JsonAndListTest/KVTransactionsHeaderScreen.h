//
//  KVTransactionsHeaderScreen.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 25/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVAccount.h"

@interface KVTransactionsHeaderScreen : NSObject


-(NSString *) getHeaderDetails:(KVAccount *)account;
-(NSString *) getHeaderTodayDate;

@end
