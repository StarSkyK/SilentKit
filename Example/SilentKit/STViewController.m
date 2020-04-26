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
    
    STBaseButton * btn = [[STBaseButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100) title:@"点击" bgColor:UIColor.purpleColor clickEvent:^{
        NSLog(@"一体化按钮");
    }];
   
    [self.view addSubview:btn];
    
 

}


@end
