//
//  ViewController.m
//  BYCacheData
//
//  Created by CoDancer on 2017/4/25.
//  Copyright © 2017年 CoDancer. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Catrgory.h"
#import "FMGlobal.h"
#import "FMAppWebRequest.h"
#import "FMSQHelpModel.h"
#import "FMRecommendModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIButton *localDataBtn = [UIButton new];
    [localDataBtn setTitle:@"本地加载" forState:UIControlStateNormal];
    [localDataBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [localDataBtn addTarget:self action:@selector(reloadDataFromSQTable) forControlEvents:UIControlEventTouchUpInside];
    localDataBtn.size = CGSizeMake(100, 25);
    localDataBtn.layer.cornerRadius = 5.0;
    localDataBtn.layer.borderColor = [UIColor blackColor].CGColor;
    localDataBtn.layer.borderWidth = 1.0;
    [self.view addSubview:localDataBtn];
    
    localDataBtn.centerX = SCREEN_WIDTH/2.0;
    localDataBtn.bottomY = SCREEN_HEIGHT - 20;
    
    UIButton *requestBtn = [UIButton new];
    [requestBtn setTitle:@"发送请求" forState:UIControlStateNormal];
    [requestBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [requestBtn addTarget:self action:@selector(sendRequest) forControlEvents:UIControlEventTouchUpInside];
    requestBtn.size = CGSizeMake(100, 25);
    requestBtn.layer.cornerRadius = 5.0;
    requestBtn.layer.borderColor = [UIColor blackColor].CGColor;
    requestBtn.layer.borderWidth = 1.0;
    [self.view addSubview:requestBtn];
    
    requestBtn.centerX = SCREEN_WIDTH/2.0;
    requestBtn.bottomY = localDataBtn.topY - 20;
}

- (void)sendRequest {
    
    [[FMAppWebRequest sharedClient] homePageWithParam:nil SQTableName:@"homeCacheData" success:^(id responseObject) {
         NSLog(@"%@",responseObject);
    } failure:^(NSError *error, id cacheData) {
        NSLog(@"%@",cacheData);
    }];
}

- (void)reloadDataFromSQTable {
    
    NSDictionary *dic = [FMSQHelpModel dataDicFromSQTable:@"homeCacheData"];
    NSLog(@"%@",dic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
