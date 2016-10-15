//
//  YPDragerViewController.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPDragerViewController.h"
#import "YPLeftView.h"
#import "YPTabBarController.h"

@interface YPDragerViewController ()<YPLeftViewDelegate>
@property (nonatomic,strong) UITabBarController *tabBar;
@end

@implementation YPDragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加左侧的view
    [self addLeftView];
    //添加子控制器
    [self addChildVC];
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(open) name:@"openDrage" object:nil];
}

- (void)dealloc{
    //虽然抽屉控制器永远不会被销毁，但要养成添加监听者，就要删除监听者的习惯
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//添加左侧的view
- (void)addLeftView{

    YPLeftView *leftV =  [YPLeftView leftView];
    leftV.frame = self.leftV.bounds;
    [self.leftV addSubview:leftV];
    
    //设置YPLeftView代理
    leftV.delegate = self;
    
}
//添加子控制器

- (void)addChildVC{
    //如果说想要办到谁的事, 谁来做, 可以继承系统的类,把属性自己的东西,写到自己里面去.让代码的结构更清晰.
    YPTabBarController *tabBarVC = [[YPTabBarController alloc] init];//tips，再隐藏底部tabBar
    tabBarVC.view.frame = self.MainV.bounds;
    [self.MainV addSubview:tabBarVC.view];
    
    self.tabBar = tabBarVC;//防止被销毁，则他的View无法处理业务逻辑
    
}

#pragma mark - <YPLeftViewDelegate>

- (void)leftView:(YPLeftView *)leftV preBtnIndex:(NSInteger)preIndex selBtnIndex:(NSInteger)index{
        //根据选中的按钮tag切换控制器的view
        //切换控制器
    self.tabBar.selectedIndex = index;
        //关闭抽屉
    [self close];//父类私有方法不可调用，=>> 将私有方法变成公有的方法
}

#pragma mark - YPLeftView代理
- (void)leftViewDidSelectCity:(YPLeftView *)leftV{
    //关闭抽屉
    [self close];
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
