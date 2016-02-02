//
//  driverRouteVC.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "driverObject.h"

@interface driverRouteVC : UIViewController

@property int minTime;
@property int maxTime;

// Driver
@property driverObject *myDriver;

@end
