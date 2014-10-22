//
//  Sneaker.h
//  SneakrBook
//
//  Created by Adam Cooper on 10/22/14.
//  Copyright (c) 2014 Pixifly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Sneaker : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * picture;
@property (nonatomic, retain) NSSet *owner;
@end

@interface Sneaker (CoreDataGeneratedAccessors)

- (void)addOwnerObject:(Person *)value;
- (void)removeOwnerObject:(Person *)value;
- (void)addOwner:(NSSet *)values;
- (void)removeOwner:(NSSet *)values;

@end
