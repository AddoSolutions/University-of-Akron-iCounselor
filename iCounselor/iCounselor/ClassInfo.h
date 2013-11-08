//
//  ClassInfo.h
//  iCounselor
//
//  Created by Fortunato,Joseph on 11/8/13.
//  Copyright (c) 2013 Addo Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ClassInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * credits;
@property (nonatomic, retain) NSString * days;
@property (nonatomic, retain) NSString * courseDescription;
@property (nonatomic, retain) NSString * instructor;
@property (nonatomic, retain) NSString * courseName;
@property (nonatomic, retain) NSString * time;

@end
