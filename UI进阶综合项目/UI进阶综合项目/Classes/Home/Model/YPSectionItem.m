//
//  YPSectionItem.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/21/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPSectionItem.h"
#import "MJExtension.h"

@implementation YPSectionItem


+ (NSDictionary *)objectClassInArray{

    return @{
             @"body" : @"YPHomeCellItem"

             };

}

+ (NSArray *)getSectionItemList{

    return [YPSectionItem mj_objectArrayWithFilename:@"HomeDatas.plist"];
}
@end
