//
//  WYPViewController.h
//  抽屉效果(掌握)
//
//  Created by 园平 on 9/9/16.
//  Copyright © 2016 园平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYPViewController : UIViewController
//为了让外界调用
@property (nonatomic,weak) UIView *MainV;
@property (nonatomic,weak) UIView *leftV;

//关闭窗口
- (void)close;

//开启窗口
- (void)open;

@end
