//
//  UIView+Extension.m
//  ShowMe
//
//  Created by 123 on 2019/1/2.
//  Copyright © 2019 nkl. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
/**
 获取渐变色
 */
- (CAGradientLayer *)setGradientLayerWithcolors:(NSArray * )colors locations:(NSArray *)locations startPoint : (CGPoint)startPoint endPoint:(CGPoint)endPoint {
    
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = colors;
    gradientLayer.locations = locations;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    return gradientLayer;
}


- (void)setK_x:(CGFloat)k_x
{
    CGRect frame = self.frame;
    frame.origin.x = k_x;
    self.frame = frame;
}

- (CGFloat)k_x
{
    return self.frame.origin.x;
}

- (void)setK_y:(CGFloat)k_y
{
    CGRect frame = self.frame;
    frame.origin.y = k_y;
    self.frame = frame;
}

- (CGFloat)k_y
{
    return self.frame.origin.y;
}

- (void)setK_width:(CGFloat)k_width
{
    CGRect frame = self.frame;
    frame.size.width = k_width;
    self.frame = frame;
}

- (CGFloat)k_width
{
    return self.frame.size.width;
}

- (void)setK_height:(CGFloat)k_height
{
    CGRect frame = self.frame;
    frame.size.height = k_height;
    self.frame= frame;
}

- (CGFloat)k_height
{
    return self.frame.size.height;
}

- (void)setK_size:(CGSize)k_size
{
    CGRect frame = self.frame;
    frame.size = k_size;
    self.frame = frame;
}

- (CGSize)k_size
{
    return self.frame.size;
}

- (void)setK_centerX:(CGFloat)k_centerX
{
    CGPoint center = self.center;
    center.x = k_centerX;
    self.center = center;
}

- (CGFloat)k_centerX
{
    return self.center.x;
}

- (void)setK_centerY:(CGFloat)k_centerY
{
    CGPoint center = self.center;
    center.y = k_centerY;
    self.center = center;
}

- (CGFloat)k_centerY
{
    return self.center.y;
}


- (void)setK_borderWidth:(CGFloat)k_borderWidth
{
    
    if (k_borderWidth < 0) {
        return;
    }
    self.layer.borderWidth = k_borderWidth;
}

- (void)setK_borderColor:(UIColor *)k_borderColor
{
    self.layer.borderColor = k_borderColor.CGColor;
}

- (void)setK_cornerRadius:(CGFloat)k_cornerRadius
{
    self.layer.cornerRadius = k_cornerRadius;
    self.layer.masksToBounds = YES;
}

@end
