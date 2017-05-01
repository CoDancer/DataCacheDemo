//
//  FMAppWebRequest.m
//  Screenshot
//
//  Created by CoDancer on 2016/12/27.
//  Copyright © 2016年 Fm. All rights reserved.
//

#import "FMAppWebRequest.h"
#import "FMSQHelpModel.h"
#import "NSDictionary+Category.h"
#import "SDWebImageDownloader.h"

@interface FMAppWebRequest()

@property (nonatomic, assign) int index;

@end

@implementation FMAppWebRequest

+ (instancetype)sharedClient {
    
    static dispatch_once_t once;
    static FMAppWebRequest *__singleton__;
    dispatch_once(&once, ^ {
        __singleton__ = [[self alloc] init];
    });
    return __singleton__;
}

FM_DEFAULT_PARAMS_API(homePageWithParam:(NSDictionary *)params SQTableName:(NSString *)name) {
    
    return [self GET:@"服务器API的后缀名" parameters:params SQTabelName:name success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    }failure:FM_HTTP_FAILURE ];
}

@end
