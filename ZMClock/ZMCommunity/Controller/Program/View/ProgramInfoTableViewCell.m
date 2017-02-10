//
//  ProgramInfoTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ProgramInfoTableViewCell.h"

@interface ProgramInfoTableViewCell ()

@property (nonatomic,strong) UIView *lineView; //!< 分割线

@end


@implementation ProgramInfoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
        [self.contentView addSubview:self.startView];
        [self.contentView addSubview:self.infoView];
        [self.contentView addSubview:self.commentView];
        [self.contentView addSubview:self.commentItemsView];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}




-(void)setProgramFrame:(ProgramFrame *)frame
{
    switch (frame.model.programType)
    {
        case startImageType:
        {
            [self.startView setHidden:NO];
            [self.infoView setHidden:YES];
            [self.commentView setHidden:YES];
            [self.commentItemsView setHidden:YES];
            [self.lineView setHidden:YES];
            
            
            [self.startView resetWithimageViewFrame:frame.startImageFrame withimageViewFame:frame.startImageFrame withModel:frame.model];
            
            
        }
            break;
        case infoType:
        {
            [self.startView setHidden:YES];
            [self.infoView setHidden:NO];
            [self.commentView setHidden:YES];
            [self.commentItemsView setHidden:YES];
            [self.lineView setHidden:YES];

            
            [self.infoView resetWithProgramInfoFrame:frame.programinfoViewFrame withdateLabelFrame:frame.programinfoDateFrame withtitleLabelFrame:frame.programinfoTitleLabelFrame withlocalctionViewFrame:frame.programinfoLocationFrame withtimeViewFrame:frame.programinfoTimeFrame withModel:frame.model];
            
        }
            break;
        case commentNumberType:
        {
            [self.startView setHidden:YES];
            [self.infoView setHidden:YES];
            [self.commentView setHidden:NO];
            [self.commentItemsView setHidden:YES];
            [self.lineView setHidden:YES];
            
        
            [self.commentView resetWithCommentFrame:frame.commentNumberViewFrame withtitleLabelFrame:frame.commentFrame withsupportViewFrame:frame.supportViewFrame withModel:frame.model];
            
        }
            break;
        case commentitemsType:
        {
            [self.startView setHidden:YES];
            [self.infoView setHidden:YES];
            [self.commentView setHidden:YES];
            [self.commentItemsView setHidden:NO];
            [self.lineView setHidden:NO];
            
            
            [self.commentItemsView resetWithCommentItemsFrame:frame.commentViewFrame withimageViewFrame:frame.commentheadPortraiteImageFrame withtitleLabelFrame:frame.commentNickNameFrame withLevelViewFrame:frame.commentLevelFrame withdateLabelFrame:frame.commentDateFrame withdescribeLabelFrame:frame.commentDescribeFrame withModel:frame.model];
            
            
            
            //重置Frame
            [self.lineView setFrame:CGRectMake(0,frame.cellHight-1.0, kScreen_Width, 1.0)];
            
        }
            break;
    }
}











#pragma mark - Getter / Setter
-(ProgramView*)startView
{
    if (_startView == nil)
    {
        _startView = [[ProgramView alloc]initWithimageViewFrame];
    }
    return _startView;
}


-(ProgramView*)infoView
{
    if (_infoView == nil)
    {
        _infoView = [[ProgramView alloc]initWithProgramInfoFrame];
    }
    return _infoView;
}


-(ProgramView*)commentView
{
    if (_commentView == nil)
    {
        _commentView = [[ProgramView alloc]initWithCommentFrame];
    }
    return _commentView;
}



-(ProgramView*)commentItemsView
{
    if (_commentItemsView == nil)
    {
        _commentItemsView = [[ProgramView alloc]initWithCommentItemsFrame];
    }
    return _commentItemsView;
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





@end
