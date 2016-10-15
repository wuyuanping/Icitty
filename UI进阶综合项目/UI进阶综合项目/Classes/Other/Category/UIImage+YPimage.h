//
//  UIImage+YPimage.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YPimage)

//根据传入的图片名字。返回一张不渲染的图片
+ (UIImage *)imageWithOriginalModel:(NSString *)imageName;



@end
