//
//  DetailViewController.h
//  SneakrBook
//
//  Created by Adam Cooper on 10/22/14.
//  Copyright (c) 2014 Pixifly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

