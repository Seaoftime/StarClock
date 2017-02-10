//
//  TableTipView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/29.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableTipView : UIControl


#pragma mark 项目中表视图数据源空的时候使用的初始化方法
/**
 项目中表视图数据源空的时候使用的初始化方法，主要使用在表视图中
 */
-(instancetype)initWithTaskStudyTableViewEmptyFrame:(CGRect)frame withImageName:(NSString*)imageName withTiptitle:(NSString*)tipTitle;



@end
