//
//  shopperAddressVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "shopperAddressVC.h"
#import "shopperInfoVC.h"
#import "shopperProductsVC.h"

@interface shopperAddressVC ()

@end

@implementation shopperAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.createdShopper = [[shopperObject alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"passShopperToInfo"]){
        shopperInfoVC *controller = (shopperInfoVC *)segue.destinationViewController;
        controller.createdShopper = self.createdShopper;
    }
    else if([segue.identifier isEqualToString:@"passShopperToInfo"]){
        shopperProductsVC *controller = (shopperProductsVC *)segue.destinationViewController;
        controller.myShopper = self.createdShopper;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)useThisAddressButtonPressed:(UIButton *)sender
{
    [self fillShopper];
    [self performSegueWithIdentifier:@"goToProductsSegue" sender:self];
}

- (IBAction)saveThisAddressButtonPressed:(UIButton *)sender
{
    [self fillShopper];
    [self performSegueWithIdentifier:@"passShopperToInfo" sender:self];
}

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) fillShopper
{
    self.createdShopper.firstName = self.firstNameTextField.text;
    self.createdShopper.lastName = self.lastNameTextField.text;
    self.createdShopper.address1 = self.address1TextField.text;
    self.createdShopper.address2 = self.address2TextField.text;
    self.createdShopper.state = self.stateTextField.text;
    self.createdShopper.zip = self.zipTextField.text;
}

@end
