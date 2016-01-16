//
//  purchaseObject.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "productObject.h"
#import "businessClass.h"
#import "shopperObject.h"
#import "driverObject.h"

@interface purchaseObject : NSObject

// Product
@property productObject *product;

// Purchase Information
@property NSDate *purchaseTime;
@property NSDate *deliveryTime;
@property businessClass *business;
@property shopperObject *customer;
@property driverObject *driver;
@property float lat;
@property float lon;

@end
