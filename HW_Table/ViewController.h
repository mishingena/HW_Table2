//
//  ViewController.h
//  HW_Table
//
//  Created by Гена on 08.12.14.
//  Copyright (c) 2014 fix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView *topTableView;
@property (nonatomic, retain) IBOutlet UITableView *bottomTableView;

- (IBAction)downButton;
- (IBAction)upButton;

@end
