//
//  ClassTags.h
//  iCounselor
//
//  Created by Fortunato,Joseph on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ClassTags : NSManagedObject

@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) NSManagedObject *forClass;

@end
