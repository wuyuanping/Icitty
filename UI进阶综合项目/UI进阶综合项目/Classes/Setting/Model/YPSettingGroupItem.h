//
//  YPSettingGroupItem.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPSettingGroupItem : NSObject

@property (nonatomic,copy) NSString *headerT;
@property (nonatomic, copy) NSString *footerT;

/** 一组当中有多少行 */
@property (nonatomic,strong) NSArray *rowItemArray;

//组模型中只需要把共有的属性当参数即可，其他的属性到时候可随机添加，灵活性高
+ (instancetype)ItemWithRowItemArray:(NSArray *)rowArray;

@end
