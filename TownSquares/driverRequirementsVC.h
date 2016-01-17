//
//  driverRequirementsVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "driverObject.h"

@interface driverRequirementsVC : UIViewController

// Properties
@property (strong, nonatomic) driverObject *createdDriver;

// Buttons
- (IBAction)yesButtonPressed:(UIButton *)sender;
- (IBAction)noButtonPressed:(UIButton *)sender;

@end
