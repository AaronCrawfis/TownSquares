//
//  driverLicensePhotoVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "driverObject.h"

@interface driverLicensePhotoVC : UIViewController

// Properties
@property (strong, nonatomic) driverObject *createdDriver;
@property NSData *selectedPhoto;

// Buttons
- (IBAction)takePictureButtonPressed:(UIButton *)sender;
- (IBAction)nextButtonPressed:(UIButton *)sender;
- (IBAction)backButtonPressed:(UIButton *)sender;

@end
