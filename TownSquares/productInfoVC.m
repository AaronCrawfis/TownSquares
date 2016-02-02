//
//  productInfoVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/28/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "productInfoVC.h"

@interface productInfoVC ()

@end

@implementation productInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Fill Text Fields
    self.productNameTexField.text = self.myProduct.name;
    self.productBusinessTextField.text = self.myProduct.business;
    self.productDescriptionTextField.text = self.myProduct.briefDescription;
    self.productPriceTextField.text = [NSString stringWithFormat:@"$%.2f",self.myProduct.price];
    
    // Fill Picture
    self.productImageView.image = [UIImage imageWithData:self.myProduct.photo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Functions

-(void)showAlert
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Success"
                                  message:@"Item Added to Cart"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                                    
                                    
                                }];
    
    [alert addAction:yesButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Buttons

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addToCartButtonPressed:(UIButton *)sender
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *cartList = [userDefaults objectForKey:@"cartList"];
    NSMutableArray *copyList = [[NSMutableArray alloc] initWithArray:cartList];
    NSString *stringToAdd = self.myProduct.name;
    [copyList addObject:stringToAdd];
    
    NSMutableArray *costList = [userDefaults objectForKey:@"cartCosts"];
    NSMutableArray *copyCostList = [[NSMutableArray alloc] initWithArray:costList];
    [copyCostList addObject:[NSString stringWithFormat:@"%f",self.myProduct.price]];
    
    [userDefaults setObject:copyCostList forKey:@"cartCosts"];
    [userDefaults setObject:copyList forKey:@"cartList"];
    [userDefaults synchronize];
    
    [self showAlert];
    
}

@end
