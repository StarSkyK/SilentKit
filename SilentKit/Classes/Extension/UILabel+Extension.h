//
//  UILabel+Extension.h
//  ShowMe
//
//  Created by 123 on 2018/8/22.
//  Copyright © 2018年 nkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
/*
 title:文字
 font:字体
 textColor:文字颜色
 **/
+(UILabel *)creatCustomLabel:(NSString *)title font:(UIFont*)font textColor:(UIColor *)color;

/*
 title:文字
 font:字体
 textColor:文字颜色
 textAligment:对齐
 **/
+(UILabel *)creatCustomLabel:(NSString *)title font:(UIFont*)font textColor:(UIColor *)color textAligment:(NSTextAlignment)align;

@end
