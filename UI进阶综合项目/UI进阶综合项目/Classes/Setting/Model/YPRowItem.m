//
//  YPRowItem.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPRowItem.h"

@implementation YPRowItem

+ (instancetype)ItemWithImage:(UIImage *)image title:(NSString *)title{
    
    YPRowItem *RowItem = [[self alloc] init];//类工厂方法使用self，防止子类调用报错
    RowItem.image = image;
    RowItem.title = title;
    return RowItem;
}

@end
