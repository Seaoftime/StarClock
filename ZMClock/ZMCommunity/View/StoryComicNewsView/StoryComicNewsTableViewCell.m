//
//  StoryComicNewsTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "StoryComicNewsTableViewCell.h"

@interface StoryComicNewsTableViewCell ()

@property (nonatomic,strong) UIView *lineView;

@end



@implementation StoryComicNewsTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self.contentView addSubview:self.storyComicNewsNormalView];
        [self.contentView addSubview:self.storyComicNewsExaminationFailView];
        [self.contentView addSubview:self.lineView];
        
        
        
    }
    return self;
}



-(void)setModel:(StoryComicNewsModel *)model
{
    switch (model.storyComicNewsModelType)
    {
        case normalType:
        {
            [self.storyComicNewsNormalView setHidden:NO];
            [self.storyComicNewsExaminationFailView setHidden:YES];
            
            
            [self.storyComicNewsNormalView resetWithNormalFrame:CGRectMake(5, 5, kScreen_Width-10, model.cellHight) withModel:model];
            [self.lineView  setFrame:CGRectMake(0, model.cellHight-6, kScreen_Width, 6.0)];
        }
            break;
        case examinationFailType:
        {
            [self.storyComicNewsNormalView setHidden:YES];
            [self.storyComicNewsExaminationFailView setHidden:NO];
            
            [self.storyComicNewsExaminationFailView resetWithExaminationFailFrame:CGRectMake(5, 5, kScreen_Width-10, model.cellHight) withModel:model];
            
            [self.lineView  setFrame:CGRectMake(0, model.cellHight-6, kScreen_Width, 6.0)];
            

        }
            break;
    }
}







#pragma mark Getter / Setter
-(StoryComicNewsView *)storyComicNewsNormalView
{
    if (_storyComicNewsNormalView == nil)
    {
        _storyComicNewsNormalView = [[StoryComicNewsView alloc]initWithNormalFrame];
    }
    return _storyComicNewsNormalView;
}

-(StoryComicNewsView *)storyComicNewsExaminationFailView
{
    if (_storyComicNewsExaminationFailView == nil)
    {
        _storyComicNewsExaminationFailView = [[StoryComicNewsView alloc]initWithExaminationFailtypeFrame];
    }
    return _storyComicNewsExaminationFailView;
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


@end
