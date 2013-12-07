//
//  Class.h
//  iCouncelor
//
//  Created by Nick Artman on 11/25/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UAClass : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * subject;
@property (nonatomic, retain) NSString * available;
@property (nonatomic, retain) NSNumber * credits;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * uniqueId;
@property (nonatomic, retain) NSArray * tags;
@property (nonatomic, retain) NSNumber * isInCart;
@property (nonatomic, retain) NSNumber * isTaken;
@property (nonatomic, retain) NSDictionary * prerequisites;
@property (nonatomic, retain) NSDictionary * alternatives;

@end
