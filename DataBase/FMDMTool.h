//
//  FMDMTool.h
//  DataBase
//
//  Created by 张奥 on 2019/8/13.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import <sqlite3.h>
@interface FMDMTool : NSObject
+ (FMDMTool *)sharedDataBase;
//创建数据库
//创建数据列表
-(void)createTableName:(NSString*)name;
//插入数据
-(void)insertDataDatabaseName:(NSString *)name;
//查询数据
-(void)queryDatabaseName:(NSString *)name;
//更新数据
-(void)updateDatabaseFileName:(NSString *)fileName;
//删除数据
-(void)deleteDataFileName:(NSString *)fileName;
@end
