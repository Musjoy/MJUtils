//
//  UITableViewCell+Utils.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableViewCellDelegate <NSObject>


@end

@interface UITableViewCell (Utils)

@property (nonatomic, assign, nullable) id<TableViewCellDelegate> delegate;

/** 根据数据和给定宽度，计算高度 */
+ (CGFloat)heightForCellWithData:(nullable id)data inWidth:(CGFloat)aWidth;
/** 通用cell初始化方法 */
+ (nonnull instancetype)cellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;

/**
 *	@brief	使用数据data来初始化cell
 *
 *	@param 	data 	初始化cell所需要的数据
 *
 *	@return	void
 */
- (void)configWithData:(nullable id)data;


/**
 *	@brief	使用数据data和附加数据attachData来初始化cell
 *
 *	@param 	data        初始化cell所需要的数据
 *	@param 	attachData 	初始化cell所需要附加的数据
 *
 *	@return	void
 */
- (void)configWithData:(nullable id)data andAttach:(nullable id)attachData;


@end

