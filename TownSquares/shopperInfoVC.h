//
//  shopperInfoVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shopperObject.h"

@interface shopperInfoVC : UIViewController

// Properties
@property shopperObject *createdShopper;

// Text Fields
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

// Buttons
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)createAccountButtonPressed:(UIButton *)sender;
- (IBAction)signInButtonPressed:(UIButton *)sender;

// Switch
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;

@end
