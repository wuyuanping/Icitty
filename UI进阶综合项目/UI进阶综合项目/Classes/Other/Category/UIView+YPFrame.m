//
//  UIView+YPFrame.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/20/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "UIView+YPFrame.h"

@implementation UIView (YPFrame)

/***
 
 1.一般情况下,分类只能添加方法.
 2.如果想要添加属性,也是可以的,有条件
 必须得要重写该属性的set与get方法才行.
 
 3.使用@property不会生成带有下划线的成员属性.
 使用@property它会声明set与get方法
 */

//@dynamic width;

- (CGFloat)width {
    return self.frame.size.width;//切记：不会生成带下划线的属性
}

- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    
}


- (CGFloat)height {
    return self.frame.size.height;
    
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}





@end
