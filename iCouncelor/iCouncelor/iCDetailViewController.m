//
//  iCDetailViewController.m
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import "iCDetailViewController.h"

@interface iCDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation iCDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

// This is included so that the description label will scale to fit the text it contains
- (void) viewDidLayoutSubviews {
    [self.classDescription sizeToFit];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"name"] description];
        
        self.navigationItem.title = [[self.detailItem valueForKey:@"name"] description];
        self.className.text = [[self.detailItem valueForKey:@"name"] description];
        self.classSubject.text = [[self.detailItem valueForKey:@"subject"] description];
        self.classNumber.text = [[self.detailItem valueForKey:@"number"] description];
        self.classCredits.text = [[self.detailItem valueForKey:@"credits"] description];
        self.classDescription.text = [[self.detailItem valueForKey:@"desc"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
