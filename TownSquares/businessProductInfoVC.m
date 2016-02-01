//
//  businessProductInfoVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "businessProductInfoVC.h"
#import <Parse/Parse.h>

@interface businessProductInfoVC ()

@end

@implementation businessProductInfoVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.productNameTextField.text = self.myProduct.name;
    self.productPriceTextField.text = [NSString stringWithFormat:@"$%.2f",self.myProduct.price];
    self.productDescriptionTextView.text = self.myProduct.briefDescription;
    self.productImage.image = [UIImage imageWithData:self.myProduct.photo];
    self.timeTextField.text = self.myProduct.pickupTime;
    self.productImage.image = [UIImage imageWithData:self.myProduct.photo];
        
    [self.myProduct.photoPointer getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            self.productImage.image = image;
            
        }
        else
        {
            // Put in default picture
        }
    }];

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self runDriverQueryWithFirstName:self.firstName andLastName:self.lastName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) runDriverQueryWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName
{
    
    // Pull Products From Server
    PFQuery *query = [PFQuery queryWithClassName:@"Drivers"];
    [query whereKey:@"lastName" equalTo:lastName];
    [query whereKey:@"firstName" equalTo:firstName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu drivers.", (unsigned long)objects.count);
            
            PFObject *driverObject = objects[0];
            
            self.driverNameTextField.text = [NSString stringWithFormat:@"%@ %@",driverObject[@"firstName"],driverObject[@"lastName"]];
            self.phoneTextField.text = driverObject[@"phoneNumber"];
            
            
            PFFile *driverPicturePointer = driverObject[@"driverPicture"];
            [driverPicturePointer getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
                if (!error) {
                    UIImage *image = [UIImage imageWithData:imageData];
                    self.driverImage.image = image;
                    
                }
                else
                {
                    // Put in default picture
                }
            }];

        }
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}


- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
