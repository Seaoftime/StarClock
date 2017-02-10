//
//  StoryComicNewsTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  该自定义表单元格为“小说”、“漫画”、“资讯”主页中使用
//
//

#import <UIKit/UIKit.h>
#import "StoryComicNewsView.h"
#import "StoryComicNewsModel.h"

@interface StoryComicNewsTableViewCell : UITableViewCell


@property (nonatomic,strong) StoryComicNewsView *storyComicNewsNormalView;
@property (nonatomic,strong) StoryComicNewsView *storyComicNewsExaminationFailView;

@property (nonatomic,strong) StoryComicNewsModel *model;

@end
