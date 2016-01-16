//
//  driverObject.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "carObject.h"

@interface driverObject : NSObject

// Basic Information
@property NSString *firstName;
@property NSString *lastName;

// Address
@property NSString *street;
@property NSString *city;
@property NSString *state;
@property NSString *zip;

// Contact Info
@property NSString *phone;
@property NSString *email;

// Car/Driver Info
@property NSString *driversLicence;
@property bool currentEmployment;
@property carObject *car;
@property NSMutableArray *routeHistory;

// Hours Worked Info
@property NSMutableArray *hoursWorked;

@end
