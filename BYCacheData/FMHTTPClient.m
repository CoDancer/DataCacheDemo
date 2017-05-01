//
//  FMHTTPClient.m
//  Screenshot
//
//  Created by CoDancer on 2016/12/27.
//  Copyright © 2016年 Fm. All rights reserved.
//

#import "FMHTTPClient.h"

@interface FMHTTPClient()

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

@implementation FMHTTPClient

+ (instancetype)sharedClient {
    
    static dispatch_once_t once;
    static FMHTTPClient *__singleton__;
    dispatch_once(&once, ^ {
        __singleton__ = [[self alloc] init];
    });
    return __singleton__;
}

-(AFHTTPRequestOperationManager *)manager {
    
    if (_manager == nil) {
        _manager = [AFHTTPRequestOperationManager manager];
        _manager.responseSerializer = [AFJSONResponseSerializer
                                       serializerWithReadingOptions:NSJSONReadingMutableContainers];
        _manager.requestSerializer=[AFHTTPRequestSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    }
    return _manager;
}

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(AFHTTPRequestOperation *, id))success
                        failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {
    
    NSMutableDictionary *parm = [NSMutableDictionary new];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parm setObject:obj forKey:key];
    }];
    [self tagParams:parm];
    NSString *url;
    url = [NSString stringWithFormat:@"%@%@",@"http://test-ke-api.oouuu.com",URLString];
    
    return [self.manager POST:url parameters:parm success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation, error);
        }
    }];
}

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(id)parameters
                    SQTabelName:(NSString *)tableName
                        success:(void (^)(AFHTTPRequestOperation *, id))success
                        failure:(void (^)(AFHTTPRequestOperation *, NSError *, id))failure {
    
    NSMutableDictionary *parm = [NSMutableDictionary new];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parm setObject:obj forKey:key];
    }];
    [self tagParams:parm];
    NSString *url;
    url = [NSString stringWithFormat:@"%@%@",@"服务器域名",URLString];
    
    return [self.manager GET:url
                  parameters:parm
                 SQTabelName:tableName
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(operation, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error, id cacheData) {
        if (failure) {
            failure(operation, error, cacheData);
        }
    }];
}

- (void)tagParams:(NSMutableDictionary *)params {
    
    if (!params) {
        params = [NSMutableDictionary dictionary];
    }
    NSDictionary *dictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *ver = [dictionary objectForKey:@"CFBundleShortVersionString"];
    
    params[@"systype"] = @"ios";
    params[@"appversion"] = ver;

}

@end
