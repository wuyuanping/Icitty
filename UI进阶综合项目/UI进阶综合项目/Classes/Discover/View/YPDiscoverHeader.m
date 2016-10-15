//
//  YPDiscoverHeader.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/22/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPDiscoverHeader.h"
#import "YPDiscoverHeaderItem.h"

@interface YPDiscoverHeader ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end


@implementation YPDiscoverHeader

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setHeadItem:(YPDiscoverHeaderItem *)headItem{

    _headItem = headItem;
    //设置数据
    self.imageV.image = [UIImage imageNamed:headItem.image];
    self.titleLabel.text = headItem.feeltitle;
    self.subLabel.text = headItem.title;



}






@end
