//
//  FMDMTool.m
//  DataBase
//
//  Created by 张奥 on 2019/8/13.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "FMDMTool.h"
@interface FMDMTool()
@property (nonatomic, strong) FMDatabase *db;
@end
@implementation FMDMTool

+ (FMDMTool *)sharedDataBase
{
    static FMDMTool *fmdbDataBase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fmdbDataBase = [[FMDMTool alloc] init];
    });
    return fmdbDataBase;
}


//创建数据列表
-(void)createTableName:(NSString*)name{
    //2.创建对应路径下数据库
    _db = [FMDatabase databaseWithPath:[self filePathName:name]];
    //3.在数据库中进行增删改查操作时，需要判断数据库是否open，如果open失败，可能是权限或者资源不足，数据库操作完成通常使用close关闭数据库
    [_db open];
    if (![_db open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    //4.数据库中创建表（可创建多张）
    NSString *sql = [NSString stringWithFormat:@"create table if not exists %@ ('ID' INTEGER PRIMARY KEY AUTOINCREMENT,'name' TEXT NOT NULL, 'phone' TEXT NOT NULL,'score' INTEGER NOT NULL)",name];
    //5.执行更新操作 此处database直接操作，不考虑多线程问题，多线程问题，用FMDatabaseQueue 每次数据库操作之后都会返回bool数值，YES，表示success，NO，表示fail,可以通过 @see lastError @see lastErrorCode @see lastErrorMessage
    BOOL result = [_db executeUpdate:sql];
    if (result) {
        NSLog(@"create table success");
        
    }
    [_db close];
}
//插入数据
-(void)insertDataDatabaseName:(NSString *)name{
    
    [_db open];
    ///0.直接sql语句
    //    BOOL result = [db executeUpdate:@"delete from 't_student' where ID = 110"];
    //1.
    //    BOOL result = [db executeUpdate:@"delete from 't_student' where ID = ?",@(111)];
    //2.
    //    BOOL result = [db executeUpdateWithFormat:@"delete from 't_student' where ID = %d",112];
    //3.
    NSString *sql = [NSString stringWithFormat:@"insert into '%@'(ID,name,phone,score) values(?,?,?,?)",name];
    BOOL result = [_db executeUpdate:sql withArgumentsInArray:@[@118,@"x3",@"13",@53]];
    if (result) {
        NSLog(@"insert into 'studet' 成功");
    } else {
        NSLog(@"insert into 'studet' 失败");
    }
    [_db close];
}
//查询数据
-(void)queryDatabaseName:(NSString *)name{
    
    [_db open];
    //0.直接sql语句
    //    FMResultSet *result = [db executeQuery:@"select * from 't_student' where ID = 110"];
    //1.
    //    FMResultSet *result = [db executeQuery:@"select *from 't_student' where ID = ?",@111];
    //2.
    //    FMResultSet *result = [db executeQueryWithFormat:@"select * from 't_student' where ID = %d",112];
    //3.
    NSString *sql = [NSString stringWithFormat:@"select * from '%@' where ID = ?",name];
    FMResultSet *result = [_db executeQuery:sql withArgumentsInArray:@[@118]];
    //4
    //    FMResultSet *result = [db executeQuery:@"select * from 't_sutdent' where ID = ?" withParameterDictionary:@{@"ID":@114}];
    while ([result next]) {
        NSLog(@"%@",[result stringForColumn:@"name"]);
    }
}
//更新数据
-(void)updateDatabaseFileName:(NSString *)fileName{
    [_db open];
    //0.直接sql语句
    //    BOOL result = [db executeUpdate:@"update 't_student' set ID = 110 where name = 'x1'"];
    //1.
    //    BOOL result = [db executeUpdate:@"update 't_student' set ID = ? where name = ?",@111,@"x2" ];
    //2.
    //    BOOL result = [db executeUpdateWithFormat:@"update 't_student' set ID = %d where name = %@",113,@"x3" ];
    //3.
    NSString *sql = [NSString stringWithFormat:@"update '%@' set name = ? where ID = ?",fileName];
    BOOL result = [_db executeUpdate:sql withArgumentsInArray:@[@"张奥",@118]];
    if (result) {
        NSLog(@"update 't_student' 成功");
    } else {
       NSLog(@"update 't_student' 失败");
    }
    [_db close];
}
-(void)deleteDataFileName:(NSString *)fileName{
    [_db open];
    ///0.直接sql语句
    //    BOOL result = [db executeUpdate:@"delete from 't_student' where ID = 110"];
    //1.
    //    BOOL result = [db executeUpdate:@"delete from 't_student' where ID = ?",@(111)];
    //2.
    //    BOOL result = [db executeUpdateWithFormat:@"delete from 't_student' where ID = %d",112];
    //3.
    NSString *sql = [NSString stringWithFormat:@"delete from '%@' where ID = ?",fileName];
    BOOL result = [_db executeUpdate:sql withArgumentsInArray:@[@118]];
    if (result) {
        NSLog(@"delete from 't_student' 删除成功");
    } else {
        NSLog(@"delete from 't_student' 删除失败");
    }
    [_db close];
}
-(NSString*)filePathName:(NSString *)name{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db",name]];
    return filePath;
}

@end
