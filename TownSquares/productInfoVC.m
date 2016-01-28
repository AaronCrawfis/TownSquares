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

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addToCartButtonPressed:(UIButton *)sender
{
    
}

@end
