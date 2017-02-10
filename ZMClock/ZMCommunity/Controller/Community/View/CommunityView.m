//
//  CommunityView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "CommunityView.h"

@implementation CommunityView






#pragma mark - 设置背景颜色
-(void)setViewBackgroundColor:(BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self setBackgroundColor:[UIColor greenColor]];
        
        
        [self.commentImageView setBackgroundColor:[UIColor redColor]];
        [self.titleLabel setBackgroundColor:[UIColor purpleColor]];
        [self.describeLabel setBackgroundColor:[UIColor orangeColor]];
        [self.authorLabel setBackgroundColor:[UIColor purpleColor]];
        [self.dateLabel setBackgroundColor:[UIColor redColor]];
        [self.commentView setBackgroundColor:[UIColor redColor]];
    }
}







#pragma mark - 初始化各种视图
#pragma mark 初始化明星图片视图Frame
/**
 初始化图片视图Frame
 */
-(instancetype)initWithStartImageViewFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.imageView];
    }
    return self;
}

-(void)resetStartImageViewFrame:(CGRect)frame withimageViewFame:(CGRect)imageViewFrame withModel:(CommunityModel*)model
{
    [self setFrame:frame];
    [self.imageView setFrame:imageViewFrame];
    [self.imageView setBackgroundColor:[UIColor redColor]];
    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.startImageUrl]];
}


#pragma mark 初始化详情视图Frame
/**
 初始化图片视图Frame
 */
-(instancetype)initWithCommunityInfoFrame
{
    self = [super init];
    if (self)
    {   
        [self addSubview:self.nextProgramView];
        [self addSubview:self.moreProgramButton];
        [self addSubview:self.dateLabel];
        [self addSubview:self.titleLabel];
        [self addSubview:self.localctionView];
        [self addSubview:self.timeView];
        [self addSubview:self.lineView];
    }
    return self;
}

-(void)resetWithCommunityInfoFrame:(CGRect)frame withnextProgramView:(CGRect)nextProgramViewFrame withmoreProgramButtonFrame:(CGRect)moreProgramButtonFrame withdateLabelFrame:(CGRect)dateLabelFrame withtitleLabelFrame:(CGRect)titleLabelFrame withlocalctionViewFrame:(CGRect)localctionViewFrame withtimeViewFrame:(CGRect)timeViewFrame withModel:(CommunityModel*)model
{
    [self setFrame:frame];
    
    [self.nextProgramView setFrame:nextProgramViewFrame];
    [self.nextProgramView.numberLabel setFrame:CGRectMake(20, 0, nextProgramViewFrame.size.width-20, nextProgramViewFrame.size.height)];
    [self.moreProgramButton setFrame:moreProgramButtonFrame];
    
    [self.dateLabel setFrame:dateLabelFrame];
    [self.dateLabel setTextColor:RGB(54.0, 54.0, 54.0)];
    [self.dateLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
    
    [self.titleLabel setFrame:titleLabelFrame];
    [self.titleLabel setTextColor:RGB(54.0, 54.0, 54.0)];
    [self.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self.localctionView setFrame:localctionViewFrame];
    [self.timeView setFrame:timeViewFrame];
    [self.lineView setFrame:CGRectMake(0, frame.size.height, frame.size.width, 6.0)];
    
    
    
    
    
    /**
     填充数据
     */
    [self.dateLabel setText:model.programinfoDate];
    [self.titleLabel setText:model.programinfoTitle];
    [self.nextProgramView.supportImageView setImage:[UIImage imageNamed:@"下一个行程.png"]];
    [self.nextProgramView.numberLabel setText:@"下个行程"];
    [self.localctionView.supportImageView setImage:[UIImage imageNamed:@"行程详情地点.png"]];
    [self.localctionView.numberLabel setText:model.locationInfo];
    [self.timeView.numberLabel setText:model.time];
    [self.timeView.supportImageView setImage:[UIImage imageNamed:@"行程详情时间.png"]];
}





#pragma mark 初始化社区主页资料内容
-(instancetype)initWithCommunityFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.commentImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.describeLabel];
        [self addSubview:self.authorLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.commentView];
        [self addSubview:self.lineView];
        
        [self setViewBackgroundColor:NO];
    }
    return self;
}



/**
 重置正常类型Frame
 */
-(void)resetWithCommunityFrame:(CGRect)frame withModel:(CommunityModel*)model
{
    /**
     给自己设置Frame
     */
    [self setFrame:frame];
    
    
    /**
     因为每个元素都是固定所以固定死
     给每个空间设置Frame
     */
    [self.commentImageView setFrame:CGRectMake(5, 5, 120, 60)];
    [self.titleLabel setTextColor:[UIColor blackColor]];
    [self.titleLabel setFrame:CGRectMake(130, 5, frame.size.width-135, 20)];
    [self.describeLabel setFrame:CGRectMake(130, 30, frame.size.width-135, 35)];
    [self.authorLabel setFrame:CGRectMake(5, 70, 100, 15)];
    [self.dateLabel setFrame:CGRectMake(frame.size.width-210, 70, 130, 15)];
    [self.commentView setFrame:CGRectMake(frame.size.width-70, 70, 70, 15)];
    [self.lineView setFrame:CGRectMake(0, frame.size.height, frame.size.width, 6.0)];
    
    
    
    /**
     填充数据
     */
    [self.commentImageView sd_setImageWithURL:[NSURL URLWithString:model.commentUrl]];
    [self.titleLabel setText:model.title];
    [self.describeLabel setText:model.describe];
    [self.authorLabel setText:model.author];
    [self.dateLabel setText:model.date];
    [self.commentView.supportImageView setImage:[UIImage imageNamed:model.supportImageName]];
    [self.commentView.numberLabel setText:model.supportNumber];
    
}








#pragma mark - Getter / Setter
-(UIImageView *)commentImageView
{
    if (_commentImageView == nil)
    {
        _commentImageView = [[UIImageView alloc]init];
    }
    return _commentImageView;
}

-(UIImageView *)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
        [_imageView setBackgroundColor:[UIColor redColor]];
    }
    return _imageView;
}


-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}


-(UILabel *)dateLabel
{
    if (_dateLabel == nil)
    {
        _dateLabel = [[UILabel alloc]init];
        [_dateLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_dateLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _dateLabel;
}


-(UILabel *)authorLabel
{
    if (_authorLabel == nil)
    {
        _authorLabel = [[UILabel alloc]init];
        [_authorLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_authorLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _authorLabel;
}



-(UILabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[UILabel alloc]init];
        [_describeLabel setNumberOfLines:0];
        [_describeLabel setFont:[UIFont systemFontOfSize:14.0]];
    }
    return _describeLabel;
}




-(SupportView*)nextProgramView
{
    if (_nextProgramView == nil)
    {
        _nextProgramView = [[SupportView alloc]init];
        [_nextProgramView.numberLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _nextProgramView;
}



-(ZMButton*)moreProgramButton
{
    if (_moreProgramButton == nil)
    {
        _moreProgramButton = [[ZMButton alloc]init];
        [_moreProgramButton setTitle:@"更多行程" forState:UIControlStateNormal];
        [_moreProgramButton setTitleColor:MainColor forState:UIControlStateNormal];
        [_moreProgramButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_moreProgramButton.layer setBorderWidth:2.0];
        [_moreProgramButton.layer setBorderColor:[MainColor CGColor]];
        [_moreProgramButton.layer setCornerRadius:30/2.0];
        [_moreProgramButton addTarget:self action:@selector(moreProgramButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreProgramButton;
}


-(SupportView*)localctionView
{
    if (_localctionView == nil)
    {
        _localctionView = [[SupportView alloc]init];
    }
    return _localctionView;
}





-(SupportView*)timeView
{
    if (_timeView == nil)
    {
        _timeView = [[SupportView alloc]init];
    }
    return _timeView;
}



-(SupportView*)supportView
{
    if (_supportView == nil)
    {
        _supportView = [[SupportView alloc]init];
    }
    return _supportView;
}



-(SupportView*)commentView
{
    if (_commentView == nil)
    {
        _commentView = [[SupportView alloc]init];
    }
    return _commentView;
}



-(UIView *)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:LineViewColor];
    }
    return _lineView;
}



#pragma mark - 按钮点击触发方法
-(void)moreProgramButtonAction:(ZMButton*)sender
{
    if ([self.communityDeletage respondsToSelector:@selector(moreProgramButtonAction:)])
    {
        [self.communityDeletage moreProgramButtonAction:sender];
    }
}




@end
