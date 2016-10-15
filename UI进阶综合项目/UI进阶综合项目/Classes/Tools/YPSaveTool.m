//
//  YPSaveTool.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 23/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPSaveTool.h"

@implementation YPSaveTool

/**
 根据key值来进行偏好设置
 */

+ (void)setObject:(id)value forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];

}

/**
 根据key值来进行偏好读取
 */


+ (id)objectForKey:(NSString *)defaultName{

    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];


}




@end
