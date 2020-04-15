//
//  DevicePlatform.m
//  BIBILILI
//
//  Created by juwangkeji on 2018/7/13.
//  Copyright © 2018年 WTF. All rights reserved.
//

#import "DevicePlatform.h"
#import <sys/utsname.h>
#import <SilentKit/SilentConst.h>
#define DefuleWidth  375.0
#define DefuleHeight 667.0

#define Defule4PhoneWidth     320.0
#define Defule5PhoneWidth     320.0
#define Defule6PhoneWidth     375.0
#define Defule6PlusPhoneWidth 414.0
#define DefuleXPlusPhoneWidth 375.0

@interface DevicePlatform()
@property(nonatomic,assign) DeviceType insideType;
@end

@implementation DevicePlatform
static id devicePlatfrom;

+(instancetype)shareDevicePlatform{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        devicePlatfrom = [[self alloc] init];
    });
    return devicePlatfrom;
}

-(DeviceType)insideType{
    if (!_insideType) {
        _insideType = [self deviceType];
    }
    return _insideType;
}

-(DeviceType)deviceType{
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
    //simulator
    if ([platform isEqualToString:@"i386"])          return Simulator;
    if ([platform isEqualToString:@"x86_64"])        return Simulator;
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])     return IPhone_1G;
    if ([platform isEqualToString:@"iPhone1,2"])     return IPhone_3G;
    if ([platform isEqualToString:@"iPhone2,1"])     return IPhone_3GS;
    if ([platform isEqualToString:@"iPhone3,1"])     return IPhone_4;
    if ([platform isEqualToString:@"iPhone3,2"])     return IPhone_4;
    if ([platform isEqualToString:@"iPhone4,1"])     return IPhone_4s;
    if ([platform isEqualToString:@"iPhone5,1"])     return IPhone_5;
    if ([platform isEqualToString:@"iPhone5,2"])     return IPhone_5;
    if ([platform isEqualToString:@"iPhone5,3"])     return IPhone_5C;
    if ([platform isEqualToString:@"iPhone5,4"])     return IPhone_5C;
    if ([platform isEqualToString:@"iPhone6,1"])     return IPhone_5S;
    if ([platform isEqualToString:@"iPhone6,2"])     return IPhone_5S;
    if ([platform isEqualToString:@"iPhone7,1"])     return IPhone_6P;
    if ([platform isEqualToString:@"iPhone7,2"])     return IPhone_6;
    if ([platform isEqualToString:@"iPhone8,1"])     return IPhone_6s;
    if ([platform isEqualToString:@"iPhone8,2"])     return IPhone_6s_P;
    if ([platform isEqualToString:@"iPhone8,4"])     return IPhone_SE;
    if ([platform isEqualToString:@"iPhone9,1"])     return IPhone_7;
    if ([platform isEqualToString:@"iPhone9,3"])     return IPhone_7;
    if ([platform isEqualToString:@"iPhone9,2"])     return IPhone_7P;
    if ([platform isEqualToString:@"iPhone9,4"])     return IPhone_7P;
    if ([platform isEqualToString:@"iPhone10,1"])    return IPhone_8;
    if ([platform isEqualToString:@"iPhone10,4"])    return IPhone_8;
    if ([platform isEqualToString:@"iPhone10,2"])    return IPhone_8P;
    if ([platform isEqualToString:@"iPhone10,5"])    return IPhone_8P;
    if ([platform isEqualToString:@"iPhone10,3"])    return IPhone_X;
    if ([platform isEqualToString:@"iPhone10,6"])    return IPhone_X;
    return Unknown;
}

- (CGFloat)translationSize:(CGFloat)pxSize{
//    CGFloat newPxSize = pxSize/2.0;
    CGFloat newPxSize = pxSize;
    CGFloat translationSize = 0;
    if (__KLSCREENWIDTH__ == Defule4PhoneWidth) {
        if (self.insideType == IPhone_4 || self.insideType == IPhone_5 || self.insideType == Simulator ) {
            translationSize = Defule4PhoneWidth / DefuleWidth * newPxSize;
        }else{
            //放大模式(暂未考虑)
            translationSize = Defule4PhoneWidth/DefuleWidth *newPxSize * 1;
        }
    }
    if (__KLSCREENWIDTH__ == Defule6PhoneWidth) {
        if (self.insideType == IPhone_6 || self.insideType == IPhone_7 ||self.insideType == IPhone_8 || self.insideType == IPhone_6s || self.insideType == Simulator) {
            translationSize = Defule6PhoneWidth / DefuleWidth * newPxSize;
        }else{
            //放大模式(暂未考虑)
            translationSize = Defule6PhoneWidth/DefuleWidth *newPxSize * 1;
        }
    }
    if (__KLSCREENWIDTH__ == Defule6PlusPhoneWidth) {
        if (self.insideType == IPhone_6P || self.insideType == IPhone_7P ||self.insideType == IPhone_8P || self.insideType == IPhone_6s_P || self.insideType == Simulator) {
            translationSize = Defule6PlusPhoneWidth / DefuleWidth * newPxSize;
        }else{
            //放大模式(暂未考虑)
            translationSize = Defule6PhoneWidth/DefuleWidth *newPxSize * 1;
        }
    }
    return translationSize;
}

- (CGFloat)translatWidth:(CGFloat)width{
    return ((__KLSCREENWIDTH__/DefuleWidth) * (width/2));
}
- (CGFloat)translatHeight:(CGFloat)height{
    return ((__KLSCREENHEIGHT__/DefuleHeight) * (height/2));
}

@end
