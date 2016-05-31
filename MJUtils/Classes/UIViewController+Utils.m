//
//  UIViewController+Utils.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "UIViewController+Utils.h"




@implementation UIViewController (Utils)

- (id)initFromNib
{
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    return self;
}

- (BOOL)isViewShow
{
    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
    return NO;
}

- (void)setIsViewShow:(BOOL)isViewShow
{
    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
}

- (BOOL)isViewHadShow
{
    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
    return YES;
}

- (void)setIsViewHadShow:(BOOL)isViewHadShow
{
    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
}


- (void)alertMsg:(NSString *)massage
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:massage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)alert:(NSString *)title message:(NSString *)massage
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:massage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)startLoading:(NSString *)labelText
{
#ifdef THEControllerManager
    [THEControllerManager startLoading:labelText];
#endif
}

- (void)startLoading:(NSString *)labelText detailText:(NSString *)detailText
{
#ifdef THEControllerManager
    [THEControllerManager startLoading:labelText detailText:detailText];
#endif
}

- (void)stopLoading
{
#ifdef THEControllerManager
    [THEControllerManager stopLoading];
#endif
}

- (void)toast:(NSString *)str
{
#ifdef THEControllerManager
    [THEControllerManager toast:str];
#endif
}



- (void)configWithData:(id)data
{
    // need be overwrite
    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
}

- (void)configWithData:(id)data andAttach:(id)attachData
{
    // need be overwrite
    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
}

- (void)refreshWithData:(id)data
{
    // need be overwrite
    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
}

@end
