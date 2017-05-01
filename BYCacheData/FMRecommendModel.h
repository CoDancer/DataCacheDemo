//
//  FMRecommendModel.h
//  FMPhoneShell
//
//  Created by mopucheng on 2017/4/7.
//  Copyright © 2017年 FMCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface FMRecommendModel : JSONModel

@property (nonatomic,strong)NSString *works_id;
@property (nonatomic,strong)NSString *works_url;
@property (nonatomic,strong)NSString *works_name;
@property (nonatomic,strong)NSString *allow_view;
@property (nonatomic,strong)NSString *allow_buy;
@property (nonatomic,strong)NSString *likes;
@property (nonatomic,strong)NSString *comments;
@property (nonatomic,strong)NSString *selected_type;
@property (nonatomic,strong)NSString *designer_id;
@property (nonatomic,strong)NSString *username;
@property (nonatomic,strong)NSString *headimgurl;

+(instancetype)insRequestRecommendData:(id)obj;

@end
