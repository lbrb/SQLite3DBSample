//
//  EditInfoViewController.h
//  SQLite3DBSample
//
//  Created by liangbin on 15/4/27.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditInfoViewControllerDelete

-(void)editingInfoWasFinished;

@end

@interface EditInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtFirstname;
@property (strong, nonatomic) IBOutlet UITextField *txtLastname;
@property (strong, nonatomic) IBOutlet UITextField *txtAge;

@property (nonatomic, strong) id<EditInfoViewControllerDelete> delegate;

- (IBAction)saveInfo:(id)sender;
@end
