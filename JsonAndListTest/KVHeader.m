//
//  KVHeader.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 7/05/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVHeader.h"

@implementation KVHeader


-(id) initWithDateAsString:(NSString *)dateStr
         valueDaysAsString:(NSString *)numberOfDays
{
    self = [super init];
    if (self) {
        [self setDateStr:dateStr];
        [self setDateStr:numberOfDays];
    }
    return self;
}

@end
