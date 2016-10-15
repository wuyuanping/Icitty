//
//  YPCollectionViewCell.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/22/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPCollectionViewCell.h"
#import "YPDiscoverThemeItem.h"

@interface YPCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end


@implementation YPCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setThemeItem:(YPDiscoverThemeItem *)themeItem{

    _themeItem = themeItem;
    //设置数据
    
    self.imageV.image = [UIImage imageNamed:themeItem.img];
    self.titleLabel.text = themeItem.title;
    self.subLabel.text = themeItem.keywords;
    
}



@end
