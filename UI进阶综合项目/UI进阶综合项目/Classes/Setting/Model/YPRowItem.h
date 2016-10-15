//
//  YPRowItem.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPRowItem : NSObject

@property (strong, nonatomic) UIImage *image;

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *subTitle;


+ (instancetype)ItemWithImage:(UIImage *)image title:(NSString *)title;

@end
