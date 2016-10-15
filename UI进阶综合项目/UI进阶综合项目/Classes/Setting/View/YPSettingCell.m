//
//  YPSettingCell.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPSettingCell.h"

#import "YPRowItem.h"
#import "YPSettingArrowItem.h"
#import "YPSettingSwitchItem.h"


@implementation YPSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+  (instancetype)cellWithTable:(UITableView *)tableView style:(UITableViewCellStyle)style{
    static NSString *ID = @"cell";
    YPSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YPSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
        cell.layer.cornerRadius = 8;//设置cell有圆角
    }
    return cell;
}

- (void)setRowItem:(YPRowItem *)rowItem{

    _rowItem = rowItem;
    //分开设置，逻辑结构更清晰
    //设置数据
    [self setUpData:rowItem];
    //设置辅助视图accessoryView(向右箭头和开关之类的自定义view)
    [self setUpAccessoryView:rowItem];
}

//设置数据
- (void)setUpData:(YPRowItem *)rowItem{
    //设置cell共有数据
    self.textLabel.text = rowItem.title;
    self.imageView.image = rowItem.image;
    self.detailTextLabel.text = rowItem.subTitle;//模型中有提供，有就写上，没有就不写
}
//设置辅助视图
- (void)setUpAccessoryView:(YPRowItem *)rowItem{
    //传进来的是真是模型，故需要判断一下模型的真实类型
    //再去设置辅助视图
    if ([rowItem isKindOfClass:[YPSettingArrowItem class]]) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        
    }else if([rowItem isKindOfClass:[YPSettingSwitchItem class]]){
        self.accessoryView = [[UISwitch alloc] init];
    
    }else{
        self.accessoryView = nil;
    }


}

//让cell不与两边相接,且上下cell之间有间隔！！！！
- (void)setFrame:(CGRect)frame {
    CGFloat margin = 10;
    
    frame.origin.x = margin;
    frame.size.width -= 2 * margin;
    frame.size.height -= 5;
    
    [super setFrame:frame];//?
}





















- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
