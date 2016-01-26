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


@interface shopperProductsVC : UIViewController

// Classes
@property shopperObject *myShopper;

// Returned Query
@property NSArray *myProducts;

// Text Field
@property (strong, nonatomic) IBOutlet UITextField *searchBarTextField;
- (IBAction)searchBarChanged:(UITextField *)sender;

// CollectionView
@property (strong, nonatomic) IBOutlet UICollectionView *productCollectionView;

@end
