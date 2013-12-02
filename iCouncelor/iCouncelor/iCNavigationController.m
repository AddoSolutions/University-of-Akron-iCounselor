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
    
    for (iCMasterViewController *controller in viewControllers){
        if ([controller class] == [iCMasterViewController class]){
            controller.managedObjectContext = self.managedObjectContext;
        }
    }
    
    [super viewDidLoad];
    
}

@end
