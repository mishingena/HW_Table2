//
//  DetailViewController.h
//  HW_Table
//
//  Created by Гена on 08.12.14.
//  Copyright (c) 2014 fix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

