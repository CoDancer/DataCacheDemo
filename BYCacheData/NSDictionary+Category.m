//
//  NSDictionary+Category.m
//  JobProject
//
//  Created by CoDancer on 2016/12/17.
//  Copyright © 2016年 CoDancer. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

- (id)objectOrNilForKey:(NSString *)key {
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    else {
        return object;
    }
}

+ (NSDictionary *)subUrlDicWithUrl:(NSURL *)url {
    
    NSMutableDictionary *urlParameters = nil;
    NSString *urlString = [url absoluteString];

    NSRange optionsRange = [urlString rangeOfString:@"?"];
    if (optionsRange.location != NSNotFound) {
        urlString = [urlString substringFromIndex:optionsRange.location+1 ];

        urlParameters = [NSMutableDictionary dictionary];
        NSArray *pairs = [urlString componentsSeparatedByString:@"&"];
        if (pairs.count > 0) {
            for (NSString *pair in pairs) {
                NSArray *componentPair = [pair componentsSeparatedByString:@"="];
                NSString *key = [[componentPair objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
                NSString *value = [[componentPair objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];

                [urlParameters setObject:value forKey:key];
            }
        }
    }

    return urlParameters;
}

@end
