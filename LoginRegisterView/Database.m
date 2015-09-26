//
//  Database.m
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import "Database.h"

@interface Database ()

@end

@implementation Database

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *) getDbFilePath
{
    NSString * docsPath= NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    return [docsPath stringByAppendingPathComponent:@"persons2.sql"];

}

-(void) openDb
{
    if (sqlite3_open([[self getDbFilePath]UTF8String] ,&db)!=SQLITE_OK)
                                                                //file is used o open file at database path
    {
        sqlite3_close(db);
         NSLog(@"Failed To Open Database Connection");
    }
}

-(void) closeDb
{
    sqlite3_close(db);
    
}

-(void) CreateTableNamed:(NSString *)TableNamed withName:(NSString *)username password:(NSString *)password mobile1:(NSString *)mobile1 city1:(NSString *)city1

{
    [self openDb];
    char *err; //if error occured
    
    NSString *query =[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ( 'id' INTEGER PRIMARY KEY AUTOINCREMENT,'%@' TEXT,'%@' TEXT , '%@' TEXT,'%@' TEXT )",TableNamed,username,password,mobile1,city1];
    
    if (sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!=SQLITE_OK) {
       
        NSLog(@"Failed");
        
    }
    NSLog(@"Created");
}

-(void) insert:(NSString *)TableNamed withName:(NSString *)username withNameValue:(NSString *)NameValue password:(NSString *)password withPassValue:(NSString *)PassValue mobile1:(NSString *)mobile1 withMobileValue:(NSString *)MobileValue city1:(NSString *)city1 withCityValue:(NSString *)CityValue
{
    [self openDb];
   
    NSString *query=[NSString stringWithFormat:@"INSERT INTO '%@' ('%@','%@','%@','%@') VALUES ('%@','%@','%@','%@')",TableNamed,username,password,mobile1,city1,NameValue,PassValue,MobileValue,CityValue];
   
    char *err;
    if (sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!=SQLITE_OK) {
        sqlite3_close(db);
        
    }
    NSLog(@"success");
}

-(Boolean) chekuserFromTable:(NSString *)username password:(NSString *)password
{
    [self openDb];
    
    NSString *query=[[NSString alloc]initWithFormat:@"SELECT * From demo Where Username=\"%@\" and Password=\"%@\"",username,password];
    
    sqlite3_stmt *statement;   //statement used for the point the row in table
    
    if (sqlite3_prepare_v2(db, [query UTF8String], -1, &statement, nil)==SQLITE_OK) //used to execute in byte code
    
    {
        
        while (sqlite3_step(statement)==SQLITE_ROW) {
           
            char *user=(char*) sqlite3_column_text(statement, 1);
            char *pass=(char*) sqlite3_column_text(statement, 2);
            
            //convert the char *user into nsstring *user
            //because by default get the char i sqlite
            
            NSString *userstr=[[NSString alloc]initWithUTF8String:user];
            NSString *passstr=[[NSString alloc]initWithUTF8String:pass];
            
            
            //select the conet of first and second column
            
            if ([userstr isEqualToString:@""] && [passstr isEqualToString:@""])
            {
                return false;
                break;
            }
            else
            {
                return true;
                break;
            }
        
        }
        sqlite3_finalize(statement);
        return false;
      }
    else
    {
        return false;
        
    }
   
}

-(NSMutableArray *) getRecord
{
    [self openDb];
    NSString *query=@"SELECT * From demo";
    sqlite3_stmt *statement;
     NSMutableArray *list=[[NSMutableArray alloc]init];
    if (sqlite3_prepare_v2(db, [query UTF8String], -1, &statement, nil)==SQLITE_OK) {
       
        
        while (sqlite3_step(statement)==SQLITE_ROW) {
            
            char *user=(char *)sqlite3_column_text(statement, 1);
            NSString *userstr=[[NSString alloc]initWithUTF8String:user];
            NSString *str1=[[NSString alloc]initWithFormat:@"%@",userstr];
            [list addObject:str1];
            
            
            /*char *mobile=(char *)sqlite3_column_text(statement, 3);
            NSString *mobilestr=[[NSString alloc]initWithUTF8String:mobile];
            NSString *str2=[[NSString alloc]initWithFormat:@"%@",mobilestr];
            [list addObject:str2];*/
            
        }
        
    }
    return list;
}

-(NSMutableArray *)getsinglerow:(NSString *)textSelected
{
    [self openDb];
    NSMutableArray *list=[[NSMutableArray alloc]init];
    NSString *query=[[NSString alloc]initWithFormat:@"SELECT * From demo WHERE Username=\"%@\"",textSelected];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(db,[query UTF8String], -1, &statement, nil)==SQLITE_OK) {
        
        list=[[NSMutableArray alloc]init];
        while (sqlite3_step(statement)==SQLITE_ROW) {
//            char *id1=(char *)sqlite3_column_text(statement, 0);
//            NSString *idstr=[[NSString alloc]initWithUTF8String:id1];
           
            char *user=(char *)sqlite3_column_text(statement, 1);
            NSString *userstr=[[NSString alloc]initWithUTF8String:user];
            
            char *mobile=(char *)sqlite3_column_text(statement, 3);
            NSString *mobilestr=[[NSString alloc]initWithUTF8String:mobile];
            
         char *city=(char *)sqlite3_column_text(statement, 4);
         NSString *citystr=[[NSString alloc] initWithUTF8String:city];
            
            
           // [list addObject:idstr];
            [list addObject:userstr];
            [list addObject:mobilestr];
            [list addObject:citystr];
        }
    }
    return list;
}

-(void) deletefromtable:(NSString *)tablename withName:(NSString*) name
{

    [self openDb];
    
   NSString * query  = [NSString stringWithFormat:@"DELETE FROM demo where Username='%@'",name];
    
    char * errMsg;
    
        if (sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg)!=SQLITE_OK)
           
        {
            sqlite3_close(db);
                    }
   
   
    
    }
@end
