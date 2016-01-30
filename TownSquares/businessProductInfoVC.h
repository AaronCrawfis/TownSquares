//
//  businessProductInfoVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "productObject.h"

@interface businessProductInfoVC : UIViewController

// Data
@property productObject *myProduct;

// Text Labels
@property (strong, nonatomic) IBOutlet UILabel *productNameTextField;
@property (strong, nonatomic) IBOutlet UILabel *productPriceTextField;
@property (strong, nonatomic) IBOutlet UITextView *productDescriptionTextView;
@property (strong, nonatomic) IBOutlet UILabel *driverNameTextField;
@property (strong, nonatomic) IBOutlet UILabel *timeTextField;

// Buttons
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)callButtonPressed:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *callButton;

// Images
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UIImageView *driverImage;

@end
