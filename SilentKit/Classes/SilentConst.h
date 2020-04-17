#import "DevicePlatform.h"

/**
 *当前视图高度
 */
#define __KLVIEWHEIGHT__  self.frame.size.height
/**
 *当前视图宽度
 */
#define __KLVIEWWIDTH__ self.frame.size.width
/**
 *当前屏幕宽度
 */
#define __KLSCREENWIDTH__ [UIScreen mainScreen].bounds.size.width
/**
 *当前屏幕高度
 */
#define __KLSCREENHEIGHT__ [UIScreen mainScreen].bounds.size.height
/**
 *重用ID
 */
#define __KLCEllID__ @"cellID"

#define __KLCEllSID__ @"cell_SID"
/**
 *弱引用self
 */
#define __kWeakSelf__ __weak typeof(self) weakSelf = self;
/**
 * 颜色
 */
#define Color(R,G,B,P) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:P]
#define CGColor(R,G,B,P) Color(R,G,B,P).CGColor
/**
 * 主题色
 */
#define ThemeColor Color(241, 81, 83, 1)
/*
 *window
 */
#define appWindow [UIApplication sharedApplication].keyWindow
/*
 *屏幕尺寸
 */
#define __KScreenSize__ [UIScreen mainScreen].bounds.size
/**
 *statusBar高度
 */
#define __KLSTATUSBARHEIGHT__  [[UIApplication sharedApplication] statusBarFrame].size.height

#define __KLNAVBARHEIGHT__     (__KLSTATUSBARHEIGHT__ + 44)
//尺寸转换
#define __kNFont(fontSize)    [UIFont systemFontOfSize:__KNewSize(fontSize)]

#define __kNBFont(fontSize)   [UIFont boldSystemFontOfSize:__KNewSize(fontSize)]

#define __KNewSize(pxSize)    [[DevicePlatform shareDevicePlatform] translationSize:pxSize]

#define __kNewWidth(pxSize)   [[DevicePlatform shareDevicePlatform] translatWidth:pxSize]

#define __kNewHeight(pxSize)  [[DevicePlatform shareDevicePlatform] translatHeight:pxSize]

#define __kNewRealHeight(pxSize) [[[DevicePlatform shareDevicePlatform] translatRealHeight:pxSize]


#pragma mark - 归档解档
//-------偏好-------
#define saveUserDefaults(value,key) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];//存

#define getUserDefaults(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]//取

#define removeDefaults(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];//移除
//-------偏好-------


//-------归档-------

#define filePath(Name)  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:Name]
//归档
#define enCodeObject(target,targetName) [NSKeyedArchiver archiveRootObject:target toFile:filePath(targetName)];
//解档
#define deCodeObject(targetName) [NSKeyedUnarchiver unarchiveObjectWithFile:filePath(targetName)];
//-------归档-------

//获取状态栏高度
#define STATUSBAR_HEIGHT  (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))

#define RealOrignValue   STATUSBAR_HEIGHT


#pragma mark - masonry便捷宏

#define makeLeft(target,distance)        make.left.equalTo(target).mas_offset(__KNewSize(distance))

#define makeRight(target,distance)       make.right.equalTo(target).mas_offset(__KNewSize(distance))

#define makeCenter(target,distance)      make.center.equalTo(target).mas_offset(__KNewSize(distance))

#define makeBottom(target,distance)      make.bottom.equalTo(target).mas_offset(__KNewSize(distance))

#define makeTop(target,distance)         make.top.equalTo(target).mas_offset(__KNewSize(distance))

#define makeCenterX(target,distance)     make.centerX.equalTo(target).mas_offset(__KNewSize(distance))

#define makeCenterY(target,distance)     make.centerY.equalTo(target).mas_offset(__KNewSize(distance))

#define makeWidth(m_width)               make.width.mas_equalTo(__KNewSize(m_width))

#define makeHeight(m_height)             make.height.mas_equalTo(__KNewSize(m_height))

#define makeEqualTo(target)              make.left.right.top.bottom.equalTo(target)

