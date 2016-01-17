//
//  shopperAddressVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "shopperAddressVC.h"
#import "shopperInfoVC.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)useThisAddressButtonPressed:(UIButton *)sender {
}

- (IBAction)saveThisAddressButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"passShopperToInfo" sender:self];
}

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
