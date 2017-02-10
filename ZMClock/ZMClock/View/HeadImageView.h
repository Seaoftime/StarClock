//
//  HeadImageView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadImageView : UIImageView


/**
 自定义铃声
 */
@property (nonatomic,strong) ZMButton *customTinkleButton;

/**
 系统铃声
 */
@property (nonatomic,strong) ZMButton *systemTinkleButton;


@end
