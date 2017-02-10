//
//  WeatherRecordViewTableViewContentView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  天气DIY录音单元格内容视图
//
//


#import <UIKit/UIKit.h>
#import "WeatherRecordModel.h"


@protocol WeatherRecordViewTableViewContentViewDeletage <NSObject>

-(void)playRecordButton:(ZMButton*)sender;


@end

@interface WeatherRecordViewTableViewContentView : UIView


/**
 序列标签
 */
@property (nonatomic,strong) UILabel *numberLabel;

/**
 录音内容标签
 */
@property (nonatomic,strong) UILabel *recordContentLabel;

/**
 状态图片视图
 */
@property (nonatomic,strong) UIImageView *stateImageView;

/**
 播放录音按钮
 */
@property (nonatomic,strong) ZMButton *playRecordButton;


@property (nonatomic,strong) WeatherRecordModel *contentModel;


@property (nonatomic,assign) id <WeatherRecordViewTableViewContentViewDeletage> deletage;

/**
 高度为:65
 宽度为:屏幕宽度-10*2（两边间隔宽度）
 */
-(instancetype)initWithFrame:(CGRect)frame;


@end
