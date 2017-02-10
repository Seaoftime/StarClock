//
//  SubmitView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SubmitView.h"

@implementation SubmitView



-(instancetype)initWithDeletage:(id<SubmitViewDeletage>)deletage;
{
    self = [super init];
    if (self)
    {
        [self setSubmitDeletage:deletage];
        [self addSubview:self.titleView];
        [self addSubview:self.sourceView];
        [self addSubview:self.submitInputView];
        [self addSubview:self.addPhotoButton];
        [self addSubview:self.submitScrollView];
        
        [self reSetBackgroundColor:NO];
    }
    return self;
}



-(void)reSetBackgroundColor:(BOOL)background
{
    if (background)
    {
        [self.titleView setBackgroundColor:[UIColor redColor]];
        [self.sourceView setBackgroundColor:[UIColor purpleColor]];
        [self.submitInputView setBackgroundColor:[UIColor orangeColor]];
        [self.addPhotoButton setBackgroundColor:[UIColor yellowColor]];
    }
  
}


/**
 重新设置Frame
 */
-(void)resetFrame:(CGRect)frame
{
    /**
     首先给自己设置Frame
     */
    [self setFrame:frame];
    
    [self.titleView resetFrame:CGRectMake(0, 0, frame.size.width, 30)];
    
    [self.sourceView resetFrame:CGRectMake(0, 30, frame.size.width, 30)];
    [self.submitInputView resetFrame:CGRectMake(0, 60, frame.size.width, frame.size.height-140)];
    [self.addPhotoButton setFrame:CGRectMake(0,frame.size.height-60, 50, 50)];
    [self.submitScrollView setFrame:CGRectMake(60, frame.size.height-65, frame.size.width-70, 60)];
    
    
}


#pragma mark - Getter / Setter 
-(ZMTextFieldView *)titleView
{
    if (_titleView == nil)
    {
        _titleView = [[ZMTextFieldView alloc]init];
        [_titleView.titleLabel setText:@"标题:"];
        [_titleView.inputTextField setPlaceholder:@"请输入6~25子标题"];
    }
    return _titleView;
}


-(ZMTextFieldView *)sourceView
{
    if (_sourceView == nil)
    {
        _sourceView = [[ZMTextFieldView alloc]init];
        [_sourceView.titleLabel setText:@"来源:"];
        [_sourceView.inputTextField setPlaceholder:@"请填写文章出处或者作者，原创请标明"];
    }
    return _sourceView;
}


-(ZMTextView *)submitInputView
{
    if (_submitInputView == nil)
    {
        _submitInputView = [[ZMTextView alloc]init];
//        [_submitInputView setText:@"文章正文"];
    }
    return _submitInputView;
}



-(ZMButton*)addPhotoButton
{
    if (_addPhotoButton == nil)
    {
        _addPhotoButton = [[ZMButton alloc]init];
        [_addPhotoButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
        [_addPhotoButton.titleLabel setFont:[UIFont systemFontOfSize:40.0]];
        [_addPhotoButton setTitle:@"+" forState:UIControlStateNormal];
        [_addPhotoButton setTitleColor:RGB(98.0, 98.0, 98.0) forState:UIControlStateNormal];
        [_addPhotoButton setBackgroundColor:RGB(178.0, 178.0, 178.0)];
        [_addPhotoButton.layer setCornerRadius:10.0];
        [_addPhotoButton.layer setMasksToBounds:YES];
    }
    return _addPhotoButton;
}


-(SubmitScrollView *)submitScrollView
{
    if (_submitScrollView == nil)
    {
        _submitScrollView = [[SubmitScrollView alloc]init];
    }
    return _submitScrollView;
}



-(void)submitAction:(ZMButton*)sender
{
    if ([self.submitDeletage respondsToSelector:@selector(submitPhotoButton:)])
    {
        [self.submitDeletage submitPhotoButton:sender];
    }
}

@end
