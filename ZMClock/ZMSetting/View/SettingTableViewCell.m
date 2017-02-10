//
//  SettingTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        /**
         点击效果
         */
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.textLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
        [self.textLabel setTextColor:[UIColor blackColor]];
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    }
    return self;
}


-(SettingHeaderView*)headerView
{
    if (_headerView == nil)
    {
        _headerView = [[SettingHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 180.0)];
    }
    return _headerView;
}


-(void)setModel:(SettingViewModel *)model
{
    switch (model.cellType)
    {
#pragma mark  MeNormal  正常
        case MeNormal:
        {
            [self.textLabel setText:model.titleText];
            [self.textLabel setFont:[UIFont systemFontOfSize:12.0]];
#pragma mark ->> 分割线的类型
            switch (model.celllineType)
            {
                case LineAlignmentCenter:
                case LineAlignmentFullScreen:
                case LineAlignmentLeft:
                case LineAlignmentRight:
                    break;
            }
            
            
#pragma mark ->> 是否显示箭头
            switch (model.accessoryType)
            {
                case AccessoryNone:
                case AccessoryDisclosureIndicator:
                    break;
            }
            
            
        }
            break;
#pragma mark  MeNormalEmpty  间隔类型单元格
        case MeNormalEmpty:
        {
#pragma mark ->> 分割线的类型
            switch (model.celllineType)
            {
                case LineAlignmentCenter:
                case LineAlignmentFullScreen:
                case LineAlignmentLeft:
                case LineAlignmentRight:
                {
                    [self.textLabel setText:model.titleText];
                    [self.textLabel setFont:[UIFont systemFontOfSize:12.0]];
                    [self.contentView setBackgroundColor:[UIColor grayColor]];
                    [self setAccessoryType:UITableViewCellAccessoryNone];
                }
                    break;
            }
            
#pragma mark ->> 是否显示箭头
            switch (model.accessoryType)
            {
                case AccessoryNone:
                case AccessoryDisclosureIndicator:
                {
                    [self.contentView setBackgroundColor:[UIColor grayColor]];
                    [self setAccessoryType:UITableViewCellAccessoryNone];
                }
                    break;
            }
        }
            break;
#pragma mark  MeHeadPortrait  头像类型单元格
        case MeNoNormal:
        {
            
            [self.contentView addSubview:self.headerView];
            [_headerView.headButton.navImageView sd_setImageWithURL:[NSURL URLWithString:model.imageName]];
            
            
#pragma mark ->> 分割线的类型
            switch (model.celllineType)
            {
                case LineAlignmentCenter:
                case LineAlignmentFullScreen:
                case LineAlignmentLeft:
                case LineAlignmentRight:
                {
                    [self.contentView setBackgroundColor:[UIColor grayColor]];
                    [self setAccessoryType:UITableViewCellAccessoryNone];
                }
                    break;
            }
            
            
#pragma mark ->> 是否显示箭头
            switch (model.accessoryType)
            {
                case AccessoryNone:
                case AccessoryDisclosureIndicator:
                {
                    [self.contentView setBackgroundColor:[UIColor grayColor]];
                    [self setAccessoryType:UITableViewCellAccessoryNone];
                }
                    break;
            }
        }
            break;
    }
}
@end
