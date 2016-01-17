//
//  driverEmployableVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverEmployableVC.h"

@interface driverEmployableVC ()

@end

@implementation driverEmployableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)yesButtonPressed:(UIButton *)sender
{
    self.createdDriver.isEmployable = false;
    
    // Send Data to Server
    
    
    // Perform Segue
    [self performSegueWithIdentifier:@"TYSegue" sender:self];
    
}


- (IBAction)noButtonPressed:(UIButton *)sender
{
    [self.presentingViewController.presentingViewController.presentingViewController.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
