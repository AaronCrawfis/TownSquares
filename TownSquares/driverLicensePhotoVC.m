//
//  driverLicensePhotoVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverLicensePhotoVC.h"
#import "driverCarInfoVC.h"

@interface driverLicensePhotoVC ()

@end

@implementation driverLicensePhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"passDriverToCI"]){
        driverCarInfoVC *controller = (driverCarInfoVC *)segue.destinationViewController;
        controller.createdDriver = self.createdDriver;
    }
}

- (IBAction)takePictureButtonPressed:(UIButton *)sender
{
    // Open Camera
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{
    // Save data into driver
    
    // Navigation
    [self performSegueWithIdentifier:@"passDriverToCI" sender:self];
}
@end
