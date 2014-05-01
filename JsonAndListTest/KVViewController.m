//
//  KVViewController.m
//  JsonAndListTest
//
//  Created by Klaus Villaca on 23/04/2014.
//  Copyright (c) 2014 Own. All rights reserved.
//

#import "KVViewController.h"
#import "KVDetailsJSON.h"
#import "KVParserDetail.h"
#import "KVTransactionsHeaderScreen.h"
#import "KVTransactionsTable.h"

@interface KVViewController ()

@end



@implementation KVViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString *pathJsonFromFile = [[NSBundle mainBundle] pathForResource:@"dummy" ofType:@"json"];
        myJsonAsObject = [[[KVParserDetail alloc] init] parseJSON:pathJsonFromFile];
        KVTransactionsTable *transactionTable = [[KVTransactionsTable alloc] init];
        activityDictionary = [transactionTable createDictionaryMergingTransactions:myJsonAsObject.transactionsArray
                                                                       andPendings:myJsonAsObject.pendingArray];
        
        // Reverse order still not working
        activityListKeys = [activityDictionary allKeys];
        activityListDescendingOrder = [activityListKeys sortedArrayUsingComparator:^(id obj1, id obj2) {
            return [obj2 compare:obj1 options:NSNumericSearch];
        }];
        pathJsonFromFile = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    KVTransactionsHeaderScreen *headerDetails = [[KVTransactionsHeaderScreen alloc] init];
    [accDetails setText:[headerDetails getHeaderDetails:myJsonAsObject.account]];
    [todaysDate setText:[headerDetails getHeaderTodayDate]];
    
    //    [transactionsTable ];
    
    accDetails = nil;
    todaysDate = nil;
    myJsonAsObject = nil;
    headerDetails = nil;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
