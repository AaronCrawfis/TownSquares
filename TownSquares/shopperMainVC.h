//
//  shopperMainVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shopperObject.h"

@interface shopperMainVC : UIViewController

// Buttons
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)addressButtonPressed:(UIButton *)sender;
- (IBAction)signInButtonPressed:(UIButton *)sender;

// Text Fields
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

// Objects
@property shopperObject *myShopper;

@end
