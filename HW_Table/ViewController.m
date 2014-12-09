//
//  ViewController.m
//  HW_Table
//
//  Created by Гена on 08.12.14.
//  Copyright (c) 2014 fix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableIndexSet *inxSet1;
    NSMutableIndexSet *inxSet2;
    NSMutableArray *arr1;
    NSMutableArray *arr2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    inxSet1 = [NSMutableIndexSet new];
    inxSet2 = [NSMutableIndexSet new];
    arr1 = [[NSMutableArray alloc] initWithObjects: @"Test1", @"Test2", @"Test3", nil];
    arr2 = [[NSMutableArray alloc] initWithObjects: @"Test4", @"Test5", @"Test6", @"Test7", @"Test8", @"Test9", nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return arr1.count + arr2.count;
//    if(tableView == self.topTableView){
//        return 5;
//    }
//    
//    if(tableView == self.bottomTableView){
//        return 10;
//    }
//    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (tableView == self.topTableView) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"topCell" forIndexPath:indexPath];
        if (indexPath.row < arr1.count) cell.textLabel.text = [arr1 objectAtIndex:indexPath.row]; else cell.textLabel.text = @"";
//        cell.textLabel.text = @"Top Cells";
        if ([inxSet1 containsIndex:indexPath.row]) cell.accessoryType = UITableViewCellAccessoryCheckmark; else cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"bottomCell" forIndexPath:indexPath];
        if (indexPath.row < arr2.count) cell.textLabel.text = [arr2 objectAtIndex:indexPath.row]; else cell.textLabel.text = @"";
//        cell.textLabel.text = @"Bottom Cell";
        if ([inxSet2 containsIndex:indexPath.row]) cell.accessoryType = UITableViewCellAccessoryCheckmark; else cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (tableView == self.topTableView) {
        if (indexPath.row < arr1.count) {
            if (![inxSet1 containsIndex:indexPath.row]) {
                [inxSet1 addIndex:indexPath.row];
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                [inxSet1 removeIndex:indexPath.row];
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
    }
    if (tableView == self.bottomTableView) {
        if (indexPath.row < arr2.count) {
            if (![inxSet2 containsIndex:indexPath.row]) {
                [inxSet2 addIndex:indexPath.row];
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                [inxSet2 removeIndex:indexPath.row];
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
    }
}

- (IBAction)downButton {
    __block NSInteger counter = 0;
    [inxSet1 enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [arr2 addObject:[arr1 objectAtIndex:idx-counter]];
        [arr1 removeObjectAtIndex:idx-counter];
        counter++;
    }];
    [inxSet1 removeAllIndexes];
    [self.topTableView reloadData];
    [self.bottomTableView reloadData];
    NSLog(@"%@", arr1);
    NSLog(@"%@", arr2);
}

- (IBAction)upButton {
    __block NSInteger counter = 0;
    [inxSet2 enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [arr1 addObject:[arr2 objectAtIndex:idx-counter]];
        [arr2 removeObjectAtIndex:idx-counter];
        counter++;
    }];
    
//    [inxSet2 enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
//        [arr2 removeObjectAtIndex:idx];
//    }];
    
    [inxSet2 removeAllIndexes];
    
//    while (inxSet2) {
//        NSInteger i = [inxSet2 firstIndex];
//        [inxSet2 removeIndex:i];
//        [arr1 addObject:[arr2 objectAtIndex:i]];
//        [arr2 removeObjectAtIndex:i];
//    }
    [self.topTableView reloadData];
    [self.bottomTableView reloadData];
    NSLog(@"%@", arr1);
    NSLog(@"%@", arr2);
}
@end
