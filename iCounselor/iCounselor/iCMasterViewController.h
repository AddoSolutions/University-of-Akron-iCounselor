//
//  iCMasterViewController.h
//  iCounselor
//
//  Created by Nick Artman on 11/20/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iCDetailViewController;

#import <CoreData/CoreData.h>

@interface iCMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) iCDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
