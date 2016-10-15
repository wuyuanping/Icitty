//
//  YPDiscoverVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 9/19/16.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPDiscoverVC.h"
#import "YPDiscoverItem.h"
#import "YPDiscoverHeaderItem.h"
#import "YPDiscoverThemeItem.h"
//自定义view
#import "YPCollectionViewCell.h"
#import "YPDiscoverHeader.h"

@interface YPDiscoverVC ()
//存放数据模型的数组
@property (nonatomic,strong) NSArray *discoverDateArr;

@end

static NSString * const reuseIdentifier = @"YPCollectionCell";
static NSString * const headerIdentifier = @"headerReuse";


@implementation YPDiscoverVC

- (NSArray *)discoverDateArr{

    if (!_discoverDateArr) {
        _discoverDateArr = [YPDiscoverItem getDiscoveryList];
    }
    return _discoverDateArr;
}

//创建UICollectionViewController时必须同时指定布局样式，否则报错

- (instancetype)init{
    UICollectionViewFlowLayout *flowl = [[UICollectionViewFlowLayout alloc] init];
    //格子大小
    flowl.itemSize = CGSizeMake(150, 140);
    //组边距
    flowl.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //头部视图大小
    flowl.headerReferenceSize = CGSizeMake(screenW, 207);//高度与xib一致
    return [super initWithCollectionViewLayout:flowl];//关键点
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //UICollectionViewController的View并不是collectionView
    //tableViewController的View就是tableView.
    self.collectionView.backgroundColor = [UIColor colorWithRed:246 /255.0 green:246/255.0 blue:246/255.0 alpha:1];
    self.title = @"发现";
    
    
    //UICollectionViewController只能通过注册的方式调用
    //注意，设置UICollectionViewController的header勾选xib时默认是不会自动绑定xib，需要你手动绑定设置它的类
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"YPCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];

    //注册UICollectionViewController头部视图

       [self.collectionView registerNib:[UINib nibWithNibName:@"YPDiscoverHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];

}

//因为UICollectionViewController的父类遵守了协议和代理
#pragma mark <UICollectionViewDataSource>

//共有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.discoverDateArr.count;
   
    
}

//每一组有多少个格子
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    YPDiscoverItem *disItem = self.discoverDateArr[section];
    return disItem.themes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //获取Cell（自定义cell）
    YPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //获取模型
    YPDiscoverItem *disItem = self.discoverDateArr[indexPath.section];
    YPDiscoverThemeItem *themeItem = disItem.themes[indexPath.row];
    
    //将模型数据赋值给相应控件
    cell.themeItem = themeItem;
    
    
    return cell;
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        YPDiscoverHeader *headerV =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        
        //获取数据
        YPDiscoverItem *disItem =  self.discoverDateArr[indexPath.section];
        YPDiscoverHeaderItem *headerItem =  disItem.header;
        
        //传递数据
        headerV.headItem = headerItem;
        
        return headerV;
        
    }
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
