//
//  LeftHelperView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/16.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  左侧帮助辅助视图
//
//


#import <UIKit/UIKit.h>
#import "ZMButton.h"


@interface LeftHelperView : UIView

@property (nonatomic,strong) ZMButton *topButton; //!< 上面的按钮
@property (nonatomic,strong) ZMButton *middleButton; //!< 中间的按钮
@property (nonatomic,strong) ZMButton *bottomButton; //!< 下面的按钮

-(void)resetLeftHelperFrame:(CGRect)frame;


@end
