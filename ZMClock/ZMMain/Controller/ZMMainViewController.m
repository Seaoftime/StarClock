//
//  ZMMainViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/2/23.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMainViewController.h"

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

/////li写的
#import "PeopleStandingview.h"

#import "IFlyFaceHelper.h"

#import "GAmerenwucontroller.h"

#import "goumaimodel.h"

#import "leimodelgoumai.h"

#import "Shengjihoutanchuyemianview.h"

#import "Shengjihoutanchuyemianview.h"


/////////////
#import "MeInfoModel.h"
#import "MeInfoTableViewCell.h"
#import "ZMEditNickNameViewController.h"
#import "ImagePickerHelper.h"
#import "EditMeInfoHelper.h"


//张锐
#import "ZRRImageTool.h"
#import "FaceGrindingImage.h"
#import "XTPopView.h"
#import "ZMImageLibbViewController.h"
#import "ZMImageLibbViewController2.h"
#import "ZMCarrtomDIYYViewController.h"
#import "ZMFirstPageBottommCollectionViewCell.h"
#import "UIView+Frame.h"
#import "LHPageControlView.h"

#import "iflyMSC/IFlyRecognizerView.h"
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "iflyMSC/IFlyRecognizerView.h"
#import "iflyMSC/IFlyDataUploader.h"
#import "iflyMSC/IFlyContact.h"
#import "IATConfig.h"
#import "ISRDataHelper.h"
#import "iflyMSC/IFlySpeechError.h"
#import "iflyMSC/IFlyRecognizerViewDelegate.h"

//#import "CLSpeechSynthesizer.h"//苹果自带封装
#import "ZRRSpeechSynthesizer.h"//语音合成

#import "ZMChooseSongFirstPageViewController.h"//点歌首页
#import "ZMChatMainnViewController.h"//聊天首页

#import "ZMChooseSongSearchhViewController.h"//测试完去掉
#import "ZMChatMainnViewController.h"//测试完去掉
#import "CWProgressView.h"
#import "ZMInteractonnFirstPageViewController.h"
#import "ZMChatMainnViewController.h"//测试完去掉
#import "ZMSystemTool.h"


/////
#import <AVFoundation/AVAudioRecorder.h>
#import <AVFoundation/AVAudioSession.h>

#import <CoreAudio/CoreAudioTypes.h>
#import "SpectrumView.h"
#import "ZMMeeMyGolddsViewController.h"
#import "ZMDIYCartoonnSecondDIYYViewController.h"
#import "ZMCheckinConfiiggModel.h"
/////
#import "ZMLoginViewController.h"
#import "ZMBaseNavigationController.h"
#import "ZMMainViewController.h"
#import "ZMAVPlayerManager.h"
/////文字搜索
#import "ZMSearrchSonggViewController.h"
#import "ZMChattTableViewCell.h"
#import "ZMChatFrameeModel.h"

///科大讯飞语音合成
#import <iflyMSC/IFlyMSC.h>
#import "TTSConfig.h"
#import "ZMMainPageVoiceHelpPageTableViewCell.h"//


#import "ZMCLockChooseLoveDouViewController.h"

#import "ZMClockStartPageeViewController.h"




typedef NS_OPTIONS(NSInteger, SynthesizeType){
    
    NomalType =5,         //普通合成
    UrlType = 6           //url合成
};



#define SKINColor RGB(253, 219, 189)

#define COLORR 253
#define COLORG 219
#define COLORB 189



@interface ZMMainViewController () <TopHeaderViewDeletae,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,IFlyRecognizerViewDelegate,IFlySpeechSynthesizerDelegate,AVAudioRecorderDelegate,UITableViewDelegate,UITableViewDataSource>
{

    IFlyRecognizerView *_iflyRecognizerView;
    
    //NSTimer *_animationTimer;
    
    BOOL _isPlayingSong;//正在播放
    
    //CWProgressView *_lineProgressV;//进度条
    
    BOOL _isClicked;//签到点击礼物视图
    
    BOOL _voiceHeadRight;//语音识别正确
    
    
    //SpectrumView *_spectrumView;
    
    //BOOL _voiceCanceled;//点击底部语音图标 播报取消
    

}

///----------------------------------------------------
///----------------------------------------------------
//聊天页面
@property (nonatomic, strong) NSMutableArray *chatDataArray;//聊天数据
@property (nonatomic, strong) UITableView *chatTableView;
//机器人
@property (nonatomic, copy)   NSString *robot_headPortaitStr;//头像
@property (nonatomic, copy)   NSString *robot_nicknameStr;
@property (nonatomic, copy)   NSString *robot_wantedNameStr;
//用户
@property (nonatomic, copy)   NSString *user_headPortaitStr;
@property (nonatomic, copy)   NSString *user_nicknameStr;

@property (nonatomic, copy)   NSString *robot_chatStrr;//机器人返回的聊天内容





///----------------------------------------------------
///----------------------------------------------------

@property (nonatomic, weak) NSTimer *playVoiceTimer; // 语音播报

@property (nonatomic,strong) ZMWeatherViewController *weatherViewController;

@property (nonatomic,strong) ZMImageView *zmBackgroundImageView;

@property (nonatomic,strong) TopHeaderView *topHeaderView; //!< 头部的天气预报视图
@property (nonatomic,strong) GameAlertView *gameAlertView; //!< 游戏弹出层视图

@property (nonatomic,strong) NSMutableArray *gameItemArray; //!< 数组
@property (nonatomic,strong) ZMButton *arrowsButton; //!< 弹出社区和星座按钮
@property (nonatomic,strong) GameView *gameView;//游戏喂食视图
@property (nonatomic,strong) ZMGuideImageView *guideImageView; //教学页

@property(nonatomic,strong) PeopleStandingview*peopleStandingview;//人物站立

@property(nonatomic,strong) UIButton *renwubutton;//任务 Button
@property(nonatomic,strong) UIButton *qiandaobutton1;// 签到 Button

@property (nonatomic,strong) NSMutableArray *gameItemArray1; //!< 数组
@property (nonatomic,strong) NSMutableArray *gameItemArray2; //!< 数组
@property (nonatomic,strong) NSMutableArray *gameItemArray3; //!< 数组



////////////////////张锐
@property (nonatomic, strong) UIImageView *firstPageRoleImgV;//身体图片视图
@property (nonatomic, strong) UIImageView *saveeImgV;//显示来自 diy 的视图

////////签到 点击礼物
@property (nonatomic, strong) UIView *chenckInBgV;//
@property (nonatomic, strong) UIImageView *chekinGoldImgV;
@property (nonatomic, strong) UIImageView *giftImgV;
@property (nonatomic, strong) UILabel *chekinGoldLbb;
@property (nonatomic, strong) UILabel *giftLbb;
@property (nonatomic, strong) CAShapeLayer *giftShapeLayer;

@property (nonatomic, strong) UIView *chenckInBgV2;//
@property (nonatomic, strong) UIImageView *chekinGoldImgV2;
@property (nonatomic, strong) UIImageView *giftImgV2;
@property (nonatomic, strong) UILabel *chekinGoldLbb2;
@property (nonatomic, strong) UILabel *giftLbb2;
@property (nonatomic, strong) CAShapeLayer *giftShapeLayer2;


////////////
//@property (nonatomic, strong) UIImageView *bottomAllBgV;//底部三个按钮背景
@property (nonatomic, strong) UIImageView *leftDIYStore;//diy


@property (nonatomic, strong) UIImageView *bottomUserHeadImgV;//左下方用户头像
@property (nonatomic, strong) UIButton *firstDiyyBtn;
@property (nonatomic, strong) UIButton *firstInttBtn;


@property (nonatomic, strong) UILabel *qinmiLelLb;//亲密度等级

@property (nonatomic, copy) NSString *love_level;//亲密度等级

@property (nonatomic, copy) NSString *love_value;//亲密度数值

@property (nonatomic, copy) NSString *upgrade_need_love_value;//升级所需


@property (nonatomic, strong) UIImageView *bottomIntImgV;//右下方互动按钮
@property (nonatomic, strong) UIImageView *bottomIntImgV2;//右下方互动按钮

@property (nonatomic, strong) UILabel *intLb;//互动 Label

///
@property (nonatomic, strong) UIImageView *bottomSpeechImgV;//生活秘书

@property (nonatomic, strong) UILabel *speechLb;//生活秘书 Label
//@property (nonatomic, strong) UIImageView *botomSpeechImgV;//语音识别背景

///
@property (nonatomic, strong) UIButton *voiceBtn;//语音按钮


@property (nonatomic, strong) UIView *botomWeAndYouV;//点击互动

/////互动的 collectionView

@property (nonatomic, strong) UIScrollView *botomScrollV;
@property (nonatomic, strong) UICollectionView *bottonCollectionV;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) LHPageControlView *botomPageControl;


////生活秘书界面 帮助页面
@property (nonatomic, strong) UITableView *voiceHelppTableV;
@property (nonatomic, strong) UIButton *voiceeBtn;
@property (nonatomic, strong) UIButton *voiceHelpBtn;
@property (nonatomic, strong) UIImageView *voiceHelpBgV;//帮助背景
//@property (nonatomic, strong) UIImageView *voiceHelpBottomImgV;
@property (nonatomic, strong) UILabel *voiceHelpBgLb;
@property (nonatomic, strong) UIImageView *voiceHelpBgLbImgV;
@property (nonatomic, strong) UIImageView *voiceHelpHeadImgV;

@property (nonatomic, strong) NSArray *voiceHelpImgArray;
@property (nonatomic, strong) NSArray *voiceHelpTitleArray;
@property (nonatomic, strong) NSArray *voiceHelpContentArray;

@property (nonatomic, strong) UIImageView *annimationImageV;


@property (nonatomic, strong) NSMutableArray *voiceHelpMsgArray;

//@property (nonatomic, strong) SCSiriWaveformView *voiceWaveV;
@property (nonatomic, strong) UIView *voiceeListenBgV;//聆听的动画背景
@property (nonatomic, strong) UILabel *voiceRecoLb;//显示语音识别结果
@property (nonatomic, copy) NSString *voiceStrr;


////////////////////////////////首页点歌标记
@property (nonatomic, copy) NSString *firstPageSearchSongg;



@property (nonatomic, copy) NSString * result;//识别结果
@property (nonatomic) int volume;//音量

//@property (nonatomic, strong) GFWaterView *waterView;//水波
//@property (nonatomic, strong) UILabel *animationLLb;//倾听中

/////语音合成
@property (nonatomic, copy) NSString *voiceDateStr;//报时
@property (nonatomic, strong) IFlySpeechSynthesizer * iFlySpeechSynthesizer;



////拼接天气
@property (nonatomic, copy) NSString *weather1;//多云
@property (nonatomic, copy) NSString *weather2;//最高温度
@property (nonatomic, copy) NSString *weather3;//东南风
@property (nonatomic, copy) NSString *weather4;//4级
@property (nonatomic, copy) NSString *weather5;//夜里 多云
@property (nonatomic, copy) NSString *weather6;//最低温度
@property (nonatomic, copy) NSString *weather7;//微风
@property (nonatomic, copy) NSString *voiceWeatherStr;//最后的合成语音



//////////////////////////////顶部
////////////////////////////////////////正在播放音乐
@property (nonatomic, strong) UIImageView *isPlayingBgV;//
@property (nonatomic, strong) UIImageView *isPlayingBgV22;//
@property (nonatomic, strong) UIImageView *isPlayImgV;
@property (nonatomic, strong) UILabel *isPlaySongName;//播放的歌曲名字
@property (nonatomic, strong) UIImageView *goldBggImgV;
@property (nonatomic, strong) UIImageView *goldImgV;//金币
@property (nonatomic, strong) UILabel *goldLb;//
@property (nonatomic, strong) UIButton *qiandaoBtn;//签到

@property (nonatomic, strong) UIImageView *firstLevelHeadPoritBggImgV;
@property (nonatomic, strong) UIImageView *firstLevelHeadPoritImgV;
@property (nonatomic, strong) UIImageView *firstLevelBgImgV;
@property (nonatomic, strong) UILabel *firstLevelLb;
///音乐播放动图
@property (nonatomic, strong) UIImageView *firstPageMusicPlayingImgV;

/////////////点击签到
@property (nonatomic, strong) UIImageView *qianBlackBgImgV;//黑屏
@property (nonatomic, strong) UIView *qianBgV;//整个
@property (nonatomic, strong) UIImageView *qianTopImgV;
@property (nonatomic, strong) UILabel *qiangoodLb;//签到好礼
@property (nonatomic, strong) UILabel *qianTellLb;//说明

///////7个大的 imagView
@property (nonatomic, strong) UIImageView *weekImgVDay1;
@property (nonatomic, strong) UIImageView *weekImgVDay2;
@property (nonatomic, strong) UIImageView *weekImgVDay3;
@property (nonatomic, strong) UIImageView *weekImgVDay4;
@property (nonatomic, strong) UIImageView *weekImgVDay5;
@property (nonatomic, strong) UIImageView *weekImgVDay6;
@property (nonatomic, strong) UIImageView *weekImgVDay7;
///金币
@property (nonatomic, strong) UIImageView *weekImgVGold1;
@property (nonatomic, strong) UIImageView *weekImgVGold2;
@property (nonatomic, strong) UIImageView *weekImgVGold3;
@property (nonatomic, strong) UIImageView *weekImgVGold4;
@property (nonatomic, strong) UIImageView *weekImgVGold5;
@property (nonatomic, strong) UIImageView *weekImgVGold6;
@property (nonatomic, strong) UIImageView *weekImgVGold7;
//天数
@property (nonatomic, strong) UILabel *qianDD1;
@property (nonatomic, strong) UILabel *qianDD2;
@property (nonatomic, strong) UILabel *qianDD3;
@property (nonatomic, strong) UILabel *qianDD4;
@property (nonatomic, strong) UILabel *qianDD5;
@property (nonatomic, strong) UILabel *qianDD6;
@property (nonatomic, strong) UILabel *qianDD7;
//金币数
@property (nonatomic, strong) UILabel *qianGold1;
@property (nonatomic, strong) UILabel *qianGold2;
@property (nonatomic, strong) UILabel *qianGold3;
@property (nonatomic, strong) UILabel *qianGold4;
@property (nonatomic, strong) UILabel *qianGold5;
@property (nonatomic, strong) UILabel *qianGold6;
@property (nonatomic, strong) UILabel *qianGold7;

///动画
@property (nonatomic, strong) UILabel *annimationGoldLb;
@property (nonatomic, strong) CAEmitterLayer * goldLbEmitterLayer;

//关闭按钮
@property (nonatomic, strong) UIButton *qianCloceBtn1;
@property (nonatomic, strong) UIButton *qianCloceBtn2;
//第几天
@property (nonatomic, strong) UILabel *qiandayy1;
@property (nonatomic, strong) UILabel *qiandayy2;
@property (nonatomic, strong) UILabel *qiandayy3;
@property (nonatomic, strong) UILabel *qiandayy4;
@property (nonatomic, strong) UILabel *qiandayy5;
@property (nonatomic, strong) UILabel *qiandayy6;
@property (nonatomic, strong) UILabel *qiandayy7;
//签到完成 遮罩
@property (nonatomic, strong) UIImageView *weekImgVzhe1;
@property (nonatomic, strong) UIImageView *weekImgVzhe2;
@property (nonatomic, strong) UIImageView *weekImgVzhe3;
@property (nonatomic, strong) UIImageView *weekImgVzhe4;
@property (nonatomic, strong) UIImageView *weekImgVzhe5;
@property (nonatomic, strong) UIImageView *weekImgVzhe6;
@property (nonatomic, strong) UIImageView *weekImgVzhe7;
//签到完成 对号
@property (nonatomic, strong) UIImageView *weekImgVduii1;
@property (nonatomic, strong) UIImageView *weekImgVduii2;
@property (nonatomic, strong) UIImageView *weekImgVduii3;
@property (nonatomic, strong) UIImageView *weekImgVduii4;
@property (nonatomic, strong) UIImageView *weekImgVduii5;
@property (nonatomic, strong) UIImageView *weekImgVduii6;
@property (nonatomic, strong) UIImageView *weekImgVduii7;


////
@property (nonatomic,strong) AVAudioRecorder *audioRecorder;//音频录音机

@property (nonatomic, strong) NSMutableArray *cfgMuArray;// 签到配置




@end

@implementation ZMMainViewController

@synthesize gameAlertView;


#pragma mark - DataRequest Method

#pragma mark 获取用户信息 （游戏等级信息）
-(void)getUserInfo:(BOOL)userInfo
{
    if (userInfo)
    {
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign};
               
                
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_user_info.php" theParmeters:parmeters sucess:^(id object)
                 {
                     
                     NSLog(@"UserInfo__666____%@",object);
                     
                     
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         //NSDictionary *data = [object objectForKey:@"data"];
                         
                     
                     
                     
                     }
                     
                     
                 } error:^(NSError *error){
                 
                 }];
            }
        }
    }
}







#pragma mark -------------------------------------获取天气情况
/**
 weather：BOOL类型
 YES时调用接口获取天气信息
 NO时不调用接口获取天气信息
 */
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
                 //注释掉了,不然光弹出地理位置
                 //[AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"当前位置为中国-%@",city] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime5];
             }
             else
             {
                 [AnyObjectActivityView showWithTitle:@"不在中国境内，默认郑州天气" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime5];
             }
             
             NSString *weatherUrl = [NSString stringWithFormat:@"weather/weather_info_by_name.php?province=%@&city=%@&district=%@",area,city,subLocality];
             
            //NSString *weatherUrl = [NSString stringWithFormat:@"weather/weather_info_by_name.php?province=%@&city=%@&district=%@",@"河南省",@"郑州市",@"管城回族区"];
             
             
             
             
             [[[AFNetworkingHelper alloc]init] getWithUrl:weatherUrl sucess:^(id object)
              {
                  
                  
                  NSLog(@"_____****  天气  ***____ %@",object);
                  
                  
                  
                  if (object)
                  {
                      if ([[object objectForKey:@"error_code"] intValue] == 0)
                      {
                          NSDictionary *result = [object objectForKey:@"result"];
                          NSDictionary *data = [result objectForKey:@"data"];
                          if (data)
                          {
                              WeatherModel *weatherModel = [[WeatherModel alloc] init];
                              
#pragma mark - 解析lift中的数据内容
                              
                              NSDictionary *life = [data objectForKey:@"life"];
                              NSString *date = [life objectForKey:@"date"];
                              NSDictionary *info = [life objectForKey:@"info"];
                              [weatherModel.lifeModel setDate:date];
                              
                              //解析穿衣指数
                              NSArray *chuanyi = [info objectForKey:@"chuanyi"];
                              
                              //if ([chuanyi count]>=2)
                              //{
                                  [weatherModel.lifeModel setChuanyi_title:chuanyi[0]];
                                  [weatherModel.lifeModel setChuanyi_describe:chuanyi[1]];
                                  
                                  //NSLog(@"穿衣______%@_____",chuanyi[1]);
                                  
                              //}
                              //解析感冒
                              NSArray *ganmao = [info objectForKey:@"ganmao"];
                              //if ([chuanyi count]>=2)
                              //{
                                  [weatherModel.lifeModel setGanmao_title:ganmao[0]];
                                  [weatherModel.lifeModel setGanmao_describe:ganmao[1]];
                              //}
                              
                              //解析空调指数
                              NSArray *kongtiao = [info objectForKey:@"kongtiao"];
                              //if ([chuanyi count]>=2)
                              //{
                                  [weatherModel.lifeModel setKongtiao_title:kongtiao[0]];
                                  [weatherModel.lifeModel setKongtiao_describe:kongtiao[1]];
                              //}
                              
                              
                              //解析污染指数
                              NSArray *wuran = [info objectForKey:@"wuran"];
                              //if ([chuanyi count]>=2)
                              //{
                                  [weatherModel.lifeModel setWuran_title:wuran[0]];
                                  [weatherModel.lifeModel setWuran_describe:wuran[1]];
                                  
                                  
                                  //NSLog(@"污染______%@_____", wuran[1]);
                                  
                                  
                                  
                              //}
                              
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
                              
                              
                              //NSLog(@"实时天气情况______%@___%@___%@____%@_____",temperature,humidity,weatherinfo,weatherimg);
                              
                              self.weather1 = weatherinfo;
                              
                              
                              
                              
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
                              
                              
                               //NSLog(@"实时风力____1__%@__2_%@__3__%@__4_%@_______",winddirect,windpower,windoffset,windwindspeed);
                              
                              self.weather3 = winddirect;
                              self.weather4 = windpower;
                              
                              
#pragma mark - 解析 weather 未来七天的天气预报
                              NSArray *weatherArray = [data objectForKey:@"weather"];
                              for (int i = 0; i < [weatherArray count]; i++)
                              {
                                  MemberWeatherModel *model = [[MemberWeatherModel alloc] init];
                                  
                                  NSDictionary *item = weatherArray[i];
                                  
                                  
                                  ///
                                  NSDictionary *item0 = weatherArray[0];
                                  
                                  
                                  NSString *date = [item objectForKey:@"date"];
                                  NSString *week = [item objectForKey:@"week"];
                                  NSString *nongli = [item objectForKey:@"nongli"];
                                  NSDictionary *info = [item objectForKey:@"info"];
                                  
                                  ///
                                  NSDictionary *info0 = [item0 objectForKey:@"info"];
                                  
                                  
                                  [model setNongli:nongli];
                                  [model setWeek:week];
                                  [model setDate:date];
                                  
                                  
                                  NSArray *dayArray = [info objectForKey:@"day"];
                                  
                                  
                                  ///
                                  NSArray *dayArray0 = [info0 objectForKey:@"day"];
                                  
                                  
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
                                  
                                  //NSLog(@"白天_____未来7天天气______%@___%@___%@____%@_______",dayArray0[1],dayArray0[2],dayArray0[3],dayArray0[4]);
                                  
                                  self.weather2 = dayArray0[2];
                                  
                                  
                                  
                                  NSArray *nightArray = [info objectForKey:@"night"];
                                  
                                  ///
                                  NSArray *nightArray0 = [info0 objectForKey:@"night"];
                                  
                                  
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
                                  
                                   //NSLog(@"夜晚_____未来7天天气______%@___%@___%@____%@_______",nightArray0[1],nightArray0[2],nightArray0[3],nightArray0[4]);
                                  
                                  
                                  self.weather5 = nightArray0[1];
                                  self.weather6 = nightArray0[2];
                                  self.weather7 = nightArray0[4];
                                  
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
                                  
                                  
                                   //NSLog(@"PM2.5______%@___%@___%@_______",pm25,level,quality);
                                  
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
             //[AnyObjectActivityView showWithTitle:@"定位失败，您可以重新启动程序，重新定位" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime5];
         }];
    }
}





#pragma mark ----------------------------获取用户首页相关信息(新加)
- (void)getFirstPageUserInfomation
{

    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_home_page_info.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"用户首页 ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    NSString *cur_goldStr = [NSString stringWithFormat:@"%@",[data objectForKey:@"cur_gold"]];//金币数量
                    self.love_level = [NSString stringWithFormat:@"%@",[data objectForKey:@"love_level"]];//亲密等级
                    //保存首页用户头像 设置页面用
                    [NSUserDefaults standardUserDefaults]. mainUserLoveLevelStr = self.love_level;
                    
                    
                    self.love_value = [NSString stringWithFormat:@"%@",[data objectForKey:@"love_value"]];//亲密值
                    
                    NSLog(@"亲密值 ****  %@",self.love_value);
                    
                    self.upgrade_need_love_value = [NSString stringWithFormat:@"%@",[data objectForKey:@"upgrade_need_love_value"]];//升级所需亲密值
                    
                    NSDictionary *user_avatarDic = [data objectForKey:@"user_avatar"];
                    
                    NSString *pathStr = [user_avatarDic objectForKey:@"path"];
                    
                    //保存首页用户头像 聊天管理页面用
                    [NSUserDefaults standardUserDefaults].mainUserHeadPortaitStr = pathStr;
                    
                    self.goldLb.text = cur_goldStr;
                    
                    //[self.bottomUserHeadImgV sd_setImageWithURL:[NSURL URLWithString:pathStr]];
                    [self.firstLevelHeadPoritImgV sd_setImageWithURL:[NSURL URLWithString:pathStr]];
                    
                    
                    //self.qinmiLelLb.text = self.love_level;
                    self.firstLevelLb.text = [NSString stringWithFormat:@"LV%@",self.love_level];
                    
                    _love_val.text = [NSString stringWithFormat:@"亲密值: %@/%@",self.love_value,self.upgrade_need_love_value];
                    
                    //_lineProgressV.progress = [self.love_value floatValue]/[self.upgrade_need_love_value floatValue];
                    

                    
                }
                
                
                
                
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];
            
        }else {
            //游客
            
        }
        
        
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    


}

//#pragma mark -------------------------------获取用户相关信息
//- (void)getUserSomeInfom
//{
//    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
//    {
//        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
//        {
//            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
//                                        @"sign":[ZMUserInfo sharedUserInfo].sign
//                                        };
//            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_user_info.php" theParmeters:parmeters sucess:^(id object)
//             {
//                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
//                 {
//                     
//                     
//                     NSLog(@"get_user_info____%@",object);
//                     
//                     NSDictionary *data = [object objectForKey:@"data"];
//                     
//                     NSDictionary *image_url = [data objectForKey:@"image_url"];
//                     NSString *pathUrl = [image_url objectForKey:@"path"];//头像 url
//                     
//                     //[self.bottomUserHeadImgV sd_setImageWithURL:[NSURL URLWithString:pathUrl]];
//                     
//                     
//                     //NSString *nickN = [data objectForKey:@"nickname"];//昵称
//                     //NSString *xing = [data objectForKey:@"user_id"];//星伴号
//                     NSString *gold = [data objectForKey:@"gold"];//金币数
//                     
//                     //self.goldLb.text = gold;
//                     
//                     self.love_level = [data objectForKey:@"love_level"];//亲密度等级
//                     self.love_value = [data objectForKey:@"love_value"];//亲密度数值
//                     self.upgrade_need_love_value = [data objectForKey:@"upgrade_need_love_value"];//升级所需亲密度
//                     
//                     
//                     self.qinmiLelLb.text = self.love_level;
//                     
//                     _love_val.text = [NSString stringWithFormat:@"亲密值: %@/%@",self.love_value,self.upgrade_need_love_value];
//                     
//                     _lineProgressV.progress = [self.love_value floatValue]/[self.upgrade_need_love_value floatValue];
//                     
//                     
//                 }
//             } error:^(NSError *error){}];
//        }
//    }
//}
//
//
//


#pragma mark ------------------------------------视图将要出现时
#pragma mark 隐藏 TabBar
//
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.TabBarButtonView TabBarViewHidden:0];
//获取天气的相关信息  再次调取的方法
    [self getWeather:YES];
    
    
    
#pragma mark ------------------------------再次初始化
    
    [self initSpeakTexttSynthesizer];
    
    
    
///////////////////正在播放音乐
    //[self setupPlayingSongV];
    
//获取用户相关信息  刷新界面
    //[self getUserSomeInfom];

    [self getFirstPageUserInfomation];
    
    
    
////////////隐藏签到视图
    self.qianBlackBgImgV.hidden = YES;

    
    
    
//显示保存的 diy 图片
    NSString *diyStr = [NSUserDefaults standardUserDefaults].diy_saveImgStr;
    
    if (diyStr == nil || diyStr == NULL || [diyStr isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        //字符串转图片
        NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:diyStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *diyImg = [UIImage imageWithData:decodeImgData];
        
        self.saveeImgV.image = diyImg;
        
        
        
    }
    
    
    
    
    
    
    
    
    
    if ([[ZMAVPlayerManager playerManager] isPlaying]) {
        //
        [self.firstPageMusicPlayingImgV startAnimating];
        
    }
    
}




- (void)viewWillDisappear:(BOOL)animated
{
    
    //[_animationTimer invalidate];//取消定时器
    //_animationTimer = nil;

    //[[NSNotificationCenter defaultCenter] removeObserver:self];

    //[[NSNotificationCenter defaultCenter]removeObserver:self name:@"isPlayingSongggggg" object:nil];
    
    
    ////
    [super viewWillDisappear:animated];
    
    [_iflyRecognizerView cancel];
    
    ///底部视图复原
    [self saveImgaeViewwTaped];
    
    
    
    
}




//视图
- (void)viewDidAppear:(BOOL)animated
{

    //[self getUserProfile:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        if ([self.goldLb.text isEqualToString:@"6666"]) {
            //
            [self getFirstPageUserInfomation];
        }else {
        }
        
    });
    
    


}




#pragma mark ---------------------------正在播放音乐---接收通知

- (void)isPlayingSonging:(NSNotification* )Noti
{

     if ([Noti.object isEqual:@"songing"]) {
         
         _isPlayingSong = YES;

//
//         self.isPlayingBgV.image = IMAGE(@"40X40遮罩zz");
//         
//         
//         NSString *songNameStr = [APPTransmit shareInstance].isPlayingSongName;
//         
//         self.isPlaySongName.text = [NSString stringWithFormat:@"%@",songNameStr];
//         
//         self.isPlayingBgV22.hidden = NO;
     
         
         
         [self startPlayigMusiccImageViewAnimation];//加载动画
     
         
     }




}

#pragma mark ----------------------------------停止播放音乐
//
- (void)isPlayingEndSong:(NSNotification* )Noti
{
    
//    //正在播放音乐才需要做之后的操作
//    //rate  0.0 means "stopped" 1.0 means "play at the natural rate of the current item"
//    if ([ZRPlayer sharePlayer].player.rate == 1.0) {
//        
//        self.isPlayingBgV.hidden = NO;
//        
//    }
//    
//    
//    if ([ZRPlayer sharePlayer].player.rate == 0.0) {
//        
//        self.isPlayingBgV.hidden = YES;
//        
//    }
    
    
    [self.firstPageMusicPlayingImgV stopAnimating];
    
    
    
    
    if ([Noti.object isEqual:@"songendf"]) {
    
    
        _isPlayingSong = NO;
        
        //self.isPlayingBgV22.hidden = YES;
        
        //self.isPlayingBgV.image = IMAGE(@"");
    
    }
    

}







- (void)closeBackgroundClockee
{
    ZMClockStartPageeViewController *clockStart = [[ZMClockStartPageeViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:clockStart animated:NO];
    
}







- (void)viewDidLoad
{
    [super viewDidLoad];
    
#pragma mark 主视图中的控件添加添加
    [ZMLocationAndWeather sharedInstanceWithViewController:self];
    [self.baseNavigation setHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.zmBackgroundImageView];
    
    
    _isClicked = NO;
    
    _voiceHeadRight = NO;
    

    
    //self.playVoiceTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(playVoiceTimerStart) userInfo:nil repeats:YES];
    
#pragma mark ---------------------------弹出闹钟开始页通知

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeBackgroundClockee) name:@"APP_RECEIVEED_CLOCKNOTIFY_BACKGROUND" object:nil];
    

    
    
    
    
    
    
    
    
#pragma mark ------------------------------------保存视图
    
    self.saveeImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height )];
    self.saveeImgV.userInteractionEnabled = YES;
    self.saveeImgV.backgroundColor = [UIColor clearColor];
    self.saveeImgV.userInteractionEnabled = YES;
    
    [self.zmBackgroundImageView addSubview:self.saveeImgV];

    UITapGestureRecognizer *saveTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saveImgaeViewwTaped)];
    [self.saveeImgV addGestureRecognizer:saveTap];
    
#pragma mark --------------------------------帮助页面提示数据源
    self.voiceHelpImgArray = [NSArray arrayWithObjects:@"对话图标", @"生活帮手图标", @"指令图标", nil];
    
    self.voiceHelpTitleArray = [NSArray arrayWithObjects:@"人机对话、智能回答", @"生活帮手指令", @"打开应用指令", nil];
    
    self.voiceHelpContentArray = [NSArray arrayWithObjects:@"语音聊天,与小秘书一问一答,畅聊好有趣~", @"“闹钟”、“天气”、“点歌”、“报时”", @"“打开天气”、“打开点歌”、“打开闹钟”、", nil];
    
    
    //////////////
    //底部三个按钮背景
    
//屏幕适配
    //if ([ZMSystemTool iPhone5Device]) {
        
    //    self.bottomAllBgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 130, kScreen_Width, 130)];
    //}else {
//    
//        self.bottomAllBgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 120, kScreen_Width, 120)];
//    
//    //}
//    
//    self.bottomAllBgV.backgroundColor = [UIColor clearColor];
//    //self.bottomAllBgV.alpha = 0.6;
//    self.bottomAllBgV.image = IMAGE(@"底板help");
//    self.bottomAllBgV.userInteractionEnabled = YES;
//    
//    [self.view addSubview:self.bottomAllBgV];
//    
#pragma mark -----------------------------------底部进度条
///
    //[self addBottomProgressLbb];

//获取用户相关信息
    //[self getUserSomeInfom];
    [self getFirstPageUserInfomation];
//签到配置
    //[self getCheckInUserrCfg];
    
//获取天气情况
    [self getWeather:YES];
    
    
#pragma mark -------------------------------左下方形象 diy按钮
    self.firstDiyyBtn = [[UIButton alloc] initWithFrame:CGRectMake((kScreen_Width/2 - 45)/2 - 40, kScreen_Height - 100, 81, 90)];
    
    [self.firstDiyyBtn setBackgroundImage:IMAGE(@"形象底板a") forState:UIControlStateNormal];
    [self.firstDiyyBtn setBackgroundImage:IMAGE(@"形象底板b") forState:UIControlStateHighlighted];
    [self.firstDiyyBtn addTarget:self action:@selector(leftDIYImgTaped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.firstDiyyBtn];
    

#pragma mark ------------------------------------中间 语音按钮
//语音按钮
    self.voiceBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 40, kScreen_Height - 100, 81, 90)];

    [self.voiceBtn setBackgroundImage:IMAGE(@"生活小秘书") forState: UIControlStateNormal];
    [self.voiceBtn setBackgroundImage:IMAGE(@"生活小秘书-点击") forState:UIControlStateHighlighted];
    
    [self.voiceBtn addTarget:self action:@selector(voiceBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.voiceBtn];
    
#pragma mark ---------------------------------右下方互动按钮
    self.firstInttBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - ((kScreen_Width/2 - 45)/2 - 45) - 90 + 5, kScreen_Height - 100, 81, 90)];
    
    [self.firstInttBtn setBackgroundImage:IMAGE(@"互动aa") forState:UIControlStateNormal];
    [self.firstInttBtn setBackgroundImage:IMAGE(@"互动-点击bb") forState:UIControlStateHighlighted];
    [self.firstInttBtn addTarget:self action:@selector(bottomIntImgVTaped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.firstInttBtn];
    
    
#pragma mark ---------------------------------语音识别/聊天背景
#pragma mark -------------------------------------帮助背景
///
    self.voiceHelpBgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height/2, kScreen_Width, kScreen_Height/2 )];
    //self.voiceHelpBgV.backgroundColor = [UIColor redColor];
    self.voiceHelpBgV.image = IMAGE(@"底板help");
    self.voiceHelpBgV.userInteractionEnabled = YES;
    
    //[self.botomSpeechImgV addSubview:self.voiceHelpBgV];
    [self.view addSubview:self.voiceHelpBgV];
    
    self.voiceHelpBgV.hidden = YES;
    
/////帮助 TableView
    [self.voiceHelpBgV addSubview:self.voiceHelppTableV];
    

    
#pragma mark --------------------------------帮助页面识别按钮
    //语音按钮
    self.voiceeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 20, kScreen_Height/2 - 55, 30, 45)];
    self.voiceeBtn.backgroundColor = [UIColor clearColor];
    //self.voiceeBtn.layer.cornerRadius = 23;
    //self.voiceeBtn.layer.masksToBounds = YES;
    [self.voiceeBtn setBackgroundImage:IMAGE(@"麦克风-图标help") forState:UIControlStateNormal];
    [self.voiceeBtn setBackgroundImage:IMAGE(@"麦克风-图标-点击help") forState:UIControlStateHighlighted];
    
    
    [self.voiceeBtn addTarget:self action:@selector(voiceeeeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.voiceHelpBgV addSubview:self.voiceeBtn];
    
#pragma mark ------------------------------uiimageView 动画视图
    
    self.annimationImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0,  kScreen_Height/2 - 50, kScreen_Width, 40)];
    //self.annimationImageV.backgroundColor = [UIColor orangeColor];
    self.annimationImageV.userInteractionEnabled = YES;
    
    [self.voiceHelpBgV addSubview:self.annimationImageV];
    
    self.annimationImageV.hidden = YES;
    
    
#pragma mark ---------------------------------语音帮助按钮
    ///语音帮助
    self.voiceHelpBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 50, kScreen_Height/2 - 40, 30, 30)];
    self.voiceHelpBtn.backgroundColor = [UIColor clearColor];
    self.voiceHelpBtn.layer.cornerRadius = 13;
    self.voiceHelpBtn.layer.masksToBounds = YES;
    [self.voiceHelpBtn setBackgroundImage:IMAGE(@"询问help") forState:UIControlStateNormal];
    
    [self.voiceHelpBtn addTarget:self action:@selector(voiceHelppBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.voiceHelpBgV addSubview:self.voiceHelpBtn];
    
    
    
    self.voiceHelpBgLb = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, kScreen_Width, 40)];
    self.voiceHelpBgLb.backgroundColor = [UIColor clearColor];
    self.voiceHelpBgLb.text = @"点击下方按钮,你可以这样跟我说:";
    self.voiceHelpBgLb.font = [UIFont systemFontOfSize:15];
    self.voiceHelpBgLb.textColor = [UIColor blackColor];
    self.voiceHelpBgLb.textAlignment = NSTextAlignmentCenter;
//
//    [self.voiceHelpBgV addSubview:self.voiceHelpBgLb];
//    
    
#pragma mark ---------------------------------------帮助页面头像
    
    self.voiceHelpBgLbImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0,  0, kScreen_Width, 40)];
    self.voiceHelpBgLbImgV.image = IMAGE(@"装饰条help");
    
    [self.voiceHelpBgV addSubview:self.voiceHelpBgLbImgV];
    
    
    self.voiceHelpHeadImgV = [[UIImageView alloc] initWithFrame:CGRectMake(5,  - 40, 80, 80)];
    self.voiceHelpHeadImgV.image = IMAGE(@"头像框help");
    
    [self.voiceHelpBgV addSubview:self.voiceHelpHeadImgV];
    

    
    
    [self.voiceHelpBgLbImgV addSubview:self.voiceHelpBgLb];
    
    
    
    
 
//语音波形图
//    self.voiceWaveV = [[SCSiriWaveformView alloc] initWithFrame:CGRectMake(kScreen_Width/4, 50, kScreen_Width/2, 60)];
//    self.voiceWaveV.backgroundColor = [UIColor clearColor];
//    self.voiceWaveV.waveColor = [UIColor blackColor];
//    [self.botomSpeechV addSubview:self.voiceWaveV];
    
    
    
//语音识别的结果
    self.voiceRecoLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 80)];
    self.voiceRecoLb.font = [UIFont systemFontOfSize:14];
    self.voiceRecoLb.numberOfLines = 0;
    self.voiceRecoLb.textColor = [UIColor whiteColor];
    self.voiceRecoLb.textAlignment = NSTextAlignmentCenter;
    self.voiceRecoLb.backgroundColor = [UIColor clearColor];
    
    [self.voiceHelpBgV addSubview:self.voiceRecoLb];
    
    self.voiceRecoLb.hidden = YES;
    
    
//    self.animationLLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, kScreen_Width, 40)];
//    self.animationLLb.text = @"倾听中......";
//    self.animationLLb.font = [UIFont systemFontOfSize:13];
//    //self.animationLLb.textColor = RGB(66, 163, 222);
//    self.animationLLb.textColor = [UIColor whiteColor];
//    self.animationLLb.textAlignment = NSTextAlignmentCenter;
//    self.animationLLb.userInteractionEnabled = YES;
//    
    //[self.botomSpeechV addSubview:self.animationLLb];
    
    
    

#pragma mark --------------------------------仿 QQ 录音动画
///////
//     _spectrumView = [[SpectrumView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)- 100, kScreen_Height/2 - 60 - 30, 200, 30.0)];
//    
//    __weak SpectrumView * weakSpectrum = _spectrumView;
//    
//    __weak typeof(self) weakSelf = self;
//    
//    _spectrumView.itemLevelCallback = ^() {
//        
//        [weakSelf.audioRecorder updateMeters];
//        //取得第一个通道的音频，音频强度范围时-160到0
//        float power = [weakSelf.audioRecorder averagePowerForChannel:0];
//        
//        weakSpectrum.level = power;
//    };
//    
//    [self.botomSpeechImgV addSubview:_spectrumView];
    
    
///---------------------------------------------------
///---------------------------------------------------
#pragma mark -------------------------------添加聊天tableView
    
    [self getModelChatArray];
    
    
    [self addChatTableView];
    
    
    self.chatTableView.hidden = YES;
    
    
    
    
    
    
    
    
    
///---------------------------------------------------
///---------------------------------------------------
    
///底部互动的collectionView
    //[self setupBottomCollectionView];
#pragma mark -----------------------------------配置语音合成
    [self initSpeakTexttSynthesizer];
    
    
#pragma mark -----------------------------------配置语音识别
//配置语音识别
    [self setupSpeechRecognizer];
    
    //[CLSpeechSynthesizer setLanguage:@"zh-CN"];
    [[ZRRSpeechSynthesizer sharedSpeechInstance] setSpeechLanguage:@"zh-CN"];
    
    
    
///正在播放音乐通知
    
    _isPlayingSong = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayingEndSong:) name:@"songisPlayenddd" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayingSonging:) name:@"songisPlayinng" object:nil];

#pragma mark ----------------------------------顶部正在播放
    ////正在播放
    self.isPlayingBgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0 , kScreen_Width, 60)];
    self.isPlayingBgV.backgroundColor = [UIColor clearColor];
    //self.isPlayingBgV.image = IMAGE(@"40X40遮罩zz");
    self.isPlayingBgV.userInteractionEnabled = YES;
    
    //UITapGestureRecognizer *isPlay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isPlayingBgVvTaped)];
    //[self.isPlayingBgV addGestureRecognizer:isPlay];
    
    [self.view addSubview:self.isPlayingBgV];
    
////显示音乐名称背景
    self.isPlayingBgV22 = [[UIImageView alloc] initWithFrame:CGRectMake(100 , 0 , kScreen_Width - 100 - 60, 60)];
    self.isPlayingBgV22.backgroundColor = [UIColor clearColor];
    //self.isPlayingBgV22.image = IMAGE(@"40X40遮罩zz");
    self.isPlayingBgV22.userInteractionEnabled = YES;
    
    //UITapGestureRecognizer *isPlay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isPlayingBgVvTaped)];
    //[self.isPlayingBgV22 addGestureRecognizer:isPlay];
    
    [self.isPlayingBgV addSubview:self.isPlayingBgV22];
    
    UITapGestureRecognizer *isPlay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isPlayingBgVvTaped)];
    [self.isPlayingBgV22 addGestureRecognizer:isPlay];
    
    
    if ([ZMSystemTool iPhone6PlusDevice]) {
        self.isPlayImgV = [[UIImageView alloc] initWithFrame:CGRectMake(30, 18 + 10 , 24, 24)];
    }else {
    
        self.isPlayImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 18 + 10 , 24, 24)];
    }
    
    self.isPlayImgV.backgroundColor = [UIColor clearColor];
    
    self.isPlayImgV.image = IMAGE(@"音乐-图标");
    [self.isPlayingBgV22 addSubview:self.isPlayImgV];
    
    
    if ([ZMSystemTool iPhone6PlusDevice]) {
        self.isPlaySongName = [[UILabel alloc] initWithFrame:CGRectMake(60 + 10, 15 + 10, kScreen_Width/2, 30)];
    }else {
    
        self.isPlaySongName = [[UILabel alloc] initWithFrame:CGRectMake(50 + 10, 15 + 10, kScreen_Width/2, 30)];
    }
    
    
    self.isPlaySongName.font = [UIFont systemFontOfSize:16];
    self.isPlaySongName.textColor = [UIColor whiteColor];
    
    self.isPlaySongName.textAlignment = NSTextAlignmentLeft;
    self.isPlaySongName.numberOfLines = 0;
    
    [self.isPlayingBgV22 addSubview:self.isPlaySongName];

    self.isPlayingBgV22.hidden = YES;
    
////
#pragma mark ------------------------------------- 等级头像
    
    self.firstLevelHeadPoritBggImgV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 100, 100)];
    
    self.firstLevelHeadPoritBggImgV.image = IMAGE(@"头像框help");
    
    self.firstLevelHeadPoritBggImgV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.firstLevelHeadPoritBggImgV];
    
    
    UITapGestureRecognizer *headdTapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(firstLevelHeadPoritBggImgVTaped)];
    [self.firstLevelHeadPoritBggImgV addGestureRecognizer:headdTapp];

    
    
////用户头像
    self.firstLevelHeadPoritImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    self.firstLevelHeadPoritImgV.backgroundColor = [UIColor whiteColor];
    self.firstLevelHeadPoritImgV.image = IMAGE(@"默认头像");
    self.firstLevelHeadPoritImgV.layer.cornerRadius = 40;
    self.firstLevelHeadPoritImgV.layer.masksToBounds = YES;
    
    self.firstLevelHeadPoritImgV.userInteractionEnabled = YES;
    
    [self.firstLevelHeadPoritBggImgV addSubview:self.firstLevelHeadPoritImgV];
////
    self.firstLevelBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 55, 80, 30)];
    //self.firstLevelBgImgV.backgroundColor = [UIColor orangeColor];
    self.firstLevelBgImgV.image = IMAGE(@"级别蒙版");
    //self.firstLevelBgImgV.layer.cornerRadius = 40;
    //self.firstLevelBgImgV.layer.masksToBounds = YES;
    
    self.firstLevelBgImgV.userInteractionEnabled = YES;
    
    [self.firstLevelHeadPoritImgV addSubview:self.firstLevelBgImgV];

////
    self.firstLevelLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 , 80, 30)];
    self.firstLevelLb.text = @"请登录";
    self.firstLevelLb.font = [UIFont systemFontOfSize:16];
    self.firstLevelLb.textColor = [UIColor whiteColor];
    self.firstLevelLb.textAlignment = NSTextAlignmentCenter;
    
    [self.firstLevelBgImgV addSubview:self.firstLevelLb];
    
    
    
#pragma mark --------------------------------------- 金币
    ///金币
    self.goldBggImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15 + 100 + 10, 100, 30)];
    //self.goldBggImgV.backgroundColor = [UIColor clearColor];
    self.goldBggImgV.image = IMAGE(@"金币底框");
    
    self.goldBggImgV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.goldBggImgV];

    UITapGestureRecognizer *goldTapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goldImgggVVTaped)];
    [self.goldBggImgV addGestureRecognizer:goldTapp];
    

    self.goldImgV = [[UIImageView alloc] initWithFrame:CGRectMake(-5, 0, 30, 30)];
    //self.goldImgV.backgroundColor = [UIColor clearColor];
    self.goldImgV.image = IMAGE(@"金币first");
    
    self.goldImgV.userInteractionEnabled = YES;
    
    [self.goldBggImgV addSubview:self.goldImgV];
    
    
    self.goldLb = [[UILabel alloc] initWithFrame:CGRectMake(40 - 5, 0 , 60, 30)];
    self.goldLb.text = @"0";
    self.goldLb.font = [UIFont systemFontOfSize:17];
    self.goldLb.textColor = [UIColor whiteColor];
    self.goldLb.textAlignment = NSTextAlignmentLeft;
   
    [self.goldBggImgV addSubview:self.goldLb];

#pragma mark -------------------------------------- 签到按钮
    //签到
    self.qiandaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 95, 10, 90, 50)];
    //self.qiandaoBtn.backgroundColor = [UIColor clearColor];
    
    [self.qiandaoBtn setBackgroundImage:IMAGE(@"签到first") forState:UIControlStateNormal];
    
    [self.qiandaoBtn addTarget:self action:@selector(qiandaoBtnnnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.isPlayingBgV addSubview:self.qiandaoBtn];

    
#pragma mark ---------------------------------- 音乐播放动图
    
    self.firstPageMusicPlayingImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width - 55 - 100 , 20, 50, 30)];
    //self.firstPageMusicPlayingImgV.backgroundColor = [UIColor redColor];
    //self.firstPageMusicPlayingImgV.image = IMAGE(@"金币-图标");
    
    self.firstPageMusicPlayingImgV.userInteractionEnabled = YES;
    
    [self.isPlayingBgV addSubview:self.firstPageMusicPlayingImgV];
    
    UITapGestureRecognizer *tapppp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(firstPageMusicPlayingImgVTaped)];
    
    [self.firstPageMusicPlayingImgV addGestureRecognizer:tapppp];
    
    
    
//////////////////////////////////////////////////////
    
    
    
    
    
    ////////签到详情
    [self qiandaoBtnnnClicked];
    
    
    
#pragma mark 开始获取当前信息数据
    [self getUserInfo:YES];
    
    
    //[self.view addSubview:self.topHeaderView];
    
    
    //self.topHeaderView.hidden = YES;
    
    
    
    
    
    
    
    
    
    
}


#pragma mark ------------------------帮助页面 TableView
- (UITableView *)voiceHelppTableV
{
    if (_voiceHelppTableV == nil) {
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            _voiceHelppTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreen_Width, kScreen_Height/2 - 60 - 20 )];
            
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _voiceHelppTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreen_Width, kScreen_Height/2 - 60 - 20 )];
            
        } else  {
            
            _voiceHelppTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, kScreen_Width, kScreen_Height/2 - 60 - 40 )];
        }
        
        _voiceHelppTableV.backgroundColor = [UIColor clearColor];
        
        _voiceHelppTableV.dataSource = self;
        _voiceHelppTableV.delegate = self;
        
        _voiceHelppTableV.tableFooterView = [UIView new];
        
    }

    return _voiceHelppTableV;
}


///---------------------------------------------------
///---------------------------------------------------

#pragma mark ------------------------------聊天 TableView
- (void)addChatTableView
{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40 , kScreen_Width, kScreen_Height/2 - 60 - 40 ) style:UITableViewStylePlain];
    
    [self.voiceHelpBgV addSubview:tableView];
    
    self.chatTableView = tableView;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.chatTableView.tableFooterView = [UIView new];

    
}

#pragma mark ----------------- tableViewDelegate && dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.chatTableView) {
        //
        static NSString *strId = @"cellId";
        ZMChattTableViewCell *customCell=[tableView dequeueReusableCellWithIdentifier:strId];
        if (customCell==nil) {
            customCell=[[ZMChattTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
        }
        [customCell setBackgroundColor:[UIColor clearColor]];
        customCell.selectionStyle =UITableViewCellSelectionStyleNone;
        customCell.frameModel = self.chatDataArray[indexPath.row];
        
        return customCell;
        
    } else {
    
        static NSString *cellidd = @"cellId";
        
        ZMMainPageVoiceHelpPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidd];
        
        if (!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMMainPageVoiceHelpPageTableViewCell" owner:self options:nil] lastObject];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:[UIColor clearColor]];
        
        NSString *imgNameStr = [self.voiceHelpImgArray objectAtIndex:indexPath.section];
        NSString *titleStr = [self.voiceHelpTitleArray objectAtIndex:indexPath.section];
        NSString *contentStr = [self.voiceHelpContentArray objectAtIndex:indexPath.section];
        
        cell.helpImgV.image = [UIImage imageNamed:imgNameStr];
        cell.helpTitleLb.text = titleStr;
        
        cell.helpContentLb.textColor = RGB(100, 100, 100);
        cell.helpContentLb.text = contentStr;
        
        
            
        cell.helpContentLb.numberOfLines = 0;
        
        
        cell.eewaiLb.textColor = RGB(100, 100, 100);
        
        
        if (indexPath.section == 2) {
            
            cell.eewaiLb.text = @"“文字聊天”";
            
        }
        
        
        return cell;
        
    }
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.chatTableView) {
        return self.chatDataArray.count;
    } else {
    
        return 1;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ZMChatFrameeModel *frameModel = self.chatDataArray[indexPath.row];
//    return frameModel.cellHeight;
    
    if (tableView == self.chatTableView) {
        
        if (indexPath.row == 0) {
            
            return 0;
            
        } else {
            
            
            ZMChatFrameeModel *frameModel = self.chatDataArray[indexPath.row];
            return frameModel.cellHeight;
        
        }
        
        
    } else {
        
        return 60;
    }
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.voiceHelppTableV) {
        return 3;
    } else
        return 1;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)];
    sectionHeadBackgroundView.backgroundColor = [UIColor clearColor];
    return sectionHeadBackgroundView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}




#pragma mark -----------------------------------聊天接口信息

- (void)getRobitAndUsersNicknameAndPotirt
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
        
        [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"tuling/get_chat_user_info.php" theParmeters:parmeters sucess:^(id object) {
            //
            //NSLog(@"%@",object);
            NSString *status = (NSString *)[object objectForKey:@"status"];
            
            
            if ([status isEqualToString:@"0"] ) {
                //
                //解析数据
                NSDictionary *data = [object objectForKey:@"data"];
                //机器人
                NSDictionary *robot_avatar = [data objectForKey:@"robot_avatar"];
                self.robot_headPortaitStr = [robot_avatar objectForKey:@"path"];
                self.robot_nicknameStr = [data objectForKey:@"robot_nickname"];
                self.robot_wantedNameStr  = [data objectForKey:@"robot_wanted_name"];
                
                //NSLog(@"robot_____________1%@______2%@________3%@",self.robot_headPortaitStr,self.robot_nicknameStr,self.robot_wantedNameStr);
                
                //用户
                NSDictionary *user_avatar = [data objectForKey:@"user_avatar"];
                self.user_headPortaitStr = [user_avatar objectForKey:@"path"];
                self.user_nicknameStr = [data objectForKey:@"user_nickname"];
                
                NSLog(@"user_________1%@________2%@",self.user_headPortaitStr,self.user_nicknameStr);
                
                [APPTransmit shareInstance].userHeadPortaitStr = self.user_headPortaitStr;
                
                
                
                
                
            }
            
            
        } error:^(NSError *error) {
            //
            NSLog(@"%@",error);
        }];
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
}



#pragma mark ------------------------------图灵机器人
#pragma mark -----------------------------语音聊天
- (void)chatWithRobott
{
    NSLog(@"聊天:%@",self.voiceRecoLb.text);
    
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if (self.voiceRecoLb.text == nil || self.voiceRecoLb.text == NULL || [self.voiceRecoLb.text isKindOfClass:[NSNull class]]) {
            
            
        }else {
            
            //字典这么初始化的话 如果有任何一个 value 为 空 就会直接崩掉
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign, @"word":self.voiceRecoLb.text , @"loc":@"河南省郑州市管城区"};
            //@"loc":@"河南省郑州市管城区"
            
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"tuling/chat_robot.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"%@",object);
                
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    self.robot_chatStrr = [data objectForKey:@"text"];
                    
                    NSLog(@"chat:%@",self.robot_chatStrr);
                    
                    
                    NSString *nickStrt = [NSUserDefaults standardUserDefaults].robot_Nickname;
                    
                    
                    if ([self.voiceRecoLb.text isEqualToString:@"点歌"] || [self.voiceRecoLb.text isEqualToString:@"打开点歌"]) {
                        //
                        [self robotSendMess:@"请说出歌手名或歌曲名"];
                        //[CLSpeechSynthesizer playVoice:@"请说出歌手名或歌曲名"];//语音播报
                        
                        //[[ZRRSpeechSynthesizer sharedSpeechInstance] startSpeechText:@"请说出歌手名或歌曲名"];
                        
                        [_iFlySpeechSynthesizer startSpeaking:@"请说出歌手名或歌曲名"];
                        
                        
                        self.firstPageSearchSongg = @"歌手名或歌曲名";
                        

                        
                    } else if ([self.firstPageSearchSongg isEqualToString:@"歌手名或歌曲名"]) {
                    
                        [APPTransmit shareInstance].textSearchSongStr = self.voiceRecoLb.text;
                        
                        ZMSearrchSonggViewController *textSearch = [ZMSearrchSonggViewController shareZMSearrchSonggViewController];
                        
                        [self.navigationController pushViewController:textSearch animated:YES];

                        
                        
                    
                    } else if ([self.voiceRecoLb.text isEqualToString:@"闹钟"] || [self.voiceRecoLb.text isEqualToString:@"打开闹钟"] || [self.voiceRecoLb.text isEqualToString:@"打开天气"]) {
                        
                        return ;
                        
                        
                    } else {
                    
                        if ([self.robot_chatStrr isEqualToString:@"我是棒棒哒图灵机器人"] || [self.robot_chatStrr isEqualToString:@"我是图灵机器人呀，难道你不认识我了么？"] || [self.robot_chatStrr isEqualToString:@"我叫图灵机器人，活泼可爱的图灵机器人"] || [self.robot_chatStrr isEqualToString:@"听好了, 我叫图灵机器人"] || [self.robot_chatStrr isEqualToString:@"我是图灵机器人，棒棒哒图灵机器人"] || [self.robot_chatStrr isEqualToString:@"我可是人见人爱的图灵机器人呢，你竟然不认识我"]) {
                            
                            if (nickStrt == nil || nickStrt == NULL || [nickStrt isKindOfClass:[NSNull class]]) {
                                
                                [self robotSendMess:@"我是棒棒哒星伴聊天机器人"];
                                
                                //[CLSpeechSynthesizer playVoice:@"我是棒棒哒星伴聊天机器人"];//语音播报
                                //[[ZRRSpeechSynthesizer sharedSpeechInstance] startSpeechText:@"我是棒棒哒星伴聊天机器人"];
                                
                                
                                [_iFlySpeechSynthesizer startSpeaking:@"我是棒棒哒星伴聊天机器人"];
                                
                                
                            }else {
                                
                                [self robotSendMess:[NSString stringWithFormat:@"我是你的%@啊",nickStrt]];
                                
                                //[CLSpeechSynthesizer playVoice:[NSString stringWithFormat:@"我是你的%@啊",nickStrt]];//语音播报
                                
                                //[[ZRRSpeechSynthesizer sharedSpeechInstance] startSpeechText:[NSString stringWithFormat:@"我是你的%@啊",nickStrt]];
                                
                                
                                [_iFlySpeechSynthesizer startSpeaking:[NSString stringWithFormat:@"我是你的%@啊",nickStrt]];
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                        } else if ([self.voiceRecoLb.text isEqualToString:@"几点了"] || [self.voiceRecoLb.text isEqualToString:@"几点啦"] || [self.voiceRecoLb.text isEqualToString:@"报时"]) {
                            
                            
                            [self getNowDatee];
                            
                            
                        } else if ([self.voiceRecoLb.text isEqualToString:@"文字聊天"] ){
                    
                            return ;
                        
                        } else {
                            
                            
                            //发送文字
                            [self robotSendMess:self.robot_chatStrr];
                            
                            
                            //说出来
                            //[CLSpeechSynthesizer playVoice:self.robot_chatStrr];//语音播报
                            
                            //[[ZRRSpeechSynthesizer sharedSpeechInstance] startSpeechText:self.robot_chatStrr];
                            
                            //启动合成会话(科大讯飞)
                            [_iFlySpeechSynthesizer startSpeaking:self.robot_chatStrr];
                            
                        }

                    
                    
                    }
                    
                    
                }
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];
            
            
            
        }
        
        
        
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
    
}



#pragma mark ------------------------------发送消息,刷新数据

- (void)robotSendMess:(NSString *)messValues
{
    
    
    /*
     *机器人(对方)
     **/
    
    
    
    //获取当前的时间
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *forMatter=[[NSDateFormatter alloc]init];
    forMatter.dateFormat=@"HH:mm"; //小时和分钟
    NSString *nowTime = [forMatter stringFromDate:nowdate];
    
    
    
    NSMutableDictionary *dicAuto = [NSMutableDictionary dictionary];
    //dicAuto[@"imageName"] = @"girl.jpeg";
    dicAuto[@"desc"] = messValues;
    
    dicAuto[@"time"] = nowTime;
    dicAuto[@"person"] = [NSNumber numberWithBool:0]; //转为Bool类型
    ZMChatModell *messAuto = [[ZMChatModell alloc]initWithModel:dicAuto];
    ZMChatFrameeModel *frameModelAuto = [ZMChatFrameeModel modelFrame:messAuto timeIsEqual:[self timeIsEqual:nowTime]];//判断前后时候是否一致
    [self.chatDataArray addObject:frameModelAuto];
    [self.chatTableView reloadData];
    
    
    NSIndexPath *path = [NSIndexPath indexPathForItem:self.chatDataArray.count-1 inSection:0];
    [self.chatTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
    
    
    
    
}




- (void)sendMess:(NSString *)messValues
{
    //添加一个数据模型(并且刷新表)
    //获取当前的时间
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *forMatter=[[NSDateFormatter alloc]init];
    forMatter.dateFormat=@"HH:mm"; //小时和分钟
    NSString *nowTime = [forMatter stringFromDate:nowdate];
    
    
    
    /*
     *用户(我)
     **/
    
    
    NSMutableDictionary *dicValues = [NSMutableDictionary dictionary];
    
    
    
    
    
    
    //dicValues[@"imageName"] = imgName;
    
    dicValues[@"desc"] = messValues;
    dicValues[@"time"] = nowTime; //当前的时间
    dicValues[@"person"] = [NSNumber numberWithBool:1]; //转为Bool类型
    ZMChatModell *mess = [[ZMChatModell alloc] initWithModel:dicValues];
    ZMChatFrameeModel *frameModel = [ZMChatFrameeModel modelFrame:mess timeIsEqual:[self timeIsEqual:nowTime]]; //判断前后时候是否一致
    [self.chatDataArray addObject:frameModel];
    [self.chatTableView reloadData];
    
    
    
    
    /*
     *机器人(对方)
     **/
    
    
    NSIndexPath *path = [NSIndexPath indexPathForItem:self.chatDataArray.count-1 inSection:0];
    [self.chatTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
    
    
}





#pragma mark ------------------------------------聊天数据

- (NSMutableArray *)chatDataArray{
    if (_chatDataArray == nil) {
        _chatDataArray = [NSMutableArray array];
    }
    return _chatDataArray;
}

-(void)getModelChatArray{
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"dataPlist" ofType:@"plist"];//得到Plist文件里面的数据
    NSArray *arrData=[NSArray arrayWithContentsOfFile:strPath];
    for (NSDictionary *dicData in arrData) {
        ZMChatModell *model=[[ZMChatModell alloc]initWithModel:dicData]; //将数据转为模型
        
        BOOL isEquel;
        if(self.chatDataArray){
            isEquel=[self timeIsEqual:model.time];//判断上一个模型数据里面的时间是否和现在的时间相等
        }
        ZMChatFrameeModel *frameModel=[[ZMChatFrameeModel alloc]initWithFrameModel:model timeIsEqual:isEquel];//将模型里面的数据转为Frame,并且判断时间是否相等
        [self.chatDataArray addObject:frameModel];//添加Frame的模型到数组里面
    }
}

#pragma mark 判断前后时间是否一致
- (BOOL)timeIsEqual:(NSString *)comStrTime{
    ZMChatFrameeModel *frame=[self.chatDataArray lastObject];
    NSString *strTime=frame.dataModel.time; //frame模型里面的NSString时间
    if ([strTime isEqualToString:comStrTime]) { //比较2个时间是否相等
        return YES;
    }
    return NO;
}




///---------------------------------------------------
///---------------------------------------------------


#pragma mark -------------用户点击签到按钮后获取到的签到的详细情况

- (void)getUserCheckkInInfo
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
        
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_check_in_info.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"签到的详细情况 ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    NSInteger can_check_in_today = [[data objectForKey:@"can_check_in_today"] integerValue];////0 不可以签到  1 可以

                    
                    NSString *can_check_in_todayStrr = [NSString stringWithFormat:@"%ld",(long)can_check_in_today];
                    
                                                        
                                                        
                    NSInteger check_in_continus = [[data objectForKey:@"check_in_continus"] integerValue];//连续签到的天数
                    
                    NSString *continueStrrr = [NSString stringWithFormat:@"%ld",(long)check_in_continus];
                    
                    
                    NSLog(@"今天能否签到________%@",can_check_in_todayStrr);
                    
                    NSLog(@"连续签到的天数________%@",continueStrrr);
                    
                    
                    
                    //已经完成签到 1 天
//                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"1"]) {
//                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
//                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"1"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        
                        
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                        [self.qianCloceBtn2 setTitle:@"关 闭" forState:UIControlStateNormal];
                        [self.qianCloceBtn2 addTarget:self action:@selector(qianCloceBtn1Clicked) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"1"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        //第二天可以签
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                    }
                    
                    ////////////第二天
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"2"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                        
                        [self.qianCloceBtn2 setTitle:@"关 闭" forState:UIControlStateNormal];
                        [self.qianCloceBtn2 addTarget:self action:@selector(qianCloceBtn1Clicked) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }

                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"2"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //第三天可以签
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                    }

                    
                    ////////////第三天
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"3"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                        
                        [self.qianCloceBtn2 setTitle:@"关 闭" forState:UIControlStateNormal];
                        [self.qianCloceBtn2 addTarget:self action:@selector(qianCloceBtn1Clicked) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"3"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        //第4天可以签
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                    }

                    
                    ////////////第4天
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"4"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                        
                        [self.qianCloceBtn2 setTitle:@"关 闭" forState:UIControlStateNormal];
                        [self.qianCloceBtn2 addTarget:self action:@selector(qianCloceBtn1Clicked) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"4"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        //第5天可以签
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                    }

                    ////////////第5天
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"5"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        [self.weekImgVDay5 addSubview:self.weekImgVzhe5];
                        
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                        
                        [self.qianCloceBtn2 setTitle:@"关 闭" forState:UIControlStateNormal];
                        [self.qianCloceBtn2 addTarget:self action:@selector(qianCloceBtn1Clicked) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"5"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        [self.weekImgVDay5 addSubview:self.weekImgVzhe5];
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        //第6天可以签
                        
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                    }

                    
                    ////////////第6天
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"6"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        [self.weekImgVDay5 addSubview:self.weekImgVzhe5];
                        [self.weekImgVDay6 addSubview:self.weekImgVzhe6];
                        
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        
                        //self.weekImgVDay7.userInteractionEnabled = NO;
                        
                        
                        
                        [self.qianCloceBtn2 setTitle:@"关 闭" forState:UIControlStateNormal];
                        [self.qianCloceBtn2 addTarget:self action:@selector(qianCloceBtn1Clicked) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"6"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        [self.weekImgVDay5 addSubview:self.weekImgVzhe5];
                        [self.weekImgVDay6 addSubview:self.weekImgVzhe6];
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //第7天可以签

                        
                        
                    }

                    ////////////第7天
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"7"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        [self.weekImgVDay5 addSubview:self.weekImgVzhe5];
                        [self.weekImgVDay6 addSubview:self.weekImgVzhe6];
                        [self.weekImgVDay7 addSubview:self.weekImgVzhe7];
                        
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //
                        
                        
                        [self.qianCloceBtn2 setTitle:@"关 闭" forState:UIControlStateNormal];
                        [self.qianCloceBtn2 addTarget:self action:@selector(qianCloceBtn1Clicked) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"7"]) {
                        
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        [self.weekImgVDay5 addSubview:self.weekImgVzhe5];
                        [self.weekImgVDay6 addSubview:self.weekImgVzhe6];
                        [self.weekImgVDay7 addSubview:self.weekImgVzhe7];
                        
                        
                        self.weekImgVDay1.userInteractionEnabled = NO;
                        self.weekImgVDay2.userInteractionEnabled = NO;
                        //self.weekImgVDay3.userInteractionEnabled = NO;
                        self.weekImgVDay4.userInteractionEnabled = NO;
                        self.weekImgVDay5.userInteractionEnabled = NO;
                        
                        self.weekImgVDay6.userInteractionEnabled = NO;
                        //第7天可以签
                        
                        
                        
                    }

                    
                    
                }
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];

        
        
        }
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    



}

#pragma mark ---------------------------------签到配置
- (void)getCheckInUserrCfg
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            NSLog(@"9/30 签到配置:userid____________ %@",[ZMUserInfo sharedUserInfo].user_id);
            NSLog(@"9/30 签到配置:sign____________ %@",[ZMUserInfo sharedUserInfo].sign);
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"interactive/get_check_in_cfg.php" theParmeters:parmeters sucess:^(id object) {
                //
               
                
                NSLog(@"9/30 签到配置:____________ %@",object);
                
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    //NSArray *data = [object objectForKey:@"data"];
                    
                    
                    self.cfgMuArray = [ZMCheckinConfiiggModel parseRespondsCheckinConfiiggData:object];
                    
                    NSLog(@"9/30 签到配置: %@",self.cfgMuArray);
                    
                    
                    
                }
                
                
                
           
                
                
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];

            
        }
        
  
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    




}

#pragma mark ---------------------------------请求签到数据


- (void)getQiandaooUserCheeckInData
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
        
        
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/user_check_in.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"签到user_check_in____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    NSInteger add_num = [[data objectForKey:@"add_num"] integerValue];//获得的金币
                    NSInteger check_in_cotinus = [[data objectForKey:@"check_in_cotinus"] integerValue];//连续签到的天数
                    
                    //获得的金币数
                    NSString *addnumber = [NSString stringWithFormat:@"%ld",(long)add_num];
                    
                    NSString *continueStr = [NSString stringWithFormat:@"%ld",(long)check_in_cotinus];
                    
                    
                    
                    NSLog(@"9/30   获得的金币  %@",addnumber);
                    
                    
                    
                    if ([continueStr isEqualToString:@"1"]) {
                        
                        
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+1500" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                       
                        [self.weekImgVDay1 addSubview:self.weekImgVzhe1];
                        
                        
                        
                        
                       /////开始动画
                        //[self beginGoldLbAnimation];
                        
                        
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        [self getUserCheckkInInfo];//重新获取签到情况 刷新界面
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    if ([continueStr isEqualToString:@"2"]) {
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+1600" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                        [self.weekImgVDay2 addSubview:self.weekImgVzhe2];
                        
                        
                        
                        
                        //self.annimationGoldLb.frame = CGRectMake(30 + 50, 260, 100, 30);
                        
                        //self.annimationGoldLb.text = @"+50金币";
                        
                        //[self beginGoldLbAnimation];
                        
                        
                        
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        
                        [self getUserCheckkInInfo];//重新获取签到情况
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    if ([continueStr isEqualToString:@"3"]) {
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+1700,电影票+1" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        
                        [self getUserCheckkInInfo];//重新获取签到情况
                        
                        
                    }

                    if ([continueStr isEqualToString:@"4"]) {
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+1800" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                        [self.weekImgVDay4 addSubview:self.weekImgVzhe4];
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        
                        [self getUserCheckkInInfo];//重新获取签到情况
                        
                        
                    }

                    
                    if ([continueStr isEqualToString:@"5"]) {
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+1900" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                        [self.weekImgVDay5 addSubview:self.weekImgVzhe5];
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        
                        [self getUserCheckkInInfo];//重新获取签到情况
                        
                        
                    }

                    
                    if ([continueStr isEqualToString:@"6"]) {
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+2000" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                        [self.weekImgVDay6 addSubview:self.weekImgVzhe6];
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        
                        [self getUserCheckkInInfo];//重新获取签到情况
                        
                        
                    }

                    if ([continueStr isEqualToString:@"7"]) {
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+2100,钻戒+1" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                        [self.weekImgVDay7 addSubview:self.weekImgVzhe7];
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        
                        [self getUserCheckkInInfo];//重新获取签到情况
                        
                        
                    }

                    
                    
                }
                
                
                
                
                
                
        
                
                if ([status isEqualToString:@"3"] ) {
                    //
                    //[AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                    
                    //self.weekImgVzhe2.hidden =  YES;
                }
                
                
            
                
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];
        
        }
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }

    
}




#pragma mark ----------------------------------第3 7 天 签到


- (void)getCheckinThreeSevenDayData
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/user_check_in.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"签到user_check_in____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    //NSInteger add_num = [[data objectForKey:@"add_num"] integerValue];//获得的金币
                    NSInteger check_in_cotinus = [[data objectForKey:@"check_in_cotinus"] integerValue];//连续签到的天数
                    
                    //获得的金币数
                    //NSString *addnumber = [NSString stringWithFormat:@"%ld",(long)add_num];
                    
                    NSString *continueStr = [NSString stringWithFormat:@"%ld",(long)check_in_cotinus];
                    
                    
                    
                    if ([continueStr isEqualToString:@"3"]) {
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+80,加电影票一份" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                        [self.weekImgVDay3 addSubview:self.weekImgVzhe3];
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        
                        [self getUserCheckkInInfo];//重新获取签到情况
                        
                        
                    }
                    
                    
                    if ([continueStr isEqualToString:@"7"]) {
                        [AnyObjectActivityView showWithTitle:@"签到成功,金币+200,加送钻戒一个" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                        [self.weekImgVDay7 addSubview:self.weekImgVzhe7];
                        
                        
                        //[self getUserSomeInfom];//刷新界面   金币数重新显示
                        [self getFirstPageUserInfomation];
                        
                        
                        [self getUserCheckkInInfo];//重新获取签到情况
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                
                
                if ([status isEqualToString:@"3"] ) {
                    //
                    [AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                    
                    //self.weekImgVzhe2.hidden =  YES;
                }
                
                
                
                
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];
            
        }
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
    
}


- (void)threeSevenDayCheckIn
{

    [self getCheckinThreeSevenDayData];

}




#pragma mark ---------------------------------------点击签到
- (void)weekday111Taped
{
    //点击签到
    [self getQiandaooUserCheeckInData];


}


- (void)weekday222Taped
{
    //点击签到
    [self getQiandaooUserCheeckInData];
    
    
    
}


- (void)weekday333Taped
{
   // NSLog(@"第3天");
    
    self.chenckInBgV2.hidden = YES;
    
    if (_isClicked == NO) {
        
        self.chenckInBgV.hidden = NO;
        
        [self.chenckInBgV.layer addSublayer:self.giftShapeLayer];

        
        _isClicked = YES;
        
    }else {
        
        self.chenckInBgV.hidden = YES;
        
        [self.giftShapeLayer removeFromSuperlayer];
        
        _isClicked = NO;
        
    }
    
    
    
}

- (void)weekday444Taped
{
    [self getQiandaooUserCheeckInData];
    
}

- (void)weekday555Taped
{
    
    [self getQiandaooUserCheeckInData];
}


- (void)weekday666Taped
{
    [self getQiandaooUserCheeckInData];
    
}


- (void)weekday777Taped
{
    //NSLog(@"第7天");
    
    self.chenckInBgV.hidden = YES;
    
    if (_isClicked == NO) {
        
        self.chenckInBgV2.hidden = NO;
        
        [self.chenckInBgV2.layer addSublayer:self.giftShapeLayer2];
        
        
        _isClicked = YES;
        
    }else {
        
        self.chenckInBgV2.hidden = YES;
        
        [self.giftShapeLayer2 removeFromSuperlayer];
        
        _isClicked = NO;
        
    }
    
    
}


#pragma mark --------------------------------------粒子动画

/**
 *  开始动画
 */
- (void)beginGoldLbAnimation
{
//    __weak typeof(self)bself = self;
//    
//    self.annimationGoldLb.hidden = NO;
//    
//    [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:5 options:UIViewAnimationOptionCurveLinear animations:^{
//        CABasicAnimation * effectAnimation = [CABasicAnimation animationWithKeyPath:@"emitterCells.zanShape.birthRate"];
//        effectAnimation.fromValue = [NSNumber numberWithFloat:30];
//        effectAnimation.toValue = [NSNumber numberWithFloat:0];
//        effectAnimation.duration = 0.0f;
//        effectAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//        [bself.goldLbEmitterLayer addAnimation:effectAnimation forKey:@"zanCount"];
//        //放大动画
//        {
//            CABasicAnimation * aniScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//            aniScale.fromValue = [NSNumber numberWithFloat:0.5];
//            aniScale.toValue = [NSNumber numberWithFloat:3.0];
//            aniScale.duration = 1.5;
//            aniScale.delegate = self;
//            aniScale.removedOnCompletion = NO;
//            aniScale.repeatCount = 1;
//            [bself.annimationGoldLb.layer addAnimation:aniScale forKey:@"babyCoin_scale"];
//        }
//    } completion:^(BOOL finished) {
//        
//    }];
    
    
}
/**
 *  动画结束代理方法
 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [self.annimationGoldLb.layer animationForKey:@"babyCoin_scale"]) {
        [self babyCoinFadeAway];
    }
    if (anim == [self.annimationGoldLb.layer animationForKey:@"aniMove_aniScale_groupAnimation"]) {
        self.annimationGoldLb.hidden = YES;
        
    }
}
/**
 *  金币散开结束后文字下落动画
 */
- (void)babyCoinFadeAway
{
//    CGFloat aPPW = 30;
//    CGFloat aPPH = 35;
//    CABasicAnimation * aniMove = [CABasicAnimation animationWithKeyPath:@"position"];
//    aniMove.fromValue = [NSValue valueWithCGPoint:self.annimationGoldLb.layer.position];
//    
//    aniMove.toValue = [NSValue valueWithCGPoint:CGPointMake(aPPW, aPPH)];
//    
//    CABasicAnimation * aniScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    aniScale.fromValue = [NSNumber numberWithFloat:3.0];
//    aniScale.toValue = [NSNumber numberWithFloat:0.5];
//    
//    CAAnimationGroup * aniGroup = [CAAnimationGroup animation];
//    aniGroup.duration = 1.0;
//    aniGroup.repeatCount = 1;
//    aniGroup.delegate = self;
//    aniGroup.animations = @[aniMove,aniScale];
//    aniGroup.removedOnCompletion = NO;
//    //    aniGroup.fillMode = kCAFillModeForwards;  //防止动画结束后回到原位
//    [self.annimationGoldLb.layer removeAllAnimations];
//    [self.annimationGoldLb.layer addAnimation:aniGroup forKey:@"aniMove_aniScale_groupAnimation"];
//    
}







#pragma mark --------------------------------------底部进度条
- (void)addBottomProgressLbb
{
    //
    
//    _lineProgressV = [[CWProgressView alloc] initWithFrame:CGRectMake(20, 90, kScreen_Width - 40, 5)];
//    _lineProgressV.type = NZProgressTypeDefault;
//    _lineProgressV.textColor = [UIColor redColor];
//    _lineProgressV.progress = 0;
//    _lineProgressV.progressColor = RGB(235, 84, 129);
//    //_lineProgressV.alpha = 0.8;
//    
//    //[self.bottomAllBgV addSubview:_lineProgressV];
//
//    _love_val = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, kScreen_Width - 60, 20)];
//     _love_val.backgroundColor = [UIColor clearColor];
//    [_love_val setFont:[UIFont boldSystemFontOfSize:13.0]];
//    _love_val.text = [NSString stringWithFormat:@"亲密值: 0/0"];
//    
//    [_love_val setTextAlignment:NSTextAlignmentLeft];
//    [_love_val setTextColor:[UIColor whiteColor]];
//    
    //[self.bottomAllBgV addSubview:_love_val];






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


#pragma mark --------------------------------------背景图片
- (ZMImageView *)zmBackgroundImageView
{
    if (_zmBackgroundImageView == nil)
    {
        _zmBackgroundImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
       
        //[_zmBackgroundImageView setImage:[UIImage imageNamed:@"场景"]];疯狂动物城-场景
        [_zmBackgroundImageView setImage:[UIImage imageNamed:@"动物城-场景xiu.jpg"]];
        _zmBackgroundImageView.userInteractionEnabled = YES;
        
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
        //_gameView = [[GameView alloc]initWithFrame:CGRectMake(0, kScreen_Height-120, kScreen_Width, 120) setDeletage:self];
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





///////////////////////////////////////////////////////



#pragma mark ---------------------------- 设置合成参数
- (void)initSpeakTexttSynthesizer
{
//
    
    //通过appid连接讯飞语音服务器，把@"53b5560a"换成你申请的appid
    NSString *initString = [NSString stringWithFormat:@"%@=%@", [IFlySpeechConstant APPID], @"57aadd69"];

    //所有服务启动前，需要确保执行createUtility
    [IFlySpeechUtility createUtility:initString];
    
    //创建合成对象，为单例模式
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    _iFlySpeechSynthesizer.delegate = self;
    
    //设置语音合成的参数
    //合成的语速,取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant SPEED]];
    //合成的音量;取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant VOLUME]];
    //发音人,默认为”xiaoyan”;可以设置的参数列表可参考个性化发音人列表
    
    
    NSString *speaker = [NSUserDefaults standardUserDefaults].speaker_Namee;
    
    
    if (speaker == nil || speaker == NULL || [speaker isKindOfClass:[NSNull class]]) {
        
        [_iFlySpeechSynthesizer setParameter:@"xiaoyu" forKey:[IFlySpeechConstant VOICE_NAME]];//
        
    } else {
        
        [_iFlySpeechSynthesizer setParameter:speaker forKey:[IFlySpeechConstant VOICE_NAME]];//
        
        
        //[_iFlySpeechSynthesizer setParameter:@"vixx" forKey:[IFlySpeechConstant VOICE_NAME]];//
        
        
    }
    
    
    //音频采样率,目前支持的采样率有 16000 和 8000
    [_iFlySpeechSynthesizer setParameter:@"8000" forKey:[IFlySpeechConstant SAMPLE_RATE]];
    ////asr_audio_path保存录音文件路径，如不再需要，设置value为nil表示取消，默认目录是documents
    [_iFlySpeechSynthesizer setParameter:@"tts.pcm" forKey:[IFlySpeechConstant TTS_AUDIO_PATH]];
    
    
    
    
    
    
    NSLog(@"说话人姓名___%@",speaker);
    
}











#pragma mark -----------------------------配置语音识别
- (void)setupSpeechRecognizer
{
    NSString *initString = [NSString stringWithFormat:@"%@=%@", [IFlySpeechConstant APPID], @"57aadd69"];
    
    [IFlySpeechUtility createUtility:initString];
    _iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.voiceHelpBgV.center];
    _iflyRecognizerView.alpha = 0;
    //_iflyRecognizerView.hidden = YES;
    
    _iflyRecognizerView.delegate = self;
    
    [_iflyRecognizerView setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
    [_iflyRecognizerView setParameter:@"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    [_iflyRecognizerView setParameter:@"plain" forKey:[IFlySpeechConstant RESULT_TYPE]];
    
    [_iflyRecognizerView setParameter:@"0" forKey:[IFlySpeechConstant ASR_PTT]];///标点符号


}


#pragma mark--------------------------------开始语音识别
- (void)startListenning
{
    [_iflyRecognizerView start];
    NSLog(@"start listenning...");
    
    
    
    //开始动画
    //_animationTimer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(startAnimationnn) userInfo:nil repeats:YES];
    //[[NSRunLoop mainRunLoop] addTimer:_animationTimer forMode:NSDefaultRunLoopMode];
    
    //[self recordStartQQAnimationStart];
    
    
    [self startImageViewAnimationg];
    
    
}




/**
 音量回调函数
 volume 0－30
 ****/
- (void) onVolumeChanged: (int)volume
{
    
    //NSString * vol = [NSString stringWithFormat:@"音量：%d",volume];
    
    
    //self.volume = volume;
    
}




#pragma mark ---------------------------------语音识别结果

- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:@"%@", key];
    }
    
    self.voiceRecoLb.text = [NSString stringWithFormat:@"%@%@", self.voiceRecoLb.text, result];
    
    self.voiceStrr = [NSString stringWithFormat:@"%@%@", self.voiceRecoLb.text, result];
    
    
    //[self recordFinishQQAnimationFinish];/////结束动画
    [self.annimationImageV stopAnimating];
    
    
    self.annimationImageV.hidden = YES;
    self.voiceeBtn.hidden = NO;//语音按钮
    self.voiceHelpBtn.hidden = NO;
    

    
    if (self.voiceRecoLb.text.length > 1) {
        //
        [_iflyRecognizerView cancel];//取消本次识别
        
    }
    
    
    
    
///---------------------------------------------------
///---------------------------------------------------
    
    

    if (self.voiceRecoLb.text.length > 1) {
        //
        
        [self sendMess:[NSString stringWithFormat:@"“%@”",self.voiceRecoLb.text]]; //发送信息
        
        
        [self chatWithRobott];//和机器人聊天

    }else {
    
        
    }
    
    
    
///---------------------------------------------------
///---------------------------------------------------
    
//    if ([self.voiceRecoLb.text rangeOfString:@"几点"].location == NSNotFound) {
//        //
//    }else {
//    
//        [self getNowDatee];
//    }
//    
//    
//    
//    if ([self.voiceRecoLb.text isEqualToString:@"报时"] || [self.voiceRecoLb.text isEqualToString:@"几点了"] || [self.voiceRecoLb.text isEqualToString:@"几点啦"] ) {
//        
//        [self getNowDatee];
//    }
    
    
    
    
//    if ([self.voiceRecoLb.text rangeOfString:@"天气"].location == NSNotFound) {
//        //
//    }else {
//        
//        //[self getNowWeather];
//    }
//    
//    
//    
//    if ([self.voiceRecoLb.text isEqualToString:@"天气"] || [self.voiceRecoLb.text isEqualToString:@"今天天气怎样"]) {
//        [self getNowWeather];
//    }
    
    
    
//    if ([self.voiceRecoLb.text rangeOfString:@"打开天气"].location == NSNotFound) {
//        //
//    }else {
//        
//        
//        
//    }
    
    
    //([self.voiceRecoLb.text rangeOfString:@"打开天气"].location != NSNotFound)
    if ([self.voiceRecoLb.text isEqualToString:@"打开天气"] ) {
        
        
        [self.weatherViewController startGetWeatherWithSuperViewController:self];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.navigationController pushViewController:self.weatherViewController animated:YES];
        });
        
        

    }

    
    
    //
    if ([self.voiceRecoLb.text isEqualToString:@"闹钟"] || [self.voiceRecoLb.text isEqualToString:@"打开闹钟"] || ([self.voiceRecoLb.text rangeOfString:@"闹钟"].location != NSNotFound) ) {
        
        
        NSString *imgStr = [NSUserDefaults standardUserDefaults].clockListHeadPoritStr;
        
        if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
            
            
            [NSUserDefaults standardUserDefaults].clockTiShiiStt = @"一次";
            
            
            ZMCLockChooseLoveDouViewController *chooose = [[ZMCLockChooseLoveDouViewController alloc] init];
            chooose.titleeLb.text = @"选择爱豆叫你起床";
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
               
                [self.navigationController pushViewController:chooose animated:YES];
                
                
                
                
            });

            
            
            
        } else {
            
            ZMClockViewController *clock = [ZMClockViewController sharedZMClockViewController];
            
            clock.titleeLb.text = @"闹钟列表";
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.navigationController pushViewController:clock animated:YES];
            });
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    if ([self.voiceRecoLb.text isEqualToString:@"文字聊天"] || ([self.voiceRecoLb.text rangeOfString:@"文字聊天"].location != NSNotFound) ) {
        
        //[self saveImgaeViewwTaped];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //
            ZMChatMainnViewController *chatVC = [[ZMChatMainnViewController alloc] init];
            
            chatVC.titleeLb.text = @"聊天";
            
            [self.navigationController pushViewController:chatVC animated:YES];
            
        });
        
        
    }
    
    
    
}




- (void)onError:(IFlySpeechError *)errorr
{
    
    NSLog(@"errorCode:%@", [errorr errorDesc]);
   
    
    NSLog(@"识别结果 ****** %@",self.voiceStrr);
    
    
    [self.annimationImageV stopAnimating];
    
    
    self.annimationImageV.hidden = YES;
    self.voiceeBtn.hidden = NO;//语音按钮
    self.voiceHelpBtn.hidden = NO;
    
    
    if (self.voiceRecoLb.text.length > 1) {
        //
        
    } else {
    
        //发送文字
        [self robotSendMess:@"抱歉,我听不清楚你说了什么."];
        //[[ZRRSpeechSynthesizer sharedSpeechInstance] startSpeechText:@"抱歉,我听不清楚你说了什么."];
        [_iFlySpeechSynthesizer startSpeaking:@"抱歉,我听不清楚你说了什么."];

    }
    
    
    
    NSLog(@"识别 ______%@",self.voiceRecoLb.text);
    
    
    
}




#pragma mark --------------------音乐播放 uiimageView 帧动画

- (void)startPlayigMusiccImageViewAnimation
{
    NSMutableArray *imagesArray = [NSMutableArray array];
    
    //加载全部图片，并放入数组中
    for (int i = 1; i<5; i++) {
        
        NSString *sting = [NSString stringWithFormat:@"mus音频%d",i];
        
        UIImage *image = [UIImage imageNamed:sting];
        
        [imagesArray addObject:image];
        
        /*图片量比较大的时候
         NSString *name = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
         
         UIImage *image = [UIImage imageWithContentsOfFile:name];*/
        
    }
    
    //设置动画图片
    self.firstPageMusicPlayingImgV.animationImages = imagesArray;
    
    //设置播放时长  1秒30帧, 一张图片的时间 = 1/30 = 0.03333 总耗时20 * 0.0333
    self.firstPageMusicPlayingImgV.animationDuration = 1.0f;
    
    //默认为0，无限播放
    self.firstPageMusicPlayingImgV.animationRepeatCount = 0;
    
    //开始播放
    [self.firstPageMusicPlayingImgV startAnimating];
    
    
    
}




#pragma mark ------------------语音识别 uiimageView 帧动画

- (void)startImageViewAnimationg
{
    NSMutableArray *imagesArray = [NSMutableArray array];
    
    //加载全部图片，并放入数组中
    for (int i = 1; i<5; i++) {
        
        NSString *sting = [NSString stringWithFormat:@"音频动画%d",i];
        
        UIImage *image = [UIImage imageNamed:sting];
        
        [imagesArray addObject:image];
        
        /*图片量比较大的时候
         NSString *name = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
         
         UIImage *image = [UIImage imageWithContentsOfFile:name];*/
        
    }
    
    //设置动画图片
    self.annimationImageV.animationImages = imagesArray;
    
    //设置播放时长  1秒30帧, 一张图片的时间 = 1/30 = 0.03333 总耗时20 * 0.0333
    self.annimationImageV.animationDuration = 1.0f;
    
    //默认为0，无限播放
    self.annimationImageV.animationRepeatCount = 0;
    
    //开始播放
    [self.annimationImageV startAnimating];
    

}



///////////////////////////////////////////语音识别动画

//#pragma mark ----------------------------开始 QQ 语音动画
//- (void)recordStartQQAnimationStart
//{
//    
//    self.voiceeBtn.hidden = YES;////隐藏语音按钮
//    _spectrumView.hidden = NO;
//    
//    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
//    {
//        //7.0第一次运行会提示，是否允许使用麦克风
//        AVAudioSession *session = [AVAudioSession sharedInstance];
//        NSError *sessionError;
//        //AVAudioSessionCategoryPlayAndRecord用于录音和播放
//        [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
//        if(session == nil)
//            NSLog(@"Error creating session: %@", [sessionError description]);
//        else
//            [session setActive:YES error:nil];
//    }
//    
//    if (![self.audioRecorder isRecording]) {
//        
//        [self.audioRecorder record];
//        
//        NSLog(@"录音开始");
//        
//    }
//    
//}
//
//#pragma mark ---------------------------- QQ 语音动画 结束
//- (void)recordFinishQQAnimationFinish
//{
//    
//    if ([self.audioRecorder isRecording]) {
//        
//        NSLog(@"完成");
//        [self.audioRecorder stop];
//        
//    }
//    
//}
//
//
//
///**
// *  获得录音机对象
// *
// *  @return 录音机对象
// */
//- (AVAudioRecorder *)audioRecorder{
//    if (!_audioRecorder) {
//        //创建录音文件保存路径
//        NSURL *url=[self getSavePath];
//        //创建录音格式设置
//        NSDictionary *setting=[self getAudioSetting];
//        //创建录音机
//        NSError *error=nil;
//        _audioRecorder=[[AVAudioRecorder alloc]initWithURL:url settings:setting error:&error];
//        _audioRecorder.delegate = self;
//        _audioRecorder.meteringEnabled=YES;//如果要监控声波则必须设置为YES
//        if (error) {
//            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
//            return nil;
//        }
//    }
//    return _audioRecorder;
//}
//
//
///**
// *  取得录音文件设置
// *
// *  @return 录音设置
// */
//- (NSDictionary *)getAudioSetting{
//    NSMutableDictionary *dicM=[NSMutableDictionary dictionary];
//    //设置录音格式
//    [dicM setObject:@(kAudioFormatMPEG4AAC) forKey:AVFormatIDKey];
//    //设置录音采样率，8000是电话采样率，对于一般录音已经够了
//    [dicM setObject:@(8000) forKey:AVSampleRateKey];
//    //设置通道,这里采用单声道
//    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
//    //每个采样点位数,分为8、16、24、32
//    [dicM setObject:@(8) forKey:AVLinearPCMBitDepthKey];
//    //是否使用浮点数采样
//    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
//    //....其他设置等
//    return dicM;
//}
//
//
///**
// *  取得录音文件保存路径
// *
// *  @return 录音文件路径
// */
//- (NSURL *)getSavePath{
//    
//    //  在Documents目录下创建一个名为FileData的文件夹
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"XunFeiAudioData"];
//    NSLog(@"%@",path);
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    BOOL isDir = FALSE;
//    BOOL isDirExist = [fileManager fileExistsAtPath:path isDirectory:&isDir];
//    if(!(isDirExist && isDir))
//        
//    {
//        BOOL bCreateDir = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
//        if(!bCreateDir){
//            NSLog(@"创建文件夹失败！");
//        }
//        NSLog(@"创建文件夹成功，文件路径%@",path);
//    }
//    
//    path = [path stringByAppendingPathComponent:@"xunfeimyRecord.aac"];
//    NSLog(@"file path:%@",path);
//    NSURL *url=[NSURL fileURLWithPath:path];
//    return url;
//}
//
//////////////////////////////////////////////////////




#pragma mark ----------------------------------------报时

- (void)getNowDatee
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"dateString:________%@_________",dateString);
    NSArray *dateArray = [dateString componentsSeparatedByString:@":"];
    
    
    
    self.voiceDateStr = [NSString stringWithFormat:@"现在是北京时间%@点%@分",dateArray[0],dateArray[1]];
    //NSLog(@"voiceDateStr:________%@_________",self.voiceDateStr);
    

    self.voiceRecoLb.text = self.voiceDateStr;
    
    //[CLSpeechSynthesizer playVoice:self.voiceDateStr];//语音报时
    //[[ZRRSpeechSynthesizer sharedSpeechInstance] startSpeechText:self.voiceDateStr];
    
    [_iFlySpeechSynthesizer startSpeaking:self.voiceDateStr];
    
    //发送文字
    [self robotSendMess:self.voiceDateStr];
    
    
    
    
    

}



#pragma mark ----------------------------------------播报天气
- (void)getNowWeather
{

    
    if (self.weather1 == nil || self.weather1 == NULL || [self.weather2 isKindOfClass:[NSNull class]]) {
        
        NSString *weatherStr = @"星伴为您播报最新天气情况,郑州,今天白天多云,最高温度10摄氏度,东南风,2级,今天夜间多云,最低温度2摄氏度,微风,二级";
        
        //发送文字
        [self robotSendMess:weatherStr];
        
        //[CLSpeechSynthesizer playVoice:weatherStr];//播报天气
        [[ZRRSpeechSynthesizer sharedSpeechInstance] startSpeechText:weatherStr];
        
        
        self.voiceRecoLb.text = self.voiceWeatherStr;
        
        
        
    }else {
    
    
        //[CLSpeechSynthesizer playVoice:self.voiceWeatherStr];//播报天气
        [[ZRRSpeechSynthesizer sharedSpeechInstance] startSpeechText:self.voiceWeatherStr];
        
        //发送文字
        [self robotSendMess:self.voiceWeatherStr];
        
        _voiceHeadRight = YES;
        
        
        self.voiceRecoLb.text = self.voiceWeatherStr;
        
    
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(16.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        
        
        //[self voiceHelppBtnClicked];//进入语音帮助页面
    });
    
    
    
}





#pragma mark --------------------------------- 各种按钮点击事件




#pragma mark ----------------------保存视图点击//关闭语音播报界面
- (void)saveImgaeViewwTaped
{
    [_iflyRecognizerView cancel];//取消本次识别
    
//--------------------------------------------------------
//--------------------------------------------------------
//停止语音播报
    
    [[ZRRSpeechSynthesizer sharedSpeechInstance] stopSpeechText];//取消语音播报
    
    if ([_iFlySpeechSynthesizer isSpeaking]) {
        //
        [_iFlySpeechSynthesizer pauseSpeaking];
        [_iFlySpeechSynthesizer stopSpeaking];//科大讯飞
    }
    
//--------------------------------------------------------
//--------------------------------------------------------
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        self.leftDIYStore.hidden = NO;
        self.bottomIntImgV.hidden = NO;
        self.bottomUserHeadImgV.hidden = NO;
        self.voiceBtn.hidden = NO;
        
        self.isPlayingBgV.hidden = NO;//顶部音乐播放
        
        
        self.voiceHelpBgV.hidden = YES;
        
        
        
        self.firstDiyyBtn.hidden = NO;
        self.firstInttBtn.hidden = NO;
        
        self.firstLevelHeadPoritBggImgV.hidden = NO;
        self.goldBggImgV.hidden = NO;
        
        
        
    });
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.bottomSpeechImgV.frame = CGRectMake(kScreen_Width - 60 - 30, kScreen_Height - 120 , 60, 60);
        [self.view bringSubviewToFront:self.bottomSpeechImgV];
        
        
        self.voiceHelpBgV.frame = CGRectMake(0, kScreen_Height, kScreen_Width, kScreen_Height/2 - 50);
        
        
        
    }];
    
    
    
    [self.annimationImageV stopAnimating];//停止动画
    
    
    
    
    
    
////////////清空聊天数据
    
    
    if ([self.voiceRecoLb.text rangeOfString:@"打开"].location == NSNotFound ) {///数组越界问题
        //
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 耗时的操作
            if (self.chatDataArray.count != 0) {
                
                [self.chatDataArray removeAllObjects];
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 更新界面
                    
                    [self.chatTableView reloadData];
                    
                });
                
                
            }
            
           
            
            
        });
        
        
    }
    
    
    


}



#pragma mark --------------------------------点击顶部签到按钮
- (void)qiandaoBtnnnClicked
{
//
    
    
    NSString *loginJudge = [NSUserDefaults standardUserDefaults].notLoginOrLogin;
    
    if ([loginJudge isEqualToString:@"notLogin"]) {
        
        ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMLoginViewController alloc]];
        [kWindow setRootViewController:navRoot];
        
        
    } else {
    
    
#pragma mark -----------------------------------请求签到配置接口
        
        
        [self getCheckInUserrCfg];
        
        
        
        
        
        
        
        
        
        
        self.qianBlackBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0 , kScreen_Width, kScreen_Height)];
        self.qianBlackBgImgV.backgroundColor = [UIColor clearColor];
        self.qianBlackBgImgV.image = IMAGE(@"40X40遮罩zz");
        self.qianBlackBgImgV.userInteractionEnabled = YES;
        //self.qianBlackBgImgV.alpha = 0;
        
        [self.view addSubview:self.qianBlackBgImgV];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            self.qianBgV = [[UIView alloc] initWithFrame:CGRectMake(30, 80 , kScreen_Width - 60, kScreen_Height - 180)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianBgV = [[UIView alloc] initWithFrame:CGRectMake(30, 90 , kScreen_Width - 60, kScreen_Height - 260 + 20)];
            
            
        } else {
            
            self.qianBgV = [[UIView alloc] initWithFrame:CGRectMake(30, 100 , kScreen_Width - 60, kScreen_Height - 260)];
        }
        
        self.qianBgV.backgroundColor = [UIColor whiteColor];
        
        [self.qianBlackBgImgV addSubview:self.qianBgV];
        
        ////
        
        if ([ZMSystemTool iPhone5Device]) {
            
            self.qianTopImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0 , kScreen_Width - 60, 40)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianTopImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0 , kScreen_Width - 60, 40)];
            
            
        } else {
            
            self.qianTopImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0 , kScreen_Width - 60, 50)];
        }
        
        
        self.qianTopImgV.backgroundColor = MAIN_MAIN_APP_COLOR;
        //self.qianBlackBgImgV.image = IMAGE(@"40X40遮罩zz");
        self.qianTopImgV.userInteractionEnabled = YES;
        
        [self.qianBgV addSubview:self.qianTopImgV];
        
        ////
        if ([ZMSystemTool iPhone5Device]) {
            
            self.qianTellLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, kScreen_Width - 60 , 60)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianTellLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, kScreen_Width - 60 , 60)];
            
        } else {
            self.qianTellLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, kScreen_Width - 60 , 60)];
            
        }
        
        self.qianTellLb.backgroundColor = RGB(235, 235, 235);
        self.qianTellLb.numberOfLines = 0;
        self.qianTellLb.text = @"  连续签到天数越多,奖励越给力噢!注意:签到\n中断或签满7天重新从第一天开始.";
        
        if ([ZMSystemTool iPhone5Device]) {
            
            self.qianTellLb.font = [UIFont systemFontOfSize:13];
            
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianTellLb.font = [UIFont systemFontOfSize:14];
            
        } else {
            self.qianTellLb.font = [UIFont systemFontOfSize:15];
            
            
        }
        
        self.qianTellLb.textColor = [UIColor grayColor];
        self.qianTellLb.textAlignment = NSTextAlignmentCenter;
        self.qianTellLb.userInteractionEnabled = YES;
        [self.qianBgV addSubview:self.qianTellLb];
        
        //
        if ([ZMSystemTool iPhone5Device]) {
            
            self.qiangoodLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 60, 40)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.qiangoodLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 60, 40)];
            
        } else {
            self.qiangoodLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 60, 50)];
            
        }
        
        self.qiangoodLb.backgroundColor = [UIColor clearColor];
        //self.qianTellLb.numberOfLines = 0;
        self.qiangoodLb.text = @"签到好礼";
        self.qiangoodLb.font = [UIFont systemFontOfSize:20];
        self.qiangoodLb.textColor = [UIColor whiteColor];
        self.qiangoodLb.textAlignment = NSTextAlignmentCenter;
        self.qiangoodLb.userInteractionEnabled = YES;
        [self.qianBgV addSubview:self.qiangoodLb];
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            self.weekImgVDay1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 120 , (kScreen_Width - 60 - 50)/4, 100)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVDay1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 110 , (kScreen_Width - 60 - 50)/4, 110)];
            
            
        } else {
            
            self.weekImgVDay1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 120 , (kScreen_Width - 60 - 50)/4, 120)];
            
        }
        
        self.weekImgVDay1.backgroundColor = [UIColor clearColor];
        self.weekImgVDay1.image = IMAGE(@"底板qian");
        self.weekImgVDay1.userInteractionEnabled = YES;
        UITapGestureRecognizer *weekday1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weekday111Taped)];
        [self.weekImgVDay1 addGestureRecognizer:weekday1];
        
        [self.qianBgV addSubview:self.weekImgVDay1];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVDay2 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + (kScreen_Width - 60 - 50)/4 + 10, 120 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVDay2 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + (kScreen_Width - 60 - 50)/4 + 10, 110 , (kScreen_Width - 60 - 50)/4, 110)];
            
            
        } else {
            
            self.weekImgVDay2 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + (kScreen_Width - 60 - 50)/4 + 10, 120 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVDay2.backgroundColor = [UIColor clearColor];
        self.weekImgVDay2.image = IMAGE(@"底板qian");
        self.weekImgVDay2.userInteractionEnabled = YES;
        UITapGestureRecognizer *weekday22 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weekday222Taped)];
        [self.weekImgVDay2 addGestureRecognizer:weekday22];
        
        [self.qianBgV addSubview:self.weekImgVDay2];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVDay3 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 2 *(kScreen_Width - 60 - 50)/4 + 20, 120 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVDay3 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 2 *(kScreen_Width - 60 - 50)/4 + 20, 110 , (kScreen_Width - 60 - 50)/4, 110)];
            
            
        } else {
            
            self.weekImgVDay3 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 2 *(kScreen_Width - 60 - 50)/4 + 20, 120 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVDay3.backgroundColor = [UIColor clearColor];
        self.weekImgVDay3.image = IMAGE(@"底板qian");
        self.weekImgVDay3.userInteractionEnabled = YES;
        UITapGestureRecognizer *weekday3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weekday333Taped)];
        [self.weekImgVDay3 addGestureRecognizer:weekday3];
        
        [self.qianBgV addSubview:self.weekImgVDay3];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVDay4 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 3 * (kScreen_Width - 60 - 50)/4 + 30, 120 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVDay4 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 3 * (kScreen_Width - 60 - 50)/4 + 30, 110 , (kScreen_Width - 60 - 50)/4, 110)];
            
            
        } else {
            
            self.weekImgVDay4 = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 3 * (kScreen_Width - 60 - 50)/4 + 30, 120 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVDay4.backgroundColor = [UIColor clearColor];
        self.weekImgVDay4.image = IMAGE(@"底板qian");
        self.weekImgVDay4.userInteractionEnabled = YES;
        UITapGestureRecognizer *weekday44 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weekday444Taped)];
        [self.weekImgVDay4 addGestureRecognizer:weekday44];
        
        [self.qianBgV addSubview:self.weekImgVDay4];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVDay5 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 - 15, 250 - 20, (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVDay5 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 - 15, 250 - 10, (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            
            self.weekImgVDay5 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 - 15, 250 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVDay5.backgroundColor = [UIColor clearColor];
        self.weekImgVDay5.image = IMAGE(@"底板qian");
        self.weekImgVDay5.userInteractionEnabled = YES;
        UITapGestureRecognizer *weekday5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weekday555Taped)];
        [self.weekImgVDay5 addGestureRecognizer:weekday5];
        
        [self.qianBgV addSubview:self.weekImgVDay5];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVDay6 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 + (kScreen_Width - 60 - 50)/4 - 5, 250 - 20, (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVDay6 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 + (kScreen_Width - 60 - 50)/4 - 5, 250 - 10, (kScreen_Width - 60 - 50)/4, 110)];
            
            
            
        } else {
            
            self.weekImgVDay6 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 + (kScreen_Width - 60 - 50)/4 - 5, 250 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVDay6.backgroundColor = [UIColor clearColor];
        self.weekImgVDay6.image = IMAGE(@"底板qian");
        self.weekImgVDay6.userInteractionEnabled = YES;
        UITapGestureRecognizer *weekday66 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weekday666Taped)];
        [self.weekImgVDay6 addGestureRecognizer:weekday66];
        
        [self.qianBgV addSubview:self.weekImgVDay6];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVDay7 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 + 2 * (kScreen_Width - 60 - 50)/4 + 5, 250 - 20, (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVDay7 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 + 2 * (kScreen_Width - 60 - 50)/4 + 5, 250 - 10, (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            
            self.weekImgVDay7 = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreen_Width - 60) - ((kScreen_Width - 60 - 50)/4))/4 + 2 * (kScreen_Width - 60 - 50)/4 + 5, 250 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVDay7.backgroundColor = [UIColor clearColor];
        self.weekImgVDay7.image = IMAGE(@"底板qian");
        self.weekImgVDay7.userInteractionEnabled = YES;
        UITapGestureRecognizer *weekday7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weekday777Taped)];
        [self.weekImgVDay7 addGestureRecognizer:weekday7];
        
        [self.qianBgV addSubview:self.weekImgVDay7];
        
        
        //金币
        if ([ZMSystemTool iPhone5Device]) {
            
            self.weekImgVGold1 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            self.weekImgVGold1 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10 , 30, 30)];
            
            
        } else {
            
            self.weekImgVGold1 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 , 30, 30)];
        }
        self.weekImgVGold1.backgroundColor = [UIColor clearColor];
        self.weekImgVGold1.image = IMAGE(@"金币-图标");
        self.weekImgVGold1.userInteractionEnabled = YES;
        
        [self.weekImgVDay1 addSubview:self.weekImgVGold1];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVGold2 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
            
        }else if ([ZMSystemTool iPhone6Device]) {
            self.weekImgVGold2 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
            
        } else {
            self.weekImgVGold2 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 , 30, 30)];
            
        }
        
        self.weekImgVGold2.backgroundColor = [UIColor clearColor];
        self.weekImgVGold2.image = IMAGE(@"金币-图标");
        self.weekImgVGold2.userInteractionEnabled = YES;
        
        [self.weekImgVDay2 addSubview:self.weekImgVGold2];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            self.weekImgVGold3 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15 - 3, 45 - 10, 40, 40)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVGold3 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15 - 3, 45 - 10, 40, 40)];
            
        } else {
            self.weekImgVGold3 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15 - 8, 45 , 50, 50)];
            
        }
        
        self.weekImgVGold3.backgroundColor = [UIColor clearColor];
        self.weekImgVGold3.image = IMAGE(@"礼物");
        self.weekImgVGold3.userInteractionEnabled = YES;
        
        [self.weekImgVDay3 addSubview:self.weekImgVGold3];
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            self.weekImgVGold4 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVGold4 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
        } else {
            self.weekImgVGold4 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 , 30, 30)];
            
        }
        
        self.weekImgVGold4.backgroundColor = [UIColor clearColor];
        self.weekImgVGold4.image = IMAGE(@"金币-图标");
        self.weekImgVGold4.userInteractionEnabled = YES;
        
        [self.weekImgVDay4 addSubview:self.weekImgVGold4];
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVGold5 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
            
        }else if ([ZMSystemTool iPhone6Device]) {
            self.weekImgVGold5 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
            
        } else {
            self.weekImgVGold5 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 , 30, 30)];
            
        }
        
        self.weekImgVGold5.backgroundColor = [UIColor clearColor];
        self.weekImgVGold5.image = IMAGE(@"金币-图标");
        self.weekImgVGold5.userInteractionEnabled = YES;
        
        [self.weekImgVDay5 addSubview:self.weekImgVGold5];
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            self.weekImgVGold6 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            self.weekImgVGold6 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 - 10, 30, 30)];
            
            
        } else {
            self.weekImgVGold6 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15, 45 , 30, 30)];
            
        }
        
        self.weekImgVGold6.backgroundColor = [UIColor clearColor];
        self.weekImgVGold6.image = IMAGE(@"金币-图标");
        self.weekImgVGold6.userInteractionEnabled = YES;
        
        [self.weekImgVDay6 addSubview:self.weekImgVGold6];
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            self.weekImgVGold7 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15 - 3, 45 - 10 , 40, 40)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVGold7 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15 - 8 + 5, 45 - 10, 40, 40)];
            
        } else {
            self.weekImgVGold7 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 15 - 8, 45 , 50, 50)];
            
        }
        
        self.weekImgVGold7.backgroundColor = [UIColor clearColor];
        self.weekImgVGold7.image = IMAGE(@"礼物");
        self.weekImgVGold7.userInteractionEnabled = YES;
        
        [self.weekImgVDay7 addSubview:self.weekImgVGold7];
        
        //金币数
        if ([ZMSystemTool iPhone5Device]) {
            self.qianGold1 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 20, 40, 30)];
            self.qianGold1.font = [UIFont systemFontOfSize:13];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianGold1 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 10, 40, 30)];
            self.qianGold1.font = [UIFont systemFontOfSize:13];
            
            
            
        } else {
            
            self.qianGold1 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85, 40, 30)];
            self.qianGold1.font = [UIFont systemFontOfSize:13];
            
            
            self.annimationGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(30, 260, 100, 30)];
            self.annimationGoldLb.font = [UIFont systemFontOfSize:17];
            
            
        }
        
        self.qianGold1.backgroundColor = [UIColor clearColor];
        //self.qianTellLb.numberOfLines = 0;
        self.qianGold1.text = @"+1500";
        
        self.qianGold1.textColor = [UIColor whiteColor];
        self.qianGold1.textAlignment = NSTextAlignmentCenter;
        self.qianGold1.userInteractionEnabled = YES;
        
        self.annimationGoldLb.text = @"+20金币";
        self.annimationGoldLb.textAlignment = NSTextAlignmentCenter;
        self.annimationGoldLb.textColor = RGB(241, 168, 43);
        self.annimationGoldLb.userInteractionEnabled = YES;
        
        [self.weekImgVDay1 addSubview:self.qianGold1];
        [self.view addSubview:self.annimationGoldLb];
        
        self.annimationGoldLb.hidden = YES;
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qianGold2 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 20, 40, 30)];
            self.qianGold2.font = [UIFont systemFontOfSize:13];
        } else if ([ZMSystemTool iPhone6Device]) {
            self.qianGold2 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 10, 40, 30)];
            self.qianGold2.font = [UIFont systemFontOfSize:13];
            
            
            
        } else {
            self.qianGold2 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85, 40, 30)];
            self.qianGold2.font = [UIFont systemFontOfSize:13];
        }
        
        self.qianGold2.backgroundColor = [UIColor clearColor];
        self.qianGold2.text = @"+1600";
        
        self.qianGold2.textColor = [UIColor whiteColor];
        self.qianGold2.textAlignment = NSTextAlignmentCenter;
        self.qianGold2.userInteractionEnabled = YES;
        [self.weekImgVDay2 addSubview:self.qianGold2];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qianGold3 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 20, 40, 30)];
            self.qianGold3.font = [UIFont systemFontOfSize:13];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianGold3 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 10, 40, 30)];
            self.qianGold3.font = [UIFont systemFontOfSize:16];
            
        } else {
            self.qianGold3 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85, 40, 30)];
            self.qianGold3.font = [UIFont systemFontOfSize:13];
        }
        
        self.qianGold3.backgroundColor = [UIColor clearColor];
        self.qianGold3.text = @"+1700";
        
        self.qianGold3.textColor = [UIColor whiteColor];
        self.qianGold3.textAlignment = NSTextAlignmentCenter;
        self.qianGold3.userInteractionEnabled = YES;
        //[self.weekImgVDay3 addSubview:self.qianGold3];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qianGold4 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 20, 40, 30)];
            self.qianGold4.font = [UIFont systemFontOfSize:13];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianGold4 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 10, 40, 30)];
            self.qianGold4.font = [UIFont systemFontOfSize:13];
            
        } else {
            self.qianGold4 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85, 40, 30)];
            self.qianGold4.font = [UIFont systemFontOfSize:13];
        }
        
        self.qianGold4.backgroundColor = [UIColor clearColor];
        self.qianGold4.text = @"+1800";
        
        self.qianGold4.textColor = [UIColor whiteColor];
        self.qianGold4.textAlignment = NSTextAlignmentCenter;
        self.qianGold4.userInteractionEnabled = YES;
        [self.weekImgVDay4 addSubview:self.qianGold4];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qianGold5 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 20, 40, 30)];
            self.qianGold5.font = [UIFont systemFontOfSize:13];
        } else if ([ZMSystemTool iPhone6Device]) {
            self.qianGold5 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 10, 40, 30)];
            self.qianGold5.font = [UIFont systemFontOfSize:13];
            
            
        } else {
            self.qianGold5 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85, 40, 30)];
            self.qianGold5.font = [UIFont systemFontOfSize:13];
        }
        
        self.qianGold5.backgroundColor = [UIColor clearColor];
        self.qianGold5.text = @"+1900";
        
        self.qianGold5.textColor = [UIColor whiteColor];
        self.qianGold5.textAlignment = NSTextAlignmentCenter;
        self.qianGold5.userInteractionEnabled = YES;
        [self.weekImgVDay5 addSubview:self.qianGold5];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qianGold6 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 20, 40, 30)];
            self.qianGold6.font = [UIFont systemFontOfSize:12];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianGold6 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 10, 40, 30)];
            self.qianGold6.font = [UIFont systemFontOfSize:12];
            
        } else {
            self.qianGold6 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85, 40, 30)];
            self.qianGold6.font = [UIFont systemFontOfSize:12];
        }
        
        self.qianGold6.backgroundColor = [UIColor clearColor];
        self.qianGold6.text = @"+2000";
        
        self.qianGold6.textColor = [UIColor whiteColor];
        self.qianGold6.textAlignment = NSTextAlignmentCenter;
        self.qianGold6.userInteractionEnabled = YES;
        [self.weekImgVDay6 addSubview:self.qianGold6];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qianGold7 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85 - 20, 40, 30)];
            self.qianGold7.font = [UIFont systemFontOfSize:13];
            
        } else if ([ZMSystemTool iPhone6Device]) {
            
            
            
        } else {
            self.qianGold7 = [[UILabel alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/8 - 20, 85, 50, 30)];
            self.qianGold7.font = [UIFont systemFontOfSize:13];
        }
        
        self.qianGold7.backgroundColor = [UIColor clearColor];
        self.qianGold7.text = @"+2100";
        
        self.qianGold7.textColor = [UIColor whiteColor];
        self.qianGold7.textAlignment = NSTextAlignmentCenter;
        self.qianGold7.userInteractionEnabled = YES;
        //[self.weekImgVDay7 addSubview:self.qianGold7];
        
        
        //关闭
        if ([ZMSystemTool iPhone5Device]) {
            
            self.qianCloceBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 60 - 20 - 3, -10 + 5, 30, 30)];
            self.qianCloceBtn1.layer.cornerRadius = 15;
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianCloceBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 60 - 25 , -10 + 5, 30, 30)];
            self.qianCloceBtn1.layer.cornerRadius = 15;
            
        } else {
            
            self.qianCloceBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 60 - 30 - 3, -10 + 5, 40, 40)];
            self.qianCloceBtn1.layer.cornerRadius = 20;
        }
        
        self.qianCloceBtn1.backgroundColor = [UIColor whiteColor];
        
        self.qianCloceBtn1.layer.masksToBounds = YES;
        [self.qianCloceBtn1 setBackgroundImage:IMAGE(@"关闭-按键qian") forState: UIControlStateNormal];
        [self.qianCloceBtn1 addTarget:self action:@selector(qianCloceBtn1Clicked) forControlEvents:UIControlEventTouchUpInside];
        [self.qianBgV addSubview:self.qianCloceBtn1];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qianCloceBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((kScreen_Width - 60)/2 - 60, self.qianBgV.frame.size.height - 80 + 30, 120, 40)];
        }else if ([ZMSystemTool iPhone6PlusDevice]) {
            
            self.qianCloceBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((kScreen_Width - 60)/2 - 60, self.qianBgV.frame.size.height - 80 , 120, 50)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            self.qianCloceBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((kScreen_Width - 60)/2 - 60, self.qianBgV.frame.size.height - 80 + 30 - 10, 110, 40)];
        }else {
            
        }
        
        self.qianCloceBtn2.backgroundColor = RGB(228, 84, 129);
        self.qianCloceBtn2.layer.cornerRadius = 10;
        self.qianCloceBtn2.layer.masksToBounds = YES;
        //[self.qianCloceBtn2 setBackgroundImage:IMAGE(@"关闭-按键qian") forState: UIControlStateNormal];
        [self.qianCloceBtn2 setTitle:@"今日签到" forState:UIControlStateNormal];
        [self.qianCloceBtn2 addTarget:self action:@selector( todayCheckinBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.qianBgV addSubview:self.qianCloceBtn2];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qiandayy1 = [[UILabel alloc] initWithFrame:CGRectMake(-6, 4, 40, 25)];
            self.qiandayy1.font = [UIFont systemFontOfSize:13];
        }else {
            
            self.qiandayy1 = [[UILabel alloc] initWithFrame:CGRectMake(1, 3, 40, 30)];
            self.qiandayy1.font = [UIFont systemFontOfSize:15];
        }
        
        self.qiandayy1.backgroundColor = [UIColor clearColor];
        self.qiandayy1.text = @"1  天";
        
        self.qiandayy1.textColor = [UIColor whiteColor];
        self.qiandayy1.textAlignment = NSTextAlignmentCenter;
        self.qiandayy1.userInteractionEnabled = YES;
        self.qiandayy1.transform = CGAffineTransformMakeRotation(- 0.8);
        
        [self.weekImgVDay1 addSubview:self.qiandayy1];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qiandayy2 = [[UILabel alloc] initWithFrame:CGRectMake(-6, 4, 40, 25)];
            self.qiandayy2.font = [UIFont systemFontOfSize:13];
        }else {
            self.qiandayy2 = [[UILabel alloc] initWithFrame:CGRectMake(1, 3, 40, 30)];
            self.qiandayy2.font = [UIFont systemFontOfSize:15];
        }
        
        self.qiandayy2.backgroundColor = [UIColor clearColor];
        self.qiandayy2.text = @"2  天";
        
        self.qiandayy2.textColor = [UIColor whiteColor];
        self.qiandayy2.textAlignment = NSTextAlignmentCenter;
        self.qiandayy2.userInteractionEnabled = YES;
        self.qiandayy2.transform = CGAffineTransformMakeRotation(- 0.8);
        
        [self.weekImgVDay2 addSubview:self.qiandayy2];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qiandayy3 = [[UILabel alloc] initWithFrame:CGRectMake(-6, 4, 40, 25)];
            self.qiandayy3.font = [UIFont systemFontOfSize:13];
        }else {
            self.qiandayy3 = [[UILabel alloc] initWithFrame:CGRectMake(1, 3, 40, 30)];
            self.qiandayy3.font = [UIFont systemFontOfSize:15];
        }
        
        self.qiandayy3.backgroundColor = [UIColor clearColor];
        self.qiandayy3.text = @"3  天";
        
        self.qiandayy3.textColor = [UIColor whiteColor];
        self.qiandayy3.textAlignment = NSTextAlignmentCenter;
        self.qiandayy3.userInteractionEnabled = YES;
        self.qiandayy3.transform = CGAffineTransformMakeRotation(- 0.8);
        
        [self.weekImgVDay3 addSubview:self.qiandayy3];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qiandayy4 = [[UILabel alloc] initWithFrame:CGRectMake(-6, 4, 40, 25)];
            self.qiandayy4.font = [UIFont systemFontOfSize:13];
        }else {
            self.qiandayy4 = [[UILabel alloc] initWithFrame:CGRectMake(1, 3, 40, 30)];
            self.qiandayy4.font = [UIFont systemFontOfSize:15];
        }
        
        self.qiandayy4.backgroundColor = [UIColor clearColor];
        self.qiandayy4.text = @"4  天";
        
        self.qiandayy4.textColor = [UIColor whiteColor];
        self.qiandayy4.textAlignment = NSTextAlignmentCenter;
        self.qiandayy4.userInteractionEnabled = YES;
        self.qiandayy4.transform = CGAffineTransformMakeRotation(- 0.8);
        
        [self.weekImgVDay4 addSubview:self.qiandayy4];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qiandayy5 = [[UILabel alloc] initWithFrame:CGRectMake(-6, 4, 40, 25)];
            self.qiandayy5.font = [UIFont systemFontOfSize:13];
        }else {
            self.qiandayy5 = [[UILabel alloc] initWithFrame:CGRectMake(1, 3, 40, 30)];
            self.qiandayy5.font = [UIFont systemFontOfSize:15];
        }
        
        self.qiandayy5.backgroundColor = [UIColor clearColor];
        self.qiandayy5.text = @"5  天";
        
        self.qiandayy5.textColor = [UIColor whiteColor];
        self.qiandayy5.textAlignment = NSTextAlignmentCenter;
        self.qiandayy5.userInteractionEnabled = YES;
        self.qiandayy5.transform = CGAffineTransformMakeRotation(- 0.8);
        
        [self.weekImgVDay5 addSubview:self.qiandayy5];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qiandayy6 = [[UILabel alloc] initWithFrame:CGRectMake(-6, 4, 40, 25)];
            self.qiandayy6.font = [UIFont systemFontOfSize:13];
        }else {
            self.qiandayy6 = [[UILabel alloc] initWithFrame:CGRectMake(1, 3, 40, 30)];
            self.qiandayy6.font = [UIFont systemFontOfSize:15];
        }
        
        self.qiandayy6.backgroundColor = [UIColor clearColor];
        self.qiandayy6.text = @"6  天";
        
        self.qiandayy6.textColor = [UIColor whiteColor];
        self.qiandayy6.textAlignment = NSTextAlignmentCenter;
        self.qiandayy6.userInteractionEnabled = YES;
        self.qiandayy6.transform = CGAffineTransformMakeRotation(- 0.8);
        
        [self.weekImgVDay6 addSubview:self.qiandayy6];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.qiandayy7 = [[UILabel alloc] initWithFrame:CGRectMake(-6, 4, 40, 25)];
            self.qiandayy7.font = [UIFont systemFontOfSize:13];
        }else {
            self.qiandayy7 = [[UILabel alloc] initWithFrame:CGRectMake(1, 3, 40, 30)];
            self.qiandayy7.font = [UIFont systemFontOfSize:15];
        }
        
        self.qiandayy7.backgroundColor = [UIColor clearColor];
        self.qiandayy7.text = @"7  天";
        
        self.qiandayy7.textColor = [UIColor whiteColor];
        self.qiandayy7.textAlignment = NSTextAlignmentCenter;
        self.qiandayy7.userInteractionEnabled = YES;
        self.qiandayy7.transform = CGAffineTransformMakeRotation(- 0.8);
        
        [self.weekImgVDay7 addSubview:self.qiandayy7];
        
        
        
        
        
        
        //加遮罩
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVzhe1 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVzhe1 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            
            self.weekImgVzhe1 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVzhe1.backgroundColor = [UIColor clearColor];
        self.weekImgVzhe1.image = IMAGE(@"底板-遮罩qi");
        self.weekImgVzhe1.userInteractionEnabled = YES;
        //[self.weekImgVDay1 addSubview:self.weekImgVzhe1];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVduii1 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 + 5, (kScreen_Width - 60 - 50)/8, 40)];
            
        } else if ([ZMSystemTool iPhone6Device]) {
            self.weekImgVduii1 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 25 , (kScreen_Width - 60 - 50)/8, 35)];
            
            
        } else {
            self.weekImgVduii1 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 , (kScreen_Width - 60 - 50)/8, 60)];
            
        }
        
        self.weekImgVduii1.backgroundColor = [UIColor clearColor];
        self.weekImgVduii1.image = IMAGE(@"对号qia");
        self.weekImgVduii1.userInteractionEnabled = YES;
        [self.weekImgVzhe1 addSubview:self.weekImgVduii1];
        
        
        
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVzhe2 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVzhe2 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            self.weekImgVzhe2 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVzhe2.backgroundColor = [UIColor clearColor];
        self.weekImgVzhe2.image = IMAGE(@"底板-遮罩qi");
        self.weekImgVzhe2.userInteractionEnabled = YES;
        //[self.weekImgVDay2 addSubview:self.weekImgVzhe2];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVduii2 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 + 5, (kScreen_Width - 60 - 50)/8, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            self.weekImgVduii2 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 25 , (kScreen_Width - 60 - 50)/8, 35)];
            
            
        } else {
            self.weekImgVduii2 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 , (kScreen_Width - 60 - 50)/8, 60)];
        }
        
        self.weekImgVduii2.backgroundColor = [UIColor clearColor];
        self.weekImgVduii2.image = IMAGE(@"对号qia");
        self.weekImgVduii2.userInteractionEnabled = YES;
        [self.weekImgVzhe2 addSubview:self.weekImgVduii2];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVzhe3 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVzhe3 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            self.weekImgVzhe3 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVzhe3.backgroundColor = [UIColor clearColor];
        self.weekImgVzhe3.image = IMAGE(@"底板-遮罩qi");
        self.weekImgVzhe3.userInteractionEnabled = YES;
        //[self.weekImgVDay3 addSubview:self.weekImgVzhe3];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVduii3 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 + 5, (kScreen_Width - 60 - 50)/8, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVduii3 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 25 , (kScreen_Width - 60 - 50)/8, 35)];
            
        } else {
            self.weekImgVduii3 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 , (kScreen_Width - 60 - 50)/8, 60)];
        }
        
        self.weekImgVduii3.backgroundColor = [UIColor clearColor];
        self.weekImgVduii3.image = IMAGE(@"对号qia");
        self.weekImgVduii3.userInteractionEnabled = YES;
        [self.weekImgVzhe3 addSubview:self.weekImgVduii3];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVzhe4 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVzhe4 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            self.weekImgVzhe4 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVzhe4.backgroundColor = [UIColor clearColor];
        self.weekImgVzhe4.image = IMAGE(@"底板-遮罩qi");
        self.weekImgVzhe4.userInteractionEnabled = YES;
        //[self.weekImgVDay4 addSubview:self.weekImgVzhe4];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVduii4 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 + 5, (kScreen_Width - 60 - 50)/8, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVduii4 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 25 , (kScreen_Width - 60 - 50)/8, 35)];
            
        } else {
            self.weekImgVduii4 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 , (kScreen_Width - 60 - 50)/8, 60)];
        }
        
        self.weekImgVduii4.backgroundColor = [UIColor clearColor];
        self.weekImgVduii4.image = IMAGE(@"对号qia");
        self.weekImgVduii4.userInteractionEnabled = YES;
        [self.weekImgVzhe4 addSubview:self.weekImgVduii4];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVzhe5 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVzhe5 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            self.weekImgVzhe5 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVzhe5.backgroundColor = [UIColor clearColor];
        self.weekImgVzhe5.image = IMAGE(@"底板-遮罩qi");
        self.weekImgVzhe5.userInteractionEnabled = YES;
        //[self.weekImgVDay5 addSubview:self.weekImgVzhe5];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVduii5 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 + 5, (kScreen_Width - 60 - 50)/8, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVduii5 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 25 , (kScreen_Width - 60 - 50)/8, 35)];
            
        } else {
            self.weekImgVduii5 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 , (kScreen_Width - 60 - 50)/8, 60)];
        }
        
        self.weekImgVduii5.backgroundColor = [UIColor clearColor];
        self.weekImgVduii5.image = IMAGE(@"对号qia");
        self.weekImgVduii5.userInteractionEnabled = YES;
        [self.weekImgVzhe5 addSubview:self.weekImgVduii5];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVzhe6 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVzhe6 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            self.weekImgVzhe6 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVzhe6.backgroundColor = [UIColor clearColor];
        self.weekImgVzhe6.image = IMAGE(@"底板-遮罩qi");
        self.weekImgVzhe6.userInteractionEnabled = YES;
        //[self.weekImgVDay6 addSubview:self.weekImgVzhe6];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVduii6 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 + 5, (kScreen_Width - 60 - 50)/8, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVduii6 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 25 , (kScreen_Width - 60 - 50)/8, 35)];
            
        } else {
            self.weekImgVduii6 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 , (kScreen_Width - 60 - 50)/8, 60)];
        }
        
        self.weekImgVduii6.backgroundColor = [UIColor clearColor];
        self.weekImgVduii6.image = IMAGE(@"对号qia");
        self.weekImgVduii6.userInteractionEnabled = YES;
        [self.weekImgVzhe6 addSubview:self.weekImgVduii6];
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVzhe7 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 100)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.weekImgVzhe7 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 110)];
            
        } else {
            self.weekImgVzhe7 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0 , (kScreen_Width - 60 - 50)/4, 120)];
        }
        
        self.weekImgVzhe7.backgroundColor = [UIColor clearColor];
        self.weekImgVzhe7.image = IMAGE(@"底板-遮罩qi");
        self.weekImgVzhe7.userInteractionEnabled = YES;
        //[self.weekImgVDay7 addSubview:self.weekImgVzhe7];
        
        if ([ZMSystemTool iPhone5Device]) {
            self.weekImgVduii7 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 + 5, (kScreen_Width - 60 - 50)/8, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            self.weekImgVduii7 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 25 , (kScreen_Width - 60 - 50)/8, 35)];
            
            
        } else {
            self.weekImgVduii7 = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 60 - 50)/16 , 20 , (kScreen_Width - 60 - 50)/8, 60)];
        }
        
        self.weekImgVduii7.backgroundColor = [UIColor clearColor];
        self.weekImgVduii7.image = IMAGE(@"对号qia");
        self.weekImgVduii7.userInteractionEnabled = YES;
        [self.weekImgVzhe7 addSubview:self.weekImgVduii7];
        
        /////////请求签到数据
        [self getUserCheckkInInfo];
        
        
        
        ///添加点击礼物 尖角视图
        ///第三天
        if ([ZMSystemTool iPhone5Device]) {
            
            self.chenckInBgV = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 40 , kScreen_Height/3 - 30, 140, 80)];
        } else if ([ZMSystemTool iPhone6Device]) {
            self.chenckInBgV = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 30 - 2, kScreen_Height/3 - 50 - 10, 140, 80)];
            
            
        } else {
            
            self.chenckInBgV = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 30 , kScreen_Height/3 - 50, 140, 80)];
            
        }
        /*形状*/
        self.giftShapeLayer = [CAShapeLayer layer];
        self.giftShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
        self.giftShapeLayer.fillColor = [UIColor whiteColor].CGColor;
        self.giftShapeLayer.lineWidth = 2;
        
        /*路径*/
        CGMutablePathRef path = CGPathCreateMutable();
        
        CGPathMoveToPoint(path, NULL, self.chenckInBgV.frame.size.width / 2  - 15, self.chenckInBgV.frame.size.height );
        
        CGPathAddLineToPoint(path, NULL, self.chenckInBgV.frame.size.width / 2, self.chenckInBgV.frame.size.height + 10);
        
        CGPathAddLineToPoint(path, NULL, self.chenckInBgV.frame.size.width / 2 + 15, self.chenckInBgV.frame.size.height);
        
        self.giftShapeLayer.path = path;
        
        self.giftShapeLayer.frame = self.chenckInBgV.bounds;
        
        
        
        self.chenckInBgV.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:self.chenckInBgV];
        
        self.chekinGoldImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10 , 5, 30, 30)];
        self.chekinGoldImgV.image = IMAGE(@"金币-图标");
        [self.chenckInBgV addSubview:self.chekinGoldImgV];
        
        self.chekinGoldLbb = [[UILabel alloc] initWithFrame:CGRectMake(self.chenckInBgV.frame.size.width/2 , 5, self.chenckInBgV.frame.size.width/2, 30)];
        self.chekinGoldLbb.text = @"+1700";
        self.chekinGoldLbb.textAlignment = NSTextAlignmentCenter;
        self.chekinGoldLbb.font = [UIFont systemFontOfSize:13];
        self.chekinGoldLbb.textColor = RGB(228, 84, 129);
        
        [self.chenckInBgV addSubview:self.chekinGoldLbb];
        
        self.giftImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10 , 40, self.chenckInBgV.frame.size.width/2 - 10, 35)];
        self.giftImgV.image = IMAGE(@"电影院门票");
        
        [self.chenckInBgV addSubview:self.giftImgV];
        
        self.giftLbb = [[UILabel alloc] initWithFrame:CGRectMake(self.chenckInBgV.frame.size.width/2 + 15 + 5, 35, self.chenckInBgV.frame.size.width/2, 45)];
        self.giftLbb.text = @"+1";
        self.giftLbb.numberOfLines = 0;
        //self.giftLbb.textAlignment = NSTextAlignmentCenter;
        self.giftLbb.font = [UIFont systemFontOfSize:14];
        self.giftLbb.textColor = RGB(228, 84, 129);
        
        [self.chenckInBgV addSubview:self.giftLbb];
        
        
        self.chenckInBgV.hidden = YES;
        
        
        //////////第七天
        if ([ZMSystemTool iPhone5Device]) {
            
            self.chenckInBgV2 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 20 + 5, kScreen_Height/3 - 30 + 110, 140, 80)];
            
        }else if ([ZMSystemTool iPhone6Device]){
            
            self.chenckInBgV2 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 20 + 35 - 10, kScreen_Height/3 - 30 + 110 - 10, 140, 80)];
            
        } else {
            self.chenckInBgV2 = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 20 + 35, kScreen_Height/3 - 30 + 110, 140, 80)];
            
        }
        /*形状*/
        self.giftShapeLayer2 = [CAShapeLayer layer];
        self.giftShapeLayer2.strokeColor = [UIColor whiteColor].CGColor;
        self.giftShapeLayer2.fillColor = [UIColor whiteColor].CGColor;
        self.giftShapeLayer2.lineWidth = 2;
        
        /*路径*/
        CGMutablePathRef path2 = CGPathCreateMutable();
        
        CGPathMoveToPoint(path2, NULL, self.chenckInBgV2.frame.size.width / 2  - 15, self.chenckInBgV2.frame.size.height );
        
        CGPathAddLineToPoint(path2, NULL, self.chenckInBgV2.frame.size.width / 2, self.chenckInBgV2.frame.size.height + 10);
        
        CGPathAddLineToPoint(path2, NULL, self.chenckInBgV2.frame.size.width / 2 + 15, self.chenckInBgV2.frame.size.height);
        
        self.giftShapeLayer2.path = path2;
        
        self.giftShapeLayer2.frame = self.chenckInBgV2.bounds;
        
        
        
        self.chenckInBgV2.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:self.chenckInBgV2];
        
        self.chekinGoldImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(10 , 5, 30, 30)];
        self.chekinGoldImgV2.image = IMAGE(@"金币-图标");
        [self.chenckInBgV2 addSubview:self.chekinGoldImgV2];
        
        self.chekinGoldLbb2 = [[UILabel alloc] initWithFrame:CGRectMake(self.chenckInBgV2.frame.size.width/2 , 5, self.chenckInBgV2.frame.size.width/2, 30)];
        self.chekinGoldLbb2.text = @"+2100";
        self.chekinGoldLbb2.textAlignment = NSTextAlignmentCenter;
        self.chekinGoldLbb2.font = [UIFont systemFontOfSize:13];
        self.chekinGoldLbb2.textColor = RGB(228, 84, 129);
        
        [self.chenckInBgV2 addSubview:self.chekinGoldLbb2];
        
        self.giftImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(10  , 40, self.chenckInBgV2.frame.size.width/2 - 10 - 10, 35)];
        self.giftImgV2.image = IMAGE(@"钻戒");
        
        [self.chenckInBgV2 addSubview:self.giftImgV2];
        
        self.giftLbb2 = [[UILabel alloc] initWithFrame:CGRectMake(self.chenckInBgV2.frame.size.width/2 + 15, 35, self.chenckInBgV2.frame.size.width/2, 45)];
        self.giftLbb2.text = @"+1";
        self.giftLbb2.numberOfLines = 0;
        self.giftLbb2.font = [UIFont systemFontOfSize:14];
        self.giftLbb2.textColor = RGB(228, 84, 129);
        
        [self.chenckInBgV2 addSubview:self.giftLbb2];
        
        
        self.chenckInBgV2.hidden = YES;
        
        
        

    
    
    }
    
    
//
//    
    
    
    //////////////粒子动画
    //发射源
    self.goldLbEmitterLayer = [CAEmitterLayer layer];
    self.goldLbEmitterLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.annimationGoldLb.frame), CGRectGetHeight(self.annimationGoldLb.frame));
    [self.annimationGoldLb.layer addSublayer:self.goldLbEmitterLayer];
    //发射源形状
    self.goldLbEmitterLayer.emitterShape = kCAEmitterLayerCircle;
    //发射模式
    self.goldLbEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    //渲染模式
    //    emitter.renderMode = kCAEmitterLayerAdditive;
    //发射位置
    self.goldLbEmitterLayer.emitterPosition = CGPointMake(self.annimationGoldLb.frame.size.width/2.0, self.annimationGoldLb.frame.size.height/2.0);
    //发射源尺寸大小
    self.goldLbEmitterLayer.emitterSize = CGSizeMake(20, 20);
    
    // 从发射源射出的粒子
    {
        CAEmitterCell * cell = [CAEmitterCell emitterCell];
        cell.name = @"zanShape";
        //粒子要展现的图片
        cell.contents = (__bridge id)[UIImage imageNamed:@"金币-图标"].CGImage;
        //    cell.contents = (__bridge id)[UIImage imageNamed:@"EffectImage"].CGImage;
        //            cell.contentsRect = CGRectMake(100, 100, 100, 100);
        //粒子透明度在生命周期内的改变速度
        cell.alphaSpeed = -0.5;
        //生命周期
        cell.lifetime = 3.0;
        //粒子产生系数(粒子的速度乘数因子)
        cell.birthRate = 0;
        //粒子速度
        cell.velocity = 300;
        //速度范围
        cell.velocityRange = 100;
        //周围发射角度
        cell.emissionRange = M_PI / 8;
        //发射的z轴方向的角度
        cell.emissionLatitude = -M_PI;
        //x-y平面的发射方向
        cell.emissionLongitude = -M_PI / 2;
        //粒子y方向的加速度分量
        cell.yAcceleration = 250;
        self.goldLbEmitterLayer.emitterCells = @[cell];
    }
    
    

    ////////开始动画
    //[self beginGoldLbAnimation];
    
    
    
    
    
    


}







#pragma mark ---------------------------------今日签到
- (void)todayCheckinBtnClicked
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_check_in_info.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"今日签到 ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    NSInteger can_check_in_today = [[data objectForKey:@"can_check_in_today"] integerValue];////0 不可以签到  1 可以
                    
                    
                    NSString *can_check_in_todayStrr = [NSString stringWithFormat:@"%ld",(long)can_check_in_today];
                    
                    
                    
                    NSInteger check_in_continus = [[data objectForKey:@"check_in_continus"] integerValue];//连续签到的天数
                    
                    NSString *continueStrrr = [NSString stringWithFormat:@"%ld",(long)check_in_continus];
                    
                    
                    NSLog(@"今日签到____今天能否签到________%@",can_check_in_todayStrr);
                    
                    NSLog(@"今日签到____连续签到的天数________%@",continueStrrr);
                    
                    
                    
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"0"]) {
                        
                        [self weekday111Taped];
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"1"]) {
                        
                        //[AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                    }
                    
                    //第二天
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"1"]) {
                        
                        [self weekday222Taped];
                        
                        
                        
                        
                        //[self qiandaoBtnnnClicked];
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"2"]) {
                        
                        //[AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                    }
                    
                    
                    //第3天
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"2"]) {
                        
                        [self threeSevenDayCheckIn];
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"3"]) {
                        
                        //[AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                    }

                    
                    
                    
                    
                    //第4天
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"3"]) {
                        
                        [self weekday444Taped];
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"4"]) {
                        
                        //[AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                    }
                    
                    //第5天
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"4"]) {
                        
                        [self weekday555Taped];
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"5"]) {
                        
                        //[AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                    }

                    //第6天
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"5"]) {
                        
                        [self weekday666Taped];
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"6"]) {
                        
                        //[AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                    }

                    

                    //第7天
                    if ([can_check_in_todayStrr isEqualToString:@"1"] && [continueStrrr isEqualToString:@"6"]) {
                        
                        [self threeSevenDayCheckIn];
                        
                        
                    }
                    
                    if ([can_check_in_todayStrr isEqualToString:@"0"] && [continueStrrr isEqualToString:@"7"]) {
                        
                        //[AnyObjectActivityView showWithTitle:@"已签到" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                        
                    }

                    
                    
                    
                }
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];
            
            
            
        }
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }

    
    
    
    

}


#pragma mark ---------------------------------签到关闭按钮
- (void)qianCloceBtn1Clicked
{
    

    self.chenckInBgV.hidden = YES;
    self.chenckInBgV2.hidden = YES;

    
    self.annimationGoldLb.hidden = YES;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.qianBlackBgImgV.frame = CGRectMake(0, - kScreen_Height, kScreen_Width, kScreen_Height);
        //self.qianBlackBgImgV.alpha = 0.5;
        
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.qianBlackBgImgV.hidden = YES;
    });



}



#pragma mark ----------------------------点击左上方等级头像
- (void)firstLevelHeadPoritBggImgVTaped
{

    NSString *loginJudge = [NSUserDefaults standardUserDefaults].notLoginOrLogin;
    
    if ([loginJudge isEqualToString:@"notLogin"]) {
        
        ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMLoginViewController alloc]];
        [kWindow setRootViewController:navRoot];
        
        
    } else {
        
        ZMGameSettingViewController *setting = [[ZMGameSettingViewController alloc] init];
        
        
        [self.navigationController pushViewController:setting animated:YES];
        
    }




}


#pragma mark ------------------------------------点击金币
- (void)goldImgggVVTaped
{

    //ZMChooseSongFirstPageViewController *songP = [ZMChooseSongFirstPageViewController shareZMChooseSongFirstPageViewController];
    
    
    NSString *loginJudge = [NSUserDefaults standardUserDefaults].notLoginOrLogin;
    
    if ([loginJudge isEqualToString:@"notLogin"]) {
        //
        ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMLoginViewController alloc]];
        [kWindow setRootViewController:navRoot];
        
    } else {
    
    
        ZMMeeMyGolddsViewController *gold = [[ZMMeeMyGolddsViewController alloc] init];
        gold.titleeLb.text = @"我的金币";
        
        [self.navigationController pushViewController:gold animated:YES];
        
    }
    
    
    


}


#pragma mark --------------------------------顶部点击进入点歌页面
- (void)firstPageMusicPlayingImgVTaped
{

    ZMChooseSongFirstPageViewController *songP = [ZMChooseSongFirstPageViewController shareZMChooseSongFirstPageViewController];
    
    [self.navigationController pushViewController:songP animated:YES];
}


- (void)isPlayingBgVvTaped
{
    
    //if (_isPlayingSong) {
        //
    //    ZMChooseSongFirstPageViewController *songP = [ZMChooseSongFirstPageViewController shareZMChooseSongFirstPageViewController];
        
        
   //     [self.navigationController pushViewController:songP animated:YES];
    //}
    
    

}




#pragma mark ------------------------------ DIY 按钮

- (void)leftDIYImgTaped
{
    ZMCarrtomDIYYViewController *diyVC1 = [ZMCarrtomDIYYViewController sharedZMCarrtomDIYYViewController];
    
    ZMDIYCartoonnSecondDIYYViewController *diyVC2 = [ZMDIYCartoonnSecondDIYYViewController sharedZMDIYCartoonnSecondDIYYViewController];
    
    
    
    NSString *first_second = [NSUserDefaults standardUserDefaults].diy_firstOrSecond;
    
    if (first_second == nil || first_second == NULL || [first_second isKindOfClass:[NSNull class]]) {
        
        [self.navigationController pushViewController:diyVC1 animated:YES];
        
        
    }else {

        if ([first_second isEqualToString:@"1"]) {
            
            [self.navigationController pushViewController:diyVC1 animated:YES];
        }
        
        if ([first_second isEqualToString:@"2"]) {
            
            [self.navigationController pushViewController:diyVC2 animated:YES];
        }
        
        
        
    }
    

    

}


#pragma mark ----------------------------------底部语音 麦克风
- (void)voiceeeeBtnClicked
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        if ([self.weather1 isEqualToString:@""] && [self.weather2 isEqualToString:@""] ) {
            
            [self getWeather:YES];
        }
        
    });
    
    self.voiceeBtn.hidden = YES;
    self.voiceHelpBtn.hidden = YES;
    
    self.voiceHelppTableV.hidden = YES;
    
    self.voiceHelpBgLb.hidden = YES;
    
    //self.voiceHelpBgLbImgV.hidden = YES;
    //self.voiceHelpHeadImgV.hidden = YES;
    
    self.annimationImageV.hidden = NO;
    
    
    
    
    
    //聊天 TableView
    self.chatTableView.hidden = NO;
    
    
    
    //_spectrumView.hidden = NO;//qq 动画
    //self.voiceRecoLb.hidden = NO;
    
    self.voiceRecoLb.text = @"";
    //self.animationLLb.text = @"";
    
    
    
    _voiceHeadRight = NO;
    
//--------------------------------------------------------
//--------------------------------------------------------
//停止语音播报
    
    [[ZRRSpeechSynthesizer sharedSpeechInstance] stopSpeechText];//取消语音播报
    
    if ([_iFlySpeechSynthesizer isSpeaking]) {
        //
        [_iFlySpeechSynthesizer pauseSpeaking];
        [_iFlySpeechSynthesizer stopSpeaking];//科大讯飞
    }
    
//--------------------------------------------------------
//--------------------------------------------------------

    [_iflyRecognizerView cancel];
    
    
    
    [self startListenning];//开始倾听
    
    

}

#pragma mark ----------------------------------语音帮助
- (void)voiceHelppBtnClicked
{
    [_iflyRecognizerView cancel];//取消本次识别
    
//--------------------------------------------------------
//--------------------------------------------------------
//停止语音播报
    
    [[ZRRSpeechSynthesizer sharedSpeechInstance] stopSpeechText];//取消语音播报
    
    if ([_iFlySpeechSynthesizer isSpeaking]) {
        //
        [_iFlySpeechSynthesizer pauseSpeaking];
        [_iFlySpeechSynthesizer stopSpeaking];//科大讯飞
    }
    
//--------------------------------------------------------
//--------------------------------------------------------

    
    
    
    self.chatTableView.hidden = YES;
    
    self.voiceHelppTableV.hidden = NO;
    
    self.voiceHelpBgLb.hidden = NO;

    
    
    
    
}


#pragma mark --------------------------------中间 语音识别按钮

- (void)voiceBtnClicked
{
    
    ////////////清空聊天数据
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 耗时的操作
        if (self.chatDataArray.count != 1) {
            
            [self.chatDataArray removeAllObjects];
           
        
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            
            if (self.chatDataArray.count != 1) {
                
                [self getModelChatArray];//在添加默认第一条数据
                
                [self.chatTableView reloadData];///刷新界面
            }
            
            
            
           
            
            
        });
        
        
    });
    
    
    
    
    
    
    
    NSString *loginJudge = [NSUserDefaults standardUserDefaults].notLoginOrLogin;
    
    if ([loginJudge isEqualToString:@"notLogin"]) {
        
        ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMLoginViewController alloc]];
        [kWindow setRootViewController:navRoot];
        
        
    } else {
        
        self.firstPageSearchSongg = @"";//清空机器人点歌标记
        
        
        self.voiceBtn.hidden = YES;
        
        self.isPlayingBgV.hidden = YES;
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //
            if ([self.weather1 isEqualToString:@""] && [self.weather2 isEqualToString:@""] ) {
                
                [self getWeather:YES];
            }
            
            
        });
        
        
        
        
        
        
        self.voiceWeatherStr = [NSString stringWithFormat:@"星伴为您播报最新天气情况,郑州,今天白天%@,最高温度%@摄氏度,%@,%@,今天夜间%@,最低温度%@摄氏度,%@,二级", self.weather1, self.weather2, self.weather3, self.weather4, self.weather5, self.weather6, self.weather7];
        
        NSLog(@"____***星伴天气***_____%@______",self.voiceWeatherStr);
        
        
        
        //[self voiceHelppBtnClicked];
        
        
        
        self.leftDIYStore.hidden = YES;
        self.bottomIntImgV.hidden = YES;
        self.bottomUserHeadImgV.hidden = YES;
        self.voiceBtn.hidden = YES;
        
        self.firstDiyyBtn.hidden = YES;
        self.firstInttBtn.hidden = YES;
        
        self.firstLevelHeadPoritBggImgV.hidden = YES;
        self.goldBggImgV.hidden = YES;
        
        //self.botomSpeechImgV.hidden = NO;
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.voiceHelpBgV.hidden = NO;
            
            
        });
        
        
        
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            
            
            self.voiceHelpBgV.frame = CGRectMake(0, kScreen_Height/2, kScreen_Width, kScreen_Height/2);
            
            
            
        }];
        
        
        
        
        
        [self voiceHelppBtnClicked];//点击语音帮助按钮
        
        [self.annimationImageV stopAnimating];//停止动画
        self.annimationImageV.hidden = YES;
        self.voiceHelpBtn.hidden = NO;
        self.voiceeBtn.hidden = NO;
        
        
    }
    
    
}


#pragma mark - 语音识别图片点击
- (void)bottomSpeechImgVTaped
{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        self.leftDIYStore.hidden = NO;
        self.bottomIntImgV.hidden = NO;
        self.bottomUserHeadImgV.hidden = NO;
        self.voiceBtn.hidden = NO;
        
        
        self.voiceHelpBgV.hidden = YES;//关闭语音帮助页面
        
        self.bottomSpeechImgV.hidden = YES;
        
        
        //[_animationTimer invalidate];//取消定时器
        //_animationTimer = nil;
        
        
        self.voiceRecoLb.text = @"";
        
        
    });



}


#pragma mark -------------------------点击用户头像(进入设置页面)
- (void)bottomUserHeadImgVTaped
{

//    NSString *loginJudge = [NSUserDefaults standardUserDefaults].notLoginOrLogin;
//    
//    if ([loginJudge isEqualToString:@"notLogin"]) {
//        
//        ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMLoginViewController alloc]];
//        [kWindow setRootViewController:navRoot];
//        
//        
//    } else {
//        
//        ZMGameSettingViewController *setting = [[ZMGameSettingViewController alloc] init];
//        
//        
//        [self.navigationController pushViewController:setting animated:YES];
//        
//    }
//    
    
   

}




- (void)bottomIntImgVTaped22
{

    
    self.bottomIntImgV2.hidden = YES;
    
    self.botomWeAndYouV.hidden = YES;
    self.bottomUserHeadImgV.hidden = NO;
    self.voiceBtn.hidden = NO;
    
    self.botomPageControl.hidden = YES;
    
    
  



}

#pragma mark ---------------------------------- 互动按钮
- (void)bottomIntImgVTaped
{

    
    
    NSString *loginJudge = [NSUserDefaults standardUserDefaults].notLoginOrLogin;
    
    if ([loginJudge isEqualToString:@"notLogin"]) {
        
        ZMBaseNavigationController *navRoot = [[ZMBaseNavigationController alloc]initWithRootViewController:[ZMLoginViewController alloc]];
        [kWindow setRootViewController:navRoot];
        
        
    } else {

        ZMInteractonnFirstPageViewController *interactinVC = [[ZMInteractonnFirstPageViewController alloc] init];
        
        [self presentViewController:interactinVC animated:YES completion:^{
            //
        }];
        
    }
   
    
    
    
    
    
////------------------------------------------测试分割线
    
    
    //ZMNewClockLissttViewController *clock = [[ZMNewClockLissttViewController alloc] init];
    //clock.titleeLb.text = @"闹钟";
    
    //#import "ZMClockViewController.h"
    
    //ZMClockViewController *clock = [[ZMClockViewController alloc] init];
    
    
//    NSString *imgStr = [NSUserDefaults standardUserDefaults].clockListHeadPoritStr;
//    
//    if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
//        
//        
//        [NSUserDefaults standardUserDefaults].clockTiShiiStt = @"一次";
//        
//
//        ZMCLockChooseLoveDouViewController *chooose = [[ZMCLockChooseLoveDouViewController alloc] init];
//        chooose.titleeLb.text = @"选择爱豆叫你起床";
//        
//        [self.navigationController pushViewController:chooose animated:YES];
//        
//    }else {
//        
//        
//        ZMClockViewController *clock = [ZMClockViewController sharedZMClockViewController];
//        
//        clock.titleeLb.text = @"闹钟列表";
//        
//        [self.navigationController pushViewController:clock animated:YES];
//        
//
//        
//    }
//    
//    
//    
    
    
    
    
    
    //ZMChooseSongFirstPageViewController *songP = [ZMChooseSongFirstPageViewController shareZMChooseSongFirstPageViewController];
    
    
   // [self.navigationController pushViewController:songP animated:YES];
    
    //ZMClockStartPageeViewController *start = [[ZMClockStartPageeViewController alloc] init];
    
    //[self.navigationController pushViewController:start animated:YES];
    

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









@end
