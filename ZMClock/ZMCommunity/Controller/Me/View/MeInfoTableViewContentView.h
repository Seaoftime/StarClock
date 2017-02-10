//
//  MeInfoTableViewContentView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  我的个人资料单元格内容视图
//
//
//

#import <UIKit/UIKit.h>

@interface MeInfoTableViewContentView : UIView

@property (nonatomic,strong) UILabel *titleLabel; //!< 每行的标题
@property (nonatomic,strong) UILabel *describeLabel; //!< 每行的描述内容
@property (nonatomic,strong) UIImageView *imageView; //!< 头像图片视图


//张锐
@property (nonatomic, strong) UIImageView *jiantouImgV;//箭头

/**
 头像类型单元格内容视图初始化
 */
-(instancetype)initWithHeadPortrait;

-(void)resetHeadPortraitFrame:(CGRect)frame;

/**
 正常表格单元格内容视图初始化
 */
-(instancetype)initWithNormal;

-(void)resetNormalFrame:(CGRect)frame;

@end
