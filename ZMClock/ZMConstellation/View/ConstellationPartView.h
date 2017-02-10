//
//  ConstellationPartView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  这个是用来存放星座不同内容视图
//
//
//

#import <UIKit/UIKit.h>
#import "CompositeView.h"
#import "ConstellationModel.h"


typedef NS_ENUM(NSInteger,ConstellationPartType)
{
    middleType = 1,
    bottomType = 2,
};




@interface ConstellationPartView : UIView

#pragma mark 上部分使用控件
@property (nonatomic,strong) UILabel *dateLabel;  //!< 日期标签
@property (nonatomic,strong) UILabel *summaryLabel;  //!< 今日运势内容标签


#pragma mark 下部分使用控件
@property (nonatomic,strong) CompositeView *zongHeZhiShuView; //!< 综合指数
@property (nonatomic,strong) CompositeView *caiYunZhiShuView; //!< 财运指数
@property (nonatomic,strong) CompositeView *gongZuoZhiShuView; //!< 工作指数
@property (nonatomic,strong) CompositeView *aiQingZhiShuView; //!< 爱情指数

-(instancetype)initWithFrame:(CGRect)frame withConstellationPartType:(ConstellationPartType)partType;


-(void)setmodel:(ConstellationModel*)model withConstellationPartType:(ConstellationPartType)partType;

@end
