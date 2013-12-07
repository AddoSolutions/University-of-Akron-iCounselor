//
//  iCAppDelegate.h
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UbiquityStoreManager.h"

@interface iCAppDelegate : UIResponder <UIApplicationDelegate, UbiquityStoreManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(strong, nonatomic) UbiquityStoreManager *ubiquityStoreManager;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
