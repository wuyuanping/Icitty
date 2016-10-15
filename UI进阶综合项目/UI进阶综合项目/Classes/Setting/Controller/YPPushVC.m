//
//  YPPushVC.m
//  UI进阶综合项目
//
//  Created by 吴园平 on 24/09/2016.
//  Copyright © 2016 吴园平. All rights reserved.
//

#import "YPPushVC.h"

#import "YPAwardVC.h"

@interface YPPushVC ()
@end

@implementation YPPushVC




- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推送提醒";
    //描述一组
    [self setUpGroup0];
}
//描述一组
- (void)setUpGroup0 {
    
    //描述一行
    YPSettingArrowItem *rowItem = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"开奖推送"];
    rowItem.desVCName = [YPAwardVC class];
    
    YPSettingSwitchItem *rowItem1 = [YPSettingSwitchItem ItemWithImage:[UIImage imageNamed:@"more_historyorder"] title:@"比分直播"];
    
    YPSettingArrowItem *rowItem2 = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"比分直播1"];
    YPSettingArrowItem *rowItem3 = [YPSettingArrowItem ItemWithImage:[UIImage imageNamed:@"handShake"] title:@"比分直播2"];
    
    //一组当中有多少行
    NSArray *rowArray = @[rowItem,rowItem1,rowItem2,rowItem3];
    
    //创建组模型
    YPSettingGroupItem *groupItem = [YPSettingGroupItem ItemWithRowItemArray:rowArray];
    groupItem.headerT = @"第0组头部";
    
    //添加一组
    [self.groupArray addObject:groupItem];
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
