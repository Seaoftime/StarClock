//
//  CompositeView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  这个是混合视图，用来显示“综合指数、”财运指数等空间信息
//
//

#import <UIKit/UIKit.h>
#import "CWStarRateView.h"


@interface CompositeView : UIView

@property (nonatomic,strong) UILabel *titleLabel; // <! 标题标签
@property (nonatomic,strong) UILabel *describeLabel; // <! 描述标签
@property (nonatomic,strong) UILabel *ratioLabel; // <! 比率标签
@property (nonatomic,strong) CWStarRateView *starRateView; // !< 星级评分



@end
