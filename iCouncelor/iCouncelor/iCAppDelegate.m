//
//  iCAppDelegate.m
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import "iCAppDelegate.h"

#import "iCMasterViewController.h"
#import "iCRootTabBarController.h"
#import "UAClass.h"
#import "iCSplitViewController.h"
#import "iCNavigationController.h"

@implementation iCAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    
    NSLog( @"Starting UbiquityStoreManagerExample on device: %@\n\n", [UIDevice currentDevice].name );
    
    // STEP 1 - Initialize the UbiquityStoreManager
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"iCouncelor.sqlite"];
    _ubiquityStoreManager = [[UbiquityStoreManager alloc] initStoreNamed:nil withManagedObjectModel:nil
                                                           localStoreURL:storeURL containerIdentifier:nil additionalStoreOptions:nil
                                                                delegate:self];
    
    
    self.ubiquityStoreManager.cloudEnabled = YES;

    
    iCRootTabBarController *controller = (iCRootTabBarController*) self.window.rootViewController;
    [controller setManagedObjectContext:self.managedObjectContext];
    
    NSArray *controllers = controller.viewControllers;
    
    for (id vc in controllers) {
        [vc setManagedObjectContext:self.managedObjectContext];
        
        if ([vc class] == [iCSplitViewController class]){
            iCSplitViewController *splitter = vc;
            
            
            NSArray *viewControllers = splitter.viewControllers;
            
            for (iCNavigationController *controller in viewControllers){
                if ([controller class] == [iCNavigationController class]){
                    controller.managedObjectContext = self.managedObjectContext;
                }
            }
            
        }
    }
    
    [self.ubiquityStoreManager rebuildCloudContentFromCloudStoreOrLocalStore:YES];
    
    return YES;
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    
    
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

- (UAClass *)getClassFromUniqueId:(NSString *)uniqueId
{
    
    NSFetchRequest * classQuery = [[NSFetchRequest alloc] init];
    [classQuery setEntity:[NSEntityDescription entityForName:@"UAClass" inManagedObjectContext:self.managedObjectContext]];
    [classQuery setPredicate:[NSPredicate predicateWithFormat:@"uniqueId == %@", uniqueId]];
    [classQuery setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    UAClass *class = [[self.managedObjectContext executeFetchRequest:classQuery error:&error] firstObject];
    
    return class;
    
}

- (NSString *)getUniqueIdFromClassPlist:(NSDictionary *)plistClass
{
    
    return [NSString stringWithFormat:@"%@:%@",[plistClass valueForKey:@"subject"],[plistClass valueForKey:@"number"]];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"iCouncelor" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"iCouncelor.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (NSManagedObjectContext *)managedObjectContextForUbiquityChangesInManager:(UbiquityStoreManager *)manager {
    
    return self.managedObjectContext;
}

- (void)ubiquityStoreManager:(UbiquityStoreManager *)manager willLoadStoreIsCloud:(BOOL)isCloudStore {
    
    NSLog( @"Triggered willLoadStoreIsCloud");
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    
    _managedObjectContext = nil;
}

- (void)ubiquityStoreManager:(UbiquityStoreManager *)manager failedLoadingStoreWithCause:(UbiquityStoreErrorCause)cause context:(id)context wasCloud:(BOOL)wasCloudStore
{
    NSLog( @"Triggered failedLoadingStoreWithCause");
}
- (void)ubiquityStoreManager:(UbiquityStoreManager *)manager didLoadStoreForCoordinator:(NSPersistentStoreCoordinator *)coordinator isCloud:(BOOL)isCloudStore
{
    NSLog( @"Triggered didLoadStoreForCoordinator");
    
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    moc.persistentStoreCoordinator = coordinator;
    moc.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
    _managedObjectContext = moc;
    
    [self syncRemoteClasses];
    
}

-(void)syncRemoteClasses
{
    
    NSURL *url = [NSURL URLWithString:@"http://raw.github.com/AddoSolutions/University-of-Akron-iCounselor/master/remote-plist.plist"];
    
    NSLog(@"Using SQLLite DB: %@", self.managedObjectContext.persistentStoreCoordinator.description);
    
    NSDictionary *allData = [[NSDictionary alloc] initWithContentsOfURL:url];
    
    NSDictionary *classData = [allData valueForKey:@"courses"];
    
    NSLog(@"classData contains %i dictionaries.", [classData count]);
    
    
    if ([classData count] > 0){
        
        /* Delete all objects before re-adding them */
        
        NSFetchRequest * allClassesQuery = [[NSFetchRequest alloc] init];
        [allClassesQuery setEntity:[NSEntityDescription entityForName:@"UAClass" inManagedObjectContext:self.managedObjectContext]];
        [allClassesQuery setIncludesPropertyValues:NO]; //only fetch the managedObjectID
        
        NSError * error = nil;
        NSArray * allClasses = [self.managedObjectContext executeFetchRequest:allClassesQuery error:&error];
        //error handling goes here
        for (UAClass * class in allClasses) {
            
            /*
             
             Check if the class is NOT in the pList and has NOT been taken
             
             found = false;
             
             for (plist data){
             if matches, found=true
             }
             
             if (!found) deleteObject;
             
             */
            
            bool found = false;
            
            for (NSDictionary *eachClassRaw in classData) {
                if( [[self getUniqueIdFromClassPlist:eachClassRaw] isEqualToString:class.uniqueId] ){
                    found = true;
                    NSLog(@"Already found: %@", class.uniqueId);
                    break;
                }
            }
            
            if (!found){
                [self.managedObjectContext deleteObject:class];
                NSLog(@"Deleting: %@", class.uniqueId);
            }
        }
        
        /* Re add the new ones */
        
        for (NSDictionary *eachClassRaw in classData) {
            
            
            // Check id class exists in DB, if so, load it and edit it, otherwise make one.
            
            NSString *uniqueId = [self getUniqueIdFromClassPlist:eachClassRaw];
            
            UAClass *class = [self getClassFromUniqueId:uniqueId];
            
            if (class == nil){
                class = [NSEntityDescription insertNewObjectForEntityForName:@"UAClass" inManagedObjectContext:self.managedObjectContext ];
                
                NSLog(@"Creating: %@", uniqueId);
            }else{
                
                NSLog(@"Just updating: %@", uniqueId);
            }
            
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            
            class.subject = [f numberFromString:[eachClassRaw valueForKey:@"subject"]];
            class.number = [f numberFromString:[eachClassRaw valueForKey:@"number"]];
            class.available = [eachClassRaw valueForKey:@"available"];
            class.name = [eachClassRaw valueForKey:@"name"];
            class.credits = [eachClassRaw valueForKey:@"credits"];
            class.desc = [eachClassRaw valueForKey:@"description"];
            class.tags = [eachClassRaw valueForKey:@"tags"];
            class.prerequisites = [eachClassRaw valueForKey:@"prerequisites"];
            class.alternatives = [eachClassRaw valueForKey:@"alternatives"];
            class.uniqueId = [self getUniqueIdFromClassPlist:eachClassRaw];
            
            
            
        }
        
        [self.managedObjectContext save:&error];
        
    }

}

@end
