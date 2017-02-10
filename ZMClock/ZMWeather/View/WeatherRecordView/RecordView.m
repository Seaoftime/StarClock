//
//  RecordView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "RecordView.h"

@implementation RecordView

-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<RecordViewDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setRecordDeletage:deletage];
        
        [self addSubview:self.timeLabel];
    
        //添加子视图
        [self addSubview:self.tipLabel];
        [self addSubview:self.tipTitleLabel];
        
        
        [self addSubview:self.toolBarView];
        
    }
    return self;
}



#pragma mark - Getter / Setter

-(UILabel *)timeLabel
{
    if (_timeLabel == nil)
    {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, kScreen_Width, 30)];
        [_timeLabel setTextAlignment:NSTextAlignmentCenter];
        [_timeLabel setTextColor:RGB(220, 130, 226)];
        [_timeLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25.0]];
        [_timeLabel setShadowColor:RGB(35.0, 72.0, 83.0)];
        [_timeLabel setShadowOffset:CGSizeMake(1, 1)];
        [_timeLabel setText:@"00:00:00"];
    }
    return _timeLabel;
}



-(UILabel *)tipLabel
{
    if (_tipLabel == nil)
    {
        _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 170, kScreen_Width, 50)];
        [_tipLabel setTextAlignment:NSTextAlignmentCenter];
        [_tipLabel setText:@"点击录音按钮录音，读出屏幕中的短语"];
        [_tipLabel setTextColor:RGB(160.0, 160.0, 160.0)];
        [_tipLabel setNumberOfLines:0];
    }
    return _tipLabel;
}

-(UILabel *)tipTitleLabel
{
    if (_tipTitleLabel == nil)
    {
        _tipTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, kScreen_Width, 60)];
        [_tipTitleLabel setTextAlignment:NSTextAlignmentCenter];
        [_tipTitleLabel setTextColor:RGB(166.0, 246.0, 255.0)];
        [_tipTitleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25.0]];
        [_tipTitleLabel setShadowColor:RGB(35.0, 72.0, 83.0)];
        [_tipTitleLabel setShadowOffset:CGSizeMake(1, 1)];
        [_tipTitleLabel setNumberOfLines:0];
    }
    return _tipTitleLabel;
}


-(UIView*)toolBarView
{
    if (_toolBarView == nil)
    {
        _toolBarView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreen_Height-70, kScreen_Width, 70)];
        [_toolBarView setBackgroundColor:RGB(106.0,221.0, 255.0)];
        [_toolBarView addSubview:self.recordButton];
        [_toolBarView addSubview:self.playButton];
        [_toolBarView addSubview:self.doneButton];
    }
    return _toolBarView;
}



-(ZMButton *)playButton
{
    if (_playButton == nil)
    {
        _playButton = [[ZMButton alloc]initWithFrame:CGRectMake(self.recordButton.frame.origin.x-100,70/2-40/2 , 80, 40)];
        [_playButton setImage:[UIImage imageNamed:@"播放"] forState:UIControlStateNormal];
        [_playButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_playButton setTag:1];
        [_playButton setHidden:YES];
    }
    return _playButton;
}


-(ZMButton *)recordButton
{
    if (_recordButton == nil)
    {
        _recordButton = [[ZMButton alloc]initWithFrame:CGRectMake(kScreen_Width/2-80/2,70/2-40/2 , 80, 40)];
        [_recordButton setImage:[UIImage imageNamed:@"录音"] forState:UIControlStateNormal];
        [_recordButton addTarget:self action:@selector(recordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_recordButton setTag:20];
    }
    return _recordButton;
}




-(ZMButton *)doneButton
{
    if (_doneButton == nil)
    {
        _doneButton = [[ZMButton alloc]initWithFrame:CGRectMake(self.recordButton.frame.origin.x + 100,70/2-40/2 , 80, 40)];
        [_doneButton setImage:[UIImage imageNamed:@"完成"] forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_doneButton setTag:3];
        [_doneButton setHidden:YES];
    }
    return _doneButton;
}


#pragma mark - 按钮触发的方法
#pragma mark  录音按钮触发的方法
-(void)recordButtonAction:(ZMButton *)sender
{
    if ([self.recordDeletage respondsToSelector:@selector(recordViewButtonAction:)])
    {
        [self.recordDeletage recordViewButtonAction:sender];
    }
    
    
    switch (sender.tag)
    {
        case 20:
        {
            [sender setTag:30];
            [sender setImage:[UIImage imageNamed:@"停止"] forState:UIControlStateNormal];
        }
            break;
        case 30:
        {
            [sender setTag:40];
            [sender setImage:[UIImage imageNamed:@"重录"] forState:UIControlStateNormal];
            [self.playButton setHidden:NO];
            [self.doneButton setHidden:NO];
        }
            break;
        case 40:
        {
            [sender setTag:30];
            [sender setImage:[UIImage imageNamed:@"停止"] forState:UIControlStateNormal];
            [self.playButton setHidden:NO];
            [self.doneButton setHidden:NO];
        }
            break;
    }
}


#pragma mark  播放和完成按钮触发的方法
-(void)buttonAction:(ZMButton *)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            NSLog(@"播放按钮");
        }
            break;
        case 3:
        {
            NSLog(@"完成按钮");
        }
            break;
    }
    
    
    if ([self.recordDeletage respondsToSelector:@selector(recordViewButtonAction:)])
    {
        [self.recordDeletage recordViewButtonAction:sender];
    }
}

@end
