//
//  ZMChooseSongSearchhViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


/////语音搜索
#import "ZMChooseSongSearchhViewController.h"

#import "ZMChooseSongFirstPgTableViewCell.h"
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
#import "TTSConfig.h"
#import "ZMSearchSonngModell.h"
#import "ZMAVPlayerManager.h"
#import "SpectrumView.h"


@interface ZMChooseSongSearchhViewController ()<UITableViewDelegate,UITableViewDataSource,IFlyRecognizerViewDelegate,UISearchBarDelegate,AVAudioRecorderDelegate>
{

    IFlyRecognizerView *_iflyRecognizerView;


    SpectrumView *_spectrumView;

}

@property (nonatomic, strong) UIView *topSearchV;//顶部搜索
@property (nonatomic, strong) UITableView *searchSongTabV;
//@property (nonatomic, strong) UITextField *searchTF;//搜索结果框
@property (nonatomic, strong) UIView *voiceListenBgV;//语音背景
@property (nonatomic, strong) UISearchBar *searchBarView;

@property (nonatomic, strong) UILabel *listenLbb;///倾听中

/////
@property (nonatomic, copy)   NSString *searchStr;//搜索关键字
@property (nonatomic, strong) NSMutableArray *searchDataArray;//搜索结果
@property (nonatomic, strong) UILabel *sorryLbb;//未搜到音乐

@property (nonatomic, strong) UIView *noListenV;//未识别
@property (nonatomic, strong) UILabel *nospeechLbb;//未识别
@property (nonatomic, strong) UIButton *listenBtn2;//点击继续语音搜索
@property (nonatomic, strong) UIImageView *speechImgV;//语音按钮

////
@property (nonatomic,strong) AVAudioRecorder *audioRecorder;//音频录音机


//添加 footerView
@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) UILabel *musicTitle;
@property (nonatomic, strong) UILabel *songerLbb;

@property (nonatomic, strong) UIImageView *musicImageView;
@property (nonatomic, strong) UIButton *playButton;

@property (nonatomic, strong) ZMSearchSonngModell *searchSongModelll;
@property (nonatomic, strong) ZMChooseSongFirstPgTableViewCell *searchSongCell;


/**
 *  定时器
 */
@property (nonatomic, strong) CADisplayLink *displayLink;


@property (nonatomic, copy)   NSString *musiccid;//播放历史

@end

@implementation ZMChooseSongSearchhViewController


//+ (ZMChooseSongSearchhViewController *)sharedZMChooseSongSearchhViewController
//{
//
//    static ZMChooseSongSearchhViewController *defaultVC = nil;
//    
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//        defaultVC = [[self alloc] init];
//    });
//    
//    return defaultVC;
//
//}


- (CADisplayLink *)displayLink
{
    if (_displayLink == nil) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(upadte)];
    }
    return _displayLink;
}

#pragma mark 定时器操作方法
- (void)upadte
{
    //正在播放音乐才需要做之后的操作
    //rate  0.0 means "stopped" 1.0 means "play at the natural rate of the current item"
    if ([[ZMAVPlayerManager playerManager] isPlaying]) {
        //头像转动
        CGFloat angle = M_PI_4 / 60;
        self.musicImageView.transform = CGAffineTransformRotate(self.musicImageView.transform, angle);
        
        
    }
    
}





- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //开启定时器
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
   
    [self.view endEditing:YES];
    
    
    [_iflyRecognizerView cancel];
    _iflyRecognizerView = nil;
    
    [self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [_displayLink invalidate];
    _displayLink = nil;
    
    
    
    
    
}








- (void)viewDidLoad {
    [super viewDidLoad];
    //
    //self.title = @"搜索";
    //[self setNavRightBtnImage:@""];
    
    
    UIView *vv = [[UIView alloc] initWithFrame:CGRectMake(50, 20, kScreen_Width, 44)];
    vv.backgroundColor = [UIColor clearColor];
    
    [self.baseNavigation addSubview:vv];
    
    
    UIView *searchBgView = [[UIView alloc] initWithFrame:CGRectMake(-15, 0, kScreen_Width - 60, 44)];
    
    searchBgView.backgroundColor = [UIColor clearColor];
    
    //[self.view addSubview:searchBgView];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(8, 0,kScreen_Width - 8 - 60, 40.f)];
    
    //光标颜色
    searchBar.tintColor = [UIColor grayColor];
    
    searchBar.placeholder = @"                                                                             ";
    
    //[searchBarView setBackgroundColor:[UIColor clearColor]];
    
    //背景图片
    UIImage *imgg = [self GetImageWithColor:[UIColor whiteColor] andHeight:40];
    [searchBar setBackgroundImage:imgg];
    [searchBar setSearchFieldBackgroundImage:imgg forState:UIControlStateNormal];
    
    //输入光标左边距
    [searchBar setSearchTextPositionAdjustment: UIOffsetMake(5, 0)];
    
    searchBar.delegate = self;
    
    self.searchBarView = searchBar;
    
    [searchBgView addSubview:searchBar];
    
    //self.searchSongTableView.tableHeaderView = searchBgView;
    
    
    //语音图标
    if ([ZMSystemTool iPhone5Device]) {
        self.speechImgV = [[UIImageView alloc] initWithFrame:CGRectMake(searchBar.frame.size.width - 25 - 10 + 10, 8, 20, 25)];
    }else {
    
        self.speechImgV = [[UIImageView alloc] initWithFrame:CGRectMake(searchBar.frame.size.width - 25 - 10 + 5, 8, 20, 25)];
    }
    
    self.speechImgV.backgroundColor = [UIColor  clearColor];
    self.speechImgV.userInteractionEnabled = YES;
    self.speechImgV.image = IMAGE(@"语音-图标");
    
    [searchBgView addSubview:self.speechImgV];
    
    UITapGestureRecognizer *speechTappp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topSsspeechTapImgVTaped)];
    [self.speechImgV addGestureRecognizer:speechTappp];
    
    
    
    [vv addSubview:searchBgView];
    
   
    

    

    [self setupSearchSongTableView];//搜歌 tableView
    
    [self settupVoiceListenBgV];//语音背景
    
    [self setuppSpeechRecognizer];//配置语音识别
    

///添加未识别的视图
    [self addNoRecognizedListenV];
    
    
////添加 footerView
    [self addFooterView];
    
    
    
}


#pragma mark -------------------------------------footerView
- (void)addFooterView{
    
    self.footView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreen_Height, kScreen_Width, 60)];
    
    self.footView.backgroundColor = [UIColor whiteColor];
    self.footView.alpha = 0.8;
    
    [self.view addSubview:self.footView];
    
    self.musicTitle = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, [UIScreen mainScreen].bounds.size.width-80 - 80, 40)];
    self.musicTitle.textAlignment = NSTextAlignmentLeft;
    self.musicTitle.textColor = [UIColor blackColor];
    self.musicTitle.font = [UIFont systemFontOfSize:15];
    self.musicTitle.text = @"星伴";
    self.musicTitle.numberOfLines = 0;
    
    self.songerLbb = [[UILabel alloc]initWithFrame:CGRectMake(80, 30, [UIScreen mainScreen].bounds.size.width-80 - 80, 30)];
    self.songerLbb.textAlignment = NSTextAlignmentLeft;
    self.songerLbb.textColor = [UIColor blackColor];
    self.songerLbb.font = [UIFont systemFontOfSize:12];
    self.songerLbb.text = @"星伴";
    self.songerLbb.numberOfLines = 0;
    
    [self.footView addSubview:self.musicTitle];
    [self.footView addSubview:self.songerLbb];
    
    self.musicImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 5, 50, 50)];
    self.musicImageView.layer.cornerRadius = 25;
    self.musicImageView.layer.masksToBounds = YES;
    self.musicImageView.image = [UIImage imageNamed:@"logo"];
    [self.footView addSubview:self.musicImageView];
    
    [self.footView addSubview:self.playButton];
    
    
}

- (UIButton *)playButton
{
    if (_playButton == nil) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _playButton.frame = CGRectMake(kScreen_Width - 22 - 34, 13, 34, 34);
        _playButton.backgroundColor = [UIColor clearColor];
        [_playButton setTitle:@"暂停" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        UIImage *image = [UIImage imageNamed:@"iconfont-bofang"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_playButton setBackgroundImage:image forState:UIControlStateNormal];
        _playButton.tintColor = MainColor;
        
        
    }
    
    return _playButton;
}







#pragma mark - 设置右侧按钮图标
- (void)setNavRightBtnImage:(NSString*)imageName
{
    [self.baseNavigation.rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
}

#pragma mark - 右侧按钮触发的方法
- (void)navRightBtnAction:(UIButton*)sender
{
}




- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self startttListenning];//开始倾听   刚进入时


}



/** 语音识别�?
 此类现在设计为单例，你在使用中只需要创建此对象，不能调用release/dealloc函数去释放此对象。所有关于语音识别的操作都在此类中�? */


//- (void)dealloc
//{
//    //移除定时器
//    //[self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//    [self.displayLink invalidate];
//    self.displayLink = nil;
//    
//    
//    
//    [_iflyRecognizerView cancel];
//    [_animationTimerr invalidate];
//    _animationTimerr = nil;
//    
//  
//}



- (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}




#pragma mark ------------------------------------UI

#pragma mark ------------------------------tableView
- (void)setupSearchSongTableView
{
    
    self.searchSongTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64)];
    
    self.searchSongTabV.backgroundColor = [UIColor whiteColor];
    self.searchSongTabV.dataSource = self;
    self.searchSongTabV.delegate = self;
    self.searchSongTabV.rowHeight = 100;
    
    
    [self.view addSubview:self.searchSongTabV];
    
    //去掉多余的分割线
    self.searchSongTabV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    
    //tableHeaderView
//    self.topSearchV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 80)];
//    self.topSearchV.backgroundColor = [UIColor  whiteColor];
//    
//    self.searchSongTabV.tableHeaderView = self.topSearchV;
    
    
    
//    //搜索结果框
//    self.searchTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, kScreen_Width - 40, 44)];
//    self.searchTF.textColor = [UIColor blackColor];
//    self.searchTF.backgroundColor = RGB(235, 235, 235);
//    self.searchTF.font = [UIFont systemFontOfSize:17];
//    //self.searchTF.clearButtonMode = UITextFieldViewModeAlways;
//    self.searchTF.textAlignment = NSTextAlignmentLeft;
//    
//    [self.topSearchV addSubview:self.searchTF];
//    
    
    //点击语音按钮
//    self.speechImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.searchTF.frame.size.width - 25 - 20, 10, 20, 25)];
//    self.speechImgV.backgroundColor = [UIColor  clearColor];
//    self.speechImgV.userInteractionEnabled = YES;
//    self.speechImgV.image = IMAGE(@"语音-图标");
//    
//    [self.searchTF addSubview:self.speechImgV];
//    
//    UITapGestureRecognizer *speechTapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topSspeechTapImgVgfTaped)];
//    [self.speechImgV addGestureRecognizer:speechTapp];
//    
    
    //self.searchSongTabV.hidden = YES;//隐藏
    
    
    
    
    
    self.sorryLbb = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, kScreen_Width, 40)];
    self.sorryLbb.backgroundColor = [UIColor orangeColor];
    self.sorryLbb.text = @"对不起,未搜到相关结果,请重新搜索.";
    self.sorryLbb.font = [UIFont systemFontOfSize:15];
    self.sorryLbb.textColor = [UIColor blackColor];
    self.sorryLbb.textAlignment = NSTextAlignmentCenter;
    
    [self.searchSongTabV addSubview:self.sorryLbb];
    self.sorryLbb.hidden = YES;
    
    
    
}


- (void)settupVoiceListenBgV
{


    self.voiceListenBgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    self.voiceListenBgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.voiceListenBgV];

    
    
#pragma mark -----------------------------------倾听中提示
    
    self.listenLbb = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreen_Height/2 - 40, kScreen_Width, 40)];
    self.listenLbb.text = @"倾听中......";
    self.listenLbb.font = [UIFont systemFontOfSize:16];
    //self.animationLLb.textColor = RGB(66, 163, 222);
    self.listenLbb.textColor = [UIColor lightGrayColor];
    self.listenLbb.textAlignment = NSTextAlignmentCenter;
    self.listenLbb.userInteractionEnabled = YES;
    
    [self.voiceListenBgV addSubview:self.listenLbb];
    
    
    
#pragma mark --------------------------------仿 QQ 录音动画
    ///////
    _spectrumView = [[SpectrumView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)- 100, kScreen_Height/2, 200, 50.0)];
    
    
    _spectrumView.itemColor = RGB(111, 221, 255);
    
    __weak SpectrumView * weakSpectrum = _spectrumView;
    
    __weak typeof(self) weakSelf = self;
    
    _spectrumView.itemLevelCallback = ^() {
        
        [weakSelf.audioRecorder updateMeters];
        //取得第一个通道的音频，音频强度范围时-160到0
        float power = [weakSelf.audioRecorder averagePowerForChannel:0];
        
        weakSpectrum.level = power;
    };
    
    [self.voiceListenBgV addSubview:_spectrumView];
    
    
    

}


#pragma mark --------------------------------添加未识别语音视图
- (void)addNoRecognizedListenV
{
    self.noListenV = [[UIView alloc] initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height/2)];
    self.noListenV.backgroundColor = [UIColor whiteColor];
    
    [self.voiceListenBgV addSubview:self.noListenV];

    
    self.nospeechLbb = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, kScreen_Width, 40)];
    self.nospeechLbb.backgroundColor = [UIColor whiteColor];
    self.nospeechLbb.text = @"未识别你的语音,点击下方按钮重新语音搜索";
    self.nospeechLbb.font = [UIFont systemFontOfSize:17];
    self.nospeechLbb.textColor = [UIColor blackColor];
    self.nospeechLbb.textAlignment = NSTextAlignmentCenter;
    
    [self.noListenV addSubview:self.nospeechLbb];
//再点击语音按钮
    self.listenBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 30, kScreen_Height/2 - 120, 60, 60)];
    self.listenBtn2.backgroundColor = [UIColor clearColor];
    self.listenBtn2.layer.cornerRadius = 30;
    self.listenBtn2.layer.masksToBounds = YES;
    [self.listenBtn2 setBackgroundImage:IMAGE(@"麦克风-图标") forState:UIControlStateNormal];
    
    [self.listenBtn2 addTarget:self action:@selector(listenBtn2Clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.noListenV addSubview:self.listenBtn2];
    
    
    
    self.noListenV.hidden = YES;


}





#pragma mark --------------------------------配置语音识别
- (void)setuppSpeechRecognizer
{
    NSString *initString = [NSString stringWithFormat:@"%@=%@", [IFlySpeechConstant APPID], @"57aadd69"];
    
    [IFlySpeechUtility createUtility:initString];
    _iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.voiceListenBgV.center];
    _iflyRecognizerView.alpha = 0;
    //_iflyRecognizerView.hidden = YES;
    
    _iflyRecognizerView.delegate = self;
    
    [_iflyRecognizerView setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
    [_iflyRecognizerView setParameter:@"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    [_iflyRecognizerView setParameter:@"plain" forKey:[IFlySpeechConstant RESULT_TYPE]];
    
    [_iflyRecognizerView setParameter:@"0" forKey:[IFlySpeechConstant ASR_PTT]];///标点符号
    
    
}

#pragma mark ---------------------------------刚开始进入
- (void)startttListenning
{
    [_iflyRecognizerView start];
    NSLog(@"start listenning...");
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        self.animationLLb.hidden = NO;
//    });
    
    
#pragma mark ---------------------------------开始 QQ 语音动画
    //开始动画
    //_animationTimerr = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(startttAnimationnn) userInfo:nil repeats:YES];
    //[[NSRunLoop mainRunLoop] addTimer:_animationTimerr forMode:NSDefaultRunLoopMode];
    
    
    [self recordStartQQAnimationStart];
    
    
}


#pragma mark ---------------------------------再度点击语音按钮
///
- (void)startAgainnListening
{
    
    self.noListenV.hidden = YES;

    [_iflyRecognizerView start];
    NSLog(@"start listenning...");


    //开始动画
//    _animationTimerr = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(startAgainnAnimationnn) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:_animationTimerr forMode:NSDefaultRunLoopMode];
    
    
#pragma mark ---------------------------------开始 QQ 语音动画
    
    [self recordStartQQAnimationStart];
    

}





#pragma mark -------------------------------搜索栏代理
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    NSLog(@"searchBar   begin");
    
    
    [self.searchDataArray removeAllObjects];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.searchSongTabV reloadData];
    });
    //[self.searchSongTableView reloadData];
    
    
}



- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    if (searchText.length == 0) {
        self.speechImgV.hidden = NO;
    }else {
        
        self.speechImgV.hidden = YES;
    }
    
    
    
    
}



///点击 search 按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //self.sorryLb.hidden = YES;
    
    self.searchStr = searchBar.text;
    
    
    [self getSearchSongData];
    
    [AnyObjectActivityView showWithTitle:@"搜索中,请稍后..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
    
    
    [self.searchBarView resignFirstResponder];
    
    self.searchSongTabV.hidden = NO;
    self.voiceListenBgV.hidden = YES;
    self.speechImgV.hidden = YES;

    
}









#pragma mark -----------------------语音识别结果-IFlyRecognizerViewDelegate

- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:@"%@", key];
    }
    
    
    NSString *resultStr = [NSString stringWithFormat:@"%@%@", self.searchBarView.text, result];
    
    //self.searchTF.text = resultStr;
    //self.searchStr = resultStr;//搜索关键字
    
    NSInteger ll = resultStr.length;
    
    if (ll > 1) {
        
        [_iflyRecognizerView cancel];//取消本次识别
        
        self.searchBarView.text = [resultStr substringToIndex:ll - 0];
        self.searchStr = [resultStr substringToIndex:ll - 0];
        
    }else {
    
        //self.searchTF.text = resultStr;
        //self.searchStr = resultStr;
    
    }
    
    //NSLog(@"substringToIndex________%@",self.searchStr);
    
    
    if (resultStr.length == 0) {
        
        
    }else {
        
        self.searchSongTabV.hidden = NO;
        self.voiceListenBgV.hidden = YES;
        self.speechImgV.hidden = YES;
        
        [_iflyRecognizerView cancel];//取消本次识别
        
        [AnyObjectActivityView showWithTitle:@"搜索中,请稍后..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self getSearchSongData];//请求搜索
        });
        
        
        
    }
    
    
}


- (void)onError:(IFlySpeechError *)errorr
{
    NSLog(@"errorCode:%@", [errorr errorDesc]);
    //self.voiceRecoLb.text = [NSString stringWithFormat:@"%@", [errorr errorDesc]];
    
    
    
    [_iflyRecognizerView cancel];//取消本次识别
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.noListenV.hidden = NO;//
    });
    
    
}



///////////////////////////////////////////语音识别动画

#pragma mark ----------------------------开始 QQ 语音动画
- (void)recordStartQQAnimationStart
{
    
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
    {
        //7.0第一次运行会提示，是否允许使用麦克风
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *sessionError;
        //AVAudioSessionCategoryPlayAndRecord用于录音和播放
        [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
        if(session == nil)
            NSLog(@"Error creating session: %@", [sessionError description]);
        else
            [session setActive:YES error:nil];
    }
    
    if (![self.audioRecorder isRecording]) {
        
        [self.audioRecorder record];
        
        NSLog(@"录音开始");
        
    }
    
}

#pragma mark ---------------------------- QQ 语音动画 结束
- (void)recordFinishQQAnimationFinish
{
    
    if ([self.audioRecorder isRecording]) {
        
        NSLog(@"完成");
        [self.audioRecorder stop];
        
    }
    
}



/**
 *  获得录音机对象
 *
 *  @return 录音机对象
 */
- (AVAudioRecorder *)audioRecorder{
    if (!_audioRecorder) {
        //创建录音文件保存路径
        NSURL *url=[self getSavePath];
        //创建录音格式设置
        NSDictionary *setting=[self getAudioSetting];
        //创建录音机
        NSError *error=nil;
        _audioRecorder=[[AVAudioRecorder alloc]initWithURL:url settings:setting error:&error];
        _audioRecorder.delegate = self;
        _audioRecorder.meteringEnabled=YES;//如果要监控声波则必须设置为YES
        if (error) {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
    }
    return _audioRecorder;
}


/**
 *  取得录音文件设置
 *
 *  @return 录音设置
 */
- (NSDictionary *)getAudioSetting{
    NSMutableDictionary *dicM=[NSMutableDictionary dictionary];
    //设置录音格式
    [dicM setObject:@(kAudioFormatMPEG4AAC) forKey:AVFormatIDKey];
    //设置录音采样率，8000是电话采样率，对于一般录音已经够了
    [dicM setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道,这里采用单声道
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数,分为8、16、24、32
    [dicM setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    //....其他设置等
    return dicM;
}


/**
 *  取得录音文件保存路径
 *
 *  @return 录音文件路径
 */
- (NSURL *)getSavePath{
    
    //  在Documents目录下创建一个名为FileData的文件夹
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"XunFeiAudioData22"];
    NSLog(@"%@",path);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if(!(isDirExist && isDir))
        
    {
        BOOL bCreateDir = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        if(!bCreateDir){
            NSLog(@"创建文件夹失败！");
        }
        NSLog(@"创建文件夹成功，文件路径%@",path);
    }
    
    path = [path stringByAppendingPathComponent:@"xunfeimyRecord.aac"];
    NSLog(@"file path:%@",path);
    NSURL *url=[NSURL fileURLWithPath:path];
    return url;
}


//////////////////////////////////////////////////

#pragma mark ------------------------点击 searchBar的语音图标
- (void)topSsspeechTapImgVTaped
{

    [self.view endEditing:YES];
    
    
    self.searchBarView.text = @"";
    
    self.nospeechLbb.hidden = YES;
    self.searchSongTabV.hidden = YES;
    self.voiceListenBgV.hidden = NO;
    
    [self listenBtn2Clicked];



}

#pragma mark ----------------- tableViewDelegate && dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellid = @"searchSong";
    
    ZMChooseSongFirstPgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (!cell){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMChooseSongFirstPgTableViewCell" owner:self options:nil] lastObject];
    }
    cell.backgroundColor = [UIColor whiteColor];
    
    
    ZMSearchSonngModell *searchSongModel = [self.searchDataArray objectAtIndex:indexPath.row];
    
    [cell updateSearchSongCellWith:searchSongModel];
    
    
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    return self.searchDataArray.count;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    return 100;
//    
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.footView.frame = CGRectMake(0, kScreen_Height - 60, kScreen_Width, 60);
        
        self.searchSongTabV.frame = CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64 - 60);
        
    }];
    
    
    ZMSearchSonngModell *searchSongModel = self.searchDataArray[indexPath.row];
    
    self.musiccid = searchSongModel.music_id;
    
    [self getSearchHPlayMusicID:self.musiccid];//统计播放历史

    
    //音乐名字  通知
    [APPTransmit shareInstance].isPlayingSongName = searchSongModel.song_name;
    
    
    self.musicTitle.text = searchSongModel.song_name;
    self.songerLbb.text = searchSongModel.singer_name;
    
    
    
    
    //向首页传值
    [APPTransmit shareInstance].diangeFirstPageHeadPoritStr = searchSongModel.music_pic;
    [APPTransmit shareInstance].diangeFirstPageSongNameStr = searchSongModel.song_name;
    [APPTransmit shareInstance].diangeFirstPageSongerNameeStr = searchSongModel.singer_name;
    
    //传值的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"transmitttttt" object:@"transsssmit"];
    

    
    
    
    
    NSString *pic = searchSongModel.music_pic;
    
    if (pic == nil || pic == NULL || [pic isKindOfClass:[NSNull class]]) {
        
        self.musicImageView.image = [UIImage imageNamed:@"logo"];
        
    }else {
        
        [self.musicImageView sd_setImageWithURL:[NSURL URLWithString:searchSongModel.music_pic]];
    }
    
    
    [[ZMAVPlayerManager playerManager] loadNewSongg:searchSongModel.mp3_url];
    
    [[ZMAVPlayerManager playerManager] startPlay];
    
//正在播放
//发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];
    

    
    
    
//    //按钮
    UIImage *image = [UIImage imageNamed:@"iconfont-zanting"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [_playButton setBackgroundImage:image forState:UIControlStateNormal];
    _playButton.tintColor = MainColor;
    
    //
    [_playButton addTarget:self action:@selector(playButtonClickedttrr:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}




#pragma mark -------------------------------------暂停播放按钮

- (void)playButtonClickedttrr:(UIButton *)playButton
{
    
    if ([playButton.currentTitle isEqualToString:@"播放"]) {
        [playButton setTitle:@"暂停" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        UIImage *image = [UIImage imageNamed:@"iconfont-zanting"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_playButton setBackgroundImage:image forState:UIControlStateNormal];
        _playButton.tintColor = MainColor;
        //
        [[ZMAVPlayerManager playerManager] startPlay];
        //
        
        // 正在播放   发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];
        
        
    }else{
        
        [playButton setTitle:@"播放" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        UIImage *image = [UIImage imageNamed:@"iconfont-bofang"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_playButton setBackgroundImage:image forState:UIControlStateNormal];
        _playButton.tintColor = MainColor;
        //
        [[ZMAVPlayerManager playerManager] pausePlay];
        //
        // 暂停  发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayenddd" object:@"songendf"];
        
    }
    
    
}






#pragma mark ------------------------------再度点击语音按钮
- (void)listenBtn2Clicked
{

    [self.view endEditing:YES];
    
    
    self.searchBarView.text = @"";

    [self startAgainnListening];



}






#pragma mark -------------------播放结束

//- (void)moviePlayDidEnd:(NSNotification *)notification {
//    NSLog(@"Play end");
//    
//    //__weak typeof(self) weakSelf = self;
//    [[ZRPlayer sharePlayer].player seekToTime:kCMTimeZero completionHandler:^(BOOL finished) {
//        
//        //[weakSelf.stateButton setTitle:@"Play" forState:UIControlStateNormal];
//        
//        
//        //[APPTransmit shareInstance].hiddenIsPlayBgV = @"hidden";
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayenddd" object:@"songendf"];
//        
//        
//        
//    }];
//}




#pragma mark ----------------------------------------统计播放历史
- (void)getSearchHPlayMusicID:(NSString *)musiciddd
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]) {
            //
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign, @"music_id":musiciddd };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"life_secretory/play.php" theParmeters:parmeters sucess:^(id object) {
                //
                // NSLog(@"idddd__________%@",musiciddd);
                // NSLog(@"idddd__________%@",[ZMUserInfo sharedUserInfo].user_id);
                // NSLog(@"idddd__________%@",[ZMUserInfo sharedUserInfo].sign);
                NSLog(@"播放__________%@",object);
                //NSLog(@"sign _____%@",[ZMUserInfo sharedUserInfo].sign);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    
                    
                }
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];
            
        }else {
            
            //未登录
            
            
        }
        
        
        
        
        
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
    
    
    
    
    
    
}



#pragma mark -------------------------------请求数据
- (void)getSearchSongData
{
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        //NSString *dev_unique_id = [[ZMHelper sharedHelp] getIdentifierStr];
        
        if (self.searchStr.length == 0) {
            //
        }else {
            
            NSDictionary *parmeters = @{ @"unique_id":@"22233455", @"start_time":@"0",@"music_src_type":@"0",@"keyword":self.searchStr, @"page":@"1" };
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"life_secretory/search.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"搜索________%@",object);
                
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                //NSInteger count = (NSInteger)[object objectForKey:@"count"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    self.searchDataArray = [ZMSearchSonngModell parseRespondsSearchhSongData:object];
                    
                    //NSLog(@"--searchDataArray-----%ld",(unsigned long)self.searchDataArray.count);
                    
                    
                    if (self.searchDataArray.count != 0) {
                        
                        self.sorryLbb.hidden = YES;
                        
                        
                    }else {
                        
                        //self.title = @"搜索";
                        self.sorryLbb.hidden = NO;
                        
                    }
                    
                    [self.searchSongTabV reloadData];//加载数据
                }
                
                
        
        
    
            } error:^(NSError *error) {
                //
                NSLog(@"错误_____%@",error);
                
                self.sorryLbb.hidden = YES;
                
            }];
            
        }
        
            
            
            
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
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
