//
//  NSString+Utils.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef locString
#define locString(...) [NSString localizedString:__VA_ARGS__, nil]
#endif

@interface NSString (Utils)

/** 本地字符串替换 */
+ (NSString *)localizedString:(NSString *)format, ... NS_REQUIRES_NIL_TERMINATION;

/** 版本号检查 */
- (BOOL)isNewThanVersion:(NSString *)oldVersion;

/**
 *	@brief	将字符串作md5值加密，如果传入的原文为空字符串“”或者nil则返回的密文为空字符串“”
 *
 *	@return	密文
 */
- (NSString *)md5;

/** 去除首尾空格 */
-(NSString *)trim;

+ (NSString *)formateTime:(long)aTime;

/** 获取url参数 */
- (NSString *)getUrlParameter:(NSString *)param;

/** 是否包含字符串 */
- (BOOL)containString:(NSString *)str;

@end
