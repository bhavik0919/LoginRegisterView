//
//  WelcomeViewController.m
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import "WelcomeViewController.h"
#import "RecordViewController.h"
#import "ViewController.h"
@interface WelcomeViewController ()
{
    RecordViewController *recordview;
    ViewController *viewcontroller;
    
}
@end

@implementation WelcomeViewController

@synthesize userstring,loginuser;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    loginuser.text=userstring;
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
//    loginuser.text=userstring;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logut:(id)sender {
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults removeObjectForKey:@"user"];
//    [defaults removeObjectForKey:@"pass"];
//    [defaults synchronize];
    
    viewcontroller =[[ViewController alloc]init];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}
@end
