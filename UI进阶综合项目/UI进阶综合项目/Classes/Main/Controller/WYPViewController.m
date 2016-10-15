//
//  WYPViewController.m
//  抽屉效果(掌握)
//
//  Created by 园平 on 9/9/16.
//  Copyright © 2016 园平. All rights reserved.
//

#import "WYPViewController.h"

@interface WYPViewController ()<UIGestureRecognizerDelegate>

//@property (nonatomic,weak) UIView *MainV;
//@property (nonatomic,weak) UIView *leftV;

@end

#define screenW [UIScreen mainScreen].bounds.size.width

@implementation WYPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控件
    
    [self setUp];
    //给mainV添加手势（拖动）
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_MainV addGestureRecognizer:pan];
    
    //添加点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    //self.view -> self.leftV
    [self.leftV addGestureRecognizer:tap];//给控制器view添加点按手势，则无论你点击那个View均会响应。

    tap.delegate = self;//切记设置tap的代理，才能实现tap手势

}

- (void)close{
    //复位
    [UIView animateWithDuration:0.25 animations:^{
        
        self.MainV.transform = CGAffineTransformIdentity;//???消除bug
        self.MainV.frame = self.view.bounds;
    }];
}

#pragma mark - <UIGestureRecognizerDelegate>
//用于解决手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    NSLog(@"%@",touch.view);//不来,没设置你想解决的那个手势的代理,=>我想监听点击的范围叫UITableViewCellContentView
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;//当点击在tableView上时，取消手势识别,其他地方则可以识别
    }
    return YES;
}

#define target screenW * 0.8 //假设只能拖动mainView向右占80%

- (void)open{
    //动画形式关闭
    [UIView animateWithDuration:0.25 animations:^{
//        [self positionWithOffset:target];//？？？？
        CGRect frame = self.MainV.frame;
        frame.origin.x = target;
        self.MainV.frame = frame;
    }];
}

//手指拖动
- (void)pan:(UIPanGestureRecognizer *)pan{

    //获取手动拖拽的偏移量（每次相对于最原始位置）
    CGPoint transP = [pan translationInView:self.view];
    
    //根据偏移量让MainView偏移到拖动的位置
    [self positionWithOffset:transP.x];
    
    //判断手势的状态
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.MainV.frame.origin.x < self.view.bounds.size.width * 0.5) {
            self.MainV.frame = self.view.bounds;
        }else{//大于一半
            CGFloat offsetX = target - _MainV.frame.origin.x;
        [UIView animateWithDuration:0.5 animations:^{
            
            [self positionWithOffset:offsetX];
        }];
        }
    }
    
    //只要存在相对位置不一样，就要设置清零（前者计算偏移量是根据原位置，二后者每一次便宜均是根据上一次位置，故每移动一次偏移量需要清零一次，否则拖动效果累加，速度很快）
    [pan setTranslation:CGPointZero inView:self.MainV];// CGPointZero == CGPointMake(0, 0)
}

// 根据偏移量计算当前MainView的位置
- (void)positionWithOffset:(CGFloat)offset{

    //平移(根据偏移量修改mainV的x值)
     CGRect frame =  self.MainV.frame;
    frame.origin.x += offset;
    self.MainV.frame = frame;
    
    //如果向左拖动，就不动
    if (self.MainV.frame.origin.x < 0) {
        self.MainV.frame = self.view.bounds;
    }
    //设置缩放比例假如 ：0.3
    CGFloat scale = self.MainV.frame.origin.x * 0.3 / screenW;//tips
    scale = 1 - scale;
    //缩放
    self.MainV.transform = CGAffineTransformMakeScale(scale, scale);
}


- (void)setUp{
    
    //显示在下面View
    UIView *leftV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    leftV.backgroundColor = [UIColor redColor];
    _leftV = leftV;
    [self.view addSubview:leftV];
    
    //显示在上面view
    UIView *mainV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _MainV = mainV;
    mainV.backgroundColor = [UIColor greenColor];
    [self.view addSubview:mainV];

}




@end
