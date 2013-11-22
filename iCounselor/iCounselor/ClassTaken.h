//
//  ClassTaken.h
//  iCounselor
//
//  Created by Fortunato,Joseph on 11/22/13.
//  Copyright (c) 2013 Nick Artman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ClassTaken : NSManagedObject

@property (nonatomic, retain) NSString * classID;
@property (nonatomic, retain) NSDate * dateTaken;

@end
