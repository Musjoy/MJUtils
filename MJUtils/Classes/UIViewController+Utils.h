//
//  UIViewController+Utils.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import HEADER_CONTROLLER_MANAGER

@interface UIViewController (Utils)

// 界面是否显示，这里必须调用了viewDidAppear才会为Yes
@property (nonatomic, assign) BOOL isViewShow;

@property (nonatomic, nonatomic) BOOL isViewHadShow;        // 是否已经显示过

/** 从xib初始化 */
- (id)initFromNib;


/**
 *	@brief	提示
 *
 *	@param 	msg 	提示信息
 */
- (void)alertMsg:(NSString*)msg;


/**
 *	@brief	显示加载框
 *
 *	@param 	labelText 	加载框显示内容
 */
- (void)startLoading:(NSString *)labelText;
- (void)startLoading:(NSString *)labelText detailText:(NSString *)detailText;

/**
 *	@brief	隐藏加载框
 */
- (void)stopLoading;

/**
 *	@brief	弹出底部的提示文字
 *
 *	@param 	str 需要弹出的字符串
 */
- (void)toast:(NSString *)str;


#pragma mark -

/** 使用该数据初始化界面 */
- (void)configWithData:(id)data;

/** 使用附加参数初始化该界面 */
- (void)configWithData:(id)data andAttach:(id)attachData;

/** 使用该数据刷新界面 */
- (void)refreshWithData:(id)data;

@end
