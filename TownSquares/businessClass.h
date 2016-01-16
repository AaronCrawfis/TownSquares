//
//  businessClass.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "ownerObject.h"

@interface businessClass : NSObject

// Basic Information
@property NSString *name;
@property NSString *phone;

// Owner Information
@property ownerObject *owner;

// Location
@property double lat;
@property double lon;

// Inventory
@property NSMutableArray *inventory;

// Purchase Information
@property int numPurchases;
@property float totalRevenue;
@property NSMutableArray *purchaseHistory;

@end
