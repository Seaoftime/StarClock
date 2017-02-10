//
//  StoryComicNewsView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  该视图为“小说”、“漫画”、“资讯”自定义单元格中使用
//
//

#import <UIKit/UIKit.h>
#import "SupportView.h"
#import "StoryComicNewsModel.h"

@interface StoryComicNewsView : UIView


/**
 审核失败标签
 */
@property (nonatomic,strong) UILabel *examinationFailLabel;


/**
 图片视图
 */
@property (nonatomic,strong) UIImageView *storyComicNewsImageView;

/**
 标题标签
 */
@property (nonatomic,strong) UILabel *titleLabel;

/**
 描述标签
 */
@property (nonatomic,strong) UILabel *describeLabel;

/**
 作者标签
 */
@property (nonatomic,strong) UILabel *authorLabel;

/**
 日期标签
 */
@property (nonatomic,strong) UILabel *dateLabel;

/**
 评论图片视图
 */
@property (nonatomic,strong) SupportView *commentView;



-(instancetype)initWithNormalFrame;
/**
 重置正常类型Frame
 */
-(void)resetWithNormalFrame:(CGRect)frame withModel:(StoryComicNewsModel*)model;





-(instancetype)initWithExaminationFailtypeFrame;
/**
 重置正常类型Frame
 */
-(void)resetWithExaminationFailFrame:(CGRect)frame withModel:(StoryComicNewsModel*)model;




@end
