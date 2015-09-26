//
//  Database.h
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface Database : UIViewController

{
    sqlite3 *db;     //create the database functionalities
    
}

-(NSString *) getDbFilePath;

-(void) openDb;

-(void) closeDb;

-(void) CreateTableNamed:(NSString *)TableNamed withName:(NSString *)username password:(NSString *)password mobile1:(NSString *)mobile1 city1:(NSString *)city1;

-(void) insert:(NSString *)TableNamed withName:(NSString *)username withNameValue:(NSString *)NameValue password:(NSString *)password withPassValue:(NSString *)PassValue mobile1:(NSString *)mobile1 withMobileValue:(NSString *)MobileValue city1:(NSString *)city1 withCityValue:(NSString *)CityValue;

-(Boolean) chekuserFromTable:(NSString *)username password:(NSString *)password;

-(NSMutableArray *)getsinglerow:(NSString *)textSelected;

-(NSMutableArray *) getRecord;

-(void) deletefromtable:(NSString *)tablename withName:(NSString*) name;

@end
