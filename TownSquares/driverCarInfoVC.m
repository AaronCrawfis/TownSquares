//
//  driverCarInfoVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverCarInfoVC.h"
#import "carObject.h"
#import "driverEmployableVC.h"

@interface driverCarInfoVC ()

@end

@implementation driverCarInfoVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create car
    self.createdDriver.car = [[carObject alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"passDriverToEM"]){
        driverEmployableVC *controller = (driverEmployableVC *)segue.destinationViewController;
        controller.createdDriver = self.createdDriver;
    }
}


- (IBAction)backButtonPressed:(UIButton *)sender {
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{
    // Assign car attributes
    self.createdDriver.car.make = self.makeTextField.text;
    self.createdDriver.car.model = self.modelTextField.text;
    self.createdDriver.car.year = [self.yearTextField.text intValue];
    self.createdDriver.car.color = self.colorTextField.text;
    self.createdDriver.car.vin = self.vinTextField.text;
    self.createdDriver.car.license = self.licensePlateTextField.text;
    
    // Navigation
    [self performSegueWithIdentifier:@"passDriverToEM" sender:self];
}
@end
