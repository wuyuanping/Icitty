//
//  YPHomeCellItem.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/21/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPHomeCellItem : NSObject


/**
 *  标题
 */
@property (nonatomic, copy) NSString *section_title;
/**
 *  图片地址
 */
@property (nonatomic, copy) NSString *imageURL;
/**
 *  浏览次数
 */
@property (nonatomic, copy) NSString *fav_count;
/**
 *  底部名称
 */
@property (nonatomic, copy) NSString *poi_name;




@end
