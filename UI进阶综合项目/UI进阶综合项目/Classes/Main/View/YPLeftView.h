//
//  YPLeftView.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <UIKit/UIKit.h>
//1.定义协议
@class YPLeftView;

@protocol YPLeftViewDelegate <NSObject>
//协议把自己传出去，再按需传
- (void)leftView:(YPLeftView *)leftV preBtnIndex:(NSInteger)preIndex selBtnIndex:(NSInteger)index;
- (void)leftViewDidSelectCity:(YPLeftView *)leftV;

@end


@interface YPLeftView : UIView

@property (nonatomic,weak)id<YPLeftViewDelegate> delegate;

+ (instancetype)leftView;


@end
