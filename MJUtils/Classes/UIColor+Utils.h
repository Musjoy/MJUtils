//
//  UIColor+Utils.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIColor (Utils)

/**
 *	@brief	RGB值转换为UIColor对象
 *
 *	@param 	inColorString 	RGB值，如“＃808080”这里只需要传入“808080”
 *
 *	@return	UIColor对象
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

@end
