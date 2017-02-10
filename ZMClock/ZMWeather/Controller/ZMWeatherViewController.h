//
//  ZMWeatherViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  天气预报视图控制器
//
//
//

#import "ZMDesignBaseViewController.h"

#import "ZMMoreDesignBaseViewController.h"
#import "WeatherModel.h"

#import "ZMBaseeNavigationViewController.h"

@interface ZMWeatherViewController : ZMDesignBaseViewController



/**
 如果之前已经获取了天气预报信息，
 在这就不用获取了，没有的话，在这就会重新获取
 */
-(void)startGetWeatherWithSuperViewController:(UIViewController *)viewController;


#pragma mark 设置数据
-(void)setWeatherModel:(WeatherModel*)model withLocationTitle:(NSString *)title;


@end
