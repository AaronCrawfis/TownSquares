//
//  businessListVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "businessListVC.h"
#import <Parse/Parse.h>
#import "businessProductInfoVC.h"

@interface businessListVC ()

@end

@implementation businessListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self runQuery];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.productTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"productInfoSegue"])
    {
        businessProductInfoVC *controller = (businessProductInfoVC *)segue.destinationViewController;
        controller.myProduct = self.myProduct;
    }
}


#pragma mark - Helper Functions

-(void) runQuery
{
    // Pull Products From Server
    PFQuery *query = [PFQuery queryWithClassName:@"Goods"];
    [query whereKey:@"Zone" equalTo:@"ND"];
    //[query whereKey:@"Business" equalTo:self.myBusiness.name];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            /* Do something with the found objects
             for (PFObject *object in objects) {
             NSLog(@"%@", object.objectId);
             }*/
            
            self.productList = [NSArray arrayWithArray:objects];
        }
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

#pragma mark - TableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    PFObject *product = [self.productList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = product[@"productName"];
    cell.detailTextLabel.text = product[@"productDes"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.productList.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Setup Data Source/Destination
    PFObject *object = [self.productList objectAtIndex:indexPath.row];
    productObject *product = [[productObject alloc] init];
    
    // Copy Data
    product.name = object[@"productName"];
    product.driver = [self runDriverQuery:product.name];
    product.price = [object[@"productPrice"] doubleValue];

    
    self.myProduct = product;
    
    [self performSegueWithIdentifier:@"productInfoSegue" sender:self];
}

#pragma mark - Helper Function
-(driverObject *) runDriverQuery:(NSString *)productName
{
    driverObject *driver = [[driverObject alloc] init];
    
    return driver;
}


@end
