//
//  PublicMethod.h
//  ShowMe
//
//  Created by 123 on 2018/8/24.
//  Copyright © 2018年 nkl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicMethod : NSObject

/**
 判断是不是手机号
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 指定宽度按比例缩放
 */
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

/**
 按比例缩放,size 是你要把图显示到 多大区域 CGSizeMake(300, 140)
 */
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;


@end
