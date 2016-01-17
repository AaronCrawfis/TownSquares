//
//  driverSignInVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverSignInVC.h"
#import "driverRequirementsVC.h"

@interface driverSignInVC ()

@end

@implementation driverSignInVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create new driver
    self.createdDriver = [[driverObject alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"passDriverToRequirements"]){
        driverRequirementsVC *controller = (driverRequirementsVC *)segue.destinationViewController;
        controller.createdDriver = self.createdDriver;
    }
}

- (IBAction)cancelButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{
    // Fill driver with information
    self.createdDriver.firstName = self.firstNameTextField.text;
    self.createdDriver.lastName = self.lastNameTextField.text;
    self.createdDriver.email = self.emailTextField.text;
    self.createdDriver.phone = self.phoneTextField.text;
    self.createdDriver.city = self.cityTextField.text;
    self.createdDriver.state = self.stateTextField.text;
    self.createdDriver.zip = self.zipTextField.text;
    self.createdDriver.password = self.passwordTextField.text;
    
    // Go to next view controller
    [self performSegueWithIdentifier:@"passDriverToRequirements" sender:self];
}
@end
