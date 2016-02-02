//
//  driverRouteVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverRouteVC.h"
#import <Parse/Parse.h>

@interface driverRouteVC ()

@end

@implementation driverRouteVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Purchases"];
    [query whereKey:@"time" greaterThanOrEqualTo:@(self.minTime)];
    [query whereKey:@"time" lessThanOrEqualTo:@(self.maxTime)];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu routes.", (unsigned long)objects.count);
            
            if (objects.count == 0)
            {
                [self showAlert];
            }
            
            // Do something with the found objects
            PFObject *object = objects[0];
            
            NSString *time = object[@"timeText"];
            NSString *formattedTime = [NSString stringWithFormat:@"%@ minutes",time];
            self.timeLabel.text = formattedTime;
            self.paymentLabel.text = [NSString stringWithFormat:@"$%@",object[@"productPrice"]];
            self.milesLabel.text = object[@"miles"];
            self.packagesLabel.text = [NSString stringWithFormat:@"1"];
            self.stopsLabel.text = [NSString stringWithFormat:@"1"];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Functions

-(void)showAlert
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"No Routes"
                                  message:@"Please try again later"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                                    
                                    
                                }];
    
    [alert addAction:yesButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Buttons

- (IBAction)acceptButtonPressed:(UIButton *)sender
{
    
}

- (IBAction)declineButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
