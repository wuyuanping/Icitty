//
//  YPDiscoverItem.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/22/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YPDiscoverHeaderItem;

@interface YPDiscoverItem : NSObject

//头部
@property (nonatomic,strong) YPDiscoverHeaderItem *header;

@property (nonatomic, strong) NSArray *themes;


+ (NSArray *)getDiscoveryList;



@end
