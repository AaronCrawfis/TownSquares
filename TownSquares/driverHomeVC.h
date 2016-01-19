//
//  driverHomeVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "driverObject.h"
#import "driverPickVC.h"

@interface driverHomeVC : UIViewController

// Driver Object
@property driverObject *myDriver;

// Buttons Pressed
- (IBAction)manageAccountButtonPressed:(UIButton *)sender;
- (IBAction)runRouteButtonPressed:(UIButton *)sender;
- (IBAction)homeButtonPressed:(UIButton *)sender;

@end
