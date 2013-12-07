//
//  iCDetailViewController.h
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAClass.h"

@interface iCDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) UAClass *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *className;
@property (weak, nonatomic) IBOutlet UILabel *classSubject;
@property (weak, nonatomic) IBOutlet UILabel *classNumber;
@property (weak, nonatomic) IBOutlet UILabel *classCredits;
@property (weak, nonatomic) IBOutlet UILabel *classDescription;
@property (weak, nonatomic) IBOutlet UISwitch *takenSwitch;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

@end
