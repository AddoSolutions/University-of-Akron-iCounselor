//
//  ClassInfo.h
//  iCounselor
//
//  Created by Fortunato,Joseph on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ClassInfo, ClassTags;

@interface ClassInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * available;
@property (nonatomic, retain) NSNumber * credits;
@property (nonatomic, retain) NSString * descr;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * subject;
@property (nonatomic, retain) NSSet *alternatives;
@property (nonatomic, retain) NSSet *prerequisites;
@property (nonatomic, retain) NSSet *tags;
@end

@interface ClassInfo (CoreDataGeneratedAccessors)

- (void)addAlternativesObject:(ClassInfo *)value;
- (void)removeAlternativesObject:(ClassInfo *)value;
- (void)addAlternatives:(NSSet *)values;
- (void)removeAlternatives:(NSSet *)values;

- (void)addPrerequisitesObject:(ClassInfo *)value;
- (void)removePrerequisitesObject:(ClassInfo *)value;
- (void)addPrerequisites:(NSSet *)values;
- (void)removePrerequisites:(NSSet *)values;

- (void)addTagsObject:(ClassTags *)value;
- (void)removeTagsObject:(ClassTags *)value;
- (void)addTags:(NSSet *)values;
- (void)removeTags:(NSSet *)values;

@end
