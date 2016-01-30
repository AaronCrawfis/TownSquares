//
//  businessMainVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "businessClass.h"

@interface businessMainVC : UIViewController

// Buttons
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)signInButtonPressed:(UIButton *)sender;

// Data
@property businessClass *myBusiness;

@end
