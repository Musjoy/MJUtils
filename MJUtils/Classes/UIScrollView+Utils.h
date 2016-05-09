//
//  UIScrollView+DXRefresh.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef kRefreshColor
#define kRefreshColor ([UIColor grayColor])
#endif

@interface UIScrollView (Utils)

- (UIView *)header;
- (void)addHeaderWithTarget:(id)target action:(SEL)action;
- (void)headerBeginRefreshing;
- (void)headerEndRefreshing;
- (void)removeHeader;

- (UIView *)footer;
- (void)addFooterWithTarget:(id)target action:(SEL)action;
- (void)footerBeginRefreshing;
- (void)footerEndRefreshing;
- (void)removeFooter;

@end

