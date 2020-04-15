//
//  UIImage+Extension.m
//  ShowMe
//
//  Created by 123 on 2018/11/21.
//  Copyright © 2018 nkl. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
- (UIImage *)imageWithCornerRadius:(CGFloat)radius{
    //1.开启跟原始图片一样大小的上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctr, rect);
    CGContextClip(ctr);
    [self drawInRect:rect];
    
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;

}

@end
