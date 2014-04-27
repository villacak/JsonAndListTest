//
//  KVStringUtil.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 27/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVStringUtil : NSObject
{
    NSString *numberAsStringFormatted;
}

//-(id) initWithNumberValueForFormattWithDecimals:(NSNumber *)valueNumber;

-(NSString *) getNumberValueAsFormattedString:(NSNumber *)valueNumber;

@end
