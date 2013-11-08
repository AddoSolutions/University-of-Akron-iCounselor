//
//  ClassInfo.h
//  iCounselor
//
//  This class will handle the CoreData entity ClassInfo which is used
//  to store the information about a Computer Science class. The Degree
//  and Classes tabs will utilize this class.
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
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * time;

@end
