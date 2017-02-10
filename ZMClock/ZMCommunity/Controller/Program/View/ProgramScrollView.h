//
//  ProgramScrollView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreProgramModel.h"


@protocol ProgramScrollViewDeletage <NSObject>

-(void)programScrollViewButtonAction:(ZMButton*)sender;

@end

@interface ProgramScrollView : UIScrollView

@property (nonatomic,strong) id <ProgramScrollViewDeletage> programDeletage; //!< 代理对象



/**
 初始化
 */
-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<ProgramScrollViewDeletage>)deletage;
#pragma mark - 填充数据
/**
 填充数据
 */
-(void)setprogramArray:(NSArray *)programArray;




@end
