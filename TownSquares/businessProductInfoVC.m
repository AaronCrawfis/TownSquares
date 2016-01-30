//
//  businessProductInfoVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "businessProductInfoVC.h"

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
    
    if (self.myProduct.driver != NULL)
    {
        self.driverNameTextField.text = [NSString stringWithFormat:@"%@ %@",self.myProduct.driver.firstName,self.myProduct.driver.lastName];
        self.callButton.titleLabel.text = self.myProduct.driver.phone;
        self.driverImage.image = [UIImage imageWithData:self.myProduct.driver.photo];
    }
    
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

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)callButtonPressed:(UIButton *)sender
{
    
}

@end
