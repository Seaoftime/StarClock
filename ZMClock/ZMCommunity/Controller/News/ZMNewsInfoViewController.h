//
//  ZMNewsInfoViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//
//  资讯详情视图控制器
//
//  其实（小说、漫画、资讯）这三个控制器处理数据逻辑一样，
//  为了方便开发，不同控制器里面处理不同的逻辑处理，减小耦合，降低牵连，代码清晰
//
//


#import "ZMBaseViewController.h"

@interface ZMNewsInfoViewController : ZMBaseViewController

/**
 editType：编辑类型
 0 为不可编辑（没有发布评论的输入框，即为不能编辑）
 1 为可编辑 （有发布评论的输入框，即为能编辑）
 */
@property (nonatomic) NSInteger editType;

/**
 detailId:传递进去一个详情id
 */
-(void)starGetNewAndStoryAndComicInfoWithDetailId:(NSString*)detailId;
@end
