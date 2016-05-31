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

#pragma mark -

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
