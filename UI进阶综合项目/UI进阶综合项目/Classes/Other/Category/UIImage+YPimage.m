//
//  UIImage+YPimage.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "UIImage+YPimage.h"

@implementation UIImage (YPimage)

//根据传入的图片名字。返回一张不渲染的图片
+ (UIImage *)imageWithOriginalModel:(NSString *)imageName{
    //1.获取图片
    UIImage *image = [UIImage imageNamed:imageName];
    //2.将获取的图片重新生成一张不渲染的图片(新图片可覆盖就图片，节省空间分配)
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}


@end
