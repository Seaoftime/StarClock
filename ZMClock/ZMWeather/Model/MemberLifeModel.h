//
//  MemberLifeModel.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 生活方式数据模型
/**
 成员数据模型，用于存放生活天气预报
 */
@interface MemberLifeModel : NSObject

@property (nonatomic,strong) NSString *date;

#pragma 穿衣 - chuanyi
@property (nonatomic,strong) NSString *chuanyi_title;
@property (nonatomic,strong) NSString *chuanyi_describe;


#pragma 感冒 - ganmao
@property (nonatomic,strong) NSString *ganmao_title;
@property (nonatomic,strong) NSString *ganmao_describe;

#pragma 空调 - kongtiao
@property (nonatomic,strong) NSString *kongtiao_title;
@property (nonatomic,strong) NSString *kongtiao_describe;


#pragma 污染 - wuran
@property (nonatomic,strong) NSString *wuran_title;
@property (nonatomic,strong) NSString *wuran_describe;

#pragma 洗车- xiche
@property (nonatomic,strong) NSString *xiche_title;
@property (nonatomic,strong) NSString *xiche_describe;


#pragma 运动 - yundong
@property (nonatomic,strong) NSString *yundong_title;
@property (nonatomic,strong) NSString *yundong_describe;

#pragma 紫外线 - ziwaixian
@property (nonatomic,strong) NSString *ziwaixian_title;
@property (nonatomic,strong) NSString *ziwaixian_describe;


@end
