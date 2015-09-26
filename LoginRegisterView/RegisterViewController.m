//
//  RegisterViewController.m
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import "RegisterViewController.h"

#import "Database.h"

@interface RegisterViewController ()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    Database *database;
    UIPickerView *pickview;
    NSArray *pickerArray;
}

@end

@implementation RegisterViewController
@synthesize regpassword;
@synthesize regmobile;
@synthesize regusername;
@synthesize city;
@synthesize mydatepicker;


-(void) dateChanged:(UIDatePicker *)paramDatePicker
{
   
}

///Add Custom Picker View In RegistrationPage
-(void)addpickView
{
    pickerArray = [[NSArray alloc]initWithObjects:@"Ahmedabad", @"Himatnagar",@"Vadodara",@"Rajkot",@"Surat", nil];
    pickview = [[UIPickerView alloc]init];
    pickview.dataSource = self;
    pickview.delegate = self;
    pickview.showsSelectionIndicator = YES;
    
       UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height- mydatepicker.frame.size.height-50, 320, 50)];
    
    [toolBar setBarStyle:UIBarStyleDefault];
   
    city.inputView = pickview;
    city.inputAccessoryView = toolBar;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""]) {
        [self dateChanged:nil];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [pickerArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    [(UITextField *)city setText:[pickerArray objectAtIndex:row]];

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [pickerArray objectAtIndex:row];
}



- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    database=[[Database alloc]init];
    
    [database CreateTableNamed:@"demo" withName:@"Username" password:@"Password" mobile1:@"Mobile" city1:@"City"];
    
    [self addpickView];

    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return[textField resignFirstResponder];
}

//alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle;

-(void) showMessage:(NSString*)title withMessage:(NSString*)message

{
    
[[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}

- (IBAction)submit:(id)sender {
    
    if(regusername.text.length ==0 || regpassword.text.length ==0 || regmobile.text.length ==0 || city.text.length==0)
    {
        [self showMessage:@"ERROR" withMessage:@"Enter Valid Detail"];
    }
    else
    {
   
    [database insert:@"demo" withName:@"Username" withNameValue:regusername.text password:@"Password" withPassValue:regpassword.text mobile1:@"Mobile" withMobileValue:regmobile.text city1:@"City" withCityValue:city.text];
    
    regusername.text=@"";
    regpassword.text=@"";
    regmobile.text=@"";
    city.text=@"";
    }
    
    
}
@end
