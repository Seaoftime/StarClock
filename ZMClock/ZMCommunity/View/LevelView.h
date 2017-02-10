//
//  LevelView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  评论视图，内部包含一个评论图标和评论数
//
//

#import <UIKit/UIKit.h>

@interface LevelView : UIImageView

/**
 重置frame
 imageName:图片名称
 */
-(void)resetLevelViewFrame:(CGRect)frame withImageName:(NSString *)imageName withLevel:(NSString*)level;

@end
