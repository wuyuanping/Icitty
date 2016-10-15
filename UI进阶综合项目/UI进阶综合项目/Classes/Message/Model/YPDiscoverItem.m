//
//  YPDiscoverItem.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/22/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPDiscoverItem.h"
#import "MJExtension.h"

@implementation YPDiscoverItem


//描述数组当中存放的是什么模型
+ (NSDictionary *)objectClassInArray{

    return @{
             @"themes":@"YPDiscoverThemeItem"
             
             };

}

//得到模型数组
+ (NSArray *)getDiscoveryList{

    return [YPDiscoverItem mj_objectArrayWithFilename:@"message.plist"];


}


@end
