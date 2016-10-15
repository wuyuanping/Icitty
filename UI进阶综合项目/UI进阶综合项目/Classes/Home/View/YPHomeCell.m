//
//  YPHomeCell.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/21/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPHomeCell.h"
#import "YPHomeCellItem.h"

@interface YPHomeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end


@implementation YPHomeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{

    static NSString *ID = @"homeCell";
    YPHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;


}

//设置数据
- (void)setHomeCellItem:(YPHomeCellItem *)homeCellItem {
    _homeCellItem = homeCellItem;
    
    //给内部子控件赋值.
    self.bgImageView.image = [UIImage imageNamed:homeCellItem.imageURL];
    self.titleLabel.text = homeCellItem.section_title;
    self.subLabel.text = homeCellItem.poi_name;
    self.countLabel.text = homeCellItem.fav_count;
    
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
