//
//  FMRecommendModel.m
//  FMPhoneShell
//
//  Created by mopucheng on 2017/4/7.
//  Copyright © 2017年 FMCompany. All rights reserved.
//

#import "FMRecommendModel.h"

@implementation FMRecommendModel

+(instancetype)insRequestRecommendData:(id)obj
{
    FMRecommendModel *model = [[FMRecommendModel alloc] initWithDictionary:obj error:nil];
    return model;
}


@end
