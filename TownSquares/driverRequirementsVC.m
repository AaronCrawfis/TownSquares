//
//  driverRequirementsVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverRequirementsVC.h"
#import "driverBGCheckVC.h"

@interface driverRequirementsVC ()

@end

@implementation driverRequirementsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",self.createdDriver.firstName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"passDriverToBG"]){
        driverBGCheckVC *controller = (driverBGCheckVC *)segue.destinationViewController;
        controller.createdDriver = self.createdDriver;
    }
}

- (IBAction)yesButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"passDriverToBG" sender:self];
}

- (IBAction)noButtonPressed:(UIButton *)sender {
}
@end
