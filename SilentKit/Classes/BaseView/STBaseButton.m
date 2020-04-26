//
//  STBaseButton.m
//  SilentKit_Example
//
//  Created by kailen.ni on 2020/4/26.
//  Copyright © 2020 1457877626@qq.com. All rights reserved.
//

#import "STBaseButton.h"

@interface STBaseButton()

@property(nonatomic,copy) ButtonCallBackBlock callbackBlock;

@end

@implementation STBaseButton

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title bgColor:(UIColor *)color clickEvent:(ButtonCallBackBlock)event{
    if (self = [super initWithFrame:frame]) {
        [self configBaseButton:frame title:title bgColor:color clickEvent:event];
    }
    return self;
}

-(void)configBaseButton:(CGRect)frame title:(NSString *)title bgColor:(UIColor *)color clickEvent:(ButtonCallBackBlock)event{
    [self addTarget:self action:@selector(innerButtonCilckEvent) forControlEvents:UIControlEventTouchUpInside];
    [self setTitle:title forState:UIControlStateNormal];
    self.titleLabel.textColor = UIColor.whiteColor;
    self.backgroundColor = color ?: UIColor.blackColor;
    self.callbackBlock = event;
}


-(void)innerButtonCilckEvent{
    if (self.callbackBlock) {
        self.callbackBlock();
    }else{
        NSLog(@"点击事件尚未写入");
    }
}

@end
