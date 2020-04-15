//
//  UIButton+Extension.m
//  BIBILILI
//
//  Created by WTFKL on 2017/9/19.
//  Copyright © 2017年 WTF. All rights reserved.
//

#import "UIButton+Extension.h"
#import "SilentConst.h"

@implementation UIButton (Extension)



-(UIButton*)initButtonWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    return button;
}

-(UIButton*)createCustomButton:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor * )color cornerRad:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)boderColor{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.layer.cornerRadius = __KNewSize(radius);
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = __KNewSize(width);
    button.layer.borderColor = boderColor.CGColor;
    button.titleLabel.font = [UIFont systemFontOfSize:__KNewSize(size)];
    return button;
}

-(UIButton*)createCustomButton:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor * )color{
    UIButton * button = [self createCustomButton:title fontSize:size titleColor:color cornerRad:0 borderWidth:0 borderColor:UIColor.clearColor];
    return button;
}

-(UIButton*)createCustomButton{
    UIButton * button = [self createCustomButton:@"" fontSize:17 titleColor:ThemeColor];
    return button;
}

@end
