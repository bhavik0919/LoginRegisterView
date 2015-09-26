//
//  ViewController.m
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import "ViewController.h"
#import "Database.h"
#import "RegisterViewController.h"
#import "WelcomeViewController.h"
#import "RecordViewController.h"

@interface ViewController ()

{
    RegisterViewController *registerview;
    WelcomeViewController *welcomeview;
    Database *database;
    RecordViewController *recordview;
    
}
@end
@implementation ViewController
@synthesize username,password;

- (void)viewDidLoad {
    [super viewDidLoad];
    database=[[Database alloc]init];
    
       // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField

{
    return[textField resignFirstResponder];
}

//action Of the Show Record Button

- (IBAction)showrecord:(id)sender {
    recordview=[[RecordViewController alloc]init];
    [self.navigationController pushViewController:recordview animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{

//NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//
//// check if user is alraidy Login
//    Boolean status=([defaults objectForKey:@"user"]!=nil  && ![[defaults objectForKey:@"user"] isEqualToString:@""]);
//{
//    
//    welcomeview=[[WelcomeViewController alloc]init];
//    [self.navigationController pushViewController:welcomeview animated:YES];
//     welcomeview.userstring=username.text;
//}

}
//Action Of the Login Button(call the CheckFromTable method and verify username and password

- (IBAction)login:(id)sender {
    
    if([username.text isEqualToString:@""]&&[password.text isEqualToString:@""] )
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Required" message:@"something is missing"
                                                    delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    Boolean status=[database chekuserFromTable:username.text password:password.text];
    if (status)
        
    {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:username.text forKey:@"user"];
//        [defaults setObject:password.text forKey:@"pass"];
//        [defaults synchronize];
         welcomeview=[[WelcomeViewController alloc]init];
        [self.navigationController pushViewController:welcomeview animated:YES];
        welcomeview.userstring=username.text;
    }
    else
    {
        NSLog(@"User Not Available");
    }
    }
    username.text=@"";
    password.text=@"";
}



- (IBAction)register1:(id)sender {
    registerview=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerview animated:YES];
}
@end
