//
//  shopperObject.h
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopperObject : NSObject

// Basic Info
@property NSString *firstName;
@property NSString *lastName;
@property int age;
@property NSString *gender;

// Address
@property NSString *address1;
@property NSString *address2;
@property NSString *state;
@property NSString *zip;

// Contact Info
@property NSString *phone;
@property NSString *email;

// Location
@property double lat;
@property double lon;

// Purchase Information
@property NSMutableArray *purchaseHistory;

@end
