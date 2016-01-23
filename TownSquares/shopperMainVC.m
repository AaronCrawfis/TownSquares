//
//  shopperMainVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "shopperMainVC.h"

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


- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addressButtonPressed:(UIButton *)sender {
}

- (IBAction)signInButtonPressed:(UIButton *)sender {
}
@end
