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

@property (strong, nonatomic) NSArray *activityListDescendingOrder;

@end



@implementation KVViewController

@synthesize activityListDescendingOrder = _activityListDescendingOrder;


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
        _activityListDescendingOrder = [activityListKeys sortedArrayUsingComparator:^(id obj1, id obj2) {
            return [obj2 compare:obj1 options:NSNumericSearch];
        }];
        pathJsonFromFile = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    if ([transactionsTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [transactionsTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }

    [super viewDidLoad];
    KVTransactionsHeaderScreen *headerDetails = [[KVTransactionsHeaderScreen alloc] init];
    [accDetails setText:[headerDetails getHeaderDetails:myJsonAsObject.account]];
    [todaysDate setText:[headerDetails getHeaderTodayDate]];
    
    
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.activityListDescendingOrder count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"cellForRowAtIndexPath");
    NSString *uniqueIdentifier = @"transactionsTableId";
    
    KVTableViewCell *transCell = (KVTableViewCell *) [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    NSString *innerDicTransaction = [_activityListDescendingOrder objectAtIndex:indexPath.row];

    //headerCell = (KVTableGroupViewCell *) [self->transactionsTable dequeueReusableCellWithIdentifier:uniqueIdentifier];
    
    //KVTransactions *transaction = [activityDictionary objectForKey:innerDicTransaction];//[_activityListDescendingOrder objectAtIndex:[indexPath row]];
    
    if (!transCell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"DetailCell" bundle:nil] forCellReuseIdentifier:uniqueIdentifier];
        transCell = [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    }
    
    KVTransactions *tempArray = [activityDictionary objectForKey:innerDicTransaction];
    transCell.description.text = tempArray.description;
    transCell.value.text = [KVStringUtil convertNumberValueToValueWithDecimals:tempArray.amount];
    
    
    return transCell;
}

@end
