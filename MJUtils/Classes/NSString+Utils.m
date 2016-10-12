//
//  NSString+Utils.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "NSString+Utils.h"
#import <CommonCrypto/CommonDigest.h>


// 本地音频保存目录
#define LOCAL_MUSIC_FOLDER_NAME @"localMusic"
// 本地图片保存目录
#define LOCAL_IMAGE_FOLDER_NAME @"localImage"
// 本地头像保存目录
#define LOCAL_AVATAR_FOLDER_NAME @"localAvatar"
// 本地临时保存目录
#define LOCAL_TEMP_FOLDER_NAME @"localTemp"

// 本地图片存储路径
static NSString *s_localMusicPath = nil;
// 本地图片存储路径
static NSString *s_localImagePath = nil;
// 本地头像存储路径
static NSString *s_localAvatarPath = nil;
// 本地临时文件存储路径
static NSString *s_localTempPath = nil;


@implementation NSString (Utils)

+ (NSString *)localizedString:(NSString *)format, ...
{
    NSString *returnStr = NSLocalizedString(format, nil);
    if (returnStr && ![returnStr isEqualToString:format]) {
        
    } else {
        
    }
    if (returnStr) {
        va_list arguments;
        NSString *eachReplaceStr;
        int index = 0;
        
        va_start(arguments, format);
        while ((eachReplaceStr = va_arg(arguments, id))) {
            if ([eachReplaceStr isKindOfClass:[NSNumber class]]) {
                eachReplaceStr = [(NSNumber *)eachReplaceStr stringValue];
            }
            NSString *str = [NSString stringWithFormat:@"{%d}", index];
            returnStr = [returnStr stringByReplacingOccurrencesOfString:str withString:eachReplaceStr];
            index++;
        }
        va_end(arguments);
    }
    return returnStr;
}


- (BOOL)isNewThanVersion:(NSString *)oldVersion
{
    NSArray *arrayNew = [self componentsSeparatedByString:@"."];
    NSArray *arrayOld = [oldVersion componentsSeparatedByString:@"."];
    int len = MIN((int)arrayNew.count, (int)arrayOld.count);
    for (int i = 0; i < len; i++) {
        if ([[arrayNew objectAtIndex:i] intValue] > [[arrayOld objectAtIndex:i] intValue]) {
            return YES;
        } else if ([[arrayNew objectAtIndex:i] intValue] < [[arrayOld objectAtIndex:i] intValue]) {
            return NO;
        }
    }
    if (arrayNew.count > arrayOld.count) {
        return YES;
    }
    return NO;
}

- (NSString *)md5
{
    if (self == nil || self.length == 0) {
        return @"";
    }
    const char* str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];   // md5加密字串转大写
    }
    return ret;
}


// 去掉空格
- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


+ (NSString *)formateTime:(long)aTime
{
    long left = aTime;
    int second = left % 60;
    left = left / 60;
    int minute = left % 60;
    int hour = (int)(left / 60);
    
    NSMutableString *strReturn = [[NSMutableString alloc] init];
    if (second >= 10) {
        [strReturn insertString:[NSString stringWithFormat:@":%d", second] atIndex:0];
    } else {
        [strReturn insertString:[NSString stringWithFormat:@":0%d", second] atIndex:0];
    }

    if (minute >= 10) {
        [strReturn insertString:[NSString stringWithFormat:@"%d", minute] atIndex:0];
    } else {
        [strReturn insertString:[NSString stringWithFormat:@"0%d", minute] atIndex:0];
    }
    
    if (hour > 0) {
        if (hour >= 10) {
            [strReturn insertString:[NSString stringWithFormat:@"%d:", hour] atIndex:0];
        } else {
            [strReturn insertString:[NSString stringWithFormat:@"0%d:", hour] atIndex:0];
        }
    }
    
    return strReturn;
}



- (NSString *)getUrlParameter:(NSString *)param
{
    
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)",param];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    // 执行匹配的过程
    NSArray *matches = [regex matchesInString:self
                                      options:0
                                        range:NSMakeRange(0, [self length])];
    for (NSTextCheckingResult *match in matches) {
        //NSRange matchRange = [match range];
        //NSString *tagString = [webaddress substringWithRange:matchRange];  // 整个匹配串
        //        NSRange r1 = [match rangeAtIndex:1];
        //        if (!NSEqualRanges(r1, NSMakeRange(NSNotFound, 0))) {    // 由时分组1可能没有找到相应的匹配，用这种办法来判断
        //            //NSString *tagName = [webaddress substringWithRange:r1];  // 分组1所对应的串
        //            return @"";
        //        }
        
        NSString *tagValue = [self substringWithRange:[match rangeAtIndex:2]];  // 分组2所对应的串
        //    NSLog(@"分组2所对应的串:%@\n",tagValue);
        return tagValue;
    }
    return @"";
}

- (BOOL)containString:(NSString *)str
{
    if (str == nil) {
        return NO;
    }
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [self containsString:str];
#else
    NSRange aRange = [self rangeOfString:str];
    if (aRange.length > 0) {
        return YES;
    }
    return NO;
#endif
}

@end
