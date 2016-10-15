//
//  YPCoverView.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/20/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YPCoverView;

@protocol YPCoverViewDelegate <NSObject>

- (void)coverViewDidClose:(YPCoverView *)coverView;

@end

@interface YPCoverView : UIView

@property (nonatomic,weak) id<YPCoverViewDelegate> delegate;

+ (instancetype)showCover;

@end
