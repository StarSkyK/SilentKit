//
//  BaseTableViewController.h
//  ShowMe
//
//  Created by 123 on 2018/12/27.
//  Copyright © 2018 nkl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  NS_ENUM(NSInteger, STRefreshType){
    STRefreshTypePullDown = 1,//下拉
    STRefreshTypePullUp= 2,//上拉
    STRefreshTypeNone = 3,//无
    STRefreshTypeAll = 4,//无
};

@interface STBaseTableViewController : UITableViewController

@property (nonatomic, assign) NSUInteger page;

@property (nonatomic, assign) NSUInteger limit;

@property (nonatomic, assign) STRefreshType refreshType;
/**
 配置各种属性
 */
-(void)configTableViewProperty;
/// 请求数据
-(void)requestList;
/// 停止所有刷新
-(void)stopAllRefresh;
@end

NS_ASSUME_NONNULL_END
