//
//  AddClockEditTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "AddClockEditTableViewCell.h"

@implementation AddClockEditTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        /**
         改颜色修改的表单元格的点击对勾颜色
         */
        [self.contentView addSubview:self.editView];
        [self setTintColor:[UIColor redColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}



-(void)setModel:(AddClockEditViewModel *)model
{
    switch (model.cellType)
    {
        case MeNormal:
        {
            [self.editView.titleLabel setText:model.title];
        }
            break;
        case MeNoNormal:
        case MeNormalEmpty:
            break;
    }
}


-(AddClockEditView *)editView
{
    if (_editView == nil)
    {
        _editView = [[AddClockEditView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 40.0)];
    }
    return _editView;
}


@end
