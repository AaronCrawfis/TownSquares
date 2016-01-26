//
//  shopperProductsVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/24/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "shopperProductsVC.h"

@interface shopperProductsVC ()

@end

@implementation shopperProductsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Pull Products From Server
    PFQuery *query = [PFQuery queryWithClassName:@"Goods"];
    [query whereKey:@"Zone" equalTo:@"ND"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            /* Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }*/
            
            self.myProducts = [NSArray arrayWithArray:objects];
            [self updateCollectionView];
        }
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
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

- (void)updateCollectionView
{
    for (PFObject *object in self.myProducts)
    {
        NSLog(@"%@", object.objectId);
    }
}

- (IBAction)searchBarChanged:(UITextField *)sender
{
    
}
@end
