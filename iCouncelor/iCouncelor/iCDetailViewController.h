//
//  iCDetailViewController.h
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iCDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *className;
@property (weak, nonatomic) IBOutlet UILabel *classSubject;
@property (weak, nonatomic) IBOutlet UILabel *classNumber;
@property (weak, nonatomic) IBOutlet UILabel *classCredits;
@property (weak, nonatomic) IBOutlet UILabel *classDescription;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@end
