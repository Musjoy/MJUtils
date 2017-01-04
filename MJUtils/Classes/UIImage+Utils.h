//
//  UIImage+Utils.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Utils)

+ (UIImage *)createImageWithColor:(UIColor *)color;
+ (UIImage *)createImageWithColor:(UIColor *)color andSize:(CGSize)size;

+ (instancetype)animatedImageNamed:(NSString *)name tintColor:(UIColor *)tintColor duration:(NSTimeInterval)duration;
- (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;       // 该方法存在缩放，请谨慎使用
- (UIImage *)imageByScalingWithScale:(float)targetScale;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage *)imageByFillingSize:(CGSize)targetSize;
- (UIImage *)fixOrientation;

- (UIImage*)grayImage;


@end
