//
//  ZMView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMView.h"

@implementation ZMView






#pragma mark 在天气中使用
-(instancetype)initWithWeatherFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.imageView];
        [self.imageView setFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
        
        [self addSubview:self.rightLabel];
        [self.rightLabel setFrame:CGRectMake(self.frame.size.height, 0,frame.size.width-frame.size.height,frame.size.height )];
        [self.rightLabel setTextColor:[UIColor whiteColor]];
        [self.rightLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
    }
    return self;
}



#pragma mark 在天气中使用
/**
 天气情况中使用
 */

-(instancetype)initWithWeatherExplainFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        CGFloat ratioWidth = frame.size.width*(1.6/3.0);
        CGFloat spaceWidth = ratioWidth + 20;
        
        
        [self addSubview:self.leftLabel];
        [self.leftLabel setFrame:CGRectMake(0, 0, ratioWidth, frame.size.height)];
        [self.leftLabel setFont:[UIFont boldSystemFontOfSize:25.0]];
        [self.leftLabel setText:@"小雪转晴天"];
        [self.leftLabel setTextAlignment:NSTextAlignmentRight];
        
        
        
        [self addSubview:self.rightLabel];
        [self.rightLabel setFrame:CGRectMake(spaceWidth, 0,frame.size.width-spaceWidth, frame.size.height)];
        [self.rightLabel setFont:[UIFont boldSystemFontOfSize:25.0]];
        [self.rightLabel setText:[NSString stringWithFormat:@"%@°",@"1"]];
    }
    return self;
    
}


/**
 协议中使用
 */
-(instancetype)initWithProtocolFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.markButton];
        [self.markButton setFrame:CGRectMake(0, 5, frame.size.height-10,frame.size.height-10)];

        
        
        CGSize size = [[ZMHelper sharedHelp] contentWidthAndHight:@"同意协议" withSpaceWidth:100 withFontOfSize:[UIFont systemFontOfSize:15.0]];
        
        [self addSubview:self.leftLabel];
        [self.leftLabel setFrame:CGRectMake(frame.size.height, 0, size.width, frame.size.height)];
        [self.leftLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self.leftLabel setTextColor:[UIColor grayColor]];
        [self.leftLabel setText:@"同意遵守"];
        
        
        
        CGSize protocolsize = [[ZMHelper sharedHelp] contentWidthAndHight:@"《用户协议和隐私条款》" withSpaceWidth:100 withFontOfSize:[UIFont systemFontOfSize:15.0]];
        
        
        
        [self addSubview:self.protocolButton];
        [self.protocolButton setFrame:CGRectMake(20+size.width+5, 0, protocolsize.width, frame.size.height)];
        [self.protocolButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [self.protocolButton setTitle:@"《用户协议和隐私条款》" forState:UIControlStateNormal];
        [self.protocolButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return self;
}





#pragma mark Getter / Setter
-(UIImageView *)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _imageView;
}

-(UILabel *)leftLabel
{
    if (_leftLabel == nil)
    {
        _leftLabel = [[UILabel alloc]init];
        [_leftLabel setTextColor:[UIColor whiteColor]];
    }
    return _leftLabel;
}


-(UILabel *)rightLabel
{
    if (_rightLabel == nil)
    {
        _rightLabel = [[UILabel alloc]init];
        [_rightLabel setTextColor:[UIColor whiteColor]];
    }
    return _rightLabel;
}


-(ZMButton *)markButton
{
    if (_markButton == nil)
    {
        _markButton = [[ZMButton alloc]initWithMarkFrame];
        [_markButton setIsMark:YES];
        [_markButton setTag:1];
    }
    return _markButton;
}


-(ZMButton *)protocolButton
{
    if (_protocolButton == nil)
    {
        _protocolButton = [[ZMButton alloc]init];
        [_protocolButton setTag:2];
    }
    return _protocolButton;
}


//初始化头衔视图
-(instancetype)initHonourWithFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.startImageView];
        [self addSubview:self.levelLanel];
        
    }
    return self;
}

-(void)resetHonourWithFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.startImageView setFrame:CGRectMake(frame.size.width/2-50/2,0, 50, 50)];
    
    [self.levelLanel setFrame:CGRectMake(0, frame.size.height-15.0, frame.size.width, 15.0)];
}

-(UIImageView *)startImageView
{
    if (_startImageView == nil)
    {
        _startImageView = [[UIImageView alloc]init];
        [_startImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _startImageView;
}

-(UILabel *)levelLanel
{
    if (_levelLanel == nil)
    {
        _levelLanel = [[UILabel alloc]init];
        [_levelLanel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_levelLanel setTextAlignment:NSTextAlignmentCenter];
        [_levelLanel setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _levelLanel;
}

@end
