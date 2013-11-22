//
//  iCRootTabBarController.h
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iCRootTabBarController : UITabBarController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end
