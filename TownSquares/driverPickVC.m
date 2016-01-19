//
//  driverPickVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverPickVC.h"

@interface driverPickVC ()

@end

@implementation driverPickVC

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
    if([segue.identifier isEqualToString:@"passDriverToEM"]){
        driverRouteVC *controller = (driverRouteVC *)segue.destinationViewController;
        controller.minTime = self.minTime;
        controller.maxTime = self.maxTime;
    }
}

- (IBAction)time0ButtonPressed:(UIButton *)sender
{
    self.minTime = 0;
    self.maxTime = 30;
    [self performSegueWithIdentifier:@"findRouteSegue" sender:self];
}

- (IBAction)time30ButtonPressed:(UIButton *)sender
{
    self.minTime = 30;
    self.maxTime = 60;
    [self performSegueWithIdentifier:@"findRouteSegue" sender:self];
}

- (IBAction)time60ButtonPressed:(UIButton *)sender
{
    self.minTime = 60;
    self.maxTime = 90;
    [self performSegueWithIdentifier:@"findRouteSegue" sender:self];
}

- (IBAction)time90ButtonPressed:(UIButton *)sender
{
    self.minTime = 90;
    self.maxTime = 120;
    [self performSegueWithIdentifier:@"findRouteSegue" sender:self];
}

- (IBAction)time2ButtonPressed:(UIButton *)sender
{
    self.minTime = 0;
    self.maxTime = 9999;
    [self performSegueWithIdentifier:@"findRouteSegue" sender:self];
}

@end
