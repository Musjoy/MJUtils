//
//  UITableViewCell+Utils.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "UITableViewCell+Utils.h"
#import "UIView+Utils.h"
#import "NSString+Utils.h"

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
    if (filePath.length > 0) {
        UITableViewCell *cell = [self viewFromNib];
        if (cell == nil) {
            cell = [[self alloc] init];
        }
        return cell;
    } else {
        return [[super alloc] initWithStyle:style reuseIdentifier:reuseIdentifier];
    }
}

- (void)configWithData:(id)data
{
    // need be overwrite
//    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));

    if ([data isKindOfClass:[NSDictionary class]]) {
        NSDictionary *aDic = (NSDictionary *)data;
        NSString *icon = aDic[@"icon"];
        if (icon.length > 0) {
            [self.imageView setImage:[UIImage imageNamed:icon]];
        }
        NSString *cellTitleKey = aDic[@"cellTitleKey"];
        if (cellTitleKey && cellTitleKey.length > 0) {
            [self.textLabel setText:locString(cellTitleKey)];
        } else {
            [self.textLabel setText:[aDic objectForKey:@"cellTitle"]];
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
    // need be overwrite
//    LogInfo(@"This function need be overwrite by [%@]", NSStringFromClass([self class]));
    [self configWithData:data];
}

@end
