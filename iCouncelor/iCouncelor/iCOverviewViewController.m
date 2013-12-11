//
//  iCTabViewController.m
//  iCouncelor
//
//  Created by Nick Artman on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import "iCOverviewViewController.h"
#import "UAClass.h"


@interface iCOverviewViewController ()

@end

@implementation iCOverviewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    NSFetchRequest * allClassesQuery = [[NSFetchRequest alloc] init];
    [allClassesQuery setEntity:[NSEntityDescription entityForName:@"UAClass" inManagedObjectContext:self.managedObjectContext]];
    [allClassesQuery setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    NSArray * allClasses = [self.managedObjectContext executeFetchRequest:allClassesQuery error:&error];
    //error handling goes here
    
    int creditsNeeded = 50;
    int creditsPerSemester = 10;
    int creditsTaken = 0;
    int classesTaken = 0;
    int creditsAvailable = 0;
    int classesAvailable = 0;
    
    for (UAClass * class in allClasses) {
        
        creditsAvailable += [[class credits] intValue];
        classesAvailable += 1;
        
        if (class.isTaken.boolValue){
            NSLog(@"Assuming took: %@", class.name);
            creditsTaken += [[class credits] intValue];
            classesTaken += 1;
        }
        
    }
    
    self.creditsNeededReport.text = [NSString stringWithFormat:@"%d",creditsNeeded];
    self.creditsTakenReport.text = [NSString stringWithFormat:@"%d",creditsTaken];
    self.expectedGraduationReport.text = @"Write Logic For This";
    
    float progress = [[NSNumber numberWithInt:creditsTaken] floatValue] / [[NSNumber numberWithInt:creditsNeeded] floatValue];
    
//    progress = .5;
    self.progressReportBar.progress = progress;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
