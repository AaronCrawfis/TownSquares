//
//  businessMainVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "businessMainVC.h"
#import "businessListVC.h"

@interface businessMainVC ()

@end

@implementation businessMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"productsSegue"])
    {
        businessListVC *controller = (businessListVC *)segue.destinationViewController;
        controller.myBusiness = self.myBusiness;
    }
}

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)signInButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"productsSegue" sender:self];
}
@end
