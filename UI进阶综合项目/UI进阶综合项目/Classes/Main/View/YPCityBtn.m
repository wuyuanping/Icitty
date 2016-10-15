//
//  YPCityBtn.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/21/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPCityBtn.h"

@implementation YPCityBtn

- (void)awakeFromNib{
    [super awakeFromNib];
    //自定义有圆角的按钮
    self.layer.cornerRadius = 10;
}

//调整按钮里面子控件位置
- (void)layoutSubviews{
    [super layoutSubviews];
    //因为系统布局控件自己和里面子控件均会调用一次，故会调用两次,按理说第一次加载按钮的View时是没有子控件的，但调用方法时，会懒加载子控件，故会受影响
    if (self.titleLabel.x > self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;//+5 使布局更好看
        
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
