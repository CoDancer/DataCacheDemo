//
//  NSDictionary+Category.h
//  JobProject
//
//  Created by CoDancer on 2016/12/17.
//  Copyright © 2016年 CoDancer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

- (id)objectOrNilForKey:(NSString *)key;

+ (NSDictionary *)subUrlDicWithUrl:(NSURL *)url;

@end
