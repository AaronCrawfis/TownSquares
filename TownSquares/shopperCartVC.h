//
//  shopperCartVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 2/1/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopperCartVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

// Buttons
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)checkoutButtonPressed:(UIButton *)sender;

// Text Labels
@property (strong, nonatomic) IBOutlet UILabel *totalPriceLabel;

// Table View
@property (strong, nonatomic) IBOutlet UITableView *cartTableView;


@end
