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

#define MODE_HISTORY 2
#define MODE_PENDING 1

@interface businessListVC ()

@end

@implementation businessListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentMode = MODE_PENDING;
    self.myBusiness.name = @"Test";
    
    [self runProductQuery];
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
        controller.firstName = self.myProduct.driverFirstName;
        controller.lastName  = self.myProduct.driverLastName;
    }
}


#pragma mark - Helper Functions

-(void) runProductQuery
{
    // Pull Products From Server
    PFQuery *query = [PFQuery queryWithClassName:@"Purchases"];
    [query whereKey:@"Business" equalTo:self.myBusiness.name];
    if (self.currentMode == MODE_PENDING) [query whereKey:@"State" equalTo:@"New"];
    else [query whereKey:@"State" equalTo:@"Old"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            
            self.productList = [NSArray arrayWithArray:objects];
            [self.productTableView reloadData];
        }
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-(void) runDriverQueryWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName
{
    
    // Pull Products From Server
    PFQuery *query = [PFQuery queryWithClassName:@"Drivers"];
    [query whereKey:@"lastName" equalTo:lastName];
    [query whereKey:@"firstName" equalTo:firstName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu drivers.", (unsigned long)objects.count);
            
            driverObject *newDriver = [[driverObject alloc] init];
            PFObject *driverObject = objects[0];
            
            // Fill driver object
            newDriver.firstName = firstName;
            newDriver.lastName = lastName;
            newDriver.phone = driverObject[@"phoneNumber"];
            
            self.myDriver = newDriver;
            
            
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
    product.price = [object[@"productPrice"] doubleValue];
    
    // Run query
    [self runDriverQueryWithFirstName:object[@"driverFirstName"] andLastName:object[@"driverLastName"]];
    product.driver = self.myDriver;
    product.driverFirstName = object[@"driverFirstName"];
    product.driverLastName = object[@"driverLastName"];
    product.pickupTime = object[@"pickupTime"];
    product.briefDescription = object[@"briefDescription"];
    
    // Picture
    product.photoPointer = object[@"productPicture"];
    
    
    self.myProduct = product;
    
    [self performSegueWithIdentifier:@"productInfoSegue" sender:self];
}

#pragma mark - Buttons

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)pendingPurchasesButtonPressed:(UIButton *)sender
{
    self.currentMode = MODE_PENDING;
    [self runProductQuery];
    [self.productTableView reloadData];
}

- (IBAction)historyButtonPressed:(UIButton *)sender
{
    self.currentMode = MODE_HISTORY;
    [self runProductQuery];
    [self.productTableView reloadData];
}
@end
