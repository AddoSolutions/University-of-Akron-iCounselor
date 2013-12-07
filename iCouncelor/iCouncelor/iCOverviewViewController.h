//
//  iCTabViewController.h
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCBaseClass.h"

@interface iCOverviewViewController : iCBaseClass
@property (weak, nonatomic) IBOutlet UILabel *creditsTakenReport;
@property (weak, nonatomic) IBOutlet UILabel *creditsNeededReport;
@property (weak, nonatomic) IBOutlet UILabel *expectedGraduationReport;
@property (weak, nonatomic) IBOutlet UIProgressView *progressReportBar;

@end
