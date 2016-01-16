//
//  driverBGCheckVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "driverRequirementsVC.h"

@interface driverBGCheckVC : UIViewController

// Properties


// Text Fields
@property (strong, nonatomic) IBOutlet UITextField *firstSSTextField;
@property (strong, nonatomic) IBOutlet UITextField *secondSSTextField;
@property (strong, nonatomic) IBOutlet UITextField *thirdSSTextField;

// Buttons
- (IBAction)agreeButtonPressed:(UIButton *)sender;
- (IBAction)disagreeButtonPressed:(UIButton *)sender;

@end
