//
//  RegisterViewController.h
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property(retain,nonatomic) UIDatePicker *mydatepicker;
@property (weak, nonatomic) IBOutlet UITextField *regusername;
@property (weak, nonatomic) IBOutlet UITextField *regpassword;
@property (weak, nonatomic) IBOutlet UITextField *regmobile;

@property (weak, nonatomic) IBOutlet UITextField *city;

- (IBAction)submit:(id)sender;

@end
