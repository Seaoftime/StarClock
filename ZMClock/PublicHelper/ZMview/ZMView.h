//
//  ZMView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMButton.h"

@interface ZMView : UIView


@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *leftLabel;
@property (nonatomic,strong) UILabel *rightLabel;

@property (nonatomic,strong) ZMButton *markButton; //!< 标注同意协议按钮
@property (nonatomic,strong) ZMButton *protocolButton; //!<

#pragma mark 在天气中使用
/**
 天气中使用
 */
-(instancetype)initWithWeatherFrame:(CGRect)frame;



#pragma mark 在天气中使用
/**
 天气情况中使用
 */

-(instancetype)initWithWeatherExplainFrame:(CGRect)frame;




/**
 协议中使用
 */
-(instancetype)initWithProtocolFrame:(CGRect)frame;



#pragma mark 我的头衔中使用
@property (nonatomic,strong) UIImageView *startImageView; //!< 星星图片视图
@property (nonatomic,strong) UILabel *levelLanel; //!< 等级标签

//初始化头衔视图
-(instancetype)initHonourWithFrame;


//初始化头衔视图
-(void)resetHonourWithFrame:(CGRect)frame;

@end
