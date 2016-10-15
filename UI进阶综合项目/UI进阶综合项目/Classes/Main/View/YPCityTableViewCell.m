//
//  YPCityTableViewCell.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/21/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPCityTableViewCell.h"

@implementation YPCityTableViewCell

+ (instancetype)cityTableViewCellWithTable:(UITableView *)tableView{

    static NSString *ID = @"cityCell";
    YPCityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YPCityTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        //设置cell样式
        cell.backgroundColor = [UIColor clearColor];
        cell.separatorInset = UIEdgeInsetsMake(0, 0 , 0, 15);//默认左边已有空白呢？？？
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    return cell;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //布局一下cell中控件位置,让显示城市名的textLabel居中
    self.textLabel.x = (self.width - self.textLabel.width) * 0.5;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
