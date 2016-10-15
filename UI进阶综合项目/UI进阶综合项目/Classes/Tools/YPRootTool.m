//
//  YPRootTool.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 23/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPRootTool.h"

#import "YPDragerViewController.h"
#import "YPSaveTool.h"
#import "YPNewFeatureVC.h"


#define YPVersion @"version"

@implementation YPRootTool


+ (UIViewController *)chooseRootVC{

    //获取版本号
    NSString *cur = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    //获取上一次版本号
    NSString *preV = [YPSaveTool objectForKey:YPVersion];
    
     //如果说当前版本与上一次版本相同时,进入主框架
    if ([cur isEqualToString:preV]) {
        YPDragerViewController *VC = [[YPDragerViewController alloc] init];
        return VC;
    }else{
    
        //不同时，进入新特性
        YPNewFeatureVC *newVC = [[YPNewFeatureVC alloc] init];
        //保存当前新特性
        [YPSaveTool setObject:cur forKey:YPVersion];
        
        return newVC;
    
    }
}
@end
