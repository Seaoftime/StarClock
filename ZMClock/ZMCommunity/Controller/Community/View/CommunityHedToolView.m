//
//  CommunityHedToolView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "CommunityHedToolView.h"

@interface CommunityHedToolView ()



@property (nonatomic,strong) UIView *lineView; //!< 分割线

@property (nonatomic) CGRect lineFrame; //!< 分割线移动的frame

@end

@implementation CommunityHedToolView


-(instancetype)initWithFrame:(CGRect)frame withDeletage:(id<CommunityHedToolViewDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setHedTooldeletage:deletage];
        
        [self setLineFrame:frame];
        
        [self addSubview:self.newsButton];
        [self addSubview:self.storyButton];
        [self addSubview:self.comicButton];
        [self addSubview:self.lineView];
        
        
        [self.newsButton setFrame:CGRectMake(0, 0, frame.size.width/3.0, frame.size.height)];
        [self.storyButton setFrame:CGRectMake(frame.size.width/3.0, 0, frame.size.width/3.0, frame.size.height)];
        [self.comicButton setFrame:CGRectMake(2*(frame.size.width/3.0), 0, frame.size.width/3.0, frame.size.height)];
        
        
    }
    return self;
}




#pragma mark - Getter  / Setter
-(ZMButton*)newsButton
{
    if (_newsButton == nil)
    {
        _newsButton = [[ZMButton alloc]init];
        [_newsButton setTitle:@"资讯" forState:UIControlStateNormal];
        [_newsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_newsButton setTag:1];
        [_newsButton addTarget:self action:@selector(communityHeadButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _newsButton;
}

-(ZMButton*)storyButton
{
    if (_storyButton == nil)
    {
        _storyButton = [[ZMButton alloc]init];
        [_storyButton setTitle:@"小说" forState:UIControlStateNormal];
        [_storyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_storyButton setTag:2];
        [_storyButton addTarget:self action:@selector(communityHeadButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _storyButton;
}


-(ZMButton*)comicButton
{
    if (_comicButton == nil)
    {
        _comicButton = [[ZMButton alloc]init];
        [_comicButton setTitle:@"漫画" forState:UIControlStateNormal];
        [_comicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_comicButton setTag:3];
        [_comicButton addTarget:self action:@selector(communityHeadButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _comicButton;
}


-(UIView *)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:MainColor];
    }
    return _lineView;
}




#pragma mark - 按钮触发的方法
-(void)communityHeadButton:(ZMButton *)comicButton
{
    switch (comicButton.tag)
    {
        case 1:
        {
            [self.newsButton setTitleColor:MainColor forState:UIControlStateNormal];
            [self.storyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.comicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [self.lineView setFrame:CGRectMake(0,self.lineFrame.size.height-3.0 , self.lineFrame.size.width/3.0, 3.0)];
            
        }
            break;
        case 2:
        {
            [self.newsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.storyButton setTitleColor:MainColor forState:UIControlStateNormal];
            [self.comicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
            [self.lineView setFrame:CGRectMake(1*(self.lineFrame.size.width/3.0),self.lineFrame.size.height-3.0 , self.lineFrame.size.width/3.0, 3.0)];
        }
            break;
        case 3:
        {
            [self.newsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.storyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.comicButton setTitleColor:MainColor forState:UIControlStateNormal];
            
             [self.lineView setFrame:CGRectMake(2*(self.lineFrame.size.width/3.0),self.lineFrame.size.height-3.0 , self.lineFrame.size.width/3.0, 3.0)];
        }
            break;
    }
    
    
    if ([self.hedTooldeletage respondsToSelector:@selector(communityHedToolViewButton:)])
    {
        [self.hedTooldeletage communityHedToolViewButton:comicButton];
    }
}

@end




