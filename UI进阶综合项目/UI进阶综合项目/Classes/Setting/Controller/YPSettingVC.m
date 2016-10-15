//
//  YPSettingVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPSettingVC.h"
#import "YPPushVC.h"
#import "YPChooseVC.h"

@interface YPSettingVC ()

@end

@implementation YPSettingVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置"; //可省略navigationItem
    //描述一组
    [self setUpGroup0];
    [self setUpGroup1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //取消按钮
    UIView *footV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 44)];//tableFooterView宽度系统默认设置为屏幕宽度，你无法修改
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    btn.x = 10;
    btn.width = screenW - 2 * btn.x;
    btn.height = 44;
    btn.layer.cornerRadius = 8;
    [footV addSubview:btn];
    
    self.tableView.tableFooterView = footV;
    
}

- (void)setUpGroup0{
    //描述一行(按需求，创建指定模型的cell)注意：模型之间的继承也是继承父类所有属性和方法
    YPSettingArrowItem *rowItem = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"个人中心"];
    rowItem.desVCName = [YPPushVC class];
    
    YPSettingArrowItem *rowItem1 = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"more_historyorder"] title:@"中心"];
    rowItem1.desVCName = [YPChooseVC class];
    
    
    YPRowItem *rowItem2 = [YPRowItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"个人中心"];
    //一组当中存放行数
    NSArray *rowArray = @[rowItem,rowItem1,rowItem2];
    //创建组模型
    YPSettingGroupItem *groupItem = [YPSettingGroupItem ItemWithRowItemArray:rowArray];
    //添加一组
    [self.groupArray addObject:groupItem];

}

- (void)setUpGroup1{
    //描述一行
    YPSettingArrowItem *rowItem = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"清理缓存"];
    rowItem.desTask = ^(NSIndexPath* indexPath){
        //弹出弹框
        UIAlertController *alert = [[UIAlertController alloc] init];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:nil];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action1];
        [alert addAction:action2];
        
        [self presentViewController:alert animated:YES completion:nil];
    };
    
    YPSettingArrowItem *rowItem1 = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"more_historyorder"] title:@"中心"];
    //一组当中有多少行
    NSArray *rowArray = @[rowItem,rowItem1];
    //创建组模型
    YPSettingGroupItem *groupItem1 = [YPSettingGroupItem ItemWithRowItemArray:rowArray];
    
    //其他属性可按需添加
    groupItem1.headerT = @"第一组头部";
    groupItem1.footerT = @"第一组尾部";
    //添加一组组模型
    [self.groupArray addObject:groupItem1];
    

}


-(void)dealloc{
    NSLog(@"%s",__func__);

}














@end
