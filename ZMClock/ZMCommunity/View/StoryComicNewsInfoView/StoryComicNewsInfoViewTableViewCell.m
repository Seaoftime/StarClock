//
//  StoryComicNewsInfoViewTableViewCell.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "StoryComicNewsInfoViewTableViewCell.h"

@interface StoryComicNewsInfoViewTableViewCell ()

@property (nonatomic,strong) UIView *lineView; //!< 分割线

@end


@implementation StoryComicNewsInfoViewTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier setDeletage:(id<StoryComicNewsInfoViewTableViewCellDeletage>)deletage
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setDeletage:deletage];
        /**
         去除点击效果
         */
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self.contentView addSubview:self.infoTitleView];
        [self.contentView addSubview:self.infoDescribeView];
        [self.contentView addSubview:self.infoImageView];
        [self.contentView addSubview:self.infoAuthorView];
        [self.contentView addSubview:self.infoCommentView];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}





-(void)setInfoframe:(StoryComicNewsInfoFrame *)infoframe
{
    _infoframe = infoframe;
    
    
    switch (infoframe.model.type)
    {
#pragma mark case titleType
        case titleType:
        {
            [self.infoTitleView setHidden:NO];
            [self.infoDescribeView setHidden:YES];
            [self.infoImageView setHidden:YES];
            [self.infoAuthorView setHidden:YES];
            [self.infoCommentView setHidden:YES];
            [self.lineView setHidden:YES];
            
            
            
            
            
            [self.infoTitleView.titleLael setFrame:infoframe.titleLabelFrame];
            [self.infoTitleView.dateLabel setFrame:infoframe.dateLabelFrame];
            [self.infoTitleView.sourceLabel setFrame:infoframe.sourceLabelFrame];
            [self.infoTitleView setFrame:infoframe.titleViewFrame];
            
            
            //填充内容
            [self.infoTitleView.titleLael setText:infoframe.model.title];
            [self.infoTitleView.dateLabel setText:infoframe.model.dateTime];
            [self.infoTitleView.sourceLabel setText:infoframe.model.source];
        }
            break;
#pragma mark case describeType
        case describeType:
        {
            
            [self.infoTitleView setHidden:YES];
            [self.infoDescribeView setHidden:NO];
            [self.infoImageView setHidden:YES];
            [self.infoAuthorView setHidden:YES];
            [self.infoCommentView setHidden:YES];
            [self.lineView setHidden:YES];
            
            
            [self.infoDescribeView.describeLabel setFrame:infoframe.describeLabelFrame];
            [self.infoDescribeView setFrame:infoframe.describeViewFrame];
            
            //填充数据
            [self.infoDescribeView.describeLabel setText:infoframe.model.describe];
        }
            break;
#pragma mark case imageType
        case imageType:
        {
            [self.infoTitleView setHidden:YES];
            [self.infoDescribeView setHidden:YES];
            [self.infoImageView setHidden:NO];
            [self.infoAuthorView setHidden:YES];
            [self.infoCommentView setHidden:YES];
            [self.lineView setHidden:YES];
            
            
            [self.infoImageView.imageView setFrame:infoframe.imageFrame];
            [self.infoImageView setFrame:infoframe.imageViewFrame];
            
            
            //填充数据
            [self.infoImageView.imageView sd_setImageWithURL:[NSURL URLWithString:infoframe.model.imageUrl]];
            
        }
            break;
#pragma mark case authorType
        case authorType:
        {
            
            [self.infoTitleView setHidden:YES];
            [self.infoDescribeView setHidden:YES];
            [self.infoImageView setHidden:YES];
            [self.infoAuthorView setHidden:NO];
            [self.infoCommentView setHidden:YES];
            [self.lineView setHidden:YES];
            
            
            [self.infoAuthorView.authorLabel setFrame:infoframe.authorLabelFrame];
            [self.infoAuthorView.topLineView setFrame:infoframe.topLineViewFrame];
            [self.infoAuthorView.readNumberView setFrame:infoframe.readLabelFrame];
            [self.infoAuthorView.commentView setFrame:infoframe.commentViewFrame];
            [self.infoAuthorView.supportView setFrame:infoframe.supportViewFrame];
            [self.infoAuthorView.bottomLineView setFrame:infoframe.bottomLineViewFrame];
            [self.infoAuthorView setFrame:infoframe.authorViewFrame];
            
            
            
            //填充数据
            [self.infoAuthorView.authorLabel setText:infoframe.model.author];
            [self.infoAuthorView.readNumberView.numberLabel setText:infoframe.model.readNumer];
            [self.infoAuthorView.readNumberView.supportImageView setImage:[UIImage imageNamed:@"阅读"]];
            
            
            [self.infoAuthorView.commentView.numberLabel setText:infoframe.model.commentNumer];
            [self.infoAuthorView.commentView.supportImageView setImage:[UIImage imageNamed:@"评论"]];
            
            [self.infoAuthorView.supportView setModel:infoframe.model];
        }
            break;
#pragma mark case commentType
        case commentType:
        {
            
            [self.infoTitleView setHidden:YES];
            [self.infoDescribeView setHidden:YES];
            [self.infoImageView setHidden:YES];
            [self.infoAuthorView setHidden:YES];
            [self.infoCommentView setHidden:NO];
            [self.lineView setHidden:NO];
            
            
            
            [self.infoCommentView.imageView setFrame:infoframe.headPortraitFrame];
            [self.infoCommentView.imageView.layer setCornerRadius:infoframe.headPortraitFrame.size.height/2];
            [self.infoCommentView.imageView.layer setMasksToBounds:YES];
            [self.infoCommentView.nickNameLael setFrame:infoframe.nickNameLabelFrame];
            [self.infoCommentView.dateLabel setFrame:infoframe.commentDateLabelFrame];
            [self.infoCommentView.describeLabel setFrame:infoframe.commentDescribeLabelFrame];
            [self.infoCommentView.supportView setFrame:infoframe.supportViewFrame];
            [self.infoCommentView setFrame:infoframe.commentViewFrame];
            [self.lineView setFrame:CGRectMake(0, infoframe.cellHight-1.0, kScreen_Width, 1.0)];
            
            
            /**
             填充数据
             */
             [self.infoCommentView.levelView resetLevelViewFrame:infoframe.commentLevelFrame withImageName:@"等级黄" withLevel:infoframe.model.level];
            [self.infoCommentView.nickNameLael setText:infoframe.model.nickName];
            [self.infoCommentView.dateLabel setText:infoframe.model.commentDate];
            [self.infoCommentView.describeLabel setText:infoframe.model.commentDescribe];
            [self.infoCommentView.imageView sd_setImageWithURL:[NSURL URLWithString:infoframe.model.headPortraitUrl]];
        }
            break;
        default:
        {
            [self.infoTitleView setHidden:YES];
            [self.infoDescribeView setHidden:YES];
            [self.infoImageView setHidden:YES];
            [self.infoAuthorView setHidden:YES];
            [self.infoCommentView setHidden:YES];
        }
            break;
            
    }
}




































#pragma mark - Getter / Setter
-(StoryComicNewsInfoView *)infoTitleView
{
    if (_infoTitleView == nil)
    {
        _infoTitleView = [[StoryComicNewsInfoView alloc]initWithTitle];
    }
    return _infoTitleView;
}



-(StoryComicNewsInfoView *)infoDescribeView
{
    if (_infoDescribeView == nil)
    {
        _infoDescribeView = [[StoryComicNewsInfoView alloc]initWithDescribe];
    }
    return _infoDescribeView;
}

-(StoryComicNewsInfoView *)infoAuthorView
{
    if (_infoAuthorView == nil)
    {
        _infoAuthorView = [[StoryComicNewsInfoView alloc]initWithAuthorAndSupportComment];
        [_infoAuthorView.supportView addTarget:self action:@selector(supportViewAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _infoAuthorView;
}

-(StoryComicNewsInfoView *)infoImageView
{
    if (_infoImageView == nil)
    {
        _infoImageView = [[StoryComicNewsInfoView alloc]initWithImageView];
    }
    return _infoImageView;
}


-(StoryComicNewsInfoView *)infoCommentView
{
    if (_infoCommentView == nil)
    {
        _infoCommentView = [[StoryComicNewsInfoView alloc]initWithComment];
    }
    return _infoCommentView;
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




#pragma mark - 点赞视图点击方法
-(void)supportViewAction:(SupportView*)sender
{
    if ([self.deletage respondsToSelector:@selector(infoAuthorViewSupportViewAction:)])
    {
        [self.deletage infoAuthorViewSupportViewAction:sender];
    }
}

@end
