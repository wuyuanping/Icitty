//
//  YPAwardVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPAwardVC.h"

#import "YPScoreVC.h"

@interface YPAwardVC ()
@end

@implementation YPAwardVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"中奖";
    //描述一组
    [self setUpGroup0];
}
//描述一组
- (void)setUpGroup0 {
    
    //描述一行
    YPSettingSwitchItem *rowItem = [YPSettingSwitchItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"使用兑换码"];
    rowItem.subTitle = @"每周二,四,日开奖";
    
    
    YPSettingArrowItem *rowItem1 = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"more_historyorder"] title:@"优惠"];
    rowItem1.desVCName = [YPScoreVC class];
    
    //一组当中有多少行
    NSArray *rowArray = @[rowItem,rowItem1];
    
    //创建组模型
    YPSettingGroupItem *groupItem = [YPSettingGroupItem ItemWithRowItemArray:rowArray];
    groupItem.headerT = @"第0组头部";
    
    //添加一组
    [self.groupArray addObject:groupItem];
}




@end
