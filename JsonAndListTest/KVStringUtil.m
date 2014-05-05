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

+(NSString *) convertSecondsToDate:(NSString *)secondsAsString
{
    NSTimeInterval timeInterval = (NSTimeInterval)[secondsAsString doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *stringDate = [KVStringUtil convertDateToString:date];
    return stringDate;
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


+(NSString *) getNumberOfDaysFromStartDate:(NSString *)startDateStr toEndDate:(NSString *)endDateStr
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [f dateFromString:startDateStr];
    NSDate *endDate = [f dateFromString:endDateStr];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];
    NSString *daysNumberToReturn =  [NSString stringWithFormat:@"%d", [components day]];
    return daysNumberToReturn;
}


@end
