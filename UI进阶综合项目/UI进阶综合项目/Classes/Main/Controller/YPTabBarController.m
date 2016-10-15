//
//  YPTabBarController.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPTabBarController.h"
#import "YPNavigationVC.h"

@interface YPTabBarController ()

@end

@implementation YPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏tanbar底部导航条，就不会与用户交互
    self.tabBar.hidden = YES;//切记
    
    NSArray *childrenVCName = @[@"YPHomeVC",
                                @"YPDiscoverVC",
                                @"YPMessageVC",
                                @"YPSettingVC"
                                ];
    for (NSString *childVC in childrenVCName) {
        UIViewController *vc = [[NSClassFromString(childVC) alloc] init];
        //因为有导航条，故自定义导航条(抽取出来，可以自定义导航条一些样式，导航条的内容一般由栈顶控制器去决定，内容才会多样)
        YPNavigationVC *naVC = [[YPNavigationVC alloc] initWithRootViewController:vc];
        
        [self addChildViewController:naVC];
    }

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
