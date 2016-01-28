//
//  shopperProductsVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/24/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "shopperObject.h"
#import "productObject.h"

@interface shopperProductsVC : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {}

// Variables
@property int currentMode;
@property int currentCategory;
@property NSMutableArray *catPhotoArray;

// Classes
@property shopperObject *myShopper;

// Returned Query
@property NSArray *myProducts;
@property productObject *myProduct;

// Text Field
@property (strong, nonatomic) IBOutlet UITextField *searchBarTextField;
- (IBAction)searchBarChanged:(UITextField *)sender;

// CollectionView
@property (strong, nonatomic) IBOutlet UICollectionView *productCollectionView;

// Buttons
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)cartButtonPressed:(UIButton *)sender;
- (IBAction)myAccountButtonPressed:(UIButton *)sender;

@end
