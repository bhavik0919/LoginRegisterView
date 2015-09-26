//
//  WelcomeViewController.h
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *loginuser;


@property NSString *userstring;

- (IBAction)logut:(id)sender;


@end
