//
//  shopperProductsVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/24/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "shopperProductsVC.h"
#import "productCellVC.h"
#import "productInfoVC.h"

#define CAT_MODE 1
#define PRO_MODE 2

#define NUM_CATS 4

#define CAT_ALL 0
#define CAT_SHOES 1
#define CAT_CLOTHES 2
#define CAT_ELECTRONICS 3

@interface shopperProductsVC ()

@end

@implementation shopperProductsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentMode = CAT_MODE;
    self.currentCategory = CAT_ALL;
    self.currentCategoryName = @"all";
    
    // Load Images into Array
    self.catPhotoArray = [[NSMutableArray alloc] initWithObjects:@"Cat_All.png", @"Cat_Shoes",@"Cat_Clothes",@"Cat_Electronics",nil];
    
    [self runQuery];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"productSegue"]){
        productInfoVC *controller = (productInfoVC *)segue.destinationViewController;
        controller.myProduct = self.myProduct;
    }
}

- (void)updateCollectionView
{
    for (PFObject *object in self.myProducts)
    {
        NSLog(@"%@", object.objectId);
    }
    
    [self.productCollectionView reloadData];
}

- (IBAction)searchBarChanged:(UITextField *)sender
{
    
}

#pragma mark - Helper Functions

- (void) runQuery
{
    // Pull Products From Server
    PFQuery *query = [PFQuery queryWithClassName:@"Goods"];
    [query whereKey:@"Zone" equalTo:@"ND"];
    if (self.currentCategoryName != @"all")[query whereKey:@"productCategory" equalTo:self.currentCategoryName];
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


#pragma mark - UICollectionView

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"productCell";
    
    // Create Cell
    productCellVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    if (self.currentMode == CAT_MODE)
    {
        [cell.imageView setImage:[UIImage imageNamed:[self.catPhotoArray objectAtIndex:indexPath.row]]];
    }
    else if (self.currentMode == PRO_MODE)
    {
        // Fill Cell w/Data
        PFObject *cellProduct = [self.myProducts objectAtIndex:indexPath.row];
        PFFile *cellPictureFile = cellProduct[@"productPicture"];
        [cellPictureFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            if (!error) {
                UIImage *image = [UIImage imageWithData:imageData];
                cell.imageView.image = image;
                self.myProduct.photo = imageData;
                
            }
            else
            {
                // Put in default picture
            }
        }];
    }
    
    // Return Cell
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger i = 0;
    
    if (self.currentMode == CAT_MODE) i = NUM_CATS;
    else i = self.myProducts.count;
    return i;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentMode == PRO_MODE)
    {
        
        // Create Product Object
        PFObject *cellProduct = [self.myProducts objectAtIndex:indexPath.row];
        self.myProduct = [[productObject alloc] init];
        
        // Fill Object Information
        self.myProduct.name = cellProduct[@"productName"];
        self.myProduct.price = [cellProduct[@"productPrice"] floatValue];
        self.myProduct.briefDescription = cellProduct[@"productDes"];
        
        PFFile *cellPictureFile = cellProduct[@"productPicture"];
        [cellPictureFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            if (!error) {
                self.myProduct.photo = imageData;
                [self performSegueWithIdentifier:@"productSegue" sender:self];
            }
            else
            {
                // Put in default picture
            }
        }];
    }
    else if (self.currentMode == CAT_MODE)
    {
        self.currentCategory = (int) indexPath.row;
        
        if (self.currentCategory == CAT_ALL) self.currentCategoryName = @"all";
        else if (self.currentCategory == CAT_SHOES) self.currentCategoryName = @"shoes";
        else if (self.currentCategory == CAT_ELECTRONICS) self.currentCategoryName = @"electronics";
        else if (self.currentCategory == CAT_CLOTHES) self.currentCategoryName = @"clothes";
        else self.currentCategoryName = @"";
        
        self.currentMode = PRO_MODE;
        [self runQuery];
        [self.productCollectionView reloadData];
    }
    
}

- (IBAction)backButtonPressed:(UIButton *)sender
{
    self.currentMode = CAT_MODE;
    [self.productCollectionView reloadData];
}

- (IBAction)cartButtonPressed:(UIButton *)sender {
}

- (IBAction)myAccountButtonPressed:(UIButton *)sender {
}
@end
