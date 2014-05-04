//
//  KVViewController.h
//  JsonAndListTest
//
//  Created by Klaus Villaca on 23/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KVDetailsJSON.h"

@interface KVViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    KVDetailsJSON *myJsonAsObject;
    NSDictionary *activityDictionary;
    //NSArray *activityListDescendingOrder;
    NSArray *activityListKeys;
    
    IBOutlet UILabel *accDetails;
    IBOutlet UILabel *todaysDate;
    IBOutlet UITableView *transactionsTable;
}

@end
