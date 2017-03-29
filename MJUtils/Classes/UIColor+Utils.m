//
//  UIColor+Utils.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "UIColor+Utils.h"

@implementation UIColor (Utils)


+ (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    NSInteger length = inColorString.length;
    if (length > 8) {
        inColorString = [inColorString substringFromIndex:length-8];
        length = 8;
    }
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString) {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    
    float alpha = 1.0;
    if (length > 6) {
        unsigned char alphaByte = (unsigned char)(colorCode  >> 24);
        colorCode = colorCode - ((colorCode >> 24) << 24);
        if (length == 7) {
            alpha = (float)alphaByte / 0xf;
        } else if (length == 8) {
            alpha = (float)alphaByte / 0xff;
        }
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char)colorCode;
    result = [UIColor colorWithRed: (float)redByte / 0xff green: (float)greenByte/ 0xff blue: (float)blueByte / 0xff alpha:alpha];
    return result;
}

@end
