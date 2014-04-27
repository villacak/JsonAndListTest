//
//  KVStringUtil.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 27/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVStringUtil.h"

@implementation KVStringUtil

//-(id) initWithNumberValueForFormattWithDecimals:(NSNumber *)valueNumber
//{
//    self = [super init];
//    if (self) {
//        numberAsStringFormatted = [NSString stringWithFormat:@"%.2f", valueNumber];
//    }
//    return numberAsStringFormatted;
//}

-(NSString *) getNumberValueAsFormattedString:(NSNumber *)valueNumber
{
    numberAsStringFormatted = [NSString stringWithFormat:@"%.2f", [valueNumber doubleValue]];
    return numberAsStringFormatted;
}

@end
