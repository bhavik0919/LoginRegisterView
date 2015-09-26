//
//  RecordViewController.m
//  LoginRegisterView
//
//  Created by Bhavik Panchal on 9/20/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import "RecordViewController.h"
#import "DetailViewController.h"
#import "Database.h"

@interface RecordViewController (){
    Database *database;
    NSMutableArray *record;
    DetailViewController *detailview;
}

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    database=[[Database alloc]init];
    
    
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    detailview =[[DetailViewController alloc]init];
    
    record=[database getRecord];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [record count];
}

- (UILabel *) newLabelWithTitle:(NSString *)paramTitle{
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = paramTitle;
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    return label;
}

- (UIView *) tableView:(UITableView *)tableView
   viewForHeaderInSection:(NSInteger)section{
   
    if (section == 0)
    {
        return [self newLabelWithTitle:@"Profile"];
    }
    
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* idenitfier = @"cell";
    UITableViewCell* cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:idenitfier];
    if(cell == nil)
    {
    cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idenitfier];
    }
    cell.textLabel.text=[record objectAtIndex:indexPath.row];
   // detailview.detailstring=cell.textLabel.text;
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [database deletefromtable:@"demo" withName:[record objectAtIndex:indexPath.row]];
       [record removeObjectAtIndex:indexPath.row];
       
        [tablvw reloadData];
       
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:detailview animated:YES];
    detailview.detailstring=[record objectAtIndex:indexPath.row];
}
@end
