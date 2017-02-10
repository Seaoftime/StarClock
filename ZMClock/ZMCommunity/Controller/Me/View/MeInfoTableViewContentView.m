//
//  MeInfoTableViewContentView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MeInfoTableViewContentView.h"

@interface MeInfoTableViewContentView ()

@property (nonatomic,strong) UIView *lineViw;

@end

@implementation MeInfoTableViewContentView

/**
 头像类型单元格内容视图初始化
 */
-(instancetype)initWithHeadPortrait
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.describeLabel];
        [self addSubview:self.imageView];
        [self addSubview:self.lineViw];
        
        [self resetBackgroundColor:NO];
    }
    return self;
}





-(void)resetHeadPortraitFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    
    [self.titleLabel setFrame:CGRectMake(20, frame.size.height/4, frame.size.width/2-20, frame.size.height/2.0)];
    [self.describeLabel setFrame:CGRectMake(20,frame.size.height/2.0 , frame.size.width/2-20, frame.size.height/2.0)];
    [self.describeLabel setTextAlignment:NSTextAlignmentLeft];
    
    [self.imageView setFrame:CGRectMake(frame.size.width-90, 10, 60, 60)];
    [self.imageView.layer setCornerRadius:10.0];
    [self.imageView.layer setMasksToBounds:YES];
    [self.lineViw setFrame:CGRectMake(0, frame.size.height-1.0,frame.size.width, 1.0)];

}






/**
 正常表格单元格内容视图初始化
 */
-(instancetype)initWithNormal
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.describeLabel];
        [self addSubview:self.lineViw];
        [self addSubview:self.jiantouImgV];
        
        [self resetBackgroundColor:NO];
    }
    return self;
}


-(void)resetNormalFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.titleLabel setFrame:CGRectMake(20, 0, frame.size.width/2-20, frame.size.height)];
    
    [self.describeLabel setFrame:CGRectMake(frame.size.width/2 - 25, 0, frame.size.width/2-20 , frame.size.height)];
    [self.lineViw setFrame:CGRectMake(0, frame.size.height-1.0,frame.size.width, 1.0)];
    [self.jiantouImgV setFrame:CGRectMake(kScreen_Width - 25, (frame.size.height - 15)/2, 10, 15)];
    
}




-(void)resetBackgroundColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self.imageView setBackgroundColor:[UIColor redColor]];
        [self.titleLabel setBackgroundColor:[UIColor purpleColor]];
        [self.describeLabel setBackgroundColor:[UIColor orangeColor]];
    }
  
}





#pragma mark Getter / Setter

-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _titleLabel;
}


-(UILabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[UILabel alloc]init];
        [_describeLabel setTextAlignment:NSTextAlignmentRight];
        [_describeLabel setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _describeLabel;
}


-(UIImageView *)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
        [_imageView setUserInteractionEnabled:YES];
    }
    return _imageView;
}


- (UIImageView *)jiantouImgV
{
    if (_jiantouImgV == nil)
    {
        _jiantouImgV = [[UIImageView alloc] init];
        _jiantouImgV.image = IMAGE(@"返回-小me");
        [_jiantouImgV setUserInteractionEnabled:YES];
    }
    return _jiantouImgV;
}




-(UIView *)lineViw
{
    if (_lineViw == nil)
    {
        _lineViw = [[UIView alloc] init];
        [_lineViw setBackgroundColor:LineViewColor];
    }
    return _lineViw;
}


@end
