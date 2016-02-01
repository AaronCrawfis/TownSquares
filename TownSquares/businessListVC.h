//
//  businessListVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "businessClass.h"
#import "productObject.h"
#import "driverObject.h"

@interface businessListVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

// Data
@property NSArray *productList;
@property businessClass *myBusiness;
@property productObject *myProduct;
@property int currentMode;
@property driverObject *myDriver;

// TableView
@property (strong, nonatomic) IBOutlet UITableView *productTableView;

// Buttons
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)pendingPurchasesButtonPressed:(UIButton *)sender;
- (IBAction)historyButtonPressed:(UIButton *)sender;

@end
