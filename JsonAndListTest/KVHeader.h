//
//  KVHeader.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 7/05/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVHeader : NSObject

@property NSString *dateStr;
@property NSString *numberOfDays;

-(id) initWithDateAsString:(NSString *)dateStr
         valueDaysAsString:(NSString *)numberOfDays;

@end
