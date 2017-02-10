//
//  ZMProgramInfoViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  行程详情视图控制器
//
//
//



#import "ZMBaseViewController.h"

@interface ZMProgramInfoViewController : ZMBaseViewController

/**
 editType：编辑类型
 0 为不可编辑
 1 为可编辑
 */
@property (nonatomic) NSInteger editType;

/**
 detailId:传递进去一个详情id
 */
-(void)starGetNewAndStoryAndComicInfoWithDetailId:(NSString*)detailId;


@end
