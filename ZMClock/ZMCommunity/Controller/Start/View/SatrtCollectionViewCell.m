//
//  SatrtCollectionViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SatrtCollectionViewCell.h"

@implementation SatrtCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        [self.contentView.layer setBorderWidth:1.5];
        [self.contentView.layer setBorderColor:[LineViewColor CGColor]];
        
        
        
        [self.contentView addSubview:self.startImageView];
        [self.contentView addSubview:self.startNanmeLabel];
        [self.contentView addSubview:self.fansLabel];
        [self.contentView addSubview:self.attentionButton];
        
        
        
        [self.startImageView setFrame:CGRectMake(5, 5, 40, 40)];
        [self.startImageView.layer setCornerRadius:20.0];
        [self.startImageView.layer setMasksToBounds:YES];
        
        
        
        [self.startNanmeLabel setFrame:CGRectMake(45, 10, frame.size.width-50, 15)];
        [self.fansLabel setFrame:CGRectMake(45, 30, frame.size.width-50, 15)];
        [self.attentionButton setFrame:CGRectMake(frame.size.width/2-60/2, frame.size.height-35, 60, 30)];
        [self.attentionButton.layer setCornerRadius:30/2.0];
    }
    return self;
}






-(void)setModel:(StartModel *)model
{
    _model = model;
    
    
    switch (model.startType)
    {
        case EnterStartType:
        {
            switch (model.statusModelType)
            {
                case AlreadyAttentionType:
                {
                    [self.attentionButton setStartModel:model];
                    [self.attentionButton setTitle:@"已关注" forState:UIControlStateNormal];
                    [self.attentionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [self.attentionButton setBackgroundColor:MainColor];
                }
                    break;
                case NoAttentionType:
                {
                    [self.attentionButton setStartModel:model];
                    [self.attentionButton setTitle:@"关注" forState:UIControlStateNormal];
                    [self.attentionButton setTitleColor:MainColor forState:UIControlStateNormal];
                    [self.attentionButton setBackgroundColor:[UIColor whiteColor]];
                }
            }
        }
            break;
        case SupportStartType:
        {
            switch (model.statusModelType)
            {
                case AlreadyAttentionType:
                {
                    [self.attentionButton setStartModel:model];
                    [self.attentionButton setTitle:@"已申请" forState:UIControlStateNormal];
                    [self.attentionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [self.attentionButton setBackgroundColor:MainColor];
                }
                    break;
                case NoAttentionType:
                {
                    [self.attentionButton setStartModel:model];
                    [self.attentionButton setTitle:@"申请" forState:UIControlStateNormal];
                    [self.attentionButton setTitleColor:MainColor forState:UIControlStateNormal];
                    [self.attentionButton setBackgroundColor:[UIColor whiteColor]];
                }
                    break;
            }
           
        }
            break;
    }
    
    [self.startImageView sd_setImageWithURL:[NSURL URLWithString:model.startUrl]];
    [self.startNanmeLabel setText:model.startName];
    [self.fansLabel setText:model.startFans];
}






#pragma mark - Getter / Setter
-(ZMButton*)attentionButton
{
    if (_attentionButton == nil)
    {
        _attentionButton = [[ZMButton alloc]init];
        [_attentionButton.layer setBorderColor:[MainColor CGColor]];
        [_attentionButton.layer setBorderWidth:2.0];
        [_attentionButton addTarget:self action:@selector(attentionAction:) forControlEvents:UIControlEventTouchUpInside];
        [_attentionButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    }
    return _attentionButton;
}


-(UIImageView *)startImageView
{
    if (_startImageView == nil)
    {
        _startImageView = [[UIImageView alloc]init];
    }
    return _startImageView;
}


-(UILabel *)startNanmeLabel
{
    if (_startNanmeLabel == nil)
    {
        _startNanmeLabel = [[UILabel alloc]init];
        [_startNanmeLabel setTextAlignment:NSTextAlignmentCenter];
        [_startNanmeLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_startNanmeLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _startNanmeLabel;
}



-(UILabel *)fansLabel
{
    if (_fansLabel == nil)
    {
        _fansLabel = [[UILabel alloc]init];
        [_fansLabel setTextAlignment:NSTextAlignmentCenter];
        [_fansLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_fansLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _fansLabel;
}


#pragma mark 按钮触发方法
-(void)attentionAction:(ZMButton*)sender
{
    if ([self.deletage respondsToSelector:@selector(attentionButtonAction:)])
    {
        [self.deletage attentionButtonAction:sender];
    }
}

@end
