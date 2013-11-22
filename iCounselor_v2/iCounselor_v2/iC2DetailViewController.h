//
//  iC2DetailViewController.h
//  iCounselor_v2
//
//  Created by Fortunato,Joseph on 11/22/13.
//  Copyright (c) 2013 Akron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iC2DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
