//
//  LLRecordData.h
//  Loong Account Book
//
//  Created by 神龟网-梁梓龙 on 2017/1/7.
//  Copyright © 2017年 梁梓龙. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDB.h"

#define LLPageSize 10

@interface LLRecordData : NSObject

@property (nonatomic, assign) int recordId; /**< 记录ID，唯一 */
@property (nonatomic, assign) int typeId;
@property (nonatomic, assign) double amount;
@property (nonatomic, strong) NSDate *consumptionDate;
@property (nonatomic, strong) NSDate *generationDate;
@property (nonatomic, assign) double remainingSum;

+ (BOOL)insert:(LLRecordData *)recordData;
+ (NSArray <LLRecordData *> *)recordDatasOnPage:(NSUInteger)page
                                       pageSize:(NSUInteger)pageSize;

@end
