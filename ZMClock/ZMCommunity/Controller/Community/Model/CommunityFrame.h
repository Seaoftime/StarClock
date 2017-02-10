//
//  CommunityFrame.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  社区主页里面控件元素Frame
//
//



#import <Foundation/Foundation.h>
#import "CommunityModel.h"

@interface CommunityFrame : NSObject
@property (nonatomic,strong) CommunityModel *model; //!< 数据模型


@property (nonatomic) CGFloat cellHight;   //!< 行高


//明星图片视图
@property (nonatomic) CGRect startImageFrame; //!< 明星图片视图的Frame
@property (nonatomic) CGRect startImageViewFrame; //!< 明星图片视图的Frame






//行程详情视图
@property (nonatomic) CGRect programinfonnextProgramViewFrame;  //!< 下一个行程标签Frame
@property (nonatomic) CGRect programinfomoreProgramButtonFrame;  //!< 更多行程按钮Frame
@property (nonatomic) CGRect programinfoTitleLabelFrame;  //!< 行程详情标题标签Frame
@property (nonatomic) CGRect programinfoDescribeLabelFrame;  //!< 行程详情内容的标签Frame
@property (nonatomic) CGRect programinfoDateFrame;     //!< 行程详情日期Frame
@property (nonatomic) CGRect programinfoLocationFrame; //!< 行程位置信息
@property (nonatomic) CGRect programinfoTimeFrame;  //!< 行程详情时间Frame
@property (nonatomic) CGRect programinfoViewFrame; //!< 行程详情视图Frame





//资讯内容视图
@property (nonatomic) CGRect commentViewFrame; //!< 整个评论视图Frame






@end
