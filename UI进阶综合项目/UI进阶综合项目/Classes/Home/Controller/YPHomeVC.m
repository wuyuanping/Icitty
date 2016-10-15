//
//  YPHomeVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPHomeVC.h"
#import "YPHomeDetailVC.h"
#import "UIImage+YPimage.h"

#import "YPSectionItem.h"
#import "YPHomeCellItem.h"
//自定义cell
#import "YPHomeCell.h"
//自定义头部View
#import "YPSectionHeaderView.h"


@interface YPHomeVC ()


@property (nonatomic,strong) NSArray *homeDataArray;

@end

@implementation YPHomeVC


- (NSArray *)homeDataArray{

    if (!_homeDataArray) {
        _homeDataArray = [YPSectionItem getSectionItemList];//tips
    }
    return _homeDataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor colorWithRed:246 /255.0 green:246/255.0 blue:246/255.0 alpha:1];
    self.navigationItem.title = @"首页";

    //接收通知,注意：有对象传过来，故有参数
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(citySelect:) name:@"citySelect" object:nil];

}
//参数是一个NSNotification对象
- (void)citySelect:(NSNotification *)note{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:note.object style:0 target:nil action:nil];


}
#pragma maek - 数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.homeDataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    YPSectionItem *secItem = self.homeDataArray[section];
    
    return secItem.body.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    //1.创建cell
    YPHomeCell *cell = [YPHomeCell cellWithTableView:tableView];
    //2.获取模型
    YPSectionItem *section = self.homeDataArray[indexPath.section];
    YPHomeCellItem * homeCellItem = section.body[indexPath.row];
    
    //3.把数据给cell展示
    cell.homeCellItem = homeCellItem;
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    YPSectionHeaderView *headView = [YPSectionHeaderView sectionHeaderView];
    YPSectionItem *secItem = self.homeDataArray[section];
    headView.sectionItem = secItem;
    return headView;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    
    //只有tableView才能管理cell的高度，xib不能决定
    return 44;

}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //与xib设置的一致
    return 160;



}
//当选中某个cell时调用

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //点击就跳入相应的控制器view中
    YPHomeDetailVC *homeDetail = [[YPHomeDetailVC alloc] init];
    //当前控制器为栈顶控制器，可拿到对应导航控制器，并push
    [self.navigationController pushViewController:homeDetail animated:YES];
    //结果：首页无法点击，原因：之前抽屉有添加“点按手势”给他们的主控制器，“点按手势”优先级 > “点击”，故将抽屉点按手势添加到leftV即可（注意：父子关系和同级之间覆盖关系）
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
