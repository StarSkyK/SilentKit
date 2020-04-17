//
//  STViewController.m
//  SilentKit
//
//  Created by 1457877626@qq.com on 04/15/2020.
//  Copyright (c) 2020 1457877626@qq.com. All rights reserved.
//

#import "STViewController.h"
#import <SilentKit.h>
#import "STCollectionvVew.h"
@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * btn = [[UIButton alloc] createCustomButton:@"测试" fontSize:14 titleColor:[UIColor colorWithHexString:@"#ff973a"]];
    btn.frame = CGRectMake(0, 100, 100, 100);
    [btn addTarget:self action:@selector(doSth) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
 

}

-(void)doSth{
    STCollectionvVew * vc = [[STCollectionvVew alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
