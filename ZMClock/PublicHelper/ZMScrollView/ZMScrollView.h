//
//  ZMScrollView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZMScrollViewDetegate <NSObject>

@optional

-(void)zmScrollViewButtonAction:(ZMButton*)sender;

@end



@interface ZMScrollView : UIScrollView
/**
 代理对象
 */
@property (nonatomic,assign) id <ZMScrollViewDetegate> scrollViewDeletage;

#pragma 引导页中使用
@property (nonatomic,strong) ZMButton *experienceButton;   //立即体验按钮




#pragma mark  初始化引导页视图控制器
-(instancetype)initWithGuideFrame:(CGRect)frame withImageArray:(NSArray*)imageArray withExperienceTitle:(NSString*)title  withDeletage:(id)deletage;




@end
