//
//  UIView+Utils.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

- (void)setCornerRound:(float)aRound;

+ (instancetype)viewFromNib;

+ (instancetype)allocView;

@end
