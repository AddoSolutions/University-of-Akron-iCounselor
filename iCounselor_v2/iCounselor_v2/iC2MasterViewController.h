//
//  iC2MasterViewController.h
//  iCounselor_v2
//
//  Created by Fortunato,Joseph on 11/22/13.
//  Copyright (c) 2013 Akron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iC2DetailViewController;

#import <CoreData/CoreData.h>

@interface iC2MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) iC2DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
