//
//  NSDate+Utils.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "NSDate+Utils.h"

#define ONE_DATE_TIME (24 * 60 * 60 * 1000)

#define TWO_DATE_TIME (2 * ONE_DATE_TIME)

#define THREE_DATE_TIME (3 * ONE_DATE_TIME)

#define CUR_TIMEZONE (8 * 60 * 60)

static NSDateFormatter *s_theDataFormatter = nil;

@implementation NSDate (Utils)

+ (NSDate *)curDate
{
    NSTimeInterval curTimestamp = [[NSDate date] timeIntervalSince1970] + CUR_TIMEZONE;
    return [NSDate dateWithTimeIntervalSince1970:curTimestamp];
}

+ (NSDate *)dataAtTomorrowBegin
{
    NSDate *today = [NSDate date];
    NSTimeInterval curTimestamp = [today timeIntervalSince1970] + CUR_TIMEZONE;
    NSTimeInterval tomorrowTimestamp = curTimestamp - ((long long)curTimestamp % ONE_DATE_TIME) + ONE_DATE_TIME;
    
    return  [NSDate dateWithTimeIntervalSince1970:tomorrowTimestamp];
}


- (NSString *)fomateString
{
    if (s_theDataFormatter == nil) {
        s_theDataFormatter = [[NSDateFormatter alloc] init];
        s_theDataFormatter.dateFormat = @"yyyy/MM/dd";
        s_theDataFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        s_theDataFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    }
    return [s_theDataFormatter stringFromDate:self];
}

@end
