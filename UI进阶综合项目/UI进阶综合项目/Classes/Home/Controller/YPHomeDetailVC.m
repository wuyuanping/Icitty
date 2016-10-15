//
//  YPHomeDetailVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPHomeDetailVC.h"
#import "UIImage+YPimage.h"
#import "YPCoverView.h"
#import "YPShareView.h"

@interface YPHomeDetailVC ()<YPCoverViewDelegate>

@end

@implementation YPHomeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalModel:@"share"] style:0 target:self action:@selector(rightClick)];
    
    
    
}


- (void)rightClick{
//    YPCoverView *cover = [YPCoverView coverView];
    //通过UIApplication获取主窗口
//    [[UIApplication sharedApplication].keyWindow addSubview:cover];
   //自己管自己的事
    //弹出遮盖(创建一个遮盖view)
   YPCoverView *coverV =  [YPCoverView showCover];//先弹出遮盖,要设置代理故要有返回值！！
    coverV.delegate = self;
    [YPShareView showShareView];//后弹出分享框
}
#pragma mark - 遮盖代理方法
- (void)coverViewDidClose:(YPCoverView *)coverView{

    //1.把分享的view移除
    [YPShareView hiddenShareViewCompletion:^{
        //移除遮盖
        [coverView removeFromSuperview];
    }];

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
