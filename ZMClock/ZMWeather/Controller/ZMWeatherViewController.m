//
//  ZMWeatherViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMWeatherViewController.h"
#import "ZMDIYWeatherViewController.h"
#import "WeatherScrollView.h"
#import "WeatherHelper.h"
#import "ZMLocationAndWeather.h"
#import "ZMMainViewController.h"

@interface ZMWeatherViewController ()

@property (nonatomic,strong) WeatherScrollView *weatherScrollView;
@property (nonatomic,strong) UIImageView *backGraoundImageView;
@property (nonatomic,strong) ZMMainViewController *mainViewController;//!< 主视图控制器
@property (nonatomic) BOOL isGetWeather; //!< 是否已经获取天气预报情况


@end

@implementation ZMWeatherViewController



#pragma mark  DataRequest Method





#pragma mark  LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
 // DIY播放图片
   
    [self setNavLeftBtnImage:@"返回按键"];
    
    
    [self setNavRightBtnImage:@""];
    
//    [self setNavRightBtnImage:@"播放DIY"];
    
  // [self setNavRightBtnImage:@"录音DIY"];
   
    
    
    [self.view addSubview:self.backGraoundImageView];
    [self.view addSubview:self.weatherScrollView];
    
    
    
    //[self getWeather:YES];
    
}



-(void)startGetWeatherWithSuperViewController:(ZMMainViewController *)viewController
{
    if (self.isGetWeather == NO)
    {
        [viewController getWeather:YES];
    }
}



-(void)setWeatherModel:(WeatherModel*)model withLocationTitle:(NSString *)title
{
    if (model)
    {
        [self setIsGetWeather:YES];
        [self setLoationTitle:title == nil ? @"--" : title];
        [self.weatherScrollView setweatherModel:model];
    }
   
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark  Getter/Setter Method
-(WeatherScrollView *)weatherScrollView
{
    if (_weatherScrollView == nil)
    {
        _weatherScrollView = [[WeatherScrollView alloc]initWithFrame:CGRectMake(0, 70, kScreen_Width, kScreen_Height-70) wtthDeletage:self];
    }
    return _weatherScrollView;
}


-(UIImageView *)backGraoundImageView
{
    if (_backGraoundImageView == nil)
    {
        _backGraoundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        [_backGraoundImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_backGraoundImageView setImage:[UIImage imageNamed:@"天气预报主背景图片.png"]];
    }
    return _backGraoundImageView;
}






-(void)getWeather:(BOOL)weather
{
    if (weather)
    {
        [[ZMLocationAndWeather sharedInstanceWithViewController:self] getWeather:^(id Object)
         {
             NSString *area = [Object objectForKey:@"省份"];
             NSString *city = [Object objectForKey:@"城市"];
             NSString *subLocality  = [Object objectForKey:@"区域"];
             NSString *ISOcountryCode = [Object objectForKey:@"国家编码"];
             if ([ISOcountryCode isEqualToString:@"CN"])
             {
                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"当前位置为中国-%@",city] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime5];
             }
             else
             {
                 [AnyObjectActivityView showWithTitle:@"不在中国境内，默认郑州天气" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime5];
             }
             
             NSString *weatherUrl = [NSString stringWithFormat:@"weather/weather_info_by_name.php?province=%@&city=%@&district=%@",area,city,subLocality];
             
             [[[AFNetworkingHelper alloc]init] getWithUrl:weatherUrl sucess:^(id object)
              {
                  if (object)
                  {
                      
                      if ([[object objectForKey:@"error_code"] intValue] == 0)
                      {
                          NSDictionary *result = [object objectForKey:@"result"];
                          NSDictionary *data = [result objectForKey:@"data"];
                          if (data)
                          {
                              WeatherModel *weatherModel = [[WeatherModel alloc]init];
                              
#pragma mark - 解析lift中的数据内容
                              
                              NSDictionary *life = [data objectForKey:@"life"];
                              NSString *date = [life objectForKey:@"date"];
                              NSDictionary *info = [life objectForKey:@"info"];
                              [weatherModel.lifeModel setDate:date];
                              
                              //解析穿衣指数
                              NSArray *chuanyi = [info objectForKey:@"chuanyi"];
                              if ([chuanyi count]>=2)
                              {
                                  [weatherModel.lifeModel setChuanyi_title:chuanyi[0]];
                                  [weatherModel.lifeModel setChuanyi_describe:chuanyi[1]];
                              }
                              //解析感冒
                              NSArray *ganmao = [info objectForKey:@"ganmao"];
                              if ([chuanyi count]>=2)
                              {
                                  [weatherModel.lifeModel setGanmao_title:ganmao[0]];
                                  [weatherModel.lifeModel setGanmao_describe:ganmao[1]];
                              }
                              
                              //解析空调指数
                              NSArray *kongtiao = [info objectForKey:@"kongtiao"];
                              if ([chuanyi count]>=2)
                              {
                                  [weatherModel.lifeModel setKongtiao_title:kongtiao[0]];
                                  [weatherModel.lifeModel setKongtiao_describe:kongtiao[1]];
                              }
                              
                              
                              //解析污染指数
                              NSArray *wuran = [info objectForKey:@"wuran"];
                              if ([chuanyi count]>=2)
                              {
                                  [weatherModel.lifeModel setWuran_title:wuran[0]];
                                  [weatherModel.lifeModel setWuran_describe:wuran[1]];
                              }
                              
                              //解析洗车指数
                              NSArray *xiche = [info objectForKey:@"xiche"];
                              if ([chuanyi count]>=2)
                              {
                                  [weatherModel.lifeModel setXiche_title:xiche[0]];
                                  [weatherModel.lifeModel setXiche_describe:xiche[1]];
                              }
                              
                              //解析运动指数
                              NSArray *yundong = [info objectForKey:@"yundong"];
                              if ([chuanyi count]>=2)
                              {
                                  [weatherModel.lifeModel setYundong_title:yundong[0]];
                                  [weatherModel.lifeModel setYundong_describe:yundong[1]];
                              }
                              
                              //解析运动指数
                              NSArray *ziwaixian = [info objectForKey:@"ziwaixian"];
                              if ([chuanyi count]>=2)
                              {
                                  [weatherModel.lifeModel setZiwaixian_title:ziwaixian[0]];
                                  [weatherModel.lifeModel setZiwaixian_describe:ziwaixian[1]];
                              }
                              
                              
#pragma mark - 解析 realtime 实时天气数据
                              NSDictionary *realtimeDictionary = [data objectForKey:@"realtime"];
                              NSString *city_code = [realtimeDictionary objectForKey:@"city_code"];
                              NSString *city_name = [realtimeDictionary objectForKey:@"city_name"];
                              NSString *realtimedate = [realtimeDictionary objectForKey:@"date"];
                              NSString *realtimetime = [realtimeDictionary objectForKey:@"time"];
                              NSString *realtimeweek = [realtimeDictionary objectForKey:@"week"];
                              NSString *moon = [realtimeDictionary objectForKey:@"moon"];
                              NSString *dataUptime = [realtimeDictionary objectForKey:@"dataUptime"];
                              
                              //解析实时天气情况
                              NSDictionary *weather = [realtimeDictionary objectForKey:@"weather"];
                              NSString *temperature = [weather objectForKey:@"temperature"];
                              NSString *humidity = [weather objectForKey:@"humidity"];
                              NSString *weatherinfo = [weather objectForKey:@"info"];
                              NSString *weatherimg = [weather objectForKey:@"img"];
                              
                              
                              //解析实时风力情况
                              NSDictionary *wind = [realtimeDictionary objectForKey:@"wind"];
                              NSString *winddirect = [wind objectForKey:@"direct"];
                              NSString *windpower = [wind objectForKey:@"power"];
                              NSString *windoffset = [wind objectForKey:@"offset"];
                              NSString *windwindspeed = [wind objectForKey:@"windspeed"];
                              
                              [weatherModel.realtimeModel setCity_code:city_code];
                              [weatherModel.realtimeModel setCity_name:city_name];
                              [weatherModel.realtimeModel setDate:realtimedate];
                              [weatherModel.realtimeModel setTime:realtimetime];
                              [weatherModel.realtimeModel setWeek:realtimeweek];
                              [weatherModel.realtimeModel setMoon:moon];
                              [weatherModel.realtimeModel setDataUptime:dataUptime];
                              [weatherModel.realtimeModel setWeather_temperature:temperature];
                              [weatherModel.realtimeModel setWeather_humidity:humidity];
                              [weatherModel.realtimeModel setWeather_info:weatherinfo];
                              [weatherModel.realtimeModel setWeather_img:weatherimg];
                              [weatherModel.realtimeModel setWind_direct:winddirect];
                              [weatherModel.realtimeModel setWind_power:windpower];
                              [weatherModel.realtimeModel setWind_offset:windoffset];
                              [weatherModel.realtimeModel setWind_windspeed:windwindspeed];
                              
#pragma mark - 解析 weather 未来七天的天气预报
                              NSArray *weatherArray = [data objectForKey:@"weather"];
                              for (int i = 0; i < [weatherArray count]; i++)
                              {
                                  MemberWeatherModel *model = [[MemberWeatherModel alloc]init];
                                  
                                  NSDictionary *item = weatherArray[i];
                                  NSString *date = [item objectForKey:@"date"];
                                  NSString *week = [item objectForKey:@"week"];
                                  NSString *nongli = [item objectForKey:@"nongli"];
                                  NSDictionary *info = [item objectForKey:@"info"];
                                  [model setNongli:nongli];
                                  [model setWeek:week];
                                  [model setDate:date];
                                  
                                  
                                  NSArray *dayArray = [info objectForKey:@"day"];
                                  if ([dayArray count]>=4)
                                  {
                                      NSString *weatherId = dayArray[0];
                                      NSString *weather = dayArray[1];
                                      NSString *temperature = dayArray[2];
                                      NSString *wind = dayArray[3];
                                      NSString *windPower = dayArray[4];
                                      [model.dayModel setWeatherId:weatherId];
                                      [model.dayModel setWeather:weather];
                                      [model.dayModel setTemperature:temperature];
                                      [model.dayModel setWind:wind];
                                      [model.dayModel setWindPower:windPower];
                                  }
                                  
                                  NSArray *nightArray = [info objectForKey:@"night"];
                                  if ([nightArray count]>=4)
                                  {
                                      NSString *weatherId = nightArray[0];
                                      NSString *weather = nightArray[1];
                                      NSString *temperature = nightArray[2];
                                      NSString *wind = nightArray[3];
                                      NSString *windPower = nightArray[4];
                                      [model.nightModel setWeatherId:weatherId];
                                      [model.nightModel setWeather:weather];
                                      [model.nightModel setTemperature:temperature];
                                      [model.nightModel setWind:wind];
                                      [model.nightModel setWindPower:windPower];
                                  }
                                  [weatherModel.weatherArray addObject:model];
                              }
                              
                              
#pragma mark - 解析 pm2.5 实时天气数据
                              NSDictionary *pm25Dictionary = [data objectForKey:@"pm25"];
                              if (pm25Dictionary)
                              {
                                  NSDictionary *pm25item = [pm25Dictionary objectForKey:@"pm25"];
                                  NSString *curPm = [pm25item objectForKey:@"curPm"];
                                  NSString *pm25 = [pm25item objectForKey:@"pm25"];
                                  NSString *pm10 = [pm25item objectForKey:@"pm10"];
                                  NSString *level = [pm25item objectForKey:@"level"];
                                  NSString *quality = [pm25item objectForKey:@"quality"];
                                  NSString *des = [pm25item objectForKey:@"des"];
                                  [weatherModel.pm25Model setCurPm:curPm];
                                  [weatherModel.pm25Model setPm25:pm25];
                                  [weatherModel.pm25Model setPm10:pm10];
                                  [weatherModel.pm25Model setLevel:level];
                                  [weatherModel.pm25Model setQuality:quality];
                                  [weatherModel.pm25Model setDes:des];
                              }
                              
                              
                              
                              
                          }
                      }
                  }
                  
              } error:^(NSError *error) {}];
             
         } error:^(NSError *Error)
         {
             [AnyObjectActivityView showWithTitle:@"定位失败，您可以重新启动程序，重新定位" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime5];
         }];
    }
}


















-(void)navLeftBtnAction:(UIButton *)sender
{
    
    //[self.navigationController pushViewController:[[ZMMainViewController alloc] init] animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            //增加src_type判断社区签到
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign,@"province":@" 河南省",@"city":@"郑州市",@"district":@"管城区" };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"weather/weather_info_by_name.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     
                 
                 {
                   
                     NSDictionary*task=[object objectForKey:@"task"];
                         if ([task isEqual:@""])
                             
                         {
                             
                         }
                         
                         else
                         {
                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                             if (task_id==6)
                             {
                                 
                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                             }
                    }
                 }
             }
            error:^(NSError *error) {}];
        }
    }
    else
    {
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    

}


#pragma mark  - Delegate Method
#pragma mark  - Response Method 右侧按钮触碰方法
-(void)navRightBtnAction:(UIButton *)sender
{
    
    
    //[self.navigationController pushViewController:[[ZMDIYWeatherViewController alloc] init] animated:YES];
}


#pragma mark  - Private Method
@end
