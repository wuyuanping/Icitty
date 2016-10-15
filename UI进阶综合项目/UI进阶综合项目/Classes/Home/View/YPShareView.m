//
//  YPShareView.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/20/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPShareView.h"
//#import "UIView+YPFrame.h"//已经在pch文件中写了
#import "YPCoverView.h"

@implementation YPShareView



+ (void) showShareView{

    //创建view
    YPShareView *shareV = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YPShareView class]) owner:nil options:nil] lastObject];
    //根据modal的底层实现modal效果
        //写一个UIView的分类，添加属性
//    shareV.width = [UIScreen mainScreen].bounds.size.width;//适应不同尺寸
//    shareV.y = [UIScreen mainScreen].bounds.size.height;//刚开始不出现
    shareV.width = screenW;
    shareV.y  = screenH;
    
    //添加到窗口上
    [[UIApplication sharedApplication].keyWindow addSubview:shareV];
    //动画：扩住变化的部分
    [UIView animateWithDuration:0.25 animations:^{
        shareV.y = [UIScreen mainScreen].bounds.size.height - shareV.height;
    }];

    

}

+ (void)hiddenShareViewCompletion:(void (^)())completion{

    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([view isKindOfClass:[YPShareView class]]) {
            //是分享的View
            [UIView animateWithDuration:0.25 animations:^{
                
                view.y = [UIScreen mainScreen].bounds.size.height;
                
            }completion:^(BOOL finished) {
                //移除分享的view
                [view removeFromSuperview];
                
                //隐藏完毕时,要做的事件不确定.(可能接下来是弹框？或者是退出遮盖)，
                //移除遮盖
                
                
                completion();
//                for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
//                    if ([view isKindOfClass:[YPCoverView class]]) {
//                        [view removeFromSuperview];
//                    }
//                }
                
                //弹框
                //                UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"asdf" message:@"asdfa" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
                //                [alertV show];
                
            }];
        }
    }
    
}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
