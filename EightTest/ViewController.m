//
//  ViewController.m
//  EightTest
//
//  Created by Mark Adams on 9/7/14.
//  Copyright (c) 2014 Mark Adams. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate>

@end

@implementation ViewController

- (IBAction)alert:(id)sender
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Enter Password" message:@"Enter the password for the account mark@thoughtbot.com" preferredStyle:UIAlertControllerStyleAlert];
    [controller addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Password";
        textField.secureTextEntry = YES;
    }];
    [controller addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [controller addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)actionSheet:(id)sender
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Forget Network" message:@"Are you sure you want to forget this network?" preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:@"Forget Network" style:UIAlertActionStyleDestructive handler:nil]];
    [controller addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    controller.popoverPresentationController.sourceView = sender;
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)show:(id)sender
{
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Secondary"];
    viewController.modalPresentationStyle = UIModalPresentationPopover;
    viewController.popoverPresentationController.delegate = self;
    viewController.popoverPresentationController.sourceView = sender;
    [self showDetailViewController:viewController sender:self];
}

- (IBAction)dismiss:(UIStoryboardSegue *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewController

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationOverFullScreen;
}

- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style
{
    return [[UINavigationController alloc] initWithRootViewController:controller.presentedViewController];
}

@end
