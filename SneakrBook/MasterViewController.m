//
//  MasterViewController.m
//  SneakrBook
//
//  Created by Adam Cooper on 10/22/14.
//  Copyright (c) 2014 Pixifly. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import  "Person.h"

@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSArray *arrayOfPersons;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataForShoes];
}

-(void)loadDataForShoes{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"dataImported"]) {
        NSURL * url = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/18/friends.json"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
                                 
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error == nil) {
                NSArray *people = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                NSLog(@"Data = %@",people);
                for (NSString *name in people) {
                    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
                    person.name = name;
                }
                [self.managedObjectContext save:nil];
                [self loadObjectsFromCoreData];
            }
            [defaults setObject:@YES forKey:@"dataImported"];
            [defaults synchronize];
        }];
        [dataTask resume];
    } else {
         NSLog(@"Hello: %lu",(unsigned long)self.arrayOfPersons.count);
        [self loadObjectsFromCoreData];
    }
}

- (IBAction)help:(id)sender {
    [self loadObjectsFromCoreData];
    NSLog(@"%lu",(unsigned long)self.arrayOfPersons.count);
}

-(void)loadObjectsFromCoreData{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    NSError *error = nil;
    self.arrayOfPersons = [self.managedObjectContext executeFetchRequest:request error:&error];
    NSLog(@" FUCK %lu",(unsigned long)self.arrayOfPersons.count);
    if (error) NSLog(@"%@", error);
    [self.tableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayOfPersons.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Person *person = [self.arrayOfPersons objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = person.name;
    return cell;
    
}
@end
