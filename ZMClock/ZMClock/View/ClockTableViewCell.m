//
//  ClockTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ClockTableViewCell.h"

@implementation ClockTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.itemView];
    }
    return self;
}


-(ClockItemView*)itemView
{
    if (_itemView == nil)
    {
        _itemView = [[ClockItemView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 80.0)];
        [_itemView.onOrOffSwitch addTarget:self action:@selector(onOrOffSwitchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _itemView;
}


-(void)onOrOffSwitchAction:(ZMSwitch*)sender
{
    if ([self.clockDeletage respondsToSelector:@selector(swithchAction:)])
    {
        [self.clockDeletage swithchAction:sender];
    }
}




-(void)setModel:(AddClockViewModel *)model
{
    [self.itemView resetWithTitle:model.dateTime withDescribe:model.repeatType withOnorOff:model.switchOn];
}

-(void)setindexTag:(NSInteger)tag
{
    [self.itemView.onOrOffSwitch setTag:tag];
}




@end
