//
//  KVStringUtil.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 27/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVStringUtil.h"

@implementation KVStringUtil

+(NSString *) convertNumberValueToValueWithDecimals:(NSNumber *)valueNumber
{
    NSString *numberAsStringFormatted = [NSString stringWithFormat:@"%.2f", [valueNumber doubleValue]];
    return numberAsStringFormatted;
}


+(NSDate *) convertStringToDate:(NSString *)dateString
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/yyyy"];
    NSDate *myDate = [df dateFromString: dateString];
    return myDate;
}


+(NSString *) convertDateToString:(NSDate *)date
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/yyyy"];
    NSString *myStrDate = [df stringFromDate:date];
    return myStrDate;
}


@end
