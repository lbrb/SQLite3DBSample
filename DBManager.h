//
//  DBManager.h
//  SQLite3DBSample
//
//  Created by liangbin on 15/4/27.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

@property (nonatomic, strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;

-(instancetype)initWithDatabaseFilename:(NSString *)dbFilename;
-(NSArray *)loadDataFromDB:(NSString *)query;
-(void)executeQuery:(NSString *)query;
@end
