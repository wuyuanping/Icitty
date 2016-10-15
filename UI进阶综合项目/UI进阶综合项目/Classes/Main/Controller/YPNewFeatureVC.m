//
//  YPNewFeatureVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 23/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPNewFeatureVC.h"
#import "YPDragerViewController.h"

@interface YPNewFeatureVC ()

@end

@implementation YPNewFeatureVC

- (void)loadView {
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide"]];
    imageV.userInteractionEnabled = YES;//因为要点击按钮
    self.view = imageV;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加开始按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"startIcon"] forState:UIControlStateNormal];
    btn.bounds = CGRectMake(0, 0, 200, 50);
    btn.center = CGPointMake(screenW * 0.5, screenH * 0.8);//控件中点在父控件中的位置
    [self.view addSubview:btn];
    
    //监听点击
    [btn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    
}
//开始点击
- (void)startClick{

    //跳转到主框架
    YPDragerViewController *mainVC = [[YPDragerViewController alloc]init];
    
    //注意：跳转到主控制器不用modal，因为使用Modal会造成循环强引用，导致导航页控制器不会被销毁。
    
    [UIApplication sharedApplication].keyWindow.rootViewController = mainVC;

}

//- (void)dealloc{
//    //证明：使用Modal会造成循环强引用，导致导航页控制器不会被销毁。
//
//    NSLog(@"%s",__func__);
//}




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
