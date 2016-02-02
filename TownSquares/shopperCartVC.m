//
//  shopperCartVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 2/1/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "shopperCartVC.h"
#import <Parse/Parse.h>

@interface shopperCartVC ()

@end

@implementation shopperCartVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.totalCost = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table View

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.cartList = [userDefaults objectForKey:@"cartList"];
    NSMutableArray *costs = [userDefaults objectForKey:@"cartCosts"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cartCell" forIndexPath:indexPath];
    
    NSString *name = [self.cartList objectAtIndex:indexPath.row];
    NSString *price = [costs objectAtIndex:indexPath.row];
    
    cell.textLabel.text = name;
    cell.detailTextLabel.text = [price substringToIndex:4];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@",[price substringToIndex:4]];
    
    self.totalCost += [price floatValue];
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f",self.totalCost];
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Get Cart List
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.cartList = [userDefaults objectForKey:@"cartList"];
    
    return self.cartList.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



#pragma mark - Buttons

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)checkoutButtonPressed:(UIButton *)sender
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [userDefaults setObject:array forKey:@"cartList"];
    [userDefaults setObject:array forKey:@"cartCosts"];
    [userDefaults synchronize];
    
    [self.cartTableView reloadData];
    self.totalCost = 0;
    self.totalPriceLabel.text = [NSString stringWithFormat:@"$0"];
}
@end
