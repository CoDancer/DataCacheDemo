//
//  FMGlobal.h
//  JobProject
//
//  Created by CoDancer on 16/12/14.
//  Copyright © 2016年 CoDancer. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAINSCREEN [UIScreen mainScreen].bounds
//当前设备的屏幕宽度
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
//当前设备的屏幕高度
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

#define UserDefaults [NSUserDefaults standardUserDefaults]

#define APPLICATION [UIApplication sharedApplication]

#define PHONESCALE 1.62

#define k_IOS_Scale [[UIScreen mainScreen] bounds].size.width/320
#define k_IOSV_Scale [[UIScreen mainScreen] bounds].size.height/568

@interface FMGlobal : NSObject


@end
