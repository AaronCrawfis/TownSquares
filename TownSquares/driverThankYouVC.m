//
//  driverThankYouVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverThankYouVC.h"

@interface driverThankYouVC ()

@end

@implementation driverThankYouVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneButtonPressed:(UIButton *)sender
{
    // Dismiss all the view controllers
    [self.presentingViewController.presentingViewController.presentingViewController.presentingViewController.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
