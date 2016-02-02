//
//  driverRouteVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "driverObject.h"

@interface driverRouteVC : UIViewController

// Data
@property int minTime;
@property int maxTime;

// Driver
@property driverObject *myDriver;

// Text Labels
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *paymentLabel;
@property (strong, nonatomic) IBOutlet UILabel *milesLabel;
@property (strong, nonatomic) IBOutlet UILabel *stopsLabel;
@property (strong, nonatomic) IBOutlet UILabel *packagesLabel;

// Buttons
- (IBAction)acceptButtonPressed:(UIButton *)sender;
- (IBAction)declineButtonPressed:(UIButton *)sender;

@end
