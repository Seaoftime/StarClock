//
//  RecordTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "RecordTableViewCell.h"

@implementation RecordTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.backGroundImageView];
    }
    return self;
}


-(UIImageView *)backGroundImageView
{
    if (_backGroundImageView == nil)
    {
        _backGroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, kScreen_Width-20, 60)];
        [_backGroundImageView setBackgroundColor:[UIColor clearColor]];
        [_backGroundImageView setImage:[UIImage imageNamed:@"录制语音时背景图片"]];
    }
    return _backGroundImageView;
}


@end
