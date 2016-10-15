//
//  YPChooseVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 26/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPChooseVC.h"
#import "YPChooseCell.h"

@interface YPChooseVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//记录当前点击的是哪一行
@property (nonatomic,assign) NSInteger curRow;

@property (nonatomic,assign) BOOL isOpen;


@end

@implementation YPChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.curRow = -1;
}

//每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

//展示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YPChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChooseCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"YPChooseCell" owner:nil options:nil][0];
    }
    
    return  cell;
}
//点击一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.isOpen = !self.isOpen;// Tips
    
    if (self.curRow != indexPath.row) {
        self.isOpen = YES;
    }
    self.curRow = indexPath.row;
    
    //更新数据(当更新tableView时会自动加一个序列帧动画)
    [tableView beginUpdates];
    [tableView endUpdates];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.curRow == indexPath.row && self.isOpen ? 230 : 44;
}



@end
