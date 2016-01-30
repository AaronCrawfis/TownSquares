//
//  businessListVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "businessClass.h"

@interface businessListVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

// Data
@property NSArray *productList;
@property businessClass *myBusiness;

// TableView
@property (strong, nonatomic) IBOutlet UITableView *productTableView;

@end
