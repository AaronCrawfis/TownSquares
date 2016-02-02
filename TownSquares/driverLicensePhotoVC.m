//
//  driverLicensePhotoVC.m
//  TownSquares
//
//  Created by Aaron Crawfis on 1/16/16.
//  Copyright © 2016 Aaron Crawfis. All rights reserved.
//

#import "driverLicensePhotoVC.h"
#import "driverCarInfoVC.h"

@interface driverLicensePhotoVC ()

@end

@implementation driverLicensePhotoVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"passDriverToCI"]){
        driverCarInfoVC *controller = (driverCarInfoVC *)segue.destinationViewController;
        controller.createdDriver = self.createdDriver;
    }
}

#pragma mark - Pictures

-(IBAction)takePhoto :(id)sender

{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    
    // image picker needs a delegate,
    [imagePickerController setDelegate:self];
    
    // Place image picker on the screen
    [self presentModalViewController:imagePickerController animated:YES];
}



-(IBAction)chooseFromLibrary:(id)sender
{
    
    UIImagePickerController *imagePickerController= [[UIImagePickerController alloc] init];
    [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    // image picker needs a delegate so we can respond to its messages
    [imagePickerController setDelegate:self];
    
    // Place image picker on the screen
    [self presentModalViewController:imagePickerController animated:YES];
    
}

//delegate methode will be called after picking photo either from camera or library
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissModalViewControllerAnimated:YES];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.imageView.image = image;
    
    self.createdDriver.IDPicture = UIImagePNGRepresentation(image);
}


#pragma mark - Buttons

- (IBAction)takePictureButtonPressed:(UIButton *)sender
{
    [self takePhoto:self];
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{
    // Save data into driver
    
    // Navigation
    [self performSegueWithIdentifier:@"passDriverToCI" sender:self];
}

- (IBAction)backButtonPressed:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
