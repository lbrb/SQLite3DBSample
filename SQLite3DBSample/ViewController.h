//
//  ViewController.h
//  SQLite3DBSample
//
//  Created by liangbin on 15/4/27.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tblPeople;
- (IBAction)addNewRecord:(id)sender;

@end

