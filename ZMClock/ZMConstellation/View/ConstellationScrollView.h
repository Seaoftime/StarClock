//
//  ConstellationScrollView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  滚动视图用来展示当前星座信息的内容
//
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "ConstellationPartView.h"

@interface ConstellationScrollView : UIScrollView <iCarouselDelegate,iCarouselDataSource>

@property (nonatomic,strong) iCarousel *icarousel; //!< 旋转木马

@property (nonatomic,strong) ConstellationPartView *middlePartView; // !< 中间的视图
@property (nonatomic,strong) ConstellationPartView *bottomPartView; // !< 下面的视图




-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id)deletage;

/**
 填充数据
 */
-(void)setConstellationModelArray:(NSMutableArray*)modelArray;

@end
