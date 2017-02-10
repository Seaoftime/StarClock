//
//  AVAudioPlayerHelper.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "AVAudioPlayerHelper.h"






@interface AVAudioPlayerHelper ()


@property (nonatomic,strong) NSMutableArray *weatherArray; //!< 存放天气语音播报的数组

@end

@implementation AVAudioPlayerHelper


static AVAudioPlayerHelper *sharedObject = nil; //第一步：静态实例，并初始化。


+(AVAudioPlayerHelper*)sharedPlayerHelper
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        
        sharedObject = [[self alloc]init];
    });
    return sharedObject;
}


-(NSMutableArray*)startPlayWeatherRecord:(BOOL)startPlay
{
    self.weatherArray = [NSMutableArray array]; //存放天气播报信息的数组
    if (self.weatherModel)
    {
        [self.weatherArray addObject:@"1"];
#pragma mark 晚上的时间
        //如果当前时间大于18点，小于6点说明已经到了晚上了，就显示晚上的图标
        if ([[[WeatherHelper sharedWeatherHelper] getHourTime]intValue] > 18 || [[[WeatherHelper sharedWeatherHelper] getHourTime] intValue] < 6)
        {
            /**
             因为需求说，如果现在是晚上的时间，不但要播报晚上的天气情况，
             还要播报第二天白天的天气情况，所以在这个地方首先要获取“weatherModel”天气对象中
             weatherArray数组中第0个元素的晚上数据模型，还要获取weatherArray数组第1个元素的白天数据模型，所以跟着这个思路去处理天气预报数据
             */
#pragma mark 开始预报晚上的天气
            [self.weatherModel.weatherArray enumerateObjectsUsingBlock:^(MemberWeatherModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
             {
                 if (idx == 0)
                 {

                     //开始组装今天晚上的天气情况
                     [self.weatherArray addObject:@"3"];
                     
                     //组装天气情况
                     [self weatherIDWithWeather:obj.nightModel.weather];
                     
                     //最高温度
                     [self.weatherArray addObject:@"43"];
                     int nightModelTemperature = [obj.nightModel.temperature intValue];
                     if (nightModelTemperature >= 0)
                     {
                         [self temperatureIDWithTemperature:nightModelTemperature];
                     }
                     else
                     {
                         
                         
                         [self.weatherArray addObject:@"45"];
                         nightModelTemperature = abs(nightModelTemperature);
                         
                         [self temperatureIDWithTemperature:nightModelTemperature];
                     }
                     
                     //风向
                     [self windIDWithwind:obj.nightModel.wind];
                     
                 }
                 else if (idx == 1)
                 {
#pragma mark 开始预报第二天白天的天气
                     //开始组装今天晚上的天气情况
                     [self.weatherArray addObject:@"4"];
                     //组装天气情况
                     [self weatherIDWithWeather:obj.dayModel.weather];
                     
                     //最高温度
                     [self.weatherArray addObject:@"44"];
                     int dayTemperature = [obj.dayModel.temperature intValue];
                     if (dayTemperature >= 0)
                     {
                         [self temperatureIDWithTemperature:dayTemperature];
                     }
                     else
                     {
                         [self.weatherArray addObject:@"45"];
                         dayTemperature = abs(dayTemperature);
                         
                         [self temperatureIDWithTemperature:dayTemperature];
                     }
                     
                     //风向
                     [self windIDWithwind:obj.dayModel.wind];
                     
                     
                     *stop = YES;  //首先停止遍历
                 }
             }];
        }
#pragma mark 白天的时间
        //如果当前时间大于6点，小于18点说明已经到了白天了，就显示白天的图标
        else if ([[[WeatherHelper sharedWeatherHelper] getHourTime]intValue] <= 18 || [[[WeatherHelper sharedWeatherHelper] getHourTime] intValue] >= 6)
        {
#pragma mark 开始预报白天的天气
            [self.weatherArray addObject:@"2"];
            [self.weatherModel.weatherArray enumerateObjectsUsingBlock:^(MemberWeatherModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
            {
                if (idx == 0)
                {
                    //组装天气情况
                    [self weatherIDWithWeather:obj.dayModel.weather];
                    
                    //最高温度
                    [self.weatherArray addObject:@"44"];
                    int dayTemperature = [obj.dayModel.temperature intValue];
                    if (dayTemperature >= 0)
                    {
                        [self temperatureIDWithTemperature:dayTemperature];
                    }
                    else
                    {
                        dayTemperature = abs(dayTemperature);
                        
                        [self temperatureIDWithTemperature:dayTemperature];
                    }
                    
                    //风向
                    [self windIDWithwind:obj.dayModel.wind];
                    
#pragma mark 开始预报晚上的天气
                    //开始组装今天晚上的天气情况
                    [self.weatherArray addObject:@"3"];
                    
                    //组装天气情况
                    [self weatherIDWithWeather:obj.nightModel.weather];
                    
                    //最高温度
                    [self.weatherArray addObject:@"43"];
                    int nightModelTemperature = [obj.nightModel.temperature intValue];
                    if (nightModelTemperature >= 0)
                    {
                        [self temperatureIDWithTemperature:nightModelTemperature];
                    }
                    else
                    {
                        nightModelTemperature = abs(nightModelTemperature);
                        
                        [self temperatureIDWithTemperature:nightModelTemperature];
                    }
                    
                    //风向
                    [self windIDWithwind:obj.nightModel.wind];
                    
                    
                    
                     *stop = YES;  //首先停止遍历
                }
            }];
            
        }
    }
    return self.weatherArray; //然后返回数组
}



#pragma mark 根据天气情况返回天气的语音播报内容录音文件名
/**
 根据天气情况返回天气的语音播报内容录音文件名
 */
-(void)weatherIDWithWeather:(NSString*)weather
{
    if ([weather isEqualToString:@"晴"])
    {
        [self.weatherArray addObject:@"5"];
    }
    else if ([weather isEqualToString:@"多云"])
    {
        [self.weatherArray addObject:@"6"];
    }
    else if ([weather isEqualToString:@"阴"])
    {
        [self.weatherArray addObject:@"7"];
    }
    else if ([weather isEqualToString:@"阵雨"])
    {
        [self.weatherArray addObject:@"8"];
    }
    else if ([weather isEqualToString:@"雷阵雨"])
    {
        [self.weatherArray addObject:@"9"];
    }
    else if ([weather isEqualToString:@"雷阵雨伴有冰雹"])
    {
        [self.weatherArray addObject:@"10"];
    }
    else if ([weather isEqualToString:@"雨夹雪"])
    {
        [self.weatherArray addObject:@"11"];
    }
    else if ([weather isEqualToString:@"小雨"])
    {
        [self.weatherArray addObject:@"12"];
    }
    else if ([weather isEqualToString:@"中雨"])
    {
        [self.weatherArray addObject:@"13"];
    }
    else if ([weather isEqualToString:@"大雨"])
    {
        [self.weatherArray addObject:@"14"];
    }
    else if ([weather isEqualToString:@"暴雨"])
    {
        [self.weatherArray addObject:@"15"];
    }
    else if ([weather isEqualToString:@"大暴雨"])
    {
        [self.weatherArray addObject:@"16"];
    }
    else if ([weather isEqualToString:@"特大暴雨"])
    {
        [self.weatherArray addObject:@"17"];
    }
    else if ([weather isEqualToString:@"阵雪"])
    {
        [self.weatherArray addObject:@"18"];
    }
    else if ([weather isEqualToString:@"小雪"])
    {
        [self.weatherArray addObject:@"19"];
    }
    else if ([weather isEqualToString:@"中雪"])
    {
        [self.weatherArray addObject:@"20"];
    }
    else if ([weather isEqualToString:@"大雪"])
    {
        [self.weatherArray addObject:@"21"];
    }
    else if ([weather isEqualToString:@"暴雪"])
    {
        [self.weatherArray addObject:@"22"];
    }
    else if ([weather isEqualToString:@"雾"])
    {
        [self.weatherArray addObject:@"23"];
    }
    else if ([weather isEqualToString:@"冻雨"])
    {
        [self.weatherArray addObject:@"24"];
    }
    else if ([weather isEqualToString:@"沙尘暴"])
    {
        [self.weatherArray addObject:@"25"];
    }
    else if ([weather isEqualToString:@"浮尘"])
    {
        [self.weatherArray addObject:@"26"];
    }
    else if ([weather isEqualToString:@"扬沙"])
    {
        [self.weatherArray addObject:@"27"];
    }
    else if ([weather isEqualToString:@"强沙尘暴"])
    {
        [self.weatherArray addObject:@"28"];
    }
    else if ([weather isEqualToString:@"霾"])
    {
        [self.weatherArray addObject:@"29"];
    }
}

#pragma mark 根据风向获取对象的录音文件
-(void)windIDWithwind:(NSString*)wind
{
    
    if ([wind isEqualToString:@"北风"])
    {
        [self.weatherArray addObject:@"47"];
    }
    else if ([wind isEqualToString:@"南风"])
    {
        [self.weatherArray addObject:@"48"];
    }
    else if ([wind isEqualToString:@"东风"])
    {
        [self.weatherArray addObject:@"49"];
    }
    else if ([wind isEqualToString:@"西风"])
    {
        [self.weatherArray addObject:@"50"];
    }
    else if ([wind isEqualToString:@"西南风"])
    {
        [self.weatherArray addObject:@"51"];
    }
    else if ([wind isEqualToString:@"西北风"])
    {
        [self.weatherArray addObject:@"52"];
    }
    else if ([wind isEqualToString:@"东南风"])
    {
        [self.weatherArray addObject:@"53"];
    }
    else if ([wind isEqualToString:@"东北风"])
    {
        [self.weatherArray addObject:@"54"];
    }
    else if ([wind isEqualToString:@"微风"])
    {
        [self.weatherArray addObject:@"55"];
    }
}


#pragma mark 根据温度情况填充温度对应的情况
-(void)temperatureIDWithTemperature:(int)temperature
{
#pragma mark 温度开始操作操作 开始
    switch (temperature)
    {
        case 0:
        {
            [self.weatherArray addObject:@"31"];  
        }
            break;
        case 1:
        {
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 2:
        {
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 3:
        {
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 4:
        {
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 5:
        {
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 6:
        {
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 7:
        {
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 8:
        {
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 9:
        {
            [self.weatherArray addObject:@"40"];
        }
            break;
        case 10:
        {
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 11:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 12:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 13:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 14:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 15:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 16:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 17:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 18:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 19:
        {
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"40"];
        }
            break;
        case 20:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 21:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 22:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 23:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 24:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 25:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 26:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 27:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 28:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 29:
        {
            [self.weatherArray addObject:@"33"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"140"];
        }
            break;
        case 30:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 31:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 32:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 33:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 34:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 35:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 36:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 37:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 38:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 39:
        {
            [self.weatherArray addObject:@"34"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"40"];
        }
            break;
        case 40:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 41:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 42:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 43:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 44:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 45:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 46:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 47:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 48:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 49:
        {
            [self.weatherArray addObject:@"35"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"40"];
        }
            break;
        case 50:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 51:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 52:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 53:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 54:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 55:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 56:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 57:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 58:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 59:
        {
            [self.weatherArray addObject:@"36"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"40"];
        }
            break;
        case 60:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 61:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 62:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 63:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 64:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 65:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 66:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 67:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 68:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 69:
        {
            [self.weatherArray addObject:@"37"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"40"];
        }
            break;
        case 70:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 71:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 72:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 73:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 74:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 75:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 76:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 77:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 78:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 79:
        {
            [self.weatherArray addObject:@"38"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"40"];
        }
            break;
        case 80:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 81:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 82:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 83:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 84:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 85:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 86:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 87:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 88:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 89:
        {
            [self.weatherArray addObject:@"39"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"40"];
        }
            break;
        case 90:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
        }
            break;
        case 91:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"32"];
        }
            break;
        case 92:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"33"];
        }
            break;
        case 93:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"34"];
        }
            break;
        case 94:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"35"];
        }
            break;
        case 95:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"36"];
        }
            break;
        case 96:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"37"];
        }
            break;
        case 97:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"38"];
        }
            break;
        case 98:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"39"];
        }
            break;
        case 99:
        {
            [self.weatherArray addObject:@"40"];
            [self.weatherArray addObject:@"41"];
            [self.weatherArray addObject:@"40"];
        }
            break;
    }
    
    [self.weatherArray addObject:@"42"];
#pragma mark 温度开始操作操作 结束
}




























-(NSMutableArray*)startPlayClockRecord:(BOOL)startPlay
{
    NSString *hour = [[ZMHelper sharedHelp] localdTime_Hour];
    NSString *minute = [[ZMHelper sharedHelp] localdTime_Minute];
    int hour_Number = [hour intValue];
    int minute_Number = [minute intValue];
    NSMutableArray *hourAndminuteArray = [NSMutableArray array];
    
    [hourAndminuteArray addObject:@"1"]; //星恋闹钟为您报时，现在是北京时间
    //直接使用case 判断时间，虽然有点累，因为逻辑问题，就这样写吧
#pragma mark 小时时操作 开始
    switch (hour_Number)
    {
        case 0:
        {
            [hourAndminuteArray addObject:@"12"]; 
        }
            break;
        case 1:
        {
            [hourAndminuteArray addObject:@"2"]; 
        }
            break;
        case 2:
        {
            [hourAndminuteArray addObject:@"13"]; //两
        }
            break;
        case 3:
        {
            [hourAndminuteArray addObject:@"4"]; 
        }
            break;
        case 4:
        {
            [hourAndminuteArray addObject:@"5"]; 
        }
            break;
        case 5:
        {
            [hourAndminuteArray addObject:@"6"]; 
        }
            break;
        case 6:
        {
            [hourAndminuteArray addObject:@"7"]; 
        }
            break;
        case 7:
        {
            [hourAndminuteArray addObject:@"8"]; 
        }
            break;
        case 8:
        {
            [hourAndminuteArray addObject:@"9"]; 
        }
            break;
        case 9:
        {
            [hourAndminuteArray addObject:@"10"]; 
        }
            break;
        case 10:
        {
            [hourAndminuteArray addObject:@"11"]; 
        }
            break;
        case 11:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"2"]; 
        }
            break;
        case 12:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"3"]; 
        }
            break;
        case 13:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"4"]; 
        }
            break;
        case 14:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"5"]; 
        }
            break;
        case 15:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"6"]; 
        }
            break;
        case 16:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"7"]; 
        }
            break;
        case 17:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"8"]; 
        }
            break;
        case 18:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"9"]; 
        }
            break;
        case 19:
        {
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"10"]; 
        }
            break;
        case 20:
        {
            [hourAndminuteArray addObject:@"3"]; 
            [hourAndminuteArray addObject:@"11"]; 
        }
            break;
        case 21:
        {
            [hourAndminuteArray addObject:@"3"]; 
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"2"]; 
        }
            break;
        case 22:
        {
            [hourAndminuteArray addObject:@"3"]; 
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"3"]; 
        }
            break;
        case 23:
        {
            [hourAndminuteArray addObject:@"3"]; 
            [hourAndminuteArray addObject:@"11"]; 
            [hourAndminuteArray addObject:@"3"]; 
        }
            break;
    }
#pragma mark 小时操作 结束
    
    [hourAndminuteArray addObject:@"14"];  //点
    
    
    
#pragma mark 分钟操作 开始
    switch (minute_Number)
    {
        case 0:
        {
            [hourAndminuteArray addObject:@"12"];  
        }
            break;
        case 1:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"2"];  
        }
            break;
        case 2:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"3"];  
        }
            break;
        case 3:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"4"];  
        }
            break;
        case 4:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"5"];  
        }
            break;
        case 5:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"6"];  
        }
            break;
        case 6:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"7"];  
        }
            break;
        case 7:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"8"];  
        }
            break;
        case 8:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"9"];  
        }
            break;
        case 9:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"10"];  
        }
            break;
        case 10:
        {
            [hourAndminuteArray addObject:@"12"];  
            [hourAndminuteArray addObject:@"11"];  
        }
            break;
        case 11:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"2"];  
        }
            break;
        case 12:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"3"];  
        }
            break;
        case 13:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"4"];  
        }
            break;
        case 14:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"5"];  
        }
            break;
        case 15:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"6"];  
        }
            break;
        case 16:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"7"];  
        }
            break;
        case 17:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"8"];  
        }
            break;
        case 18:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"9"];  
        }
            break;
        case 19:
        {
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"10"];  
        }
            break;
        case 20:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
        }
            break;
        case 21:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"2"];  
        }
            break;
        case 22:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"3"];  
        }
            break;
        case 23:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"4"];  
        }
            break;
        case 24:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"5"];  
        }
            break;
        case 25:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"6"];  
        }
            break;
        case 26:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"7"];  
        }
            break;
        case 27:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"8"];  
        }
            break;
        case 28:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"9"];  
        }
            break;
        case 29:
        {
            [hourAndminuteArray addObject:@"3"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"10"];  
        }
            break;
        case 30:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
        }
            break;
        case 31:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"2"];  
        }
            break;
        case 32:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"3"];  
        }
            break;
        case 33:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"4"];  
        }
            break;
        case 34:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"5"];  
        }
            break;
        case 35:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"6"];  
        }
            break;
        case 36:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"7"];  
        }
            break;
        case 37:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"8"];  
        }
            break;
        case 38:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"9"];  
        }
            break;
        case 39:
        {
            [hourAndminuteArray addObject:@"4"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"10"];  
        }
            break;
        case 40:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
        }
            break;
        case 41:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"2"];  
        }
            break;
        case 42:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"3"];  
        }
            break;
        case 43:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"4"];  
        }
            break;
        case 44:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"5"];  
        }
            break;
        case 45:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"6"];  
        }
            break;
        case 46:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"7"];  
        }
            break;
        case 47:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"8"];  
        }
            break;
        case 48:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"9"];  
        }
            break;
        case 49:
        {
            [hourAndminuteArray addObject:@"5"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"10"];  
        }
            break;
        case 50:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
        }
            break;
        case 51:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"2"];  
        }
            break;
        case 52:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"3"];  
        }
            break;
        case 53:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"4"];  
        }
            break;
        case 54:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"5"];  
        }
            break;
        case 55:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"6"];  
        }
            break;
        case 56:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"7"];  
        }
            break;
        case 57:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"8"];  
        }
            break;
        case 58:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"9"];  
        }
            break;
        case 59:
        {
            [hourAndminuteArray addObject:@"6"];  
            [hourAndminuteArray addObject:@"11"];  
            [hourAndminuteArray addObject:@"10"];  
        }
            break;
    }
#pragma mark 分钟操作 结束
    [hourAndminuteArray addObject:@"15"];  //分
    
    
    
    return hourAndminuteArray;
}

@end
