//
//  driverBGCheckVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverBGCheckVC.h"
#import "driverLicensePhotoVC.h"


@interface driverBGCheckVC ()

@end

@implementation driverBGCheckVC

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
    if([segue.identifier isEqualToString:@"passDriverToDL"]){
        driverLicensePhotoVC *controller = (driverLicensePhotoVC *)segue.destinationViewController;
        controller.createdDriver = self.createdDriver;
    }
}

- (IBAction)agreeButtonPressed:(UIButton *)sender
{
    // Concatenate and save ssn
    self.createdDriver.ssn = [NSString stringWithFormat:@"%@%@%@", self.firstSSTextField.text,self.secondSSTextField.text,self.thirdSSTextField.text];
    
    // !!!Navigation
    [self performSegueWithIdentifier:@"passDriverToDL" sender:self];
}

- (IBAction)disagreeButtonPressed:(UIButton *)sender
{
    [self.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
