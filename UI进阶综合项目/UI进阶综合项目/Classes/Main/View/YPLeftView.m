//
//  YPLeftView.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPLeftView.h"
#import "YPMenuBtn.h"
#import "YPCityBtn.h"
#import "YPCityTableViewCell.h"

@interface YPLeftView ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet YPMenuBtn *preSelBtn;
@property (weak, nonatomic) IBOutlet YPCityBtn *cityBtn;
//点击城市按钮出现一个tableView
@property (nonatomic,strong) UITableView *tableView;
//给城市按钮添加一个开关属性
@property (nonatomic,assign) BOOL isOpen;

@property (nonatomic,strong) NSArray * cityArr;

@end

@implementation YPLeftView

- (NSArray *)cityArr{
    if (!_cityArr) {
        _cityArr = @[@"北京",@"上海",@"广州",@"南京"];
    }
    return _cityArr;

}

+ (instancetype)leftView{

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YPLeftView class]) owner:nil options:nil] lastObject];

}


- (UITableView *)tableView{

    if (!_tableView) {
        UITableView *tableView  = [[UITableView alloc] init];
        
        //设置tableView的属性
        tableView.layer.cornerRadius = 10;
        tableView.backgroundColor = [UIColor blackColor];
        tableView.alpha = 0.7;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        //确定tableView的位置(相对按钮位置下方)
        CGFloat x = self.cityBtn.x;
        CGFloat y = CGRectGetMaxY(self.cityBtn.frame);
        CGFloat w = self.cityBtn.width;
        CGFloat h = 170;
        tableView.frame = CGRectMake(x, y, w, h);
        
        _tableView = tableView;
        //将tableView加入LeftView
        [self addSubview:tableView];
    }
    return _tableView;

}

- (IBAction)cityBtnClick:(UIButton *)cityBtn {//参数可改，类型可改为实际类型的父类
    //应该弹出一个TableView的,点击才弹出：懒加载,tableView是加到LeftView上的
    //点击一下弹出，再点击一下关闭
    //判断打开还是关闭
    if (self.isOpen) {//默认所有属性初始化都为0，即假
        
        self.tableView.height = 0;
    }else{//刚开始为假，就要打开tableView
    
        self.tableView.height = 170;
    }
    self.isOpen = !self.isOpen;//注意匹配即可（位置注意匹配即可）
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  self.cityArr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //因为cell 有特有属性，故自定义cell
    YPCityTableViewCell *cell = [YPCityTableViewCell cityTableViewCellWithTable:tableView];
    cell.textLabel.text = self.cityArr[indexPath.row];
    return cell;
    
}

#pragma mark - <UITableViewDelegate>
//当点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //没来？原因：“点击手势”优先级 > 点击 ，解决手势冲突问题!!!(到添加手势的抽屉类中，去巧妙调用手势代理方法才能解决)
    //获取当前点击的城市
    NSString *city = self.cityArr[indexPath.row];
    
    //上下级之间用代理或block，跨级之间用通知，通知相应接收者，接受相应的城市
    [[NSNotificationCenter defaultCenter] postNotificationName:@"citySelect" object:city];
    
    if ([self.delegate respondsToSelector:@selector(leftViewDidSelectCity:)]) {
        [self.delegate leftViewDidSelectCity:self];//抽屉接到通知关闭抽屉
    }
    //选择好城市，跳入主页面，此时应关闭tableView
    [self cityBtnClick:self.cityBtn];
    
}

//菜单按钮点击
- (IBAction)btnClick:(YPMenuBtn *)sender {
    
    //1.取消上一个选中的按钮(自定义按钮，取消系统高亮状态影响)
    self.preSelBtn.selected = NO;
    
    //2.让当前点击的按钮成为选中状态
    sender.selected = YES;
    
    //3.让当前点击的按钮,成为上一个选中的按钮
    self.preSelBtn = sender;
    
    
    //通知上一级 我当前点击了哪个按钮, 让上一级切换控制器.(上下级之间用代理)
    //调用代理方法
    if ([self.delegate respondsToSelector:@selector(leftView:preBtnIndex:selBtnIndex:)]) {
        [self.delegate leftView:self preBtnIndex:self.preSelBtn.tag selBtnIndex:sender.tag];
    }
    

}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
