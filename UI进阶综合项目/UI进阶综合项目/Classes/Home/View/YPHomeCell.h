//
//  YPHomeCell.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/21/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YPHomeCellItem;
@interface YPHomeCell : UITableViewCell

@property (nonatomic,strong) YPHomeCellItem * homeCellItem;

+ (instancetype)cellWithTableView:(UITableView *)tableView;



@end
