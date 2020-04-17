//
//  BaseCollectionVc.h
//  ShowMe
//
//  Created by 123 on 2019/4/8.
//  Copyright © 2019 nkl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionVc : UICollectionViewController

@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger limit;

//-(void)prepareFortableView;

/**
 配置collectionview,注册什么的写这里面
 */
-(void)configureCollectionView;

/// 请求数据
-(void)requestList;

/// 停止刷新
-(void)stopAllRefresh;


@end

NS_ASSUME_NONNULL_END
