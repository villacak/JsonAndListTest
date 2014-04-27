//
//  KVTransactionsHeaderScreen.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 25/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVTransactionsHeaderScreen.h"
#import "KVStringUtil.h"

@implementation KVTransactionsHeaderScreen


-(NSString *)getHeaderDetails:(KVAccount *)account
{
    kvUtils = [[KVStringUtil alloc] init];
    NSString *newLine = @"\n";
    NSString *nameAccount = [account.accountName stringByAppendingString:newLine];
    NSString *numberAcc = [account.accountNumber stringByAppendingString:newLine];
    NSString *balanceFormatted = [kvUtils getNumberValueAsFormattedString:account.balance];
    NSString *balance = [[@"Balance :$" stringByAppendingString:balanceFormatted] stringByAppendingString:newLine];
    NSString *availableFormatted = [kvUtils getNumberValueAsFormattedString:account.available];
    NSString *availableValue = [[@"Available :$" stringByAppendingString:availableFormatted] stringByAppendingString:newLine];
    
    NSMutableString *strToReturn = [[NSMutableString alloc] init];
    [strToReturn appendString:nameAccount];
    [strToReturn appendString:numberAcc];
    [strToReturn appendString:balance];
    [strToReturn appendString:availableValue];
    
    newLine = nil;
    nameAccount = nil;
    numberAcc = nil;
    balanceFormatted = nil;
    balance = nil;
    availableFormatted = nil;
    availableValue = nil;
    
    return strToReturn;
}



-(NSString *)getHeaderTodayDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    
    // I'm using this formater to get the device date settings - locale
    //    [formatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"dd MM"
    //                                                             options:0
    //                                                              locale:[NSLocale currentLocale]]];
    NSString *todayDate = [formatter stringFromDate:[NSDate date]];
    return todayDate;
}

@end
