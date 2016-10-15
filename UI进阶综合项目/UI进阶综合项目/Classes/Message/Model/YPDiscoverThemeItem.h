//
//  YPDiscoverThemeItem.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/22/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPDiscoverThemeItem : NSObject


//开始时间
@property (nonatomic, copy) NSString *begin_time;
//图片
@property (nonatomic, copy) NSString *img;
//关键字
@property (nonatomic, copy) NSString *keywords;
//描述
@property (nonatomic, copy) NSString *text;
//分享地址
@property (nonatomic, copy) NSString *themeurl;
//标题
@property (nonatomic, copy) NSString *title;


@end
