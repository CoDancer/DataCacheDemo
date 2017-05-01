//
//  FMSQHelpModel.m
//  BYCacheData
//
//  Created by CoDancer on 2017/4/25.
//  Copyright © 2017年 CoDancer. All rights reserved.
//

#import "FMSQHelpModel.h"
#import "FMDatabase.h"
#import "FMRecommendModel.h"
#import "JSONKit.h"

@implementation FMSQHelpModel

static FMDatabase *_db;

+ (void)initialize {
    
    NSString *path = [NSString stringWithFormat:@"%@/Library/Caches/CacheData.db",NSHomeDirectory()];
    NSLog(@"%@",path);
    _db = [FMDatabase databaseWithPath:path];
    [_db open];
}

+ (void)saveDicFromNet:(NSDictionary *)dic inSQTable:(NSString *)name {
    
    NSString *createTableStr = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (itemDict blob NOT NULL)",name];
    [_db executeUpdate:createTableStr];
    NSString *dataStr = [NSString stringWithFormat:@"INSERT INTO %@ (itemDict) VALUES (?)",name];
    [_db executeUpdate:dataStr,[self getDicStrWithDic:dic]];
}

+ (NSDictionary *)dataDicFromSQTable:(NSString *)name {

    NSString *sqStr = [NSString stringWithFormat:@"SELECT * FROM %@",name];
    FMResultSet *set = [_db executeQuery:sqStr];
    NSMutableArray *dicArr = [NSMutableArray array];
    while (set.next) {
        // 获得当前所指向的数据
        NSString *dataStr = [set stringForColumn:@"itemDict"];
        NSDictionary *dict = [self dictionaryWithJsonString:dataStr];
        [dicArr addObject:dict];
    }
    return [dicArr firstObject];
}

+ (NSString *)getDicStrWithDic:(NSDictionary *)dic {
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
