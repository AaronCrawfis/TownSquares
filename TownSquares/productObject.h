//
//  productObject.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "routeObject.h"
#import "driverObject.h"
#import <Parse/Parse.h>

@interface productObject : NSObject

// Basic Product Information
@property NSString *name;
@property NSString *category;
@property double price;
@property NSString *business;

// More Information
@property NSString *vid;
@property double stockLevel;
@property NSString *briefDescription;
@property NSString *moreInfo;

@property NSData *photo;
@property PFFile *photoPointer;

// Delivery Information
@property NSString *driverFirstName;
@property NSString *driverLastName;
@property NSString *pickupTime;
@property routeObject *route;
@property driverObject *driver;

@end
