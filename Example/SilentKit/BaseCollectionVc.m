//
//  BaseCollectionVc.m
//  ShowMe
//
//  Created by 123 on 2019/4/8.
//  Copyright © 2019 nkl. All rights reserved.
//

#import "BaseCollectionVc.h"
#import <MJRefresh/MJRefresh.h>
@interface BaseCollectionVc ()

@end

@implementation BaseCollectionVc


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureCollectionView];
    [self prepareFortableView];
    [self requestList];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

/**
 配置
 */
-(void)configureCollectionView{
    
}

//初始化tableview
-(void)prepareFortableView{
    
    self.page = 0;
    self.limit = 10;
    
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 0;
        [self requestList];
    }];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开加载" forState:MJRefreshStatePulling];
    [header setTitle:@"加载中"   forState:MJRefreshStateRefreshing];
    self.collectionView.mj_header = header;
    
    MJRefreshBackNormalFooter * footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page += 1;
        [self requestList];
    }];
    //    [footer setAutomaticallyRefresh:NO];
    [footer setTitle:@"上拉刷新" forState:MJRefreshStateIdle];
    [footer setTitle:@"松开加载" forState:MJRefreshStatePulling];
    [footer setTitle:@"加载中"   forState:MJRefreshStateRefreshing];
    self.collectionView.mj_footer = footer;
    
}


-(void)requestList{
    
}


-(void)stopAllRefresh{
    [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshing];
}

@end
