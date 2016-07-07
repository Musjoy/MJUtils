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
    int length = inColorString.length * 4;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> (length-8));
    greenByte = (unsigned char) (colorCode >> (length-16));
    blueByte = (unsigned char) (colorCode  >> (length-24)); // masks off high bits
    float alpha = 1.0;
    if (length > 24) {
        unsigned char alphaByte = (unsigned char) (colorCode - (colorCode  >> (length-24)));
        if (length == 28) {
            alpha = (float)alphaByte / 0xf;
        } else if (length == 32) {
            alpha = (float)alphaByte / 0xff;
        }
    }
    result = [UIColor colorWithRed: (float)redByte / 0xff green: (float)greenByte/ 0xff blue: (float)blueByte / 0xff alpha:alpha];
    return result;
}

@end
