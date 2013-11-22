//
//  ClassInfo.h
//  iCounselor2
//
//  Created by Fortunato,Joseph on 11/22/13.
//  Copyright (c) 2013 Akron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClassInfo;

@interface ClassInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * subject;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSNumber * credits;
@property (nonatomic, retain) NSNumber * available;
@property (nonatomic, retain) ClassInfo *alternatives;
@property (nonatomic, retain) ClassInfo *prerequisites;
@property (nonatomic, retain) NSManagedObject *tags;

@end
