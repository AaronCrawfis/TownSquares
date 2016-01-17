//
//  driverCarInfoVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "driverObject.h"

@interface driverCarInfoVC : UIViewController

// Properties
@property (strong, nonatomic) driverObject *createdDriver;

// Text Fields
@property (strong, nonatomic) IBOutlet UITextField *yearTextField;
@property (strong, nonatomic) IBOutlet UITextField *makeTextField;
@property (strong, nonatomic) IBOutlet UITextField *modelTextField;
@property (strong, nonatomic) IBOutlet UITextField *colorTextField;
@property (strong, nonatomic) IBOutlet UITextField *licensePlateTextField;
@property (strong, nonatomic) IBOutlet UITextField *vinTextField;

// Buttons
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)nextButtonPressed:(UIButton *)sender;

@end
