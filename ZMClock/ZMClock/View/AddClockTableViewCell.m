//
//  AddClockTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "AddClockTableViewCell.h"

@interface AddClockTableViewCell ()

@property (nonatomic,strong) UIImageView *accessoryImageView;



@end

@implementation AddClockTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self.contentView addSubview:self.addNormalView];
        [self.contentView addSubview:self.addNoNormalView];
        /**
         改颜色修改的表单元格的点击对勾颜色
         */
        [self setTintColor:[UIColor redColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}


-(void)setModel:(AddClockViewModel *)model
{
    switch (model.cellType)
    {
        case MeNormal:
        {
            [self setAccessoryView:self.accessoryImageView];
            [self.addNoNormalView setHidden:YES];
            [self.addNormalView setHidden:NO];
            [self.contentView addSubview:self.addNormalView];
            [self.addNormalView.titlabel setText:model.title];
            [self.addNormalView.describeLabel setText:model.describe];
        }
            break;
        case MeNormalEmpty:
        {
            [self.addNormalView setHidden:YES];
            [self.addNoNormalView setHidden:YES];
//            [self.contentView setBackgroundColor:LineViewColor];
//            [self setAccessoryType:UITableViewCellAccessoryNone];
            
        }
            break;
        case MeNoNormal:
        {
            [self.addNoNormalView setHidden:NO];
            [self.addNormalView setHidden:YES];
            [self.contentView addSubview:self.addNoNormalView];
            [self setAccessoryType:UITableViewCellAccessoryNone];
            [self.addNoNormalView.titlabel setText:model.title];
            if ([model.switchOn isEqualToString:@"开启"])
            {
                [self.addNoNormalView.onOrOffSwitch setOn:YES];
            }
            else if ([model.switchOn isEqualToString:@"关闭"])
            {
                [self.addNoNormalView.onOrOffSwitch setOn:NO];
            }
        }
            break;
    }
    
    
    switch (model.accessoryType)
    {
        case AccessoryNone:
        {
             [self setAccessoryType:UITableViewCellAccessoryNone];
        }
            break;
        case AccessoryDisclosureIndicator:
        {
            [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
            break;
    }
}




-(AddClockView *)addNormalView
{
    if (_addNormalView == nil)
    {
        _addNormalView = [[AddClockView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 50) withType:1];
    }
    return _addNormalView;
}



-(AddClockView *)addNoNormalView
{
    if (_addNoNormalView == nil)
    {
        _addNoNormalView = [[AddClockView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 50) withType:2];
         [_addNoNormalView.onOrOffSwitch addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
    }
    return _addNoNormalView;
}


-(UIImageView*)accessoryImageView
{
    if (_accessoryImageView == nil)
    {
        _accessoryImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [_accessoryImageView setImage:[UIImage imageNamed:@"添加闹钟附件"]];
    }
    return _accessoryImageView;
}



-(void)action:(ZMSwitch*)sender
{
    if ([self.addClockDeletage respondsToSelector:@selector(switchAction:)])
    {
        [self.addClockDeletage switchAction:sender];
    }
}
@end
