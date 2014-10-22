//
//  Person.h
//  SneakrBook
//
//  Created by Adam Cooper on 10/22/14.
//  Copyright (c) 2014 Pixifly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * profilePicture;
@property (nonatomic, retain) NSManagedObject *sneakers;
@property (nonatomic, retain) Person *friends;

@end
