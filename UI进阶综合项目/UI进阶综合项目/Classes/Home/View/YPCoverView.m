//
//  YPCoverView.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/20/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPCoverView.h"

@implementation YPCoverView



+ (instancetype)showCover{
    YPCoverView *cover = [[YPCoverView alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
//显示到最上方向东西都是添加到主窗口上的.
//通过UIApplication获取主窗口
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    return cover;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //移除遮盖
    //[self removeFromSuperview];
    //通知外界点击了遮盖.
    if ([self.delegate respondsToSelector:@selector(coverViewDidClose:)]) {
        [self.delegate coverViewDidClose:self];
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
