//
//  iC2DetailViewController.m
//  iCounselor2
//
//  Created by Fortunato,Joseph on 11/22/13.
//  Copyright (c) 2013 Akron. All rights reserved.
//

#import "iC2DetailViewController.h"

@interface iC2DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation iC2DetailViewController

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

// Here so that the description label will scale to fit the text it contains
- (void) viewDidLayoutSubviews {
    [self.description sizeToFit];
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
        
        // TODO populate these values based on the specific data for the class stored in Core Data
        self.navigationItem.title = @"Class Info";
        self.sectionNumber.text = @"3460:225";
        self.credits.text = @"4";
        self.prerequisites.text = @"Ehhh"; // TODO User should be able to click these to take them to that class's details
        self.alternatives.text = @"Hmmm"; // TODO same as prerequisites
        self.description.text = @"You will be schooled here...ERP MERP HERusofpodskfdsiuhfjsioafdshuifosdjom48ru89w340ri34 r09wirt0w9 itw8 t908t hwt 80u ";
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
