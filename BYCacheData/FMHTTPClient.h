//
//  FMHTTPClient.h
//  Screenshot
//
//  Created by CoDancer on 2016/12/27.
//  Copyright © 2016年 Fm. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface FMHTTPClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

- (void)tagParams:(NSMutableDictionary *)params;

@end
