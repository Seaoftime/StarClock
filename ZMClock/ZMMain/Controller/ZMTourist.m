//
//  ZMTourist.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTourist.h"

#import "UIColor_Random.h"
#import "ZMClockViewController.h"
#import "ZMWeatherViewController.h"
#import "ZMConstellationViewController.h"
#import "ZMCommunityTabBarController.h"
#import "ZMGameSettingViewController.h"
#import "GameView.h"
#import "GameAlertView.h"
#import "GameItemTypeModel.h"
#import "GameItemsModel.h"
#import "ZMLocationAndWeather.h"
#import "WeatherModel.h"
#import "ZMGuideImageView.h"
#import "TopHeaderView.h"
#import "LeftHelperControl.h"
#import "AVAudioPlayerHelper.h"


#import "ZMLoginViewController.h"
#import "PeopleStandingview.h"



@interface ZMTourist() <GameViewDeletage,TopHeaderViewDeletae,LeftHelperControlDeletage>

@property (nonatomic,strong) ZMWeatherViewController *weatherViewController;

@property (nonatomic,strong) ZMImageView *zmBackgroundImageView;

@property (nonatomic,strong) TopHeaderView *topHeaderView; //!< 头部的天气预报视图
@property (nonatomic,strong) GameAlertView *gameAlertView; //!< 游戏弹出层视图
@property (nonatomic,strong) NSMutableArray *gameItemArray; //!< 数组
@property (nonatomic,strong) ZMButton *arrowsButton; //!< 弹出社区和星座按钮
@property (nonatomic,strong) GameView *gameView;//游戏喂食视图
@property (nonatomic,strong) ZMGuideImageView *guideImageView; //教学页

@property(nonatomic,strong) PeopleStandingview*peopleStandingview;//人物站立



@end



@implementation ZMTourist

@synthesize gameAlertView;

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
                              
                              
                              [[AVAudioPlayerHelper sharedPlayerHelper] setWeatherModel:weatherModel];
                              [self.weatherViewController setWeatherModel:weatherModel withLocationTitle:city];
                              [self.topHeaderView resetModel:weatherModel];
                              
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







#pragma mark - LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [ZMLocationAndWeather sharedInstanceWithViewController:self];
    [self.baseNavigation setHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.zmBackgroundImageView];
    
    [self.view addSubview:self.peopleStandingview];
    
    [self.guideImageView startAddWithSuperView:self.view];
    
    [self.view addSubview:self.gameView];
    [self.view addSubview:self.topHeaderView];
    
    [self.view addSubview:self.arrowsButton];
    
   
    
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




#pragma mark - Getter/Setter Method
-(ZMWeatherViewController *)weatherViewController
{
    if (_weatherViewController == nil)
    {
        _weatherViewController = [[ZMWeatherViewController alloc]init];
    }
    return _weatherViewController;
}

#pragma mark 背景图片
-(ZMImageView*)zmBackgroundImageView
{
    if (_zmBackgroundImageView == nil)
    {
        _zmBackgroundImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        
        [_zmBackgroundImageView setImage:[UIImage imageNamed:@"场景"]];
    }
    return _zmBackgroundImageView;
}



#pragma mark 头部时间、温度、天气预报视图
-(TopHeaderView*)topHeaderView
{
    if (_topHeaderView == nil)
    {
        _topHeaderView = [[TopHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 60) withDeletahe:self];
    }
    return _topHeaderView;
}






#pragma mark 游戏操作界面
-(GameView *)gameView
{
    if (_gameView == nil)
    {
        _gameView = [[GameView alloc]initWithFrame:CGRectMake(0, kScreen_Height-120, kScreen_Width, 120) setDeletage:self];
    }
    return _gameView;
}


-(NSMutableArray*)gameItemArray
{
    if (_gameItemArray == nil)
    {
        _gameItemArray = [NSMutableArray array];
    }
    return _gameItemArray;
}

-(ZMButton*)arrowsButton
{
    if (_arrowsButton == nil)
    {
        
        
        UIImageView *celanimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"漂浮侧面板收缩"]];
        [celanimage setContentStretch:CGRectMake(0.7f,0.9f, 0.7, 0.9f)];
        CGRect frame = celanimage.frame;
        frame.size.width += 100;
        celanimage.frame = frame;

        _arrowsButton = [[ZMButton alloc]initWithFrame:CGRectMake(0, 70,25, 90)];

        //_arrowsButton = [[ZMButton alloc]initWithFrame:CGRectMake(-5, 70, 30, 75)];
        //[_arrowsButton setImage:[UIImage imageNamed:@"飘浮侧栏"] forState:UIControlStateNormal];
        //[_arrowsButton setBackgroundColor:RGBAlpha(255.0, 255.0, 255.0, 0.4)];
        [_arrowsButton.layer setCornerRadius:5];
        [_arrowsButton.layer setMasksToBounds:YES];
        [_arrowsButton addTarget:self action:@selector(arrowsButtonAction:) forControlEvents:UIControlEventTouchUpInside];
         [_arrowsButton addSubview:celanimage];
    }
    return _arrowsButton;
}


-(ZMGuideImageView *)guideImageView
{
    if (_guideImageView == nil)
    {
        _guideImageView = [[ZMGuideImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    }
    return _guideImageView;
}



#pragma mark TopHeaderViewDeletae (闹钟、天气 图标点击代理方法)
-(void)topHeaderViewAction:(TopHeaderControl *)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            [self.navigationController pushViewController:[[ZMClockViewController alloc]init] animated:YES];
        }
            break;
        case 2:
        {
            [self.weatherViewController startGetWeatherWithSuperViewController:self];
            [self.navigationController pushViewController:self.weatherViewController animated:YES];
        }
            break;
    }
}

#pragma mark LeftHelperControlDeletage （左侧弹出框，星座和社区按钮）
-(void)leftHelperAction:(NSInteger)sender
{
    switch (sender)
    {
        case 1:
        {
            [self.navigationController pushViewController:[[ZMConstellationViewController alloc] init] animated:YES];
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[[ZMCommunityTabBarController alloc]init] animated:YES];
           

            
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[ZMGameSettingViewController alloc]init] animated:YES];
        }
            break;
            
        case 30:
        {
            [UIView animateWithDuration:0.15 animations:^{
                
                [self.arrowsButton setFrame:CGRectMake(-30, 70, 30, 75)];
            }];
        }
            break;
        case 40:
        {
            [UIView animateWithDuration:0.15 animations:^{
                
                [self.arrowsButton setFrame:CGRectMake(-5, 70, 30, 75)];
            }];
            
        }
    }
}

#pragma mark - Delegate Method
#pragma mark GameViewDeletage 点击，食物、送花、清洁代理方法 返回登录界面
-(void)gameItemViewAction:(GameItemView *)sender
{
    
    gameAlertView = [[GameAlertView alloc]initWithDeletae:self];
    
    
    
    switch (sender.tag)
    {
#pragma mark case 1
        case 1:
        {
            
            [self.navigationController pushViewController:[[ZMLoginViewController alloc]init] animated:YES];
            
        }
            break;
#pragma mark case 2
        case 2:
        {
            

            
            
             [self.navigationController pushViewController:[[ZMLoginViewController alloc]init] animated:YES];
            
        }
            break;
#pragma mark case 3
        case 3:
        {
           
         [self.navigationController pushViewController:[[ZMLoginViewController alloc]init] animated:YES];
            self.navigationController.toolbarHidden=YES;
        
        }
            break;
    }
    
   
}




#pragma mark  PrivateMethod
#pragma mark 弹出左侧视图
-(void)arrowsButtonAction:(ZMButton*)sender
{
    LeftHelperControl *leftHelperControl = [[LeftHelperControl alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) withDeletae:self];
    [leftHelperControl show];
}


#pragma mark PeopleStandingview 主页屏幕的人物
-(PeopleStandingview *)peopleStandingview
{
    if (_peopleStandingview == nil)
    {
        _peopleStandingview = [[PeopleStandingview alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        
           }
    return _peopleStandingview;
}







@end
