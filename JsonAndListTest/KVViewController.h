//
//  KVViewController.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 23/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KVDetailsJSON.h"

@interface KVViewController : UIViewController
{
    KVDetailsJSON *myJsonAsObject;
    NSDictionary *activityDictionary;
    NSArray *activityListDescendingOrder;
    
    IBOutlet UILabel *accDetails;
    IBOutlet UILabel *todaysDate;
    IBOutlet UITableView *transactionsTable;
}

@end
