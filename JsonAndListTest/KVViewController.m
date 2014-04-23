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

@interface KVViewController ()

@end

@implementation KVViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString *pathJsonFromFile = [[NSBundle mainBundle] pathForResource:@"dummy" ofType:@"json"];
        
        KVDetailsJSON *myJsonAsObject = [[[KVParserDetail alloc] init] parseJSON:pathJsonFromFile];
        
        NSString *accountNAmeStr = [[myJsonAsObject account] accountName];
        NSLog(@"Account Name  is %@", accountNAmeStr);
        
        accountNAmeStr = nil;
        myJsonAsObject = nil;
        pathJsonFromFile = nil;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
