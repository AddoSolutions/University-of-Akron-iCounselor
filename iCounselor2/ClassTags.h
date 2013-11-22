//
//  ClassTags.h
//  iCounselor2
//
//  Created by Fortunato,Joseph on 11/22/13.
//  Copyright (c) 2013 Akron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClassInfo;

@interface ClassTags : NSManagedObject

@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) ClassInfo *forClass;

@end
