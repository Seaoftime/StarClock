//
//  TinkleTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  选择铃声
//
//
//

#import "TinkleTableViewCell.h"

@implementation TinkleTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.TinkleBackGroundView];
        [self setAccessoryView:self.accessoryImageView];
    }
    return self;
}



-(void)setModel:(TinkleModel *)model
{
    _model = model;
    [self.textLabel setText:model.ringName];
    switch (model.selectType)
    {
        case no_select_type:
        {
            [self.accessoryImageView setImage:[UIImage imageNamed:@"未选中铃声"]];
        }
            break;
        case select_type:
        {
            [self.accessoryImageView setImage:[UIImage imageNamed:@"选中铃声"]];
        }
            break;
    }
}



-(UIView *)TinkleBackGroundView
{
    if (_TinkleBackGroundView == nil)
    {
        _TinkleBackGroundView = [[UIView alloc]initWithFrame:CGRectMake(5.0, 2.5, kScreen_Width-10.0, 70)];
        
    }
    return _TinkleBackGroundView;
}


-(UIImageView*)accessoryImageView
{
    if (_accessoryImageView == nil)
    {
        _accessoryImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    }
    return _accessoryImageView;
}
@end
