//
//  FMAppWebRequest.h
//  Screenshot
//
//  Created by CoDancer on 2016/12/27.
//  Copyright © 2016年 Fm. All rights reserved.
//

#import "FMHTTPClient.h"
#import "GPAPIHeader.h"

@interface FMAppWebRequest : FMHTTPClient

+ (instancetype)sharedClient;

//首页数据
FM_DEFAULT_PARAMS_API(homePageWithParam:(NSDictionary *)params SQTableName:(NSString *)name);

@end
