//
//  YPSaveTool.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 23/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPSaveTool : NSObject

/**
    根据key值来进行偏好设置
 */

+ (void)setObject:(id)value forKey:(NSString *)key;

/**
    根据key值来进行偏好读取
 */


+ (id)objectForKey:(NSString *)defaultName;
@end
