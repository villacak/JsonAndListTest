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
#import "KVTableViewCell.h"
#import "KVTableGroupViewCell.h"

@interface KVViewController ()
{
    /* If you want a not flat array to be displayed in the table,
     * mean, flat will display the UITableViewCell for a header, then
     * change the variable to YES.
     */
    BOOL *isFlatArray;
}

@property (strong, nonatomic) NSArray *activityListDescendingOrder;
@property (strong, nonatomic) NSString *dateSecondsTemp;
@property (strong, nonatomic) KVTransactions *tempArrayTrans;
@property (strong, nonatomic) KVPending *tempArrayPend;

@end



@implementation KVViewController

@synthesize activityListDescendingOrder = _activityListDescendingOrder;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        isFlatArray = NO;
        // Custom initialization
        NSString *pathJsonFromFile = [[NSBundle mainBundle] pathForResource:@"dummy" ofType:@"json"];
        myJsonAsObject = [[[KVParserDetail alloc] init] parseJSON:pathJsonFromFile];
        KVTransactionsTable *transactionTable = [[KVTransactionsTable alloc] init];
        activityDictionary = [transactionTable createDictionaryMergingTransactions:myJsonAsObject.transactionsArray
                                                                       andPendings:myJsonAsObject.pendingArray];
        NSArray *activityListKeys = [activityDictionary allKeys];
        _activityListDescendingOrder = [activityListKeys sortedArrayUsingComparator:^(id obj1, id obj2) {
            return [obj2 compare:obj1 options:NSNumericSearch];
        }];
        
//        if (isFlatArray) {
//            activityDictionary = [transactionTable ]
//        }
        activityListKeys = nil;
        pathJsonFromFile = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    if ([transactionsTableUi respondsToSelector:@selector(setSeparatorInset:)]) {
        [transactionsTableUi setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    
    [super viewDidLoad];
    KVTransactionsHeaderScreen *headerDetails = [[KVTransactionsHeaderScreen alloc] init];
    [accDetails setText:[headerDetails getHeaderDetails:myJsonAsObject.account]];
    [todaysDate setText:[headerDetails getHeaderTodayDate]];
    
    accDetails = nil;
    todaysDate = nil;
    myJsonAsObject = nil;
    headerDetails = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *innerDicTransaction = [_activityListDescendingOrder objectAtIndex:section];
    NSArray *valuesArray = [[NSArray alloc] initWithArray:[activityDictionary valueForKey:innerDicTransaction]];
    return [valuesArray count];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_activityListDescendingOrder count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *innerDicTransaction = [_activityListDescendingOrder objectAtIndex:section];
    NSString *stringDate = [KVStringUtil convertSecondsToDate:innerDicTransaction];
    return  stringDate;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *uniqueIdentifier = @"transactionsTableId";
    NSString *innerDicTransaction = [_activityListDescendingOrder objectAtIndex:indexPath.row];
//    NSString *stringDate = [KVStringUtil convertSecondsToDate:innerDicTransaction];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    
    KVTableViewCell *transCell = nil;
//   KVTableGroupViewCell *groupcell = nil;
    NSArray *valuesArray = [[NSArray alloc] initWithArray:[activityDictionary valueForKey:innerDicTransaction]];
    
//    groupcell = (KVTableGroupViewCell *) [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
//    
//    if (!groupcell)
//    {
//        [tableView registerNib:[UINib nibWithNibName:@"GroupCell" bundle:nil] forCellReuseIdentifier:uniqueIdentifier];
//        groupcell = [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
//    }
//    groupcell.date.text = stringDate;
//    groupcell.days.text = @"----";
    
    transCell = (KVTableViewCell *) [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    for (NSArray *object in valuesArray) {
        if (!transCell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"DetailCell" bundle:nil] forCellReuseIdentifier:uniqueIdentifier];
            transCell = [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
        }
        if ([object isMemberOfClass:[KVTransactions class]]) {
            self.tempArrayTrans = [[KVTransactions alloc] initWithValueIdTransaction:[object valueForKey:@"idTransaction"]
                                                                valueDateTransaction:[object valueForKey:@"dateTransaction"]
                                                                    valueDescription:[object valueForKey:@"description"]
                                                                         valueAmount:[object valueForKey:@"amount"]];
            transCell.description.text = self.tempArrayTrans.description;
            transCell.value.text = [KVStringUtil convertNumberValueToValueWithDecimals:self.tempArrayTrans.amount];
        } else if ([object isMemberOfClass:[KVPending class]]) {
            self.tempArrayPend = [[KVPending alloc] initWithValueIdPending:[object valueForKey:@"idPending"]
                                                          valueDescription:[object valueForKey:@"description"]
                                                      valueDateTransaction:[object valueForKey:@"dateTransaction"]
                                                               valueAmount:[object valueForKey:@"amount"]];
            transCell.description.text = self.tempArrayPend.description;
            transCell.value.text = [KVStringUtil convertNumberValueToValueWithDecimals:self.tempArrayPend.amount];
        }
        
    }
    return transCell;
}
@end
