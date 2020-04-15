//
//  UIView+Extension.h
//  ShowMe
//
//  Created by 123 on 2019/1/2.
//  Copyright © 2019 nkl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)
- (CAGradientLayer *)setGradientLayerWithcolors:(NSArray * )colors locations:(NSArray *)locations startPoint : (CGPoint)startPoint endPoint:(CGPoint)endPoint;

@property (nonatomic, assign)CGFloat k_x;
@property (nonatomic, assign)CGFloat k_y;
@property (nonatomic, assign)CGFloat k_width;
@property (nonatomic, assign)CGFloat k_height;
@property (nonatomic, assign)CGFloat k_centerX;
@property (nonatomic, assign)CGFloat k_centerY;
@property (nonatomic, assign)CGSize k_size;
@property(nonatomic, assign) IBInspectable CGFloat k_borderWidth;
@property(nonatomic, assign) IBInspectable UIColor * k_borderColor;
@property(nonatomic, assign) IBInspectable CGFloat k_cornerRadius;

@end

NS_ASSUME_NONNULL_END
