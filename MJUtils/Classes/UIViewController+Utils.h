//
//  UIViewController+Utils.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (Utils)

// 界面是否显示，这里必须调用了viewDidAppear才会为Yes
@property (nonatomic, assign) BOOL isViewShow;

@property (nonatomic, nonatomic) BOOL isViewHadShow;        // 是否已经显示过

/** 从xib初始化 */
- (id)initFromNib;


#pragma mark -

/** 使用该数据初始化界面 */
- (void)configWithData:(id)data;

/** 使用附加参数初始化该界面 */
- (void)configWithData:(id)data andAttach:(id)attachData;

/** 使用该数据刷新界面 */
- (void)refreshWithData:(id)data;

@end
