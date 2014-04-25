//
//  KVTransactionsHeaderScreen.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 25/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVTransactionsHeaderScreen.h"

@implementation KVTransactionsHeaderScreen


-(NSString *)getHeaderDetails:(KVAccount *)account
{
    NSString *newLine = @"\n";
    NSString *nameAccount = [account.accountName stringByAppendingString:newLine];
    NSString *numberAcc = [account.accountNumber stringByAppendingString:newLine];
    NSString *balancaDouble = [NSString stringWithFormat:@"%@", account.balance];
    NSString *balance = [[@"Balance :" stringByAppendingString:balancaDouble] stringByAppendingString:newLine];
    NSString *availableDouble = [NSString stringWithFormat:@"%@", account.available];
    NSString *availableValue = [[@"Available :" stringByAppendingString:availableDouble] stringByAppendingString:newLine];
    
    NSMutableString *strToReturn = [[NSMutableString alloc] init];
    [strToReturn appendString:nameAccount];
    [strToReturn appendString:numberAcc];
    [strToReturn appendString:balance];
    [strToReturn appendString:availableValue];
    
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
