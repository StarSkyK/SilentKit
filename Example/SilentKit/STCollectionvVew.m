//
//  STCollectionvVew.m
//  SilentKit_Example
//
//  Created by kailen.ni on 2020/4/16.
//  Copyright © 2020 1457877626@qq.com. All rights reserved.
//

#import "STCollectionvVew.h"
#import <SilentKit/SilentKit.h>
@interface STCollectionvVew()
@end

@implementation STCollectionvVew


-(void)configTableViewProperty{
    self.refreshType = STRefreshTypeAll;
}



-(void)requestList{
    NSLog(@"start request");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        if (self.page == 0) {
            NSLog(@"下拉刷新");
        }else{
            NSLog(@"上拉加载更多,当前%ld页",self.page);
        }
       
        [self stopAllRefresh];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
