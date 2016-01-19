//
//  driverPickVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "driverObject.h"
#import "driverRouteVC.h"

@interface driverPickVC : UIViewController

// Driver Object
@property driverObject *myDriver;

// Variables
@property int minTime;
@property int maxTime;

// Buttons
- (IBAction)time0ButtonPressed:(UIButton *)sender;
- (IBAction)time30ButtonPressed:(UIButton *)sender;
- (IBAction)time60ButtonPressed:(UIButton *)sender;
- (IBAction)time90ButtonPressed:(UIButton *)sender;
- (IBAction)time2ButtonPressed:(UIButton *)sender;


@end
