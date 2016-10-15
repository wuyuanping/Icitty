//
//  YPNavigationVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPNavigationVC.h"
#import "UIImage+YPimage.h"

@interface YPNavigationVC ()

@end

@implementation YPNavigationVC

//当类被加载时调用
+(void)load {
    //NSLog(@"%s",__func__);
}

//当前类或者它的子类第一次使用时调用
+ (void)initialize {
    //NSLog(@"%s",__func__);
    //设置导航条统一的样式
    
    //因为类方法中不可访问成员变量（属性），故要将属性设置为全局属性
    //获取全局(整个应用程序导航条,约束范围太大，一般很少这么干)
    //UINavigationBar *bar = [UINavigationBar appearance];
    
    //获取指定类下面的导航条.(更好，当使用不同类型的导航条时好处就体现出来了)
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[YPNavigationVC class]]];
    
    //设置背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault];
    //设置标题的文字
    [bar setTitleTextAttributes:@{
                                  NSForegroundColorAttributeName:[UIColor whiteColor],
                                  NSFontAttributeName:[UIFont boldSystemFontOfSize:20]
                                  }];
                                  
}
//每次设置导航控制器的根控制器的导航条，均有一些重复操作，可否在一个共有方法中实现？？
//解决：根据设置每个导航控制器根控制器的底部实现，均会调用如下push方法(注意：入栈都会调用这个方法)
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //当为根控制器时，才要设置menuIcon
    if (self.childViewControllers.count == 0) {//因为循环，故有4个导航控制器
        
        //参数viewController代表当前栈顶控制器
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalModel:@"menuIcon"] style:0 target:self action:@selector(menuClick)];
    }else{//非根控制器,导航条左边图片为NavBack
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalModel:@"NavBack"] style:0 target:self action:@selector(back)];
    }
        
    [super pushViewController:viewController animated:animated];//切记：super指优先实现父类方法
}


- (void)menuClick{
//打开抽屉
    //上下级才用代理，block
    //这里是跨级，故用通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"openDrage" object:nil];

}

- (void)back{
    //返回上一级
    [self popViewControllerAnimated:YES];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
