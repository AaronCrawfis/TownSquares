//
//  driverSignInVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "driverObject.h"
#include "driverRequirementsVC.h"

@interface driverSignInVC : UIViewController

// Properties
@property (strong, nonatomic) driverObject *createdDriver;

// Text Fields
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *zipTextField;

// Buttons
- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)nextButtonPressed:(UIButton *)sender;

// Driver
@property driverObject *myDriver;

@end
