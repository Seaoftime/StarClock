//
//  WeatherRecordViewTableViewContentView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "WeatherRecordViewTableViewContentView.h"
#import "TraBookAVAudioRecorder.h"

#define BlueColor RGB(79.0, 185.0, 255.0)
#define LightYellowColor RGB(255.0, 230.0, 153.0)
#define DeepYellowColor RGB(127.0, 115.0, 76.0)



@interface WeatherRecordViewTableViewContentView ()

/**
 分割线
 */
@property (nonatomic,strong) UIView *lineView;

/**
 这个是上面的蒙版，用来处理未能开启录音功能的单元格
 */
@property (nonatomic,strong) UIView *backView;


@end



@implementation WeatherRecordViewTableViewContentView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
        /**
         背景视图的相关属性
         
         */
        
        [self setBackgroundColor:LightYellowColor];
        [self.layer setBorderWidth:3.0];
        [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [self.layer setCornerRadius:4.0];
        [self.layer setMasksToBounds:YES];
        
        
        
        //添加序列号标签
        [self addSubview:self.numberLabel];
        [self.numberLabel setFrame:CGRectMake(5, 0, 60, frame.size.height)];
        
        //添加分割线
        [self addSubview:self.lineView];
        [self.lineView setFrame:CGRectMake(70, 0, 2, frame.size.height)];
        
        
        //添加录音内容标签
        [self addSubview:self.recordContentLabel];
        [self.recordContentLabel setFrame:CGRectMake(80, 0, kScreen_Width-230, frame.size.height)];
        
        
        //添加状态图片
        [self addSubview:self.stateImageView];
        [self.stateImageView setFrame:CGRectMake(kScreen_Width-140, frame.size.height/2-20/2, 55, 20)];
        
        
        //添加播放录音按钮
        [self addSubview:self.playRecordButton];
        [self.playRecordButton setFrame:CGRectMake(kScreen_Width-80, 0, 65, frame.size.height)];
        
        
        [self addSubview:self.backView];
        [self.backView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.backView setHidden:YES];
        
        [self showBackgroundColor:0];
    }
    return self;
}


-(void)showBackgroundColor:(int)backgroundColor
{
    if (backgroundColor)
    {
        [self.numberLabel setBackgroundColor:[UIColor purpleColor]];
        [self.recordContentLabel setBackgroundColor:[UIColor redColor]];
        [self.stateImageView setBackgroundColor:[UIColor orangeColor]];
        [self.playRecordButton setBackgroundColor:[UIColor greenColor]];
    }
}


#pragma mark - Getter / Setters
#pragma mark 显示xx/xx的标签
-(UILabel *)numberLabel
{
    if (_numberLabel == nil)
    {
        _numberLabel = [[UILabel alloc]init];
        [_numberLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
        [_numberLabel setTextAlignment:NSTextAlignmentCenter];
        [_numberLabel setTextColor:[UIColor whiteColor]];
        [_numberLabel setShadowColor:RGB(35.0, 72.0, 83.0)];
        [_numberLabel setShadowOffset:CGSizeMake(1, 1)];
    }
    return _numberLabel;
}

#pragma mark 分割竖线
-(UIView *)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:RGB(222.0, 222.0, 222.0)];
    }
    return _lineView;
}

#pragma mark 蒙版
-(UIView *)backView
{
    if (_backView == nil)
    {
        _backView =[[UIView alloc]init];
        [_backView setBackgroundColor:RGBAlpha(0, 0, 0, 0.5)];
    }
    return _backView;
}


#pragma mark 录音内容标签
-(UILabel *)recordContentLabel
{
    if (_recordContentLabel == nil)
    {
        _recordContentLabel = [[UILabel alloc]init];
        [_recordContentLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_recordContentLabel setTextColor:TipAlertViewolor];
    }
    return _recordContentLabel;
}

#pragma mark 录音状态图片视图
-(UIImageView *)stateImageView
{
    if (_stateImageView == nil)
    {
        _stateImageView = [[UIImageView alloc]init];
    }
    return _stateImageView;
}

#pragma mark 播放按钮
-(ZMButton *)playRecordButton
{
    if (_playRecordButton == nil)
    {
        _playRecordButton = [[ZMButton alloc]init];
        [_playRecordButton setImage:[UIImage imageNamed:@"录音播放图片"] forState:UIControlStateNormal];
        [_playRecordButton setBackgroundColor:RGBAlpha(102.0, 92.0, 61.0,0.5)];
        [_playRecordButton addTarget:self action:@selector(playRecordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playRecordButton;
}


#pragma mark - 设置数据
/**
 设置数据模型
 */
-(void)setContentModel:(WeatherRecordModel*)model
{
    [self.playRecordButton setRecordModel:model];
    _contentModel = model;
    switch (model.weatherRecordType)
    {
        case WeatherNoRecordType:
        {
            [self.backView setHidden:NO];
        }
            break;
        case WeatherCanRecordType:
        {
            [self.backView setHidden:YES];
        }
            break;
        case WeatherRecordDoneType:
        {
            [self.backView setHidden:YES];
        }
            break;
    }
    //设置背景颜色
    [self setBackgroundColor:model.backGroundcolor];
    
    //设置录音状态图标
    [self.stateImageView setImage:[UIImage imageNamed:model.recordStateTypeImage]];
    
    //设置序号标题
    [self.numberLabel setText:model.numberRatio];
    
    //设置录音内容
    [self.recordContentLabel setText:model.recordContent];
}



-(void)playRecordButtonAction:(ZMButton*)sender
{
    
    if ([self.deletage respondsToSelector:@selector(playRecordButton:)])
    {
        [self.deletage playRecordButton:sender];
    }
    
   
}

@end
