//
//  YPSettingGroupItem.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPSettingGroupItem.h"

@implementation YPSettingGroupItem

+ (instancetype)ItemWithRowItemArray:(NSArray *)rowArray{

    YPSettingGroupItem *groupItem = [[self alloc] init];
    groupItem.rowItemArray = rowArray;
    return groupItem;

}


@end
