//
//  BaseTableViewController.m
//  ShowMe
//
//  Created by 123 on 2018/12/27.
//  Copyright © 2018 nkl. All rights reserved.
//

#import "STBaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <UIView+Extension.h>
#import "STRefreshFooter.h"
#import <SilentKit.h>
@interface STBaseTableViewController ()


@property (nonatomic, strong) MJRefreshNormalHeader * myRefreshHeader;
@property (nonatomic, strong) STRefreshFooter * myRefreshFooter;

@end

@implementation STBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self configTableViewProperty];
    [self prepareFortableView];
    [self requestList];
}
//父类专用，最早执行
-(void)setUpTableView{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.page = 0;
    self.limit = 10;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
//供子类配置
-(void)configTableViewProperty{
    
}

//初始化tableview
-(void)prepareFortableView{
    
    switch (self.refreshType) {
        case STRefreshTypePullUp:{
            self.tableView.mj_header = nil;
            self.tableView.mj_footer = self.myRefreshFooter;
        }
            break;
        case STRefreshTypePullDown:{
            self.tableView.mj_header = self.myRefreshHeader;
            self.tableView.mj_footer = nil;
        }
            break;
        case STRefreshTypeNone:{
            self.tableView.mj_header = nil;
            self.tableView.mj_footer = nil;
        }
            break;
        case STRefreshTypeAll:{
            self.tableView.mj_header = self.myRefreshHeader;
            self.tableView.mj_footer = self.myRefreshFooter;
        }
            break;
        default:
            self.tableView.mj_header = nil;
            self.tableView.mj_footer = nil;
            break;
    }
}

/**
 刷新数据用
 */
-(void)requestList{
    
}

-(void)stopAllRefresh{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - lazy

-(MJRefreshNormalHeader *)myRefreshHeader{
    if (!_myRefreshHeader) {
        _myRefreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.page = 0;
            [self requestList];
        }];
        _myRefreshHeader.automaticallyChangeAlpha = YES;
        [_myRefreshHeader setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
        [_myRefreshHeader setTitle:@"松开加载" forState:MJRefreshStatePulling];
        [_myRefreshHeader setTitle:@"加载中"   forState:MJRefreshStateRefreshing];
        
    }
    return _myRefreshHeader;
}


-(STRefreshFooter *)myRefreshFooter{
    if (!_myRefreshFooter) {
        _myRefreshFooter =  [STRefreshFooter footerWithRefreshingBlock:^{
           self.page += 1;
           [self requestList];
        }];
        _myRefreshFooter.automaticallyChangeAlpha = YES;
        [_myRefreshFooter setTitle:@"上拉刷新" forState:MJRefreshStateIdle];
        [_myRefreshFooter setTitle:@"松开加载" forState:MJRefreshStatePulling];
        [_myRefreshFooter setTitle:@"加载中"   forState:MJRefreshStateRefreshing];
    }
    return _myRefreshFooter;
}



@end
