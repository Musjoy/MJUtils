//
//  UIView+Utils.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "UIView+Utils.h"
#import <objc/runtime.h>


@implementation UIView (Utils)

- (void)setCornerRound:(float)aRound
{
    self.layer.cornerRadius = aRound;
    self.layer.masksToBounds = YES;
}

+ (instancetype)viewFromNib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self  options:nil] objectAtIndex:0];
}

+ (instancetype)allocView
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:NSStringFromClass([self class]) ofType:@"nib"];
    if (filePath.length > 0) {
        return [self viewFromNib];
    } else {
        return [super alloc];
    }
}


@end
