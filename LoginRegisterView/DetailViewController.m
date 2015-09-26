//
//  DetailViewController.m
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import "DetailViewController.h"
#import "Database.h"

@interface DetailViewController ()

{
    Database *database;
    NSArray *detail;
}
@end

@implementation DetailViewController
@synthesize detailstring,namelabel,mobilelabel,citylabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    database=[[Database alloc]init];
    
    detail=[database getsinglerow:detailstring];
    NSLog(@"runinng");
    
    namelabel.text=detailstring;
    mobilelabel.text=detail[1];
    citylabel.text=detail[2];
    
}

@end
