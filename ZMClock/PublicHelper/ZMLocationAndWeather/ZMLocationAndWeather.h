//
//  ZMLocationAndWeather.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/9.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  定位，地理反编码
//
//
//
//
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIkit/UIKit.h>


@interface ZMLocationAndWeather : NSObject <CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) CLGeocoder *geocoder;


typedef  void (^SucessBlock)(id Object);

typedef  void (^ErrorBlock)(NSError *Error);



#pragma mark 获取当前位置
-(void)getWeather:(SucessBlock)sucessBlock error:(ErrorBlock)errorBlock;




+(ZMLocationAndWeather*)sharedInstanceWithViewController:(UIViewController*)viewController;



@end
