//
//  MasterViewController.h
//  SneakrBook
//
//  Created by Adam Cooper on 10/22/14.
//  Copyright (c) 2014 Pixifly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

