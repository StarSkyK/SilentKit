//
//  UIButton+Extension.h
//  BIBILILI
//
//  Created by WTFKL on 2017/9/19.
//  Copyright © 2017年 WTF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
/**废弃*/
-(UIButton*)initButtonWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName;

-(UIButton*)createCustomButton;

-(UIButton*)createCustomButton:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor * )color;

-(UIButton*)createCustomButton:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor * )color cornerRad:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)boderColor;
@end
