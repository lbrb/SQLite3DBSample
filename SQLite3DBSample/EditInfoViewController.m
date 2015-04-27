//
//  EditInfoViewController.m
//  SQLite3DBSample
//
//  Created by liangbin on 15/4/27.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import "EditInfoViewController.h"
#import "DBManager.h"

@interface EditInfoViewController () <UITextFieldDelegate>

@property (nonatomic, strong) DBManager *dbManage;

@end

@implementation EditInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtFirstname.delegate = self;
    self.txtLastname.delegate = self;
    self.txtAge.delegate = self;
    
    self.dbManage = [[DBManager alloc] initWithDatabaseFilename:@"sampledb.sql"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveInfo:(id)sender {
    NSString *query = [NSString stringWithFormat:@"insert into peopleInfo values(null, '%@', '%@', %d)", self.txtFirstname.text, self.txtLastname.text, [self.txtAge.text intValue]];
    
    [self.dbManage executeQuery:query];
    
    if (self.dbManage.affectedRows !=0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManage.affectedRows);
        [self.delegate editingInfoWasFinished];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        NSLog(@"Could not execute the query.");
    }
}
@end
