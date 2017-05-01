//
//  FMSQHelpModel.h
//  BYCacheData
//
//  Created by CoDancer on 2017/4/25.
//  Copyright © 2017年 CoDancer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMRecommendModel;
@interface FMSQHelpModel : NSObject

+ (void)saveDicFromNet:(NSDictionary *)dic inSQTable:(NSString *)name;

+ (NSDictionary *)dataDicFromSQTable:(NSString *)name;

@end
