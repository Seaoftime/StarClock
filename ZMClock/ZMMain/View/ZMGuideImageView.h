//
//  ZMGuideImageView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/5/11.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMGuideImageView : UIImageView


/**
 superView:父视图
 */
-(instancetype)initWithFrame:(CGRect)frame;

-(void)startAddWithSuperView:(UIView*)superView;



@end
