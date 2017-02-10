//
//  RecordView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  录音视图
//
//


#import <UIKit/UIKit.h>

@protocol RecordViewDeletage <NSObject>

-(void)recordViewButtonAction:(ZMButton*)sender;

@end




@interface RecordView : UIView


/**
 时间标签
 */
@property (nonatomic,strong) UILabel *timeLabel;


/**
 “根据屏幕提示，读出屏幕中的短语”
 */
@property (nonatomic,strong) UILabel *tipLabel;


/**
 “星恋闹钟为您播报”
 */
@property (nonatomic,strong) UILabel *tipTitleLabel;



/**
 下面操作按钮承载视图
 */
@property (nonatomic,strong) UIView *toolBarView;


/**
 录音按钮
 */
@property (nonatomic,strong) ZMButton *recordButton;


/**
 播放按钮
 */
@property (nonatomic,strong) ZMButton *playButton;


/**
 完成按钮
 */
@property (nonatomic,strong) ZMButton *doneButton;


@property (nonatomic,assign) id <RecordViewDeletage> recordDeletage;

-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<RecordViewDeletage>)deletage;

@end
