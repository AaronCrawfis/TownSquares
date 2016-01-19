//
//  shopperInfoVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "shopperInfoVC.h"

@interface shopperInfoVC ()

@end

@implementation shopperInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)createAccountButtonPressed:(UIButton *)sender
{
    self.createdShopper.age = [self.ageTextField.text intValue];
    if (self.genderSegmentedControl.selectedSegmentIndex == 0) self.createdShopper.gender = [NSString stringWithFormat:@"Male"];
    else self.createdShopper.gender = [NSString stringWithFormat:@"Female"];
    self.createdShopper.phone = self.phoneTextField.text;
    self.createdShopper.email = self.emailTextField.text;
    
}

- (IBAction)signInButtonPressed:(UIButton *)sender
{
    
}

@end
