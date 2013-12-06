//
//  UserInfo.h
//  iCouncelor
//
//  Created by Fortunato,Joseph on 12/6/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * creditsTaken;
@property (nonatomic, retain) NSNumber * creditsNeeded;
@property (nonatomic, retain) NSNumber * gpa;
@property (nonatomic, retain) NSDate * gradDate;

@end
