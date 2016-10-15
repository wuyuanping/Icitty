//
//  YPSectionItem.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/21/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPSectionItem : NSObject

/**
 *  headView的颜色
 */
@property (nonatomic, copy) NSString *color;
/**
 *  headView的标题
 */
@property (nonatomic, copy) NSString *tag_name;
/**
 *  headView的子标题
 */
@property (nonatomic, copy) NSString *section_count;
/**
 *  cell模型
 */
@property (nonatomic, strong) NSArray *body;

+ (NSArray *)getSectionItemList;//tips

@end
