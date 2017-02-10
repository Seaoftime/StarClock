//
//  DIYClockTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "DIYClockTableViewCell.h"

@interface DIYClockTableViewCell ()

@property (nonatomic,strong) UIImageView *accessoryImageView;  //!< 附件图片视图
@property (nonatomic,strong) UIView *lineView; //!< 分割线

@end

@implementation DIYClockTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withHight:(CGFloat)hight
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:RGB(255.0, 176.0, 236.0)];
        [self setAccessoryView:self.accessoryImageView];
        [self addSubview:self.lineView];
        [self.lineView setFrame:CGRectMake(0, hight-4, kScreen_Width, 4)];
    }
    return self;
}



-(UIImageView *)accessoryImageView
{
    if (_accessoryImageView == nil)
    {
        _accessoryImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [_accessoryImageView setImage:[UIImage imageNamed:@"添加闹钟附件"]];
    }
    return _accessoryImageView;
}



-(UIView*)lineView
{
    if (_lineView == nil)
    {
        _lineView  = [[UIView alloc]init];
        [_lineView setBackgroundColor:[UIColor whiteColor]];
    }
    return _lineView;
}



@end
