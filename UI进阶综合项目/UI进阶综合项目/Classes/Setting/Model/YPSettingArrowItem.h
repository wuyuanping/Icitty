//
//  YPSettingArrowItem.h
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPRowItem.h"

@interface YPSettingArrowItem : YPRowItem

//注意，继承自共有模型，单独写一个模型，扩展性好

//要跳转的目的控制器的名称（注意：Class用assign修饰）
@property (assign,nonatomic) Class desVCName;//目标控制器的名字

//点击时要执行的任务(用block保存要执行的代码块，注意，copy修饰block)
@property (copy,nonatomic) void(^desTask)(NSIndexPath *indexPath);//带参数，用于区分点击同类型的不同cell

@end
