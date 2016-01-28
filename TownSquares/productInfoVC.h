//
//  productInfoVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/28/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "productObject.h"

@interface productInfoVC : UIViewController

// Shopper Info
@property productObject *myProduct;

// Text Fields
@property (strong, nonatomic) IBOutlet UILabel *productNameTexField;
@property (strong, nonatomic) IBOutlet UITextView *productDescriptionTextField;
@property (strong, nonatomic) IBOutlet UILabel *productPriceTextField;
@property (strong, nonatomic) IBOutlet UILabel *productBusinessTextField;

// Image View
@property (strong, nonatomic) IBOutlet UIImageView *productImageView;

// Button
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)addToCartButtonPressed:(UIButton *)sender;


@end
