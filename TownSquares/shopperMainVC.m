//
//  shopperMainVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "shopperMainVC.h"
#import "shopperProductsVC.h"

@interface shopperMainVC ()

@end

@implementation shopperMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"storeSegue"]){
        shopperProductsVC *controller = (shopperProductsVC *)segue.destinationViewController;
        controller.myShopper = self.myShopper;
    }
}


- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addressButtonPressed:(UIButton *)sender {
}

- (IBAction)signInButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"storeSegue" sender:self];
}
@end
