//
//  LLRecordData.m
//  Loong Account Book
//
//  Created by 神龟网-梁梓龙 on 2017/1/7.
//  Copyright © 2017年 梁梓龙. All rights reserved.
//

#import "LLRecordData.h"

@implementation LLRecordData

+ (BOOL)insert:(LLRecordData *)recordData {
    
    FMDatabase *database = [FMDatabase databaseWithPath:LLDatabaseFilePath];
    BOOL success = [database executeQueryWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) VALUES (%@, %@, %@, %@, %@);", LLAccountTableName, LLABTypeIdFieldName, LLABAmountFieldName, LLABConsumptionDateFieldName, LLABGenerationDateFieldName, LLABRemainingSumFieldName, @(recordData.typeId), @(recordData.amount), recordData.consumptionDate, recordData.generationDate, @(recordData.remainingSum)];
    
    [database close];
    
    return success;
}

+ (NSArray <LLRecordData *> *)recordDatasOnPage:(NSUInteger)page pageSize:(NSUInteger)pageSize {
    FMDatabase *database = [FMDatabase databaseWithPath:LLDatabaseFilePath];
    FMResultSet *resultSet = [database executeQueryWithFormat:@"SELECT * FROM %@ ORDER BY id DESC LIMIT %d, %d;", LLAccountTableName, 0, 20];
    NSMutableArray *resultArray = [NSMutableArray array];
    while ([resultSet next]) {
        LLRecordData *record = [[LLRecordData alloc]init];
        [resultArray addObject:record];
    }
    
    [database close];
    return resultArray;
}

- (instancetype)initWithId:(int)recordId {
    self = [super init];
    if (self) {
        
        FMDatabase *database = [[FMDatabase alloc]initWithPath:LLDatabaseFilePath];
        FMResultSet *resultSet = [database executeQuery:@"SELECT * FROM %@ WHERE id = %@", LLAccountTableName, _recordId];
        while ([resultSet next]) {
            _recordId = [resultSet intForColumn:LLABIdFieldName];
            _typeId = [resultSet intForColumn:LLABTypeIdFieldName];
            _amount = [resultSet intForColumn:LLABAmountFieldName];
            _consumptionDate = [resultSet dateForColumn:LLABConsumptionDateFieldName];
            _generationDate = [resultSet dateForColumn:LLABGenerationDateFieldName];
            _remainingSum = [resultSet doubleForColumn:LLABRemainingSumFieldName];
            
            [database close];
        }
    }
    return self;
}

@end
