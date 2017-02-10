//
//  ZMLocationAndWeather.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/9.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMLocationAndWeather.h"
#import "ZMMainViewController.h"


@interface ZMLocationAndWeather ()

@property (nonatomic) CLLocation *location;  // !< 保存当前位置经纬度
@property (nonatomic,strong) ZMMainViewController *objectViewController; //!<视图控制器对象

@end



@implementation ZMLocationAndWeather 

static ZMLocationAndWeather *sharedLocationAndWeather = nil; //第一步：静态实例，并初始化。

+(ZMLocationAndWeather*)sharedInstanceWithViewController:(ZMMainViewController*)viewController
{
    static dispatch_once_t once;
    
    dispatch_once(&once,^{
        
        sharedLocationAndWeather = [[self alloc]init];
        [sharedLocationAndWeather setObjectViewController:viewController];
        
    });
    
    [sharedLocationAndWeather locationManager];
    
    return sharedLocationAndWeather;
}




#pragma mark - Getter / Setter geocoder
-(CLGeocoder*)geocoder
{
    if (_geocoder == nil)
    {
        _geocoder=[[CLGeocoder alloc]init];
    }
    return _geocoder;
}






#pragma mark - Private Method
#pragma mark 获取当前位置
-(void)getWeather:(SucessBlock)sucessBlock error:(ErrorBlock)errorBlock
{
    [self getAddressWithLocation:self.location withWeatheSucessBlock:^(id Object)
    {
        sucessBlock(Object);
        
    } withErrorBlock:^(NSError *Error)
    {
        errorBlock(Error);
        
        /**
        NSDictionary *d = @{@"省份":@"河南省",
                            @"城市":@"郑州市",
                            @"区域""":@"郑州市",
                            @"国家编码":@"CN"};
        sucessBlock(d);
         */
    }];
}



#pragma mark 开始定位功能
-(CLLocationManager *)locationManager
{
    if (_locationManager == nil)
    {
        _locationManager = [[CLLocationManager alloc]init];
        
        /**
         判断手机定位服务是否可用
         */
        if ([CLLocationManager locationServicesEnabled])
        {
            NSLog(@"定位服务当前已打开，可以使用");
        }
        else
        {
            UIAlertController *actionAlert = [UIAlertController alertControllerWithTitle:@"定位服务提醒" message:@"您关闭了手机的定位服务，请开启定位服务" preferredStyle:UIAlertControllerStyleAlert];
            
            [actionAlert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){}]];
            
            [actionAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
            {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]];
            }]];
            
            [self.objectViewController presentViewController:actionAlert animated:YES completion:^{}];
        }
        
        
        /**
         判断用户是否给该应用开启定位服务授权
         如果没有授权则请求用户授权
         */
        switch ([CLLocationManager authorizationStatus])
        {
            case kCLAuthorizationStatusNotDetermined:
            {
                 [_locationManager requestWhenInUseAuthorization];
            }
                break;
            case kCLAuthorizationStatusRestricted:
            {
                
            }
                break;
            case kCLAuthorizationStatusDenied:
            {
                UIAlertController *actionAlert = [UIAlertController alertControllerWithTitle:@"定位权限提醒" message:@"定位权限受限，请检查定位是否开启，设置->星伴->位置->使用期间" preferredStyle:UIAlertControllerStyleAlert];
                [actionAlert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){}]];
                
                [actionAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Reset"]];
                }]];
                
                [self.objectViewController presentViewController:actionAlert animated:YES completion:^{}];
            }
                break;
            case kCLAuthorizationStatusAuthorizedAlways:
            {
                
            }
                break;
            case kCLAuthorizationStatusAuthorizedWhenInUse:
            {
                //设置代理
                _locationManager.delegate=self;
                //设置定位精度
                _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
                /***
                 //定位频率,每隔多少米定位一次
                 CLLocationDistance distance=10000.0;//十米定位一次
                 _locationManager.distanceFilter=distance;
                 */
                //启动跟踪定位
                [_locationManager startUpdatingLocation];
            }
                break;
        }
    }
    return _locationManager;
}






#pragma mark 根据地名确定地理坐标
-(void)getCoordinateByAddress:(NSString *)address
{
    //地理编码
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error)
     {
         /**
         //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
         CLPlacemark *placemark=[placemarks firstObject];
         CLLocation *location=placemark.location;//位置
         CLRegion *region=placemark.region;//区域
         NSDictionary *addressDic= placemark.addressDictionary;//详细地址信息字典,包含以下部分信息
         NSString *name=placemark.name;//地名
         NSString *thoroughfare=placemark.thoroughfare;//街道
         NSString *subThoroughfare=placemark.subThoroughfare; //街道相关信息，例如门牌等
         NSString *locality=placemark.locality; // 城市
         NSString *subLocality=placemark.subLocality; // 城市相关信息 区域，例如标志性建筑
         NSString *administrativeArea=placemark.administrativeArea; // 州
         NSString *subAdministrativeArea=placemark.subAdministrativeArea; //其他行政区域信息
         NSString *postalCode=placemark.postalCode; //邮编
         NSString *ISOcountryCode=placemark.ISOcountryCode; //国家编码
         NSString *country=placemark.country; //国家
         NSString *inlandWater=placemark.inlandWater; //水源、湖泊
         NSString *ocean=placemark.ocean; // 海洋
         NSArray *areasOfInterest=placemark.areasOfInterest; //关联的或利益相关的地标
         */
     }];
}

#pragma mark 根据坐标取得地名
-(void)getAddressWithLocation:(CLLocation*)location withWeatheSucessBlock:(SucessBlock)sucessBlock withErrorBlock:(ErrorBlock)errorBlock
{
    //反地理编  码
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (error)
         {
             errorBlock(error);
         }
         else if (placemarks)
         {
             //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
             CLPlacemark *placemark=[placemarks firstObject];
             NSString *locality=placemark.locality; // 城市（郑州市）
             NSString *subLocality=placemark.subLocality; // 城市相关信息（管城回族区），例如标志性建筑
             NSString *administrativeArea=placemark.administrativeArea; // 州（河南省）
             NSString *ISOcountryCode=placemark.ISOcountryCode; //国家编码 （CN）
             NSString *country=placemark.country; //国家 （中国）
             if ([ISOcountryCode isEqualToString:@"CN"])
             {
                 NSDictionary *locatonDictionary = @{@"城市":locality == nil ? @"郑州" :locality,
                                                     @"区域":subLocality == nil ? @"郑州" :subLocality,
                                                     @"省份":administrativeArea == nil ? @"河南省" :administrativeArea,
                                                     @"国家编码":ISOcountryCode == nil ? @"CN" :ISOcountryCode,
                                                     @"国家名称":country == nil ? @"中国" :country};
                 
                 
                 sucessBlock(locatonDictionary);
             }
             else
             {
                 /**
                  区域范围不在中国境内
                  */
                 NSDictionary *locatonDictionary = @{@"城市":@"郑州",
                                                     @"区域":@"郑州",
                                                     @"省份":@"河南省",
                                                     @"国家编码":@"CN",
                                                     @"国家名称":@"中国"};
                 
                 
                 sucessBlock(locatonDictionary);
             }
             
           
             
             /**
              以下内容现在使用不到：暂时注释掉
              CLLocation *location=placemark.location;//位置
              CLRegion *region=placemark.region;//区域
              NSDictionary *addressDic= placemark.addressDictionary;//详细地址信息字典,包含以下部分信息
              NSString *name=placemark.name;  //详细的地理名称地名（美林河畔）
              NSString *thoroughfare = placemark.thoroughfare;//街道 （航海东路1058号4楼）
              NSString *subThoroughfare=placemark.subThoroughfare; //街道相关信息，例如门牌等
              NSString *subAdministrativeArea=placemark.subAdministrativeArea; //其他行政区域信息
              NSString *postalCode=placemark.postalCode; //邮编
              NSString *inlandWater=placemark.inlandWater; //水源、湖泊
              NSString *ocean=placemark.ocean; // 海洋
              NSArray *areasOfInterest=placemark.areasOfInterest; //关联的或利益相关的地标
              
              */

         }
         else
         {
             errorBlock(error);
         }
     }];
}








#pragma mark - CLLocationManagerDelegate（定位代理方法）
#pragma mark  CoreLocation 代理
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
//可以通过模拟器设置一个虚拟位置，否则在模拟器中无法调用此方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //如果不需要实时定位，使用完即使关闭定位服务
    [manager stopUpdatingLocation];
    
    CLLocation *location=[locations firstObject];//取出第一个位置
    [self setLocation:location];
    [self.objectViewController getWeather:YES];
    
    
    
    CLLocationCoordinate2D coordinate=location.coordinate;//位置坐标
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
}


// 地理位置发生改变时触发
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // 获取经纬度
    NSLog(@"纬度:%f",newLocation.coordinate.latitude);
    NSLog(@"经度:%f",newLocation.coordinate.longitude);
    // 停止位置更新
    [manager stopUpdatingLocation];
}

// 定位失误时触发
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [manager stopUpdatingLocation];
    NSLog(@"error:%@",error);
    NSString *errorString;
    NSLog(@"Error: %@",[error localizedDescription]);
    switch([error code])
    {
        case kCLErrorDenied:
            //Access denied by user
            errorString = @"Access to Location Services denied by user";
            //Do something...
            break;
        case kCLErrorLocationUnknown:
            //Probably temporary...
            errorString = @"Location data unavailable";
            //Do something else...
            break;
        default:
            errorString = @"An unknown error has occurred";
            break;
    }
}



@end
