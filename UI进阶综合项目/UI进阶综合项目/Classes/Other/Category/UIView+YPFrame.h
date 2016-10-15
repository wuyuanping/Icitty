//
//  UIView+YPFrame.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/20/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YPFrame)


/***
 
 1.一般情况下,分类只能添加方法.
 2.如果想要添加属性,也是可以的,有条件
 必须得要重写该属性的set与get方法才行.
 
 3.使用@property不会生成带有下划线的成员属性.
 使用@property它会声明set与get方法
 */
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;



@end
