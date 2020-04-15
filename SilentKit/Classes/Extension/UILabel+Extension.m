//
//  UILabel+Extension.m
//  ShowMe
//
//  Created by 123 on 2018/8/22.
//  Copyright © 2018年 nkl. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+(UILabel *)creatCustomLabel:(NSString *)title font:(UIFont*)font textColor:(UIColor *)color{
    UILabel * m_label = [[UILabel alloc] init];
    m_label.font = font;
    m_label.textColor = color;
    m_label.text = title;
    return m_label;
}

+(UILabel *)creatCustomLabel:(NSString *)title font:(UIFont*)font textColor:(UIColor *)color textAligment:(NSTextAlignment)align{
    UILabel * m_label = [self creatCustomLabel:title font:font textColor:color];
    m_label.textAlignment = align;
    return m_label;
}


@end
