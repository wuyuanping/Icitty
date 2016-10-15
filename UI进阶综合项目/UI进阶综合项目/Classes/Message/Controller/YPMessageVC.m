//
//  YPMessageVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPMessageVC.h"

@interface YPMessageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak,nonatomic) UIView *nearView;

@end

@implementation YPMessageVC

- (UIView *)nearView {
    if (!_nearView) {
        
        UIView *nearView = [[UIView alloc] initWithFrame:self.view.bounds];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:nearView.bounds];
        imageV.image = [UIImage imageNamed:@"wnxBG"];
        [nearView addSubview:imageV];
        [self.view addSubview:nearView];
        
        
        _nearView = nearView;
    }
    return _nearView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    //设置头部View
    [self setUpTitleView];
    //添加tableView
    [self addTableView];
    
}

- (void)setUpTitleView{

    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"推荐",@"附近"]];
    seg.width = screenW * 0.5;
    seg.selectedSegmentIndex = 0;
    //设置控件颜色
    seg.tintColor = [UIColor colorWithRed:20 / 255.0 green:149 / 255.0 blue:128 / 255.0 alpha:1];

    //设置文字的属性
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    //设置顶部View
    self.navigationItem.titleView = seg;
    //监听点击
    [seg addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];

}
- (void)valueChange:(UISegmentedControl *)seg{
    
    NSString *dir = nil;
    //判断点击了哪一个
    if (seg.selectedSegmentIndex == 0) {
        //只显示显示：推荐
        self.nearView.hidden = YES;//懒加载，生成了一个View
        dir = @"fromLeft";//动画方向（设置两个不同方向，来回显示）
    }else{//显示nearView
        self.nearView.hidden = NO;
        dir = @"fromRight";
    
    }
    
    //转场动画要添加给控件的父控件
    CATransition *anim = [CATransition animation];
    anim.type = @"oglFlip";
    anim.subtype = dir;//设置方向
    anim.duration = 0.5;
    //动画添加给他们的父控件View的layer上
    [self.view.layer addAnimation:anim forKey:nil];
}

- (void)addTableView{

    UITableView *tableV = [[UITableView alloc] init];
    tableV.frame = self.view.bounds;
    [self.view addSubview:tableV];
    
    tableV.dataSource = self;
    tableV.delegate = self;

}

#pragma mark - tableView数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *ID = @"messageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }

    cell.textLabel.text = @"well";
    return cell;
    
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
