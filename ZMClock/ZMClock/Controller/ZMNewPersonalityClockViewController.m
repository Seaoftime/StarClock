//
//  ZMNewPersonalityClockViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMNewPersonalityClockViewController.h"

#import "ZMNewClockMusicLeftTableViewCell.h"
//#import "ZMNewClockMusicRightCollectionViewCell.h"

//录音界面
#import <AVFoundation/AVFoundation.h>
#import "lame.h"
//#import "TOOL.h"

#import "ZMNewRecordMyMusicModel.h"
#import "ZMShareMusicModel.h"
#import "ASIHTTPRequest.h"


///
#import "TaskCell.h"
#import "TaskModel.h"
#import "FGGDownloadManager.h"
#import "ZMMusicTaskModel.h"
#import "ZMMusicTaskTableViewCell.h"
#import "ZMMusicTaskCollectionViewCell.h"
#import "JKDBHelper.h"
#import "ZMRecordDBModel.h"
#import "CustomAlertView.h"
#import "NSMutableURLRequest+MutilPartForm.h"
#import "ZMMusicAndRecordUploadViewController.h"
#import "ZMLeftTableViewURLDownloadModel.h"
#import "ZMSystemClockRingModell.h"

#import "APPTransmit.h"


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define NAVBAR_HEIGHT 40

#define TITLE_X (SCREEN_WIDTH/2-SCREEN_WIDTH/10)
#define TITLE_Y (1.5*NAVBAR_HEIGHT)
#define TITLE_WIDTH (SCREEN_WIDTH/5)
#define TITLE_HEIGHT NAVBAR_HEIGHT

#define RECORDBAR_X (SCREEN_WIDTH/2-SCREEN_WIDTH/4)
#define RECORDBAR_Y (TITLE_Y+TITLE_HEIGHT+NAVBAR_HEIGHT/2)
#define RECORDBAR_WIDTH (SCREEN_WIDTH/2)

#define TIME_X (SCREEN_WIDTH/2-SCREEN_WIDTH/8)
#define TIME_Y (RECORDBAR_Y+NAVBAR_HEIGHT)
#define TIME_WIDTH (SCREEN_WIDTH/4)
#define TIME_HEIGHT NAVBAR_HEIGHT

#define RECORDBUTTON_X (SCREEN_WIDTH/2-SCREEN_WIDTH/6)
#define RECORDBUTTON_Y (TIME_Y+TIME_HEIGHT+NAVBAR_HEIGHT/2)
#define RECORDBUTTON_WIDTH (SCREEN_WIDTH/3)
#define RECORDBUTTON_HEIGHT RECORDBUTTON_WIDTH

#define PLAYBUTTON_X (SCREEN_WIDTH/2-SCREEN_WIDTH/8)
#define PLAYBUTTON_Y (TIME_Y+2*TIME_HEIGHT)
#define PLAYBUTTON_WIDTH SCREEN_WIDTH/4
#define PLAYBUTTON_HEIGHT PLAYBUTTON_WIDTH

#define RECORE_BUTTON_TAG 1010
#define NEW_PLAY_BUTTON_TAG 1011
#define PAUSE_PLAY_BUTTON_TAG 1012
#define FINISH_BUTTON_TAG 1013
#define RECORDAGAIN_BUTTON_TAG 1014
#define PAUSE_BUTTON_TAG 1015




///
#define kCachePath (NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0])





@interface ZMNewPersonalityClockViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,AVAudioRecorderDelegate,TopicAlertViewDeletage>
{
    UILabel* recordTitleLabel;
    UISlider* progressView;
    UILabel* timeLabel;
    UIButton* recordButton;
    UILabel* recordLabel;
    
    NSTimer* timer;
    int recordTime;
    int playTime;
    int playDuration;
    int second;
    int minute;
    
    UIButton* playButton;
    UIButton* finishButton;
    UIButton* pauseButton;
    UIButton* recordAgainButton;
    
    UILabel* playLabel;
    UILabel* finishLabel;
    UILabel* pauseLabel;
    UILabel* recordAgainLabel;
    
    AVAudioRecorder *audioRecorder;
    AVAudioPlayer *audioPlayer;
    AVAudioSession * audioSession;
    
//    NSURL* recordUrl;
//    NSURL* mp3FilePath;
//    NSURL* audioFileSavePath;
    
    NSString* recordUrl;
    NSString* mp3FilePath;
    NSString* audioFileSavePath;
    //
    NSMutableArray *musicArray;
//    NSInteger _musicIndex;//录音时的标记记号(NSUserDefault)
    //
    NSString *_upDownStr;//请求数据时向上滑还是向下
    
    
    
    
    
    ///
    NSMutableArray  *_dataArray;
    NSMutableArray  *_musicDataArray;
    
    NSMutableArray  *_dataCompletedArray;
    
    NSArray  *_musicModelArray;//下载的本地数组
    NSArray  *_recordModelArray;//录音保存到本地的数组
    NSArray *_twoToOneArray;
    NSMutableArray *_systemMusicAry;//系统铃声
    NSMutableArray *_systemNameArray;
    

    NSMutableArray *_recoreed;//录音数组转可变
    
    
    
    NSString *_recordDBNameStr;
   // UILabel *_rightTopLb;
    
    
    
//
    //ZMNewClockMusicLeftTableViewCell *leftCell;
    
}


@property (nonatomic, strong) UIImageView *leftImgV;
@property (nonatomic, strong) UIImageView *middleImgV;
@property (nonatomic, strong) UIImageView *rightImgV;
@property (nonatomic, strong) UIImageView *downloadBGV;
@property (nonatomic, strong) UIView *bgVV;
@property (nonatomic, strong) UITextField *downloadTF;
@property (nonatomic, strong) UIImageView *cellRightImgV;
@property (nonatomic, strong) UIButton *leftTVDownloadBtn;
@property (nonatomic, strong) NSMutableArray *leftTVURLDownloadArray;


//
@property (nonatomic, strong) UITableView *leftTableV;
@property (nonatomic, strong) UITableView *middleTableV;
@property (nonatomic, strong) UITableView *rightTableV;
@property (nonatomic, strong) UICollectionView *rightCollectionV;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

//我的铃声数据源(本地)
@property (nonatomic, strong) NSMutableArray *myLocalMusicArray;
@property (nonatomic, strong) NSMutableArray * remoteVideosArray;

//网友分享数据源(网络)
@property (nonatomic, strong) NSMutableArray *shareMusicArray;
@property (nonatomic, strong) NSMutableArray *shareURLArray;
//
@property (nonatomic, strong) NSMutableArray *shareURLArray2;

//下载请求
@property (nonatomic, strong) ASIHTTPRequest *downloadRequest;
//@property (nonatomic, copy) NSString *downloadUrl;
//@property (nonatomic, copy) NSString *downloadMusicName;

@property (atomic, strong) NSMutableArray *downloadObjectArr;


@property (nonatomic, strong) AVAudioPlayer * player;
@property (nonatomic) NSInteger musicIndex;

@property (nonatomic, strong) AVPlayer *onlinePlayer;
@property (nonatomic, copy) NSString *onlineUrl;

//cell 选中
@property (nonatomic,strong) ZMRecordDBModel *selectModel1;
@property (nonatomic,strong) ZMMusicTaskModel *selectModel2;
@property (nonatomic,strong) ZMSystemClockRingModell *selectModelSystem;

@property(assign, nonatomic) NSInteger clickCount;
//传值
@property (nonatomic, copy) NSString *transRingName;
@property (nonatomic, copy) NSString *transLocalPath;
//
@property (nonatomic, copy) NSString *strDeviceModel;
@property (nonatomic, strong) NSMutableArray *systemClockRingArray;//系统铃声
@property (nonatomic, strong) NSArray *aa;

@property (nonatomic, strong) UILabel *showLbb;
@property (nonatomic, strong) UILabel *rightTopLb;

@end

@implementation ZMNewPersonalityClockViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //
    [NSUserDefaults standardUserDefaults].musicIndex = _musicIndex;
    
    [self.view resignFirstResponder];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(255, 239, 255);
    
    //NSLog(@" %f %f",kScreen_Width,kScreen_Height);
    
    
    self.title = @"个性化闹铃";
    
    
//请求数据
    _upDownStr = @"1";
//    [self fetchShareMusicNetworkData];
    
    
    if ([[ZMBugFixManager sharedFixManager] afterOneWeekShow]) {
        [self prepareData];
    }else {
    }
    
    
    
    _musicModelArray = [ZMMusicTaskModel findAll];
    _recordModelArray = [ZMRecordDBModel findAll];
    
    
    _recoreed = [NSMutableArray arrayWithArray:_recordModelArray];
    
    
//系统数据
    //_systemNameArray = [NSMutableArray arrayWithObjects:@"公鸡打鸣声.mp3",@"欢快口哨音.mp3",@"清新鸟鸣声.mp3",@"舒缓口琴声.mp3", nil];
///
    _aa = [ZMSystemClockRingModell findAll];
    
    if (_aa.count == 0) {
        //
        ZMSystemClockRingModell *systemModel1 = [[ZMSystemClockRingModell alloc] init];
        systemModel1.systemName = @"公鸡打鸣声.mp3";
        systemModel1.systemUrl = [[NSBundle mainBundle] pathForResource:@"公鸡打鸣声" ofType:@"mp3"];
        [systemModel1 save];
        [self.systemClockRingArray addObject:systemModel1];
        
        
        ZMSystemClockRingModell *systemModel2 = [[ZMSystemClockRingModell alloc] init];
        systemModel2.systemName = @"欢快口哨音.mp3";
        systemModel2.systemUrl = [[NSBundle mainBundle] pathForResource:@"欢快口哨音" ofType:@"mp3"];
        [systemModel2 save];
        [self.systemClockRingArray addObject:systemModel2];
        
        ZMSystemClockRingModell *systemModel3 = [[ZMSystemClockRingModell alloc] init];
        systemModel3.systemName = @"清新鸟鸣声.mp3";
        systemModel3.systemUrl = [[NSBundle mainBundle] pathForResource:@"清新鸟鸣声" ofType:@"mp3"];
        [systemModel3 save];
        [self.systemClockRingArray addObject:systemModel3];
        
        ZMSystemClockRingModell *systemModel4 = [[ZMSystemClockRingModell alloc] init];
        systemModel4.systemName = @"舒缓口琴声.mp3";
        systemModel4.systemUrl = [[NSBundle mainBundle] pathForResource:@"舒缓口琴声" ofType:@"mp3"];
        [systemModel4 save];
        [self.systemClockRingArray addObject:systemModel4];
        
    }else {
    
    
    }
    
//UI
    //[self setNavRightBtnImage:@"上传图标"];
    [self setupUI];
    [self setupRecoderUI];
  
    
    
}

- (NSMutableArray *)systemClockRingArray
{
    if (_systemClockRingArray == nil) {
        _systemClockRingArray = [NSMutableArray array];
    }
    return _systemClockRingArray;
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[NSUserDefaults standardUserDefaults].firstLoad = 0;

}



#pragma mark - 重写

#pragma mark - 设置右侧按钮图标
-(void)setNavRightBtnImage:(NSString*)imageName
{
    [self.baseNavigation.rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

#pragma mark - 右侧按钮触发的方法
- (void)navRightBtnAction:(UIButton*)sender
{
    
    NSLog(@".......保存闹钟..........");
    
    
    
    if (_leftTableV.hidden && _rightCollectionV.hidden) {
        //
    }else if (_leftTableV.hidden && _middleTableV.hidden){
        
        ZMMusicAndRecordUploadViewController *uploadVC = [[ZMMusicAndRecordUploadViewController alloc] init];
    
        [self.navigationController pushViewController:uploadVC animated:YES];
    }else if (_middleTableV.hidden && _rightCollectionV.hidden){
        
        //_leftTableV 右上角确定按钮
        //传值 setter
        [APPTransmit shareInstance].ringName = self.transRingName;
        [APPTransmit shareInstance].ringLocalPath = self.transLocalPath;
        
        
        if ([APPTransmit shareInstance].ringName == nil || [APPTransmit shareInstance].ringName == NULL || [[APPTransmit shareInstance].ringName isKindOfClass:[NSNull class]]) {
            
            [AnyObjectActivityView showWithTitle:@"您还没有选择铃声" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
        }else {
        
            //关闭铃声播放
            [self.player stop];
            [audioPlayer stop];
            
            [AnyObjectActivityView showWithTitle:@"铃声已设置" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
            
            [self.navigationController popViewControllerAnimated:YES];
        
        }
        
    }
    
    
    
}


//添加数据模型
- (void)prepareData
{
    
    _dataArray = [NSMutableArray array];
    
    
    ZMMusicTaskModel *model=[ZMMusicTaskModel model];
    model.musicName = @"Goldberg_Variations.mp3";
    model.musicUploadPeopleName = @"假摔";
    model.musicUrl= @"http://192.168.1.111/serverpro/uploadimg/voice_alarm/100048-1466733187-394-1-.mp3";
    model.musicDownloadCount = @"3";
    model.musicDestinationPath = [kCachePath stringByAppendingPathComponent:model.musicName];
    [_dataArray addObject:model];
    
    ZMMusicTaskModel *anotherModel=[ZMMusicTaskModel model];
    anotherModel.musicName=@"Jive_Cool.mp3";
    anotherModel.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/100048-1466733151-978-1-.mp3";
    anotherModel.musicUploadPeopleName = @"假摔";
    anotherModel.musicDownloadCount = @"10";

    anotherModel.musicDestinationPath=[kCachePath stringByAppendingPathComponent:anotherModel.musicName];
    [_dataArray addObject:anotherModel];
    
    ZMMusicTaskModel *anotherModel2=[ZMMusicTaskModel model];
    anotherModel2.musicName=@"巴西世界杯.mp3";
    anotherModel2.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/100048-1466733002-229-1-.mp3";
    anotherModel2.musicUploadPeopleName = @"假摔";
    anotherModel2.musicDownloadCount = @"4";
    
    anotherModel2.musicDestinationPath=[kCachePath stringByAppendingPathComponent:anotherModel2.musicName];
    [_dataArray addObject:anotherModel2];
    
    ZMMusicTaskModel *third = [ZMMusicTaskModel model];
    third.musicName = @"EXO金钟仁叫你起床韩语.mp3";
    third.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b34707b699.mp3";
    third.musicUploadPeopleName = @"1551566";
    third.musicDownloadCount = @"2";

    third.musicDestinationPath=[kCachePath stringByAppendingString:third.musicName];
    [_dataArray addObject:third];
    
    //
    ZMMusicTaskModel *model11=[ZMMusicTaskModel model];
    model11.musicName=@"EXO金钟仁叫你起床韩语.mp3";
    model11.musicUrl= @"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b344e56cd7.mp3";
    model11.musicUploadPeopleName = @"凡凡";
    model11.musicDownloadCount = @"2";

    model11.musicDestinationPath = [kCachePath stringByAppendingPathComponent:model11.musicName];
    [_dataArray addObject:model11];
    
    
    
    ZMMusicTaskModel *model111 =[ZMMusicTaskModel model];
    model111.musicName=@"EXO金钟大叫你起床韩语.mp3";
    model111.musicUrl= @"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b34422a32f.mp3";
    model111.musicUploadPeopleName = @"凡凡";
    model111.musicDownloadCount = @"0";
    
    model111.musicDestinationPath = [kCachePath stringByAppendingPathComponent:model111.musicName];
    [_dataArray addObject:model111];
    
    
    
    ZMMusicTaskModel *anotherModel11=[ZMMusicTaskModel model];
    anotherModel11.musicName=@"EXO黄子韬叫你起床韩语.mp3";
    anotherModel11.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b343948593.mp3";
    anotherModel11.musicUploadPeopleName = @"凡凡";
    anotherModel11.musicDownloadCount = @"0";

    anotherModel11.musicDestinationPath=[kCachePath stringByAppendingPathComponent:anotherModel11.musicName];
    [_dataArray addObject:anotherModel11];
    
    ZMMusicTaskModel *anotherModel22=[ZMMusicTaskModel model];
    anotherModel22.musicName=@"周杰伦叫你起床.mp3";
    anotherModel22.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b3423a1285.mp3";
    anotherModel22.musicUploadPeopleName = @"假摔";
    anotherModel22.musicDownloadCount = @"0";

    anotherModel22.musicDestinationPath=[kCachePath stringByAppendingPathComponent:anotherModel22.musicName];
    [_dataArray addObject:anotherModel22];
    
    ZMMusicTaskModel *third11 = [ZMMusicTaskModel model];
    third11.musicName = @"吴亦凡叫你起床.mp3";
    third11.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b341cbce4b.mp3";
    third11.musicUploadPeopleName = @"假摔";
    third11.musicDownloadCount = @"0";

    third11.musicDestinationPath=[kCachePath stringByAppendingString:third11.musicName];
    [_dataArray addObject:third11];
    
    ZMMusicTaskModel *third111 = [ZMMusicTaskModel model];
    third111.musicName = @"鹿晗叫你起床.mp3";
    third111.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b34164cfca.mp3";
    third111.musicUploadPeopleName = @"假摔";
    third111.musicDownloadCount = @"0";
    
    third111.musicDestinationPath=[kCachePath stringByAppendingString:third111.musicName];
    [_dataArray addObject:third111];

    
    
    ZMMusicTaskModel *third1112 = [ZMMusicTaskModel model];
    third1112.musicName = @"华晨宇叫你起床.mp3";
    third1112.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b341062a20.mp3";
    third1112.musicUploadPeopleName = @"假摔";
    third1112.musicDownloadCount = @"0";
    
    third1112.musicDestinationPath=[kCachePath stringByAppendingString:third1112.musicName];
    [_dataArray addObject:third1112];
    
    
    ZMMusicTaskModel *third11122 = [ZMMusicTaskModel model];
    third11122.musicName = @"陈学冬叫你起床.mp3";
    third11122.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b34087e5ad.mp3";
    third11122.musicUploadPeopleName = @"假摔";
    third11122.musicDownloadCount = @"0";
    
    third11122.musicDestinationPath=[kCachePath stringByAppendingString:third11122.musicName];
    [_dataArray addObject:third11122];
    
    
    ZMMusicTaskModel *third111222 = [ZMMusicTaskModel model];
    third111222.musicName = @"陈翔叫你起床.mp3";
    third111222.musicUrl = @"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b34027e83e.mp3";
    third111222.musicUploadPeopleName = @"假摔";
    third111222.musicDownloadCount = @"0";
    
    third111222.musicDestinationPath=[kCachePath stringByAppendingString:third111222.musicName];
    [_dataArray addObject:third111222];
    
    
    
    
    ZMMusicTaskModel *third112 = [ZMMusicTaskModel model];
    third112.musicName = @"TFBOYS叫你起床.mp3";
    third112.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b33fab16e8.mp3";
    third112.musicUploadPeopleName = @"假摔";
    third112.musicDownloadCount = @"0";
    
    third112.musicDestinationPath=[kCachePath stringByAppendingString:third112.musicName];
    [_dataArray addObject:third112];
    
    ZMMusicTaskModel *third1122 = [ZMMusicTaskModel model];
    third1122.musicName = @"EXO叫你起床.mp3";
    third1122.musicUrl=@"http://192.168.1.111/serverpro/uploadimg/voice_alarm/2016-06-23/576b33e515db3.mp3";
    third1122.musicUploadPeopleName = @"凡凡";
    third1122.musicDownloadCount = @"0";
    
    third1122.musicDestinationPath = [kCachePath stringByAppendingString:third1122.musicName];
    [_dataArray addObject:third1122];


    
    
}





#pragma mark - 请求数据
- (void)fetchShareMusicNetworkData
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        NSString *dev_unique_id = [[ZMHelper sharedHelp] getIdentifierStr];
        //NSString *action_update_his = _isDown?@"1":@"2";
        
        
        NSDictionary *parmeters = @{@"dev_unique_id":dev_unique_id,@"start_seq":@"0",@"end_seq":@"0",@"per_page":@"20",@"action_update_his":_upDownStr};
        
        [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"alarm/get_alarm_voice_list.php" theParmeters:parmeters sucess:^(id object) {
            //
            if ([[MainViewControllerHelper sharedMainHelper] statusWith:object]) {
                
                NSString *msg = [object objectForKey:@"status"];
                
                if ([msg isEqualToString:@"0"]) {
                    //请求成功
                    self.shareMusicArray = [ZMShareMusicModel parseRespondsShareMusicData:object];
                    
                    
                    
                    //self.shareURLArray = [ZFSessionModel parseRespondsShareURLData:object];
                    
                    _musicDataArray = [ZMMusicTaskModel parseRespondsMusicTaskData:object];
                    
                    //NSLog(@"&&&&&&&&&&&&&&&&&&&&  %ld",_shareMusicArray.count);
                    
                    //NSLog(@"URLLLLLLLLLLLLLLLLLL  %ld",_shareURLArray.count);
                    
                    //NSLog(@"####################  %ld",_shareURLArray.count);
                    

                    _dataArray = [ZMMusicTaskModel parseRespondsMusicTaskData:object];
                    
                    
                    NSLog(@"####################  %ld",(unsigned long)_dataArray.count);
                    
                    
                    
                    if (_dataArray.count == 0) {
                        
                        self.showLbb.hidden = NO;
                        _rightTopLb.hidden = YES;
                    }else {
                    
                        self.showLbb.hidden = YES;
                        _rightTopLb.hidden = NO;
                    }
                    
                    
                    
                    //[_rightCollectionV reloadData];

                    [_rightTableV reloadData];
                    
                }else {
                
                    [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                }
            }
        } error:^(NSError *error) {
            //
            NSLog(@"%@",error);
        }];
    }else {
    
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
}



#pragma mark - UI
- (void)setupUI
{
    [self.view addSubview:self.leftImgV];
    [self.view addSubview:self.middleImgV];
    [self.view addSubview:self.rightImgV];
//
    
    
    _leftTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 50 ,kScreen_Width,kScreen_Height - 64 - 50)];
    _leftTableV.backgroundColor = RGB(255, 239, 255);
    _leftTableV.dataSource = self;
    _leftTableV.delegate = self;
    _leftTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _leftTableV.tag = 1001;

    [self.view addSubview:_leftTableV];
///
    _bgVV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 40)];
    _bgVV.backgroundColor = RGB(235.0, 255.0, 255.0);
    
    _downloadBGV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3, kScreen_Width - 10 - 50, 34)];
    _downloadBGV.image = [UIImage imageNamed:@"输入框"];
    _downloadBGV.userInteractionEnabled = YES;
    
    
    _leftTVDownloadBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 40, 5, 30, 30)];
    _leftTVDownloadBtn.backgroundColor = [UIColor clearColor];
    [_leftTVDownloadBtn setTitle:@"" forState:UIControlStateNormal];
    [_leftTVDownloadBtn setBackgroundImage:[UIImage imageNamed:@"添加闹钟附件"] forState:UIControlStateNormal];
    [_leftTVDownloadBtn addTarget:self action:@selector(urlDownloadBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _downloadTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, kScreen_Width - 10 - 57, 34)];
    _downloadTF.backgroundColor = [UIColor clearColor];
    _downloadTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _downloadTF.placeholder = @"请输入铃音下载网址下载,支持MP3/arm 格式铃音";
    
    
    
    
    //_leftTableV.tableHeaderView = _bgVV;
    //[_bgVV addSubview:_downloadBGV];
    //[_bgVV addSubview:_leftTVDownloadBtn];
    
    //[_downloadBGV addSubview:_downloadTF];

    
    
    _middleTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 50 ,kScreen_Width,kScreen_Height - 64 - 50)];
    _middleTableV.backgroundColor = RGB(255, 239, 255);
    _middleTableV.dataSource = self;
    _middleTableV.delegate = self;
    _middleTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _middleTableV.tag = 1002;
    [self.view addSubview:_middleTableV];
    
    
    ///
    UILabel *middleTableVLb = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreen_Height - 180, kScreen_Width, 40)];
    [middleTableVLb setText:@"注:录制好的铃音在我的铃声列表中显示"];
    middleTableVLb.numberOfLines = 0;
    middleTableVLb.textAlignment = NSTextAlignmentCenter;
    
    [middleTableVLb setFont:[UIFont systemFontOfSize:17]];
    [middleTableVLb setTextColor:RGB(124, 92, 117)];
    
    [_middleTableV addSubview:middleTableVLb];
    
    
    
//    _rightTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 44 ,kScreen_Width,kScreen_Height - 64 - 44)];
//    _rightTableV.backgroundColor = [UIColor orangeColor];
//    _rightTableV.dataSource = self;
//    _rightTableV.delegate = self;
//    _rightTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _rightTableV.tag = 1004;
//    [self.view addSubview:_rightTableV];
    
    
    
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //调整 item 的间隔
    _flowLayout.minimumInteritemSpacing = 3;
    _flowLayout.minimumLineSpacing = 3;
    
    
    
    self.rightTopLb = [[UILabel alloc] initWithFrame:CGRectMake(10, 64 + 50 + 5 ,kScreen_Width - 20,50)];
    self.rightTopLb.backgroundColor = RGB(255, 239, 255);
    self.rightTopLb.numberOfLines = 0;
    self.rightTopLb.text = @"平台上的铃声均来源于网友上传分享,如有侵权,请联系我们予以删除";
    self.rightTopLb.font = [UIFont systemFontOfSize:15];
    self.rightTopLb.layer.cornerRadius = 5;
    self.rightTopLb.layer.borderWidth = 1.4f;
    self.rightTopLb.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.rightTopLb.layer.masksToBounds = YES;
    
    
    self.showLbb = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreen_Height/2, kScreen_Width, 40)];
    self.showLbb.text = @"暂无分享";
    self.showLbb.font = [UIFont systemFontOfSize:17];
    self.showLbb.textAlignment = NSTextAlignmentCenter;
    //[self.view addSubview:self.showLbb];
    
    
    
    
    _rightCollectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64 + 50 + 60,kScreen_Width,kScreen_Height - 64 - 50 - 60) collectionViewLayout:_flowLayout];
    
    _rightCollectionV.backgroundColor = RGB(255, 239, 255);
    _rightCollectionV.dataSource = self;
    _rightCollectionV.delegate = self;
    
    //ZMMusicTaskCollectionViewCell
  //  UINib *nib = [UINib nibWithNibName:@"ZMNewClockMusicRightCollectionViewCell" bundle:nil];
    
    UINib *nib = [UINib nibWithNibName:@"ZMMusicTaskCollectionViewCell" bundle:nil];
    
    [_rightCollectionV registerNib:nib forCellWithReuseIdentifier:@"cellID"];
    [self.view addSubview:_rightCollectionV];
    
    [self.view addSubview:self.rightTopLb];
    
    
    
    _leftTableV.hidden = NO;
    _middleTableV.hidden = YES;
    _rightCollectionV.hidden = YES;
    _rightTopLb.hidden = YES;
    //self.showLbb.hidden = YES;
    
    //_rightTableV.hidden = YES;
    
    if (_leftTableV.hidden == NO) {
        _leftImgV.image = [UIImage imageNamed:@"我的铃音-点击状态"];
        
        

    }
    
    

//    self.showLbb = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreen_Height/2, kScreen_Width, 40)];
//    self.showLbb.text = @"暂无分享";
//    self.showLbb.font = [UIFont systemFontOfSize:17];
//    self.showLbb.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.showLbb];
    
    
    
}

- (UIImageView *)leftImgV
{
    if (_leftImgV == nil) {
        _leftImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width/3, 50)];
        _leftImgV.backgroundColor = [UIColor colorWithRed:106/255.0 green:221/255.0 blue:255/255.0 alpha:1];
        _leftImgV.image = [UIImage imageNamed:@"我的铃音2"];
        _leftImgV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1)];
        [_leftImgV addGestureRecognizer:tap];

    }

    return _leftImgV;
}


- (UIImageView *)middleImgV
{
    if (_middleImgV == nil) {
        _middleImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/3, 64, kScreen_Width/3, 50)];
        _middleImgV.backgroundColor = TOPBGColor;
        
        _middleImgV.image = [UIImage imageNamed:@"录制闹铃2"];
        _middleImgV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2)];
        [_middleImgV addGestureRecognizer:tap];
        
    }
    
    return _middleImgV;
}


- (UIImageView *)rightImgV
{
    if (_rightImgV == nil) {
        _rightImgV = [[UIImageView alloc] initWithFrame:CGRectMake(2 * (kScreen_Width/3), 64, kScreen_Width/3, 50)];
        _rightImgV.backgroundColor = TOPBGColor;
        _rightImgV.image = [UIImage imageNamed:@"网友分享2"];
        
        _rightImgV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap3)];
        [_rightImgV addGestureRecognizer:tap];
        
    }
    
    return _rightImgV;
}



#pragma mark - 录音
- (void)setupRecoderUI
{
    
//    NSInteger recordID = self.musicIndex;
//    
    NSString *s = [NSString stringWithFormat:@"%ld",(long)_musicIndex];
    
    if (s == nil || s == NULL || [s isKindOfClass:[NSNull class]]) {
        
        _musicIndex = 0;
    }else {
        _musicIndex += 1;
        
        _musicIndex = [NSUserDefaults standardUserDefaults].musicIndex;
    }
    
    
    //_musicIndex = arc4random()%10000;
    
    
    playButton = [[UIButton alloc] initWithFrame:CGRectMake(PLAYBUTTON_X, PLAYBUTTON_Y, PLAYBUTTON_WIDTH, PLAYBUTTON_HEIGHT)];
    [playButton setImage:[UIImage imageNamed:@"play_button.png"] forState:UIControlStateNormal];
    playButton.tag = NEW_PLAY_BUTTON_TAG;
    [playButton addTarget:self action:@selector(clickOnButton:) forControlEvents:UIControlEventTouchUpInside];
    
    playLabel = [[UILabel alloc] initWithFrame:CGRectMake(PLAYBUTTON_X, PLAYBUTTON_Y+PLAYBUTTON_HEIGHT, PLAYBUTTON_WIDTH, NAVBAR_HEIGHT)];
    [playLabel setText:@"播放"];
    [playLabel setTextAlignment:NSTextAlignmentCenter];
    
    pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(PLAYBUTTON_X, PLAYBUTTON_Y, PLAYBUTTON_WIDTH, PLAYBUTTON_HEIGHT)];
    [pauseButton setImage:[UIImage imageNamed:@"pause_button.png"] forState:UIControlStateNormal];
    pauseButton.tag = PAUSE_BUTTON_TAG;
    [pauseButton addTarget:self action:@selector(clickOnButton:) forControlEvents:UIControlEventTouchUpInside];
    
    pauseLabel = [[UILabel alloc] initWithFrame:CGRectMake(PLAYBUTTON_X, PLAYBUTTON_Y+PLAYBUTTON_HEIGHT, PLAYBUTTON_WIDTH, NAVBAR_HEIGHT)];
    [pauseLabel setText:@"暂停"];
    [pauseLabel setTextAlignment:NSTextAlignmentCenter];
    
    finishButton = [[UIButton alloc] initWithFrame:CGRectMake(PLAYBUTTON_X-PLAYBUTTON_WIDTH-10, PLAYBUTTON_Y, PLAYBUTTON_WIDTH, PLAYBUTTON_HEIGHT)];
    [finishButton setImage:[UIImage imageNamed:@"finish_button.png"] forState:UIControlStateNormal];
    finishButton.tag = FINISH_BUTTON_TAG;
    [finishButton addTarget:self action:@selector(clickOnButton:) forControlEvents:UIControlEventTouchUpInside];
    
    finishLabel = [[UILabel alloc] initWithFrame:CGRectMake(PLAYBUTTON_X-PLAYBUTTON_WIDTH-10, PLAYBUTTON_Y+PLAYBUTTON_HEIGHT, PLAYBUTTON_WIDTH, NAVBAR_HEIGHT)];
    [finishLabel setText:@"完成"];
    [finishLabel setTextAlignment:NSTextAlignmentCenter];
    
    recordAgainButton = [[UIButton alloc] initWithFrame:CGRectMake(PLAYBUTTON_X+PLAYBUTTON_WIDTH+10, PLAYBUTTON_Y, PLAYBUTTON_WIDTH, PLAYBUTTON_HEIGHT)];
    [recordAgainButton setImage:[UIImage imageNamed:@"record_again_button.png"] forState:UIControlStateNormal];
    recordAgainButton.tag = RECORDAGAIN_BUTTON_TAG;
    [recordAgainButton addTarget:self action:@selector(clickOnButton:) forControlEvents:UIControlEventTouchUpInside];
    
    recordAgainLabel = [[UILabel alloc] initWithFrame:CGRectMake(PLAYBUTTON_X+PLAYBUTTON_WIDTH+10, PLAYBUTTON_Y+PLAYBUTTON_HEIGHT, PLAYBUTTON_WIDTH, NAVBAR_HEIGHT)];
    [recordAgainLabel setText:@"重新录制"];
    [recordAgainLabel setTextAlignment:NSTextAlignmentCenter];
    
    recordTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(TITLE_X, TITLE_Y, SCREEN_WIDTH, TITLE_HEIGHT)];
    [recordTitleLabel setText:@"录制铃声"];
    
    progressView = [[UISlider alloc] initWithFrame:CGRectMake(RECORDBAR_X, RECORDBAR_Y, RECORDBAR_WIDTH, 20)];
    [progressView setThumbImage:[UIImage imageNamed:@"one.png"] forState:UIControlStateNormal];
    progressView.value = 0;
    progressView.userInteractionEnabled = NO;
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/4, TIME_Y, kScreen_Width/2, TIME_HEIGHT)];
    [timeLabel setText:@"00:00"];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    //[timeLabel setFont:[UIFont systemFontOfSize:40]];
    [timeLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:50]];
    [timeLabel setTextColor:RGB(124, 92, 117)];
    
    recordButton = [[UIButton alloc] initWithFrame:CGRectMake(RECORDBUTTON_X, RECORDBUTTON_Y, RECORDBUTTON_WIDTH, RECORDBUTTON_HEIGHT)];
    recordButton.tag = RECORE_BUTTON_TAG;
    [recordButton addTarget:self action:@selector(clickOnButton:) forControlEvents:UIControlEventTouchUpInside];
    [recordButton setImage:[UIImage imageNamed:@"录音121"] forState:UIControlStateNormal];
    
    recordLabel = [[UILabel alloc] initWithFrame:CGRectMake(RECORDBUTTON_X, RECORDBUTTON_Y+RECORDBUTTON_HEIGHT, RECORDBUTTON_WIDTH, NAVBAR_HEIGHT/2)];
    [recordLabel setText:@"开始录音"];
    [recordLabel setTextAlignment:NSTextAlignmentCenter];
    
    //录音设置
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    //设置录音格式  AVFormatIDKey==kAudioFormatLinearPCM
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    //设置录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）, 采样率必须要设为11025才能使转化成mp3格式后不会失真
    [recordSetting setValue:[NSNumber numberWithFloat:11025.0] forKey:AVSampleRateKey];
    //录音通道数  1 或 2 ，要转换成mp3格式必须为双通道
    [recordSetting setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    //线性采样位数  8、16、24、32
    [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //录音的质量
    [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
    
    //存储录音文件
    //recordUrl = [NSURL URLWithString:[NSTemporaryDirectory() stringByAppendingString:@"selfRecord.caf"]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    
    NSString *p = [NSString stringWithFormat:@"%@/%ldmp3.caf",path,(long)_musicIndex];
    
    //NSString *p = [NSString stringWithFormat:@"%@/mp3.caf",path];

//    recordUrl = [NSURL URLWithString:p];
    recordUrl = p;
    
    NSLog(@"%@",recordUrl);
    
    
    //初始化
//    audioRecorder = [[AVAudioRecorder alloc] initWithURL:recordUrl settings:recordSetting error:nil];
    
    audioRecorder = [[AVAudioRecorder alloc] initWithURL:[NSURL URLWithString:recordUrl] settings:recordSetting error:nil];
    
    //开启音量检测
    audioRecorder.meteringEnabled = YES;
    audioRecorder.delegate = self;
    
    [self.middleTableV addSubview:recordTitleLabel];
    [self.middleTableV addSubview:progressView];
    [self.middleTableV addSubview:timeLabel];
    [self.middleTableV addSubview:recordButton];
    [self.middleTableV addSubview:recordLabel];
    
    
    
    //self.middleTableV.backgroundColor = RGB(254, 239, 254);
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(musicIndexChange) name:@"musicIndex" object:nil];
}





- (void)clickOnButton:(UIButton*)sender
{
    audioSession = [AVAudioSession sharedInstance];//得到AVAudioSession单例对象
    switch (sender.tag) {
        case RECORE_BUTTON_TAG:{//点击开始/点击结束
            
            if (![audioRecorder isRecording]) {
                [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];//设置类别,表示该应用同时支持播放和录音
                [audioSession setActive:YES error:nil];//启动音频会话管理,此时会阻断后台音乐的播放.
                
                [audioRecorder prepareToRecord];
                [audioRecorder peakPowerForChannel:0.0];
                [audioRecorder record];
                recordTime = 0;
                
                [self recordTimeStart];
                [recordButton setImage:[UIImage imageNamed:@"recording_button.png"] forState:UIControlStateNormal];
                [recordLabel setText:@"点击结束"];
            }
            else{
                [audioRecorder stop];                          //录音停止
                [audioSession setActive:NO error:nil];         //一定要在录音停止以后再关闭音频会话管理（否则会报错），此时会延续后台音乐播放
                [timer invalidate];                            //timer失效
                [timeLabel setText:@"00:00"];                  //时间显示复位
                [progressView setValue:0 animated:YES];        //进度条复位
                
                [recordButton removeFromSuperview];
                [recordLabel removeFromSuperview];
                [self.middleTableV addSubview:playButton];
                [self.middleTableV addSubview:finishButton];
                [self.middleTableV addSubview:recordAgainButton];
                [self.middleTableV addSubview:playLabel];
                [self.middleTableV addSubview:finishLabel];
                [self.middleTableV addSubview:recordAgainLabel];
            }
        }
            break;
        case NEW_PLAY_BUTTON_TAG:{//播放
            
            [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
            [audioSession setActive:YES error:nil];
            
            if (mp3FilePath != nil) {
//                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3FilePath error:nil];
                
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:mp3FilePath] error:nil];
                
            }
            else if (recordUrl != nil){
                //audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:recordUrl error:nil];
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:recordUrl] error:nil];
            }
            
            [audioPlayer prepareToPlay];
            audioPlayer.volume = 1;
            [audioPlayer play];
            
            [playButton removeFromSuperview];
            [playLabel removeFromSuperview];
            [self.middleTableV addSubview:pauseButton];
            [self.middleTableV addSubview:pauseLabel];
            
            playDuration = (int)audioPlayer.duration;
            NSLog(@"音频时长为：%i",playDuration);
            playTime = 0;
            [self audioPlayTimeStart];
        }
            break;
        case PAUSE_PLAY_BUTTON_TAG:{
            [audioSession setActive:YES error:nil];
            
            [audioPlayer play];
            
            [playButton removeFromSuperview];
            [playLabel removeFromSuperview];
            [self.middleTableV addSubview:pauseButton];
            [self.middleTableV addSubview:pauseLabel];
        }
            break;
        case PAUSE_BUTTON_TAG:{
            [audioPlayer pause];
            [audioSession setActive:NO error:nil];
            
            playButton.tag = PAUSE_PLAY_BUTTON_TAG;
            [pauseButton removeFromSuperview];
            [pauseLabel removeFromSuperview];
            [self.middleTableV addSubview:playButton];
            [self.middleTableV addSubview:playLabel];
        }
            break;
        case FINISH_BUTTON_TAG:{//完成
            
            //[self transformCAFToMP3];
            
            
            //恢复初始状态
            [audioPlayer stop];
            [audioRecorder stop];
            [audioSession setActive:NO error:nil];
            
            [timer invalidate];
            progressView.value = 0;
            [timeLabel setText:@"00:00"];
            recordTime = 0;
            playTime = 0;
            
            [playButton removeFromSuperview];
            [pauseButton removeFromSuperview];
            [finishButton removeFromSuperview];
            [recordAgainButton removeFromSuperview];
            [playLabel removeFromSuperview];
            [pauseLabel removeFromSuperview];
            [finishLabel removeFromSuperview];
            [recordAgainLabel removeFromSuperview];
            
            [self.middleTableV addSubview:recordButton];
            [self.middleTableV addSubview:recordLabel];
            [recordButton setImage:[UIImage imageNamed:@"录音121"] forState:UIControlStateNormal];
            [recordLabel setText:@"开始录音"];


            [self completedClicked];
            
            
            
        }
            break;
        case RECORDAGAIN_BUTTON_TAG:{//重新录制
            [audioPlayer stop];
            [audioRecorder stop];
            [audioSession setActive:NO error:nil];
            
            [timer invalidate];
            progressView.value = 0;
            [timeLabel setText:@"00:00"];
            recordTime = 0;
            playTime = 0;
            
            [playButton removeFromSuperview];
            [pauseButton removeFromSuperview];
            [finishButton removeFromSuperview];
            [recordAgainButton removeFromSuperview];
            [playLabel removeFromSuperview];
            [pauseLabel removeFromSuperview];
            [finishLabel removeFromSuperview];
            [recordAgainLabel removeFromSuperview];
            
            [self.middleTableV addSubview:recordButton];
            [self.middleTableV addSubview:recordLabel];
            [recordButton setImage:[UIImage imageNamed:@"录音121"] forState:UIControlStateNormal];
            [recordLabel setText:@"开始录音"];
        }
            break;
        default:
            break;
    }
}



#pragma mark - 点击完成
- (void)completedClicked
{
    
//    self.musicIndex += 1;
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeIndex" object:self];
    
    _musicIndex += 1;
    [NSUserDefaults standardUserDefaults].musicIndex = _musicIndex;
    
    
    
    
    
    TopicAlertView *inputAlertView = [[TopicAlertView alloc]initInpputWithTitle:@"保存录音" setDelegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
    [inputAlertView showInpputAlertView];

    
    
    
    
//    CustomAlertView *alert = [[CustomAlertView alloc] initWithAlertViewHeight:248];
//    //__weak __typeof(self)weakSelf = self;
//    
//    alert.ButtonClick = ^void(UIButton*button){
//        
//        _recordDBNameStr = alert.textField.text;
//        
//        
//        
//        ZMRecordDBModel *recordDBModel = [[ZMRecordDBModel alloc] init];
//        
//        
//        recordDBModel.recordDBName = _recordDBNameStr;
//        
//        recordDBModel.recordDBUrl = recordUrl;
//        
//        [recordDBModel save];
//        
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"录音已保存"] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
//        [alert show];
//        
//         [self.navigationController popViewControllerAnimated:YES];
//    };
////
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //
//    ZMRecordDBModel *recordDBModel = [[ZMRecordDBModel alloc] init];
//    
//    recordDBModel.recordDBName = _recordDBNameStr;
//    recordDBModel.recordDBUrl = recordUrl;
//    
//    NSLog(@"^^^^^^^^^^^^^^^^^^^^^^^^^%@%@",recordDBModel.recordDBName,recordDBModel.recordDBUrl);
    
    
//    NSString *filePath = [NSURL fileURLWithPath:recordUrl];
//    
//    
//    NSData *data= [NSData dataWithContentsOfFile:filePath];
    
    //_musicIndex += 1;
    //[NSUserDefaults standardUserDefaults].musicIndex = _musicIndex;
    
//    NSString *recordurl = recordUrl;
//    //NSString *dbstr = [NSString stringWithContentsOfURL:recordUrl encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"%@",recordurl);
//    
//    //[[SQLiteDBManage sharedInstance] insertIntoMyMusicTableWithrecordFilePath:dburl WithFromType:[NSString stringWithFormat:@"%d",0]];
//    //[APPTransmit shareInstance].recordPath = dburl;
//    
//    [self.myLocalMusicArray addObject:recordurl];
//    
//    NSLog(@"arrayarray%@",self.myLocalMusicArray);
//    
//    [self.leftTableV reloadData];
//    
//    [self.navigationController popViewControllerAnimated:YES];
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"musicIndex" object:self];
    
    
}



#pragma mark - 保存录音
//#pragma arguments
-(void)topicInputAlertButton:(NSString*)sender
{
    
    [_downloadTF resignFirstResponder];
    
    NSString *strrr = [NSString stringWithFormat:@"%@",sender];
    //NSLog(@"%@",strrr);
    
    _recordDBNameStr = strrr;
    
    
    
    ZMRecordDBModel *recordDBModel = [[ZMRecordDBModel alloc] init];
    
    
    recordDBModel.recordDBName = _recordDBNameStr;
    
    recordDBModel.recordDBUrl = recordUrl;
    
    [recordDBModel save];
    
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"录音已保存"] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
//    [alert show];
    
    
    [AnyObjectActivityView showWithTitle:@"录音已保存" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.navigationController popViewControllerAnimated:YES];
    });
    
    
    
}




- (void)transformCAFToMP3
{
    //i += 1;
    
//    mp3FilePath = [NSURL URLWithString:[NSTemporaryDirectory() stringByAppendingString:@"myselfRecord.mp3"]];
//    
//    
//    @try {
//        int read, write;
//        
//        FILE *pcm = fopen([[recordUrl absoluteString] cStringUsingEncoding:1], "rb");   //source 被转换的音频文件位置
//        fseek(pcm, 4*1024, SEEK_CUR);                                                   //skip file header
//        FILE *mp3 = fopen([[mp3FilePath absoluteString] cStringUsingEncoding:1], "wb"); //output 输出生成的Mp3文件位置
//        
//        const int PCM_SIZE = 8192;
//        const int MP3_SIZE = 8192;
//        short int pcm_buffer[PCM_SIZE*2];
//        unsigned char mp3_buffer[MP3_SIZE];
//        
//        lame_t lame = lame_init();
//        lame_set_in_samplerate(lame, 11025.0);
//        lame_set_VBR(lame, vbr_default);
//        lame_init_params(lame);
//        
//        do {
//            read = (int)fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
//            if (read == 0)
//                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
//            else
//                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
//            
//            fwrite(mp3_buffer, write, 1, mp3);
//            
//        } while (read != 0);
//        
//        lame_close(lame);
//        fclose(mp3);
//        fclose(pcm);
//    }
//    @catch (NSException *exception) {
//        NSLog(@"%@",[exception description]);
//    }
//    @finally {
//        
//        
//        
//        //audioFileSavePath = mp3FilePath;
//        //audioFileSavePath = [NSURL URLWithString:[NSString stringWithFormat:@"%@%d",mp3FilePath,i]];
//        
//        NSLog(@"MP3生成成功: %@",audioFileSavePath);
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"mp3转化成功！" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        
//        
//        
//    }
    
    
    
}



- (void)recordTimeStart
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(recordTimeTick) userInfo:nil repeats:YES];
}

- (void)recordTimeTick
{
    recordTime += 1;
    [progressView setValue:(float)recordTime/30.0 animated:YES];
    if (recordTime == 30) {
        recordTime = 0;
        [audioRecorder stop];
        [[AVAudioSession sharedInstance] setActive:NO error:nil];
        [timer invalidate];
        [timeLabel setText:@"00:00"];
        [progressView setValue:0.0 animated:YES];
        
        [recordButton removeFromSuperview];
        [recordLabel removeFromSuperview];
        [self.middleTableV addSubview:playButton];
        [self.middleTableV addSubview:finishButton];
        [self.middleTableV addSubview:recordAgainButton];
        [self.middleTableV addSubview:playLabel];
        [self.middleTableV addSubview:finishLabel];
        [self.middleTableV addSubview:recordAgainLabel];
        return;
    }
    [self updateAudioRecordTime];
}

- (void)updateAudioRecordTime
{
    minute = recordTime/60.0;
    second = recordTime-minute*60;
    
    [timeLabel setText:[NSString stringWithFormat:@"%02d:%02d",minute,second]];
}

- (void)audioPlayTimeStart
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(playTimeTick) userInfo:nil repeats:YES];
}

- (void)playTimeTick
{
    if (playDuration == playTime) {
        playTime = 0;
        [audioPlayer stop];
        [[AVAudioSession sharedInstance] setActive:NO error:nil];
        
        [pauseButton removeFromSuperview];
        [pauseLabel removeFromSuperview];
        [self.middleTableV addSubview:playButton];
        [self.middleTableV addSubview:playLabel];
        
        playButton.tag = NEW_PLAY_BUTTON_TAG;
        
        [timeLabel setText:@"00:00"];
        [timer invalidate];
        progressView.value = 0;
        return;
    }
    if (![audioPlayer isPlaying]) {
        return;
    }
    playTime += 1;
    [progressView setValue:(float)playTime/(float)playDuration animated:YES];
    progressView.minimumTrackTintColor = TOPBGColor;
    
    [self updateAudioPlayTime];
}

- (void)updateAudioPlayTime
{
    minute = playTime/60.0;
    second = playTime-minute*60;
    
    [timeLabel setText:[NSString stringWithFormat:@"%02d:%02d",minute,second]];
}

//AVAudioRecorderDelegate方法
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [audioSession setActive:NO error:nil];
    
    playTime = 0;
    
    [pauseButton removeFromSuperview];
    [pauseLabel removeFromSuperview];
    [self.middleTableV addSubview:playButton];
    [self.middleTableV addSubview:playLabel];
    
    playButton.tag = NEW_PLAY_BUTTON_TAG;
    
    [timeLabel setText:@"00:00"];
    [timer invalidate];
    progressView.value = 0;
}







#pragma mark - Event 
- (void)tap1
{
    
    _leftTableV.hidden = NO;
    _middleTableV.hidden = YES;
    _rightCollectionV.hidden = YES;
    //_rightTableV.hidden = YES;
    
    _rightTopLb.hidden = YES;
    self.showLbb.hidden = YES;
    
    _leftImgV.image = [UIImage imageNamed:@"我的铃音-点击状态"];
    //_leftImgV.image = [UIImage imageNamed:@"我的铃音2"];
    _middleImgV.image = [UIImage imageNamed:@"录制闹铃2"];
    _rightImgV.image = [UIImage imageNamed:@"网友分享2"];
    
    
    [self setNavRightBtnImage:@"导航完成"];
    
    
    _musicModelArray = [ZMMusicTaskModel findAll];
    _recordModelArray = [ZMRecordDBModel findAll];
    
    [_leftTableV reloadData];
    
//关闭在线播放
    [self.onlinePlayer pause];
    
}



- (void)tap2
{
    _leftTableV.hidden = YES;
    _middleTableV.hidden = NO;
    _rightCollectionV.hidden = YES;
    //_rightTableV.hidden = YES;
    _rightTopLb.hidden = YES;

    self.showLbb.hidden = YES;
    
    
    _leftImgV.image = [UIImage imageNamed:@"我的铃音2"];
    _middleImgV.image = [UIImage imageNamed:@"录制闹铃点-击状态"];
    _rightImgV.image = [UIImage imageNamed:@"网友分享2"];
    
    [self setNavRightBtnImage:@""];
    
//关闭铃声播放
    [self.player stop];
    [audioPlayer stop];
    
//关闭在线播放
    [self.onlinePlayer pause];
    
}

- (void)tap3
{
    _leftTableV.hidden = YES;
    _middleTableV.hidden = YES;
    _rightCollectionV.hidden = NO;
    //_rightTableV.hidden = NO;
    
    
    if (_dataArray.count == 0) {
        
        [self.view addSubview:self.showLbb];
        
        self.showLbb.hidden = NO;
        _rightTopLb.hidden = YES;
    }else {
        
        self.showLbb.hidden = YES;
        _rightTopLb.hidden = NO;
    }


    _leftImgV.image = [UIImage imageNamed:@"我的铃音2"];
    _middleImgV.image = [UIImage imageNamed:@"录制闹铃2"];
    _rightImgV.image = [UIImage imageNamed:@"网友分享-点击状态"];
    
    
    [self setNavRightBtnImage:@"上传图标"];
    
//关闭铃声播放
    [self.player stop];
    [audioPlayer stop];
}


#pragma mark -tableview delegte && dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 1001) {
        
        return 3;
        //return 1;
        
    }else {
    
        return 1;
    
    }
    //return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //return self.movieList.count;
    //2
    //return self.remoteVideos.count;
    
    
    if (tableView.tag == 1001) {
        
        
        if (section == 2) {
            
            NSLog(@">>>>>>>>>>>>>>>>>>>下载铃声>>>>>>>>>>>>>>>>>>>>>>%ld",(unsigned long)_musicModelArray.count);
            
            return _musicModelArray.count;
            

        }else if (section == 1){
        
            NSLog(@">>>>>>>>>>>>>>>>>>>录制铃声>>>>>>>>>>>>>>>>>>>>>>%ld",(unsigned long)_musicModelArray.count);
            return _recordModelArray.count;
            
        }else {//系统铃声
        
            if (_aa.count == 0) {
                return self.systemClockRingArray.count;
            }else {
            
               return  _aa.count;
            }
            //return self.systemClockRingArray.count;

            
        }
        
        
        
        
        //return _musicModelArray.count + _recordModelArray.count;
        //return _twoToOneArray.count;
        
    }else if (tableView.tag == 1004) {
    
        //return _musicDataArray.count;
        
        return _dataArray.count;
    
    }else{
    
        return 1;
    }
    
}


#pragma mark - cell 选中
- (void)ClickBtn2:(UIButton *)btn
{
    
//    if (!self.selectModel1.isSelected) {
//        //self.selectModel1.isSelected = NO;
//        
//        if (self.selectModel2) {
//            self.selectModel2.isSelected = !self.selectModel2.isSelected;
//        }
//        ZMMusicTaskModel *model = _musicModelArray[btn.tag];
//        if (!model.isSelected) {
//            model.isSelected = !model.isSelected;
//            self.selectModel2 = model;
//        }
//    }
    
    //下载
    NSLog(@"下载下载下载下载下载   你选了第  %ld  行",(long)btn.tag);
    
    if (self.selectModel1.isSelected) {
        self.selectModel1.isSelected = NO;
    }
    
    if (self.selectModelSystem.isSelected) {
        self.selectModelSystem.isSelected = NO;
    }
    
    
    
    if (self.selectModel2) {
        self.selectModel2.isSelected = !self.selectModel2.isSelected;
    }
    ZMMusicTaskModel *model = _musicModelArray[btn.tag];
    if (!model.isSelected) {
        model.isSelected = !model.isSelected;
        self.selectModel2 = model;
    }
    
//传值
    self.transRingName = model.musicName;
//    self.transLocalPath = model.musicDestinationPath;

    [NSUserDefaults standardUserDefaults].selectedMusicPath = model.musicDestinationPath;
    NSLog(@"__________下载选择铃声_______%@",[NSUserDefaults standardUserDefaults].selectedMusicPath);
    
    [_leftTableV reloadData];
    
}


- (void)ClickBtn1:(UIButton *)btn
{
//    if (!self.selectModel2.isSelected) {
//        //self.selectModel2.isSelected = NO;
//        
//        if (self.selectModel1) {
//            self.selectModel1.isSelected = !self.selectModel1.isSelected;
//        }
//        ZMRecordDBModel *model = _recordModelArray[btn.tag];
//        if (!model.isSelected) {
//            model.isSelected = !model.isSelected;
//            self.selectModel1 = model;
//        }
//        
//        
//        
//    }
    //录制
    NSLog(@"录制录制录制录制录制      你选了第  %ld  行",(long)btn.tag);
    
    if (self.selectModel2.isSelected) {
         self.selectModel2.isSelected = NO;
    }
   
    if (self.selectModelSystem.isSelected) {
        self.selectModelSystem.isSelected = NO;
    }
    
    
    if (self.selectModel1) {
        self.selectModel1.isSelected = !self.selectModel1.isSelected;
    }
    ZMRecordDBModel *model = _recordModelArray[btn.tag];
    if (!model.isSelected) {
        model.isSelected = !model.isSelected;
        self.selectModel1 = model;
    }
    
//传值
    self.transRingName = model.recordDBName;
    self.transLocalPath = model.recordDBUrl;
//
    [NSUserDefaults standardUserDefaults].selectedMusicPath = model.recordDBUrl;
    NSLog(@"__________录制选择铃声_______%@",[NSUserDefaults standardUserDefaults].selectedMusicPath);
    
    
    [_leftTableV reloadData];
    
}


- (void)ClickBtn0:(UIButton *)btn
{
   
    //录制
    NSLog(@"系统系统系统系统系统      你选了第  %ld  行",(long)btn.tag);
    
    if (self.selectModel2.isSelected) {
        self.selectModel2.isSelected = NO;
    }
    
    if (self.selectModel1.isSelected) {
        self.selectModel1.isSelected = NO;
    }
    
    
    
    if (self.selectModelSystem) {
        self.selectModelSystem.isSelected = !self.selectModelSystem.isSelected;
    }
    
    if (_aa.count == 0) {
        //
        ZMSystemClockRingModell *model = _systemClockRingArray[btn.tag];
        
        if (!model.isSelected) {
            model.isSelected = !model.isSelected;
            self.selectModelSystem = model;
        }
        
        //传值
        self.transRingName = model.systemName;
        
        
        [_leftTableV reloadData];
    }else {
    
        ZMSystemClockRingModell *model = _aa[btn.tag];
        
        if (!model.isSelected) {
            model.isSelected = !model.isSelected;
            self.selectModelSystem = model;
        }
        
        //传值
        self.transRingName = model.systemName;
        
        
        [_leftTableV reloadData];
    }
   
    
}




#pragma mark -  cell删除
#pragma mark - 以下4种方法全要实现
//
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1001) {
        return YES;
    }else {
    
         return NO;
    
    }
   
}

//删除按钮的文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1001) {
        
        if (indexPath.section == 0) {
            return @"删除";
        }else {
        
            return @"删除";
        }
        

    }else {
    
        return nil;
    }
    
}

//编辑类型
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1001) {
        return UITableViewCellEditingStyleDelete;

    }else {
    
        return UITableViewCellEditingStyleNone;
    }
    
}

//编辑完成
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1001) {

//一定要先删除数据 再删除行
        if (indexPath.section == 0) {//系统铃声
            //
            
            
            if (_aa.count == 0) {
                
                [self.systemClockRingArray removeObjectAtIndex:indexPath.row];
                
                
                [_leftTableV deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                
                
                [_leftTableV reloadData];
            }else {
            
                ZMSystemClockRingModell *model = [_aa objectAtIndex:indexPath.row];
                
                [model deleteObject];
                
                [(NSMutableArray *)_aa removeObjectAtIndex:indexPath.row];
                
                
                [_leftTableV deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                
                
                [_leftTableV reloadData];
            
            }
            
            
        }else if (indexPath.section == 1){//录制铃声
            
            ZMRecordDBModel *recordModel = _recordModelArray[indexPath.row];
            [recordModel deleteObject];
            
    
            [(NSMutableArray *)_recordModelArray removeObjectAtIndex:indexPath.row];
            
            
            [_leftTableV deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            
            [_leftTableV reloadData];
            
            
        }else if (indexPath.section == 2){//下载铃声
            
            
            ZMMusicTaskModel *musicModel = _musicModelArray[indexPath.row];
            
            [musicModel deleteObject];
            
            
            [(NSMutableArray *)_musicModelArray removeObjectAtIndex:indexPath.row];
            
            
            [_leftTableV deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            
            [_leftTableV reloadData];

            
        }else {
        
        }
    }
    
}






//- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        
//        if (indexPath.section == 0) {
//            //
////            [_systemNameArray removeObjectAtIndex:indexPath.row];
//            
//            
//            [_systemClockRingArray removeObjectAtIndex:indexPath.row];
//            ZMSystemClockRingModell *model = [_systemClockRingArray objectAtIndex:indexPath.row];
//            
//            [model deleteObject];
//            [_leftTableV deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//            [_leftTableV reloadData];
////            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////                
////                ZMSystemClockRingModell *model = [_systemClockRingArray objectAtIndex:indexPath.row];
////                
////                [model deleteObject];
////                
////                [_leftTableV reloadData];
////            });
//            
//            
//            
//           // [_leftTableV deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//            
//            //[_leftTableV reloadData];
//        }
//        
//        
//        
//    }];
//    
//    
//    return @[deleteRowAction];
//}
//
//





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 1001) {
        //
        
//        static  NSString *cellIdentifier = @"left";
//        ZMNewClockMusicLeftTableViewCell *cell= [_leftTableV dequeueReusableCellWithIdentifier:cellIdentifier];
//        [_leftTableV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//        if(!cell){
//            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewClockMusicLeftTableViewCell" owner:self options:nil] lastObject];
//            
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//        if (indexPath.row%2 == 0) {
//            cell.backgroundColor = RGB(254.0, 226.0, 254.0);
//        }else {
//            
//            cell.backgroundColor = RGB(235.0, 255.0, 255.0);;
//            
//        }
//        
//        
//        [cell.rightSelectedBtn addTarget:self action:@selector(ClickBtn2:) forControlEvents:UIControlEventTouchUpInside];
//        
//        cell.rightSelectedBtn.tag = indexPath.row;
//        
//        //cell.rightImgV.image = [UIImage imageNamed:@"未选中铃声"];
//        
//        
//        ZMMusicTaskModel *model = _musicModelArray[indexPath.row - _recordModelArray.count];
//        //model.selectType = no_select_type1;
//        
//        [cell setModel:model];
//        
/////
////        [cell.rightSelectedBtn addTarget:self action:@selector(ClickBtn1:) forControlEvents:UIControlEventTouchUpInside];
////        
////        cell.rightSelectedBtn.tag = indexPath.row;
//        
//        
//        //cell.rightImgV.image = [UIImage imageNamed:@"未选中铃声"];
//        
//        //NSInteger musicTaskCount = _musicModelArray.count;
//        
//        //ZMRecordDBModel *recordModel = _recordModelArray[_musicModelArray.count];
//        
//        //[cell setRecordDBModel:recordModel];
//        
//        
//        
//        
//        
//        return cell;
//        
        
        
        
        
        
//        
        if (indexPath.section == 2) {//下载铃声
            //
            static  NSString *cellIdentifier = @"left";
            ZMNewClockMusicLeftTableViewCell *cell= [_leftTableV dequeueReusableCellWithIdentifier:cellIdentifier];
            [_leftTableV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            if(!cell){
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewClockMusicLeftTableViewCell" owner:self options:nil] lastObject];

            }
            //cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if (indexPath.row%2 == 0) {
                cell.backgroundColor = RGB(235.0, 255.0, 255.0);
            }else {
            
                
                cell.backgroundColor = RGB(254.0, 226.0, 254.0);
                
            }
            
            
            [cell.rightSelectedBtn addTarget:self action:@selector(ClickBtn2:) forControlEvents:UIControlEventTouchUpInside];
            
            cell.rightSelectedBtn.tag = indexPath.row;
            
            //cell.rightImgV.image = [UIImage imageNamed:@"未选中铃声"];
            
            
            ZMMusicTaskModel *model = _musicModelArray[indexPath.row];
            //model.selectType = no_select_type1;
            
            [cell setModel:model];
            
            return cell;

        }else if (indexPath.section == 1){//录制铃声
        
            static  NSString *cellIdentifier = @"left";
            ZMNewClockMusicLeftTableViewCell *cell= [_leftTableV dequeueReusableCellWithIdentifier:cellIdentifier];
            [_leftTableV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            
            if(!cell){
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewClockMusicLeftTableViewCell" owner:self options:nil] lastObject];
            }
            //cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if (indexPath.row%2 == 0) {
                cell.backgroundColor = RGB(254.0, 226.0, 254.0);
            }else {
                
                cell.backgroundColor = RGB(235.0, 255.0, 255.0);
                
            }
            
            cell.rightSelectedBtn.tag = indexPath.row;

            
            [cell.rightSelectedBtn addTarget:self action:@selector(ClickBtn1:) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            //cell.rightImgV.image = [UIImage imageNamed:@"未选中铃声"];
            
            
            ZMRecordDBModel *model = _recordModelArray[indexPath.row];
            
            //model.selectType = no_select_type1;

            
            [cell setRecordDBModel:model];
            
            return cell;

        }else {//系统铃声
        
            static  NSString *cellIdentifier = @"left";
            ZMNewClockMusicLeftTableViewCell *cell= [_leftTableV dequeueReusableCellWithIdentifier:cellIdentifier];
            [_leftTableV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            if(!cell){
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewClockMusicLeftTableViewCell" owner:self options:nil] lastObject];
            }
            
            if (indexPath.row%2 == 0) {
                cell.backgroundColor = RGB(254.0, 226.0, 254.0);
            }else {
                
                cell.backgroundColor = RGB(235.0, 255.0, 255.0);;
                
            }
            
            if (_aa.count == 0) {
                ZMSystemClockRingModell *model = self.systemClockRingArray[indexPath.row];
                
                cell.musicNameLb.text = model.systemName;
                
                
                cell.rightSelectedBtn.tag = indexPath.row;
                
                
                [cell.rightSelectedBtn addTarget:self action:@selector(ClickBtn0:) forControlEvents:UIControlEventTouchUpInside];
                
                [cell setSystemModel:model];
                
                return cell;
            }else {
            
                ZMSystemClockRingModell *model2 = _aa[indexPath.row];
                
                cell.musicNameLb.text = model2.systemName;
                
                cell.rightSelectedBtn.tag = indexPath.row;
                
                
                [cell.rightSelectedBtn addTarget:self action:@selector(ClickBtn0:) forControlEvents:UIControlEventTouchUpInside];
                
                [cell setSystemModel:model2];
                
                return cell;
            
            }
            
            
            
        }
        
        
        
    }else if (tableView.tag == 1004) {
    
    
        static NSString *cellId=@"TaskCellID";
        ZMMusicTaskTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
        if(!cell)
            cell=[[[NSBundle mainBundle] loadNibNamed:@"ZMMusicTaskTableViewCell" owner:nil options:nil] lastObject];
//        ZMMusicTaskModel *model= _musicDataArray[indexPath.row];
//        [cell updateCellWithModel:model];
        
        
        ZMMusicTaskModel *model= _dataArray[indexPath.row];
        [cell updateCellWithModel:model];
        
        
        //点击下载按钮时回调的代码块
        __weak typeof(cell) weakCell=cell;
        cell.downloadBlock=^(UIButton *sender){
            if([sender.currentTitle isEqualToString:@"开始"]||[sender.currentTitle isEqualToString:@"恢复"])
            {
                [sender setTitle:@"暂停" forState:UIControlStateNormal];
                
                //添加下载任务
                [[FGGDownloadManager shredManager] downloadWithUrlString:model.musicUrl toPath:model.musicDestinationPath process:^(float progress, NSString *sizeString, NSString *speedString) {
                    //更新进度条的进度值
                    weakCell.downloadProgressV.progress = progress;
                    //更新进度值文字
                    //weakCell.progressLabel.text=[NSString stringWithFormat:@"%.2f%%",progress*100];
                    //更新文件已下载的大小
                    //weakCell.sizeLabel.text=sizeString;
                    //显示网速
                    //weakCell.speedLabel.text=speedString;
                    //if(speedString)
                        //weakCell.speedLabel.hidden = NO;
                    
                    
                    
                    NSLog(@"%@",model.musicDestinationPath);
                    
                    
                } completion:^{
                    
                    [sender setTitle:@"完成" forState:UIControlStateNormal];
                    sender.enabled=NO;
                    //weakCell.speedLabel.hidden=YES;
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@下载完成",model.musicName] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
                    [alert show];
                    
                } failure:^(NSError *error) {
                    [[FGGDownloadManager shredManager] cancelDownloadTask:model.musicUrl];
                    [sender setTitle:@"恢复" forState:UIControlStateNormal];
                    //weakCell.speedLabel.hidden=YES;
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alert show];
                    
                }];
            }
            else if([sender.currentTitle isEqualToString:@"暂停"])
            {
                [sender setTitle:@"恢复" forState:UIControlStateNormal];
                [[FGGDownloadManager shredManager] cancelDownloadTask:model.musicUrl];
                
                //TaskCell *cell=(TaskCell *)[tableView cellForRowAtIndexPath:indexPath];
                //cell.speedLabel.hidden=YES;
            }
        };
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        return cell;

    
    
    
    
    }else{
        
        static  NSString *cellIdentifier = @"middle";
        UITableViewCell *cell= [_middleTableV dequeueReusableCellWithIdentifier:cellIdentifier];
        [_middleTableV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        return cell;
        
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 1001) {
        
        return 50;
    }else if (tableView.tag == 1004) {
    
        return 200;
    
    }else{
    
        return kScreen_Height - 64 - 44;
    }
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (tableView.tag == 1001) {
//        if (section == 2) {
//            //return @"下载铃声";
//            return [NSString stringWithFormat:@"下载铃声(%ld)",_musicModelArray.count];
//        }else if (section == 1){
//        
//            //return @"录制铃声";
//            return [NSString stringWithFormat:@"录制铃声(%ld)",_recordModelArray.count];
//        }else {
//        
//            return @"系统铃声";
//        }
//        
//    }else {
//    
//        return nil;
//    }
//    
//}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if (tableView.tag == 1001) {
//        
//        UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 40)];
//        sectionHeadBackgroundView.backgroundColor = RGB(106.0, 221.0, 255.0);
//        
//        
//        UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreen_Width, 30)];
//        headLabel.backgroundColor = [UIColor clearColor];
//        headLabel.font = [UIFont systemFontOfSize:17];
//        headLabel.textColor = [UIColor blackColor];
//        headLabel.text = [self tableView:tableView titleForHeaderInSection:section];
//        [sectionHeadBackgroundView addSubview:headLabel];
//        
//        
//        return sectionHeadBackgroundView;
//
//    }else {
//    
//        return nil;
//    }
//}
//


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView.tag == 1001) {
        //
        
        
        if (indexPath.section == 1) {
            //录制铃声
            [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
            [audioSession setActive:YES error:nil];
            NSError *error;
            
            
            NSArray *recordArray = [ZMRecordDBModel findAll];
            
            ZMRecordDBModel *recordModel = recordArray[indexPath.row];
            
            
            
            NSString *recordPath = recordModel.recordDBUrl;
            
            //NSURL *recordPlayUrl = [NSURL fileURLWithPath:recordPath];

            NSLog(@"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&    %@",recordPath);
            
            audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:recordPath] error:nil];
            audioPlayer.numberOfLoops = 0;
            
            [audioPlayer prepareToPlay];
            audioPlayer.volume = 1.0;
            
            if (audioPlayer == nil) {
                
                NSLog(@"AudioPlayer did not load properly: %@", [error description]);
            }else {
                
                [audioPlayer play];
            }
            

            
        }else if (indexPath.section == 2){//下载铃声
        
            //cell.rightImgV.image = [UIImage imageNamed:@"未选中铃声"];
            //[[NSNotificationCenter defaultCenter] postNotificationName:@"cellChangeBGColor" object:self];
            
            
//            //后台播放音频设置
//            AVAudioSession *session = [AVAudioSession sharedInstance];
//            [session setActive:YES error:nil];
//            [session setCategory:AVAudioSessionCategoryPlayback error:nil];
//            
//            //让app支持接受远程控制事件
//            [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
            
            NSArray *playArray = [ZMMusicTaskModel findAll];
            
            ZMMusicTaskModel *playModel = playArray[indexPath.row];
            
            
            //playModel.selectType = select_type1;

            
            
            
            NSString *playPath = playModel.musicDestinationPath;
            
            NSURL * playUrl = [NSURL fileURLWithPath:playPath];
            
            NSError * error;
            
            self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:playUrl error:&error];
            
            self.player.numberOfLoops = 0;    //无限循环  =0 一遍   =1 两遍    =2 三遍     =负数  单曲循环
            
            self.player.volume = 1.0;          //音量
            
            [self.player prepareToPlay];    //准备工作
            
            if (self.player == nil) {
                
                NSLog(@"AudioPlayer did not load properly: %@", [error description]);
            }else {
                
                [self.player play];
            }
            
        }else {
        
            //系统铃声
            if (indexPath.row == 0) {
                NSString *path = [[NSBundle mainBundle] pathForResource:@"公鸡打鸣声" ofType:@"mp3"];
                
                NSURL * playUrl = [NSURL fileURLWithPath:path];
                
                NSError * error;
                
                self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:playUrl error:&error];
                
                self.player.numberOfLoops = 0;
                self.player.volume = 1.0;          //音量
                
                [self.player prepareToPlay];    //准备工作
                
                if (self.player == nil) {
                    
                    NSLog(@"AudioPlayer did not load properly: %@", [error description]);
                }else {
                    
                    [self.player play];
                }

            }else if (indexPath.row == 1){
                
            
                NSString *path1 = [[NSBundle mainBundle] pathForResource:@"欢快口哨音" ofType:@"mp3"];
                
                NSURL * playUrl = [NSURL fileURLWithPath:path1];
                
                NSError * error;
                
                self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:playUrl error:&error];
                
                self.player.numberOfLoops = 0;
                self.player.volume = 1.0;          //音量
                
                [self.player prepareToPlay];    //准备工作
                
                if (self.player == nil) {
                    
                    NSLog(@"AudioPlayer did not load properly: %@", [error description]);
                }else {
                    
                    [self.player play];
                }

                
                
            }else if (indexPath.row ==  2){
            
                NSString *path2 = [[NSBundle mainBundle] pathForResource:@"清新鸟鸣声" ofType:@"mp3"];
                
                NSURL * playUrl = [NSURL fileURLWithPath:path2];
                
                NSError * error;
                
                self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:playUrl error:&error];
                
                self.player.numberOfLoops = 0;
                self.player.volume = 1.0;          //音量
                
                [self.player prepareToPlay];    //准备工作
                
                if (self.player == nil) {
                    
                    NSLog(@"AudioPlayer did not load properly: %@", [error description]);
                }else {
                    
                    [self.player play];
                }

                
            
            
            }else {
            
                NSString *path3 = [[NSBundle mainBundle] pathForResource:@"舒缓口琴声" ofType:@"mp3"];
                
                
                NSURL * playUrl = [NSURL fileURLWithPath:path3];
                
                NSError * error;
                
                self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:playUrl error:&error];
                
                self.player.numberOfLoops = 0;
                self.player.volume = 1.0;          //音量
                
                [self.player prepareToPlay];    //准备工作
                
                if (self.player == nil) {
                    
                    NSLog(@"AudioPlayer did not load properly: %@", [error description]);
                }else {
                    
                    [self.player play];
                }

                
            
            }
        
        }
        
        
    }else {
        
        
        
    
    
    }
    

    
    


}

#pragma mark - Touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [_downloadTF resignFirstResponder];

    [self.view resignFirstResponder];

}



#pragma mark - UICollectionViewDataSource -

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //NSLog(@"*********************** %ld",_shareMusicArray.count);
    
    return _dataArray.count;
    
}

//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    ZMNewClockMusicRightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor orangeColor];
    
    ZMMusicTaskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    cell.downloadProgressV.hidden = YES;
    
    
    
//    [cell.downloadBtn setImage:[UIImage imageNamed:@"下载232"] forState:UIControlStateNormal];
//    cell.downloadBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    
    ZMMusicTaskModel *model = [_dataArray objectAtIndex:indexPath.row];

    [cell updateCellWithModel:model];
///
    //点击下载按钮时回调的代码块
    __weak typeof(cell) weakCell = cell;
    
    cell.downloadBlock = ^(UIButton *sender){
        
        if([sender.currentTitle isEqualToString:@"下载"] ||[sender.currentTitle isEqualToString:@"下载."])
        {
            [sender setTitle:@"下载中" forState:UIControlStateNormal];
            
            //添加下载任务
            [[FGGDownloadManager shredManager] downloadWithUrlString:model.musicUrl toPath:model.musicDestinationPath process:^(float progress, NSString *sizeString, NSString *speedString) {
                //更新进度条的进度值
                weakCell.downloadProgressV.progress = progress;
                //更新进度值文字
                //weakCell.progressLabel.text=[NSString stringWithFormat:@"%.2f%%",progress*100];
                //更新文件已下载的大小
                //weakCell.sizeLabel.text=sizeString;
                //显示网速
                //weakCell.speedLabel.text=speedString;
                //if(speedString)
                //weakCell.speedLabel.hidden = NO;
                
                
                
                NSLog(@"%@",model.musicDestinationPath);
                
                
            } completion:^{
                
                
//插入一条数据
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    [model save];
                });
                
                
                //NSLog(@"%@",_dataCompletedArray);
                //[_leftTableV reloadData];
                
                [sender setTitle:@"已下载" forState:UIControlStateNormal];
                sender.enabled = NO;
                
                
                [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@下载完成",model.musicName] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                
                
                
            } failure:^(NSError *error) {
                [[FGGDownloadManager shredManager] cancelDownloadTask:model.musicUrl];
//                [sender setTitle:@"恢复" forState:UIControlStateNormal];
                [sender setTitle:@"下载." forState:UIControlStateNormal];
                
                //weakCell.speedLabel.hidden=YES;
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
                
            }];
        }
        else if([sender.currentTitle isEqualToString:@"下载中"])
        {
//            [sender setTitle:@"恢复" forState:UIControlStateNormal];
            [sender setTitle:@"下载." forState:UIControlStateNormal];
            [[FGGDownloadManager shredManager] cancelDownloadTask:model.musicUrl];
            
            //TaskCell *cell=(TaskCell *)[tableView cellForRowAtIndexPath:indexPath];
            //cell.speedLabel.hidden=YES;
        }
    };
    
    
    
//在线播放
    
//    self.onlinePlayer = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:model.musicUrl]];
    
//    NSLog(@"%@",model.musicUrl);
    
    
    
    //[cell.onlinePlayyBtn addTarget:self action:@selector(onlinePlay) forControlEvents:UIControlEventTouchUpInside];
    
    cell.onlinePlayBlock = ^(UIButton *sender){
        
        
        self.onlinePlayer = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:model.musicUrl]];
        
        self.onlinePlayer.volume = 1.0;
        
        [self.onlinePlayer play];
    };

    return cell;
    
}



////负责cell 的布局
#pragma mark - UICollectionViewDelegateFlowLayout -

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL iphone4 = [ZMSystemTool iPhone4Device];
    
    
    if (kScreen_Width == 320.000000 && kScreen_Height == 568.000000) {
        
        return CGSizeMake((kScreen_Width-11)/2, kScreen_Height/4 + 20);
    }else if (iphone4 == YES){
        
        
        return CGSizeMake((kScreen_Width-11)/2, kScreen_Height/4 + 40);
        
        
    }else{
        
        return CGSizeMake((kScreen_Width-11)/2, kScreen_Height/4 - 10);
    }

    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 4, 0, 4);
}


////负责界面的交互
#pragma mark - UICollectionViewDelegate -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


#pragma mark - leftTableView URL 下载按钮
- (void)urlDownloadBtnClicked:(UIButton *)sender
{
    
    NSString *s = _downloadTF.text;
    
    if ([s isEqualToString:@""] || s == nil || s == NULL || [s isKindOfClass:[NSNull class]]) {
        
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"没输入网址下个毛线啊"] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
//        [alert show];
        
        [AnyObjectActivityView showWithTitle:@"请输入网址" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
        
        return;
        
    }else {
        
        ZMLeftTableViewURLDownloadModel *urlModel = [[ZMLeftTableViewURLDownloadModel alloc] init];
        urlModel.leftURLUrl = s;
        urlModel.leftURLDestinationPath = [kCachePath stringByAppendingPathComponent:urlModel.leftURLUrl];

        [_leftTVURLDownloadArray addObject:urlModel];
        
        
        //[sender setTitle:@"下载中" forState:UIControlStateNormal];
        
        [AnyObjectActivityView showWithTitle:@"下载中..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
        
        
        [[FGGDownloadManager shredManager] downloadWithUrlString:s toPath:urlModel.leftURLDestinationPath process:^(float progress, NSString *sizeString, NSString *speedString) {
            //
        } completion:^{
            //
            //[sender setTitle:@"已下载" forState:UIControlStateNormal];
            
            [AnyObjectActivityView showWithTitle:@"下载完成" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
            
            sender.enabled = NO;
            
            
//            TopicAlertView *inputAlertView = [[TopicAlertView alloc]initInpputWithTitle:@"保存录音" setDelegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
//            [inputAlertView showInpputAlertView];
//
//            
//            
//            CustomAlertView *alert = [[CustomAlertView alloc] initWithAlertViewHeight:248];
//            __weak __typeof(alert)weakAlert = alert;
//            
//            alert.ButtonClick = ^void(UIButton*button){
//                
//                urlModel.leftURLName = weakAlert.textField.text;
//                urlModel.leftURLUrl = s;
//                urlModel.leftURLDestinationPath = [kCachePath stringByAppendingPathComponent:urlModel.leftURLUrl];
////插入一条数据
//                [urlModel save];
//                
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"已保存"] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
//                [alert show];
//                
//                //[self.navigationController popViewControllerAnimated:YES];
//            };

            
            

        } failure:^(NSError *error) {
            //
            [[FGGDownloadManager shredManager] cancelDownloadTask:urlModel.leftURLUrl];
            //[sender setTitle:@"恢复" forState:UIControlStateNormal];
            //weakCell.speedLabel.hidden=YES;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"下载URL错误" message:error.localizedDescription delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alert show];

        }];
        
    }




}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
