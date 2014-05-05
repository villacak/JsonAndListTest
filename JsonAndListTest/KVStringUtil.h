//
//  KVStringUtil.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 27/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVStringUtil : NSObject

+(NSString *) convertNumberValueToValueWithDecimals:(NSNumber *)valueNumber;

+(NSString *) convertSecondsToDate:(NSString *)secondsAsString;

+(NSDate *) convertStringToDate:(NSString *)dateString;

+(NSString *) convertDateToString:(NSDate *)date;

+(NSString *) getNumberOfDaysFromStartDate:(NSString *)startDate toEndDate:(NSString *)endDate;

@end
