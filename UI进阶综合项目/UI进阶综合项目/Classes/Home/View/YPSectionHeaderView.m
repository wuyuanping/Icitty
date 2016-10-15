//
//  YPSectionHeaderView.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/21/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPSectionHeaderView.h"
#import "YPSectionItem.h"
#import "UIColor+XQColor.h"

@interface YPSectionHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end

@implementation YPSectionHeaderView


+ (instancetype)sectionHeaderView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];

}

- (void)setSectionItem:(YPSectionItem *)sectionItem{

    self.titleLabel.text = sectionItem.tag_name;
    self.subLabel.text = sectionItem.section_count;
    
    //把十六进制数据转换为对应的颜色
    UIColor *color = [UIColor colorWithHexString:sectionItem.color alpha:1];
    self.backgroundColor = color;



}


@end
