//
//  driverHomeVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverHomeVC.h"

@interface driverHomeVC ()

@end

@implementation driverHomeVC

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
    if([segue.identifier isEqualToString:@"runRouteSegue"]){
        driverPickVC *controller = (driverPickVC *)segue.destinationViewController;
        controller.myDriver = self.myDriver;
    }
}

- (IBAction)runRouteButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"runRouteSegue" sender:self];
}

- (IBAction)homeButtonPressed:(UIButton *)sender
{
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)manageAccountButtonPressed:(UIButton *)sender
{
    
}
@end
