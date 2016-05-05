//
//  NSDictionary+Utils.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)

- (NSString *)convertToJsonString
{
    NSData* jsonData = nil;
    NSError* jsonError = nil;
    @try {
        jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                   options:kNilOptions
                                                     error:&jsonError];
    }
    @catch (NSException *exception) {
        //this should not happen in properly design JSONModel
        //usually means there was no reverse transformer for a custom property
//        JMLog(@"EXCEPTION: %@", exception.description);
        return nil;
    }
    
    NSString *theStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return theStr;
}

@end
