//
//  YPScoreVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 25/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPScoreVC.h"

@interface YPScoreVC ()
@property (nonatomic,assign) int a;
@end

@implementation YPScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"比分直播";
    [self setUpGroup0];
    [self setUpGroup1];
    [self setUpGroup1];
    [self setUpGroup1];
    [self setUpGroup1];
    [self setUpGroup1];
    
    _a = 10;


}


- (void)setUpGroup0 {
    
    //描述一行
    YPSettingArrowItem *rowItem = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"开奖推送"];
    
    YPSettingSwitchItem *rowItem1 = [YPSettingSwitchItem ItemWithImage:[UIImage imageNamed:@"more_historyorder"] title:@"比分直播"];
    
    //一组当中有多少行
    NSArray *rowArray = @[rowItem,rowItem1];
    
    //创建组模型
    YPSettingGroupItem *groupItem = [YPSettingGroupItem ItemWithRowItemArray:rowArray];
    groupItem.headerT = @"第0组头部";
    
    //添加一组
    [self.groupArray addObject:groupItem];
}


- (void)setUpGroup1 {
    
    //描述一行
    YPSettingArrowItem *rowItem = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"开奖推送"];
    
    
    //Block会对代码块当中的强指针进行强引用.
    //__weak XMGScoreVC * weaksSelf = self;
    
    __weak typeof(self) weakSelf = self;
    rowItem.desTask = ^(NSIndexPath *indexPath){
        
        NSLog(@"%d",weakSelf.a);//意义？？
       
        
        //弹出键盘
        UITextField *textF = [[UITextField alloc] init];
        [textF becomeFirstResponder];
        
        //添加到当前点击的Cell当中.
        //获取当前点击的Cell;
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        [cell addSubview:textF];
        
    };
    
    
    //一组当中有多少行
    NSArray *rowArray = @[rowItem];
    
    //创建组模型
    YPSettingGroupItem *groupItem = [YPSettingGroupItem ItemWithRowItemArray:rowArray];
    
    //添加一组
    [self.groupArray addObject:groupItem];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}





@end
