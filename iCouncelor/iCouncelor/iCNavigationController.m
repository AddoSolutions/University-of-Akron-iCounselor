//
//  iCNavigationController.m
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import "iCNavigationController.h"

#import "iCMasterViewController.h"

@implementation iCNavigationController

- (void)viewDidLoad{
    
    NSArray *viewControllers = self.viewControllers;
    iCMasterViewController *controller = [viewControllers objectAtIndex:viewControllers.count - 1];
    
    controller.managedObjectContext = self.managedObjectContext;
    
}

@end
