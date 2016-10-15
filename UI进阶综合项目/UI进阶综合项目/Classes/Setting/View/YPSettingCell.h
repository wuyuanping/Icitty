//
//  YPSettingCell.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YPRowItem;
@interface YPSettingCell : UITableViewCell
//提供模型属性接受模型并赋值
@property (nonatomic,strong) YPRowItem *rowItem;
//提供方法返回一个cell。因为重利用cell要用到tableView，故要提供UItableView这个参数，后面cell样式可用到时再过来这里添加。
+ (instancetype)cellWithTable:(UITableView *)tableView style:(UITableViewCellStyle)style;

@end
