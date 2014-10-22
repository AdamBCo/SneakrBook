//
//  Comment.h
//  SneakrBook
//
//  Created by Adam Cooper on 10/22/14.
//  Copyright (c) 2014 Pixifly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person, Sneaker;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) Sneaker *shoe;
@property (nonatomic, retain) Person *owner;

@end
