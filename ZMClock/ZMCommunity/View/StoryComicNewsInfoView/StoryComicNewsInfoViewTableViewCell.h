//
//  StoryComicNewsInfoViewTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//
//  该自定义表单元格为“小说”、“漫画”、“资讯”详情页中使用
//
//
//


#import <UIKit/UIKit.h>
#import "StoryComicNewsInfoView.h"
#import "StoryComicNewsInfoFrame.h"


@protocol StoryComicNewsInfoViewTableViewCellDeletage <NSObject>

-(void)infoAuthorViewSupportViewAction:(SupportView*)sender;


@end

@interface StoryComicNewsInfoViewTableViewCell : UITableViewCell


/**
 标题视图
 */
@property (nonatomic,strong) StoryComicNewsInfoView *infoTitleView;


/**
 内容视图
 */
@property (nonatomic,strong) StoryComicNewsInfoView *infoDescribeView;


/**
 详情图片视图
 */
@property (nonatomic,strong) StoryComicNewsInfoView *infoImageView;

/**
 详情评论视图
 */
@property (nonatomic,strong) StoryComicNewsInfoView *infoAuthorView;


/**
 详情评论视图
 */
@property (nonatomic,strong) StoryComicNewsInfoView *infoCommentView;




@property (nonatomic,strong) StoryComicNewsInfoFrame *infoframe;


@property (nonatomic,assign) id <StoryComicNewsInfoViewTableViewCellDeletage> deletage;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier setDeletage:(id<StoryComicNewsInfoViewTableViewCellDeletage>)deletage;

@end
