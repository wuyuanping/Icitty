//
//  YPSettingBaseVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPSettingBaseVC.h"

@interface YPSettingBaseVC ()

@end

@implementation YPSettingBaseVC

- (NSMutableArray *)groupArray{
    if (!_groupArray) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}

//当初是通过init创建setting控制器的，重写该方法，设置tableView为组样式
- (instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
    
}

//因为继承自UITableViewController他的父类已经遵守了数据源协议和代理，故可不用再写遵守协议
#pragma - mark tableView数据源代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YPSettingGroupItem *groupItem =  self.groupArray[section];
    return groupItem.rowItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.创建cell(各司其职，自定义cell,提供方法创建cell)
    YPSettingCell *cell = [YPSettingCell cellWithTable:tableView style:UITableViewCellStyleValue1];
    //2.取出模型
    YPSettingGroupItem *groupItem = self.groupArray[indexPath.section];
    YPRowItem *rowItemn = groupItem.rowItemArray[indexPath.row];//传进来的模型就是你具体写入的模型
    //把模型给cell，让cell展示数据
    cell.rowItem = rowItemn;
    return cell;
}

//返加每一组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    YPSettingGroupItem *groupItem =  self.groupArray[section];
    return groupItem.headerT;
}

//返加每一组的尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    YPSettingGroupItem *groupItem =  self.groupArray[section];
    return groupItem.footerT;
}

//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取当前模型
    YPSettingGroupItem *groupItem = self.groupArray[indexPath.section];
    YPRowItem *rowItem = groupItem.rowItemArray[indexPath.row];
    //判断模型真实类型，直接调用提供的方法，具体怎么实现我控制器不管
    if ([rowItem isKindOfClass:[YPSettingArrowItem class]]) {
        //获取真实模型
        YPSettingArrowItem *item = (YPSettingArrowItem *)rowItem;
        //判断有没有要执行的任务
        if (item.desTask) {
            item.desTask(indexPath);
            return;//因为我们一般把跳转控制器方法写到了代码块中，所以写上return；只要执行了代码块，后面就无需执行了
        }
        //判断有没有要跳转的控制器的名称
        if (item.desVCName) {
            //创建控制器(注意：父类可以接受子类对象，多态)
            UIViewController *vc = [[item.desVCName alloc] init];
            //跳转
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }

}
    

@end
