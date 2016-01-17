//
//  shopperAddressVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shopperObject.h"

@interface shopperAddressVC : UIViewController

// Properties
@property shopperObject *createdShopper;

// Text Fields
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *address1TextField;
@property (strong, nonatomic) IBOutlet UITextField *address2TextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *zipTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *securityCodeTextField;

// Buttons
- (IBAction)useThisAddressButtonPressed:(UIButton *)sender;
- (IBAction)saveThisAddressButtonPressed:(UIButton *)sender;
- (IBAction)backButtonPressed:(UIButton *)sender;

@end
