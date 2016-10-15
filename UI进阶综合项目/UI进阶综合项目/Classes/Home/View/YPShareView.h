//
//  YPShareView.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/20/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPShareView : UIView



//弹出分享的View
+ (void)showShareView;

//隐藏分享的View
+ (void)hiddenShareViewCompletion:(void (^)())completion;//巧妙使用代码块

@end
