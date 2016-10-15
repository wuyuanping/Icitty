//
//  YPSettingBaseVC.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YPRowItem.h"
#import "YPSettingGroupItem.h"
#import "YPSettingArrowItem.h"
#import "YPSettingSwitchItem.h"
#import "YPSettingCell.h"

@interface YPSettingBaseVC : UITableViewController

//存放组模型的数组 放外面公共的。
@property (nonatomic,strong) NSMutableArray *groupArray;


@end
