//
//  DevicePlatform.h
//  BIBILILI
//
//  Created by juwangkeji on 2018/7/13.
//  Copyright © 2018年 WTF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DevicePlatform : NSObject


typedef NS_ENUM(NSInteger,DeviceType) {
    
    Unknown = 0,
    Simulator,
    IPhone_1G,          //基本不用
    IPhone_3G,          //基本不用
    IPhone_3GS,         //基本不用
    IPhone_4,           //基本不用
    IPhone_4s,          //基本不用
    IPhone_5,
    IPhone_5C,
    IPhone_5S,
    IPhone_SE,
    IPhone_6,
    IPhone_6P,
    IPhone_6s,
    IPhone_6s_P,
    IPhone_7,
    IPhone_7P,
    IPhone_8,
    IPhone_8P,
    IPhone_X,
};

/// 单例
+(instancetype)shareDevicePlatform;

/// 设备类型
-(DeviceType)deviceType;

/// 转换尺寸
/// @param pxSize <#pxSize description#>
- (CGFloat)translationSize:(CGFloat)pxSize;

/// 转换宽度
/// @param width <#width description#>
- (CGFloat)translatWidth:(CGFloat)width;

/// 转换高度
/// @param height <#height description#>
- (CGFloat)translatHeight:(CGFloat)height;

@end
