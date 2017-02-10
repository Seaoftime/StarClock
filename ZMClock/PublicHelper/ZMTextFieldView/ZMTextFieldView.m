//
//  ZMTextFieldView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTextFieldView.h"

@interface ZMTextFieldView ()

@property (nonatomic,strong) UIView *lineView;

@end



@implementation ZMTextFieldView


-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.inputTextField];
    }
    return self;
}



-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.titleLabel setFrame:CGRectMake(0, 0, frame.size.width/5, frame.size.height)];
    [self.inputTextField resetFrame:CGRectMake(frame.size.width/5, 0, frame.size.width-frame.size.width/5, frame.size.height)];
}



-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _titleLabel;
}

-(UITextField *)inputTextField
{
    if (_inputTextField == nil)
    {
        _inputTextField = [[ZMTextField alloc]init];
        [_inputTextField setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _inputTextField;
}





/**
 初始化分割线TextField
 */
-(instancetype)initWithLineViewFrame:(CGRect)frame withImageName:(NSString*)imageName
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.imageView];
        [self.imageView setFrame:CGRectMake(5, 5, 20, 20)];
        [self.imageView setImage:[UIImage imageNamed:imageName]];
        
        [self addSubview:self.inputTextField];
        [self.inputTextField setFrame:CGRectMake(30, 0, frame.size.width-30, frame.size.height)];
        
        [self addSubview:self.lineView];
        [self.lineView setFrame:CGRectMake(0, frame.size.height, frame.size.width, 1)];
    }
    return self;
}



-(UIView*)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:LineViewColor];
    }
    return _lineView;
}

-(UIImageView *)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}



-(ZMButton *)verifyCodeButton
{
    if (_verifyCodeButton == nil)
    {
        _verifyCodeButton = [[ZMButton alloc]init];
        [_verifyCodeButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_verifyCodeButton setBackgroundColor:MainColor];
        [_verifyCodeButton.layer setCornerRadius:4.0];
        [_verifyCodeButton.layer setMasksToBounds:YES];
    }
    return _verifyCodeButton;
}


/**
 初始化分割线TextField和按钮Frame
 */
-(instancetype)initWithLineViewAndButtonFrame:(CGRect)frame withImageName:(NSString*)imageName withTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.imageView];
        [self.imageView setFrame:CGRectMake(5, 7.5, 15, 15)];
        [self.imageView setImage:[UIImage imageNamed:imageName]];
        
        [self addSubview:self.inputTextField];
        [self.inputTextField setFrame:CGRectMake(30, 0, frame.size.width-30, frame.size.height)];
        
        [self addSubview:self.lineView];
        [self.lineView setFrame:CGRectMake(0, frame.size.height, frame.size.width, 1)];
        
        
        
        [self addSubview:self.verifyCodeButton];
        [self.verifyCodeButton setTitle:title forState:UIControlStateNormal];
        [self.verifyCodeButton setFrame:CGRectMake(frame.size.width-120, 2, 100, frame.size.height-4)];
    }
    return self;
}



@end
