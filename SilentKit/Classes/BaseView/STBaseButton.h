//
//  STBaseButton.h
//  SilentKit_Example
//
//  Created by kailen.ni on 2020/4/26.
//  Copyright © 2020 1457877626@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ButtonCallBackBlock)();

@interface STBaseButton : UIButton
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title bgColor:(UIColor *)color clickEvent:(ButtonCallBackBlock)event;

@end

NS_ASSUME_NONNULL_END
