//
//  UITableViewCell+Utils.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "UITableViewCell+Utils.h"
#import "UIView+Utils.h"
#import HEADER_LOCALIZE
#ifdef  MODULE_THEME_MANAGER
#import <MJThemeManager/MJThemeManager.h>
#endif
#ifdef  MODULE_CACHE_MANAGER
#import <MJCacheManager/UIImageView+WebImage.h>
#endif

#define DEFAULT_CELL_HEIGHT 48

@implementation UITableViewCell (Utils)

@dynamic delegate;

//- (void)setDelegate:(id<TableViewCellDelegate>)delegate
//{
//    // need be overwrite
//    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
//}

+ (CGFloat)heightForCellWithData:(nullable id)data inWidth:(CGFloat)aWidth
{
    return DEFAULT_CELL_HEIGHT;
}

+ (__kindof UITableViewCell *)cellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:NSStringFromClass([self class]) ofType:@"nib"];
    UITableViewCell *cell = nil;
    if (filePath.length > 0) {
        cell = [self viewFromNib];
        if (cell == nil) {
            cell = [[self alloc] init];
        }
    } else {
        cell = [[super alloc] initWithStyle:style reuseIdentifier:reuseIdentifier];
    }
#ifdef MODULE_THEME_MANAGER
    [cell reloadTheme];
#endif
    return cell;
}

- (void)configWithData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSDictionary *aDic = (NSDictionary *)data;
        NSString *icon = aDic[@"icon"];
        if (icon.length > 0) {
#ifdef MODULE_CACHE_MANAGER
            [self.imageView setImageWithName:icon];
#else
            [self.imageView setImage:[UIImage imageNamed:icon]];
#endif
        }
        NSString *titleKey = aDic[@"titleKey"]?:aDic[@"cellTitleKey"];
        if (titleKey && titleKey.length > 0) {
            [self.textLabel setText:locString(titleKey)];
        } else {
            NSString *title = aDic[@"title"]?:aDic[@"cellTitle"];
            [self.textLabel setText:title];
        }
        NSString *subTitle = [aDic objectForKey:@"subTitleUpdate"];
        if (subTitle == nil) {
            subTitle = [aDic objectForKey:@"subTitle"];
        }
        if (subTitle.length > 0) {
            [self.detailTextLabel setText:subTitle];
        }
        NSNumber *disable = [aDic objectForKey:@"hideArrow"];
        if (disable && [disable boolValue]) {
            self.accessoryType = UITableViewCellAccessoryNone;
        } else {
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    } else if ([data isKindOfClass:[NSString class]]) {
        [self.textLabel setText:data];
    }
}

- (void)configWithData:(id)data andAttach:(id)attachData
{
    [self configWithData:data];
}

@end
