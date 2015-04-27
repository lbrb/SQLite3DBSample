//
//  ViewController.m
//  SQLite3DBSample
//
//  Created by liangbin on 15/4/27.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
#import "EditInfoViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, EditInfoViewControllerDelete>

@property (nonatomic, strong) DBManager *dbManage;
@property (nonatomic, strong) NSArray *arrPeopleInfo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tblPeople.delegate = self;
    self.tblPeople.dataSource = self;
    
    self.dbManage = [[DBManager alloc] initWithDatabaseFilename:@"sampledb.sql"];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNewRecord:(id)sender {
    [self performSegueWithIdentifier:@"idSequeEditInfo" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    EditInfoViewController *editVC = [segue destinationViewController];
    editVC.delegate = self;
}

-(void)loadData{
    NSString *query = @"select * from peopleInfo";
    
    if (self.arrPeopleInfo != nil) {
        self.arrPeopleInfo = nil;
    }
    self.arrPeopleInfo = [[NSArray alloc] initWithArray:[self.dbManage loadDataFromDB:query]];
    
    [self.tblPeople reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrPeopleInfo.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    
    NSInteger indexOfFirstname = [self.dbManage.arrColumnNames indexOfObject:@"firstname"];
    NSInteger indexOfLastname = [self.dbManage.arrColumnNames indexOfObject:@"lastname"];
    NSInteger indexOfAge = [self.dbManage.arrColumnNames indexOfObject:@"age"];
    
    // Set the loaded data to the appropriate cell labels.
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname], [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfLastname]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Age: %@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfAge]];
    
    return cell;
}

-(void)editingInfoWasFinished{
    [self loadData];
}
@end
