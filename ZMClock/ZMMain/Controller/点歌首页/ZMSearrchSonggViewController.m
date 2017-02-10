//
//  ZMSearrchSonggViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


/////文字搜索
#import "ZMSearrchSonggViewController.h"

#import "ZMChooseSongFirstPgTableViewCell.h"
#import "ZMAVPlayerManager.h"
#import "ZMChooseSongSearchhViewController.h"


////------------监听锁屏状态------------------------
////---------------------------------------------
#import <notify.h>
#import <MediaPlayer/MediaPlayer.h>
////---------------------------------------------


//自定义搜索框
#import "ZRRCustomSearchBar.h"
#import "CWProgressView.h"

//#import "ZMMainViewController.h"
#import "UIView+AttributeValue.h"


@interface ZMSearrchSonggViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,ZMChooseSongFirstPgTableViewCellDelegate,UIScrollViewDelegate>
{
    CGFloat _contentOffsetY;
    
    CGFloat _oldContentOffsetY;
    
    CGFloat _newContentOffsetY;
    
    
    CWProgressView *_lineProgressV;//进度条
    
    
}
//@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIImageView *speechImgV;
//@property (nonatomic, copy)   UIView *naviVvv;
//@property (nonatomic, strong) UISearchBar *searchBarView;

@property (nonatomic, strong) ZRRCustomSearchBar *customSearchBar;
/*
 显示播放进度条的定时器
 */
@property (nonatomic, strong) NSTimer *playSongTimer;


@property (nonatomic, strong) UIImageView *tableBgImggV;
@property (nonatomic, strong) UITableView *searchSongTableView;
@property (nonatomic, copy)   NSString *searchStr;
@property (nonatomic, copy)   NSString *customSearchBarStrr;

@property (nonatomic, strong) NSMutableArray *searchDataArray;//搜索结果
@property (nonatomic, strong) NSArray *autosearchDataArray;//自动加载的数据

@property (nonatomic, strong) UIView *sorryV;//
@property (nonatomic, strong) UILabel *sorryLb;//未搜到音乐
//@property (nonatomic, strong) ZMSearchSonngModell *searchSongModelll;


@property (nonatomic, strong) ZMSearchSonngModell *searchSongModel;

@property (nonatomic, assign) int searchSongIndex;//歌曲序号




//添加 footerView
@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) UILabel *musicTitle;
@property (nonatomic, strong) UILabel *songerLbb;

@property (nonatomic, strong) UIImageView *musicImageView;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *nextButton;
/**
 *  定时器
 */
@property (nonatomic, strong) CADisplayLink *displayLinkk;
@property (nonatomic, copy)  NSString *music_idd;//统计播放历史

//加载更多
@property (nonatomic, copy) NSString *music_src_type;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *start_time;


////---------------------------------------------
//锁屏界面
@property (nonatomic, copy) NSString *lockScreenMusicNameStr;
@property (nonatomic, copy) NSString *lockScreenMusicSongerNameStr;
@property (nonatomic, copy) NSString *lockScreenMusicPicStr;

@property (nonatomic, strong) UIImage *lockScreenMusicImage;
////---------------------------------------------


@end


////------------监听锁屏状态------------------------
////---------------------------------------------

static uint64_t isScreenBright;
static uint64_t isLocked;

#define kSetLockScreenLrcNoti @"kSetLockScreenLrcNoti"

////----------------------------------------------
////---------------------------------------------



@implementation ZMSearrchSonggViewController


+ (ZMSearrchSonggViewController *)shareZMSearrchSonggViewController
{
    static ZMSearrchSonggViewController *defaultVC = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        defaultVC = [[self alloc] init];
    });
    
    return defaultVC;
}


- (CADisplayLink *)displayLinkk
{
    if (_displayLinkk == nil) {
        _displayLinkk = [CADisplayLink displayLinkWithTarget:self selector:@selector(upadte)];
    }
    return _displayLinkk;
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
        
        //⚠️定时器里千万不要写通知
        //正在播放
        //发送通知
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];//不能写在定时器方法里面 一直在执行通知 内存一直在增加 很快系统会提示 没有内存空间了
        
        
       // [self addCurrentTimer];//进度条
        

        
        
    }
    
}


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    //开启定时器
    
    [self.displayLinkk addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
    
#pragma mark --------------------------------------添加进度条
    
    if ([[ZMAVPlayerManager playerManager] isPlaying]) {
        
        [self addCurrentTimer];//进度条
        
    }

    
    
    

#pragma mark -----------------------------------语音搜索
    
    self.customSearchBarStrr = [APPTransmit shareInstance].textSearchSongStr;
    
    //self.speechImgV.hidden = YES;
    self.customSearchBar.searchBarTextField.text = self.customSearchBarStrr;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //[self.searchBarView resignFirstResponder];
        
        if (self.customSearchBarStrr.length > 0) {
            //
            [self getSearchSongData];
            
            [AnyObjectActivityView showWithTitle:@"搜索中,请稍后..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
        }
        
        
    });
    
    
    
    //NSLog(@"搜索传值:_%@",self.searchBar.text);
    
    
   
    

}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.displayLinkk removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [_displayLinkk invalidate];
    _displayLinkk = nil;
    
#pragma mark -----------------------------移除进度条
    
    [self removeCurrentTimer];
    
    [self.view endEditing:YES];

}



- (void)backFarward
{
    [self.navigationController popViewControllerAnimated:YES];

    //ZMMainViewController *main = [[ZMMainViewController alloc] init];
    //[self.navigationController popToViewController:main animated:YES];
    
    
}


/////////////父类方法重写
- (void)setupTopV
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    
/////设置 navigation
    
    [self setNavLeftBtnImage:@""];
    
    self.baseNavigation.backgroundColor = RGB(236, 128, 172);

    UIView *basevv = [[UIView alloc] initWithFrame:CGRectMake(00, 00, kScreen_Width, 64)];
    basevv.backgroundColor = [UIColor clearColor];
    //basevv.alpha = 0.3;

    [self.baseNavigation addSubview:basevv];
    
    
/////自定义搜索框
    self.customSearchBar = [[ZRRCustomSearchBar alloc] initWithFrame:CGRectMake(10, 14, kScreen_Width - 20, 40)];
    [self.customSearchBar getSearchBarTextFromSearchBarBlack:^(UITextField *textField) {
        NSLog(@"text:%@", textField.text);
        
        self.customSearchBarStrr = textField.text;
        
        [self getSearchSongData];
        
        [AnyObjectActivityView showWithTitle:@"搜索中,请稍后..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
        
    }];
    
    
    
    [self.customSearchBar cancelBtnClicked:^(UIButton *cancelBtn) {
        //
        NSLog(@"cancel 按钮点击了 ..........");
        
        [self backFarward];
        
    }];
    
    
    [basevv addSubview:self.customSearchBar];
    
    
    
////TableView 背景图片
    self.tableBgImggV = [[UIImageView alloc] initWithFrame:CGRectMake(0,  0, kScreen_Width, kScreen_Height)];
    self.tableBgImggV.image = IMAGE(@"点歌-底图");
    self.tableBgImggV.userInteractionEnabled = YES;
    
    
    [self.view addSubview:self.tableBgImggV];
    

    
////搜索 TableView
    [self addSearchTableView];
    
////添加 searchBar
    //[self addSearchBarView];
////添加 sorryLb
    [self addSorryLabel];
    
////添加 footerView
    [self addFooterView];
    
//
    
    //监听播放状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(songPlaybackFinishheedd) name:@"playbackFinishheedd" object:nil];
    
    
    
    //监听首页点歌
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchBarSearchButtonClicked:) name:@"textSearchSongg" object:nil];
    
    
    
///////监听首页 播放 暂停  按钮 状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(songisPausseedrd) name:@"songisPausseed" object:@"pausseed"];
    
   
    
    
#pragma mark ---------------------------------- 监听锁屏状态
    ////-------------------------------------------------
    ////-------------------------------------------------
    // 监听锁屏状态
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, updateEnabled, CFSTR("com.apple.iokit.hid.displayStatus"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
        
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, lockState, CFSTR("com.apple.springboard.lockstate"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    });
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLockScreen) name:kSetLockScreenLrcNoti object:nil];
    
////-------------------------------------------------
////-------------------------------------------------
    
}


////-------------------------------------------------
////-------------------------------------------------
// 监听在锁定状态下，屏幕是黑暗状态还是明亮状态
static void updateEnabled(CFNotificationCenterRef center, void* observer, CFStringRef name, const void* object, CFDictionaryRef userInfo) {
    
    //    uint64_t state;
    
    int token;
    
    notify_register_check("com.apple.iokit.hid.displayStatus", &token);
    
    notify_get_state(token, &isScreenBright);
    
    notify_cancel(token);
    
    [ZMSearrchSonggViewController checkoutIfSetLrc];
    
    //    NSLog(@"锁屏状态：%llu",isScreenBright);
}

// 监听屏幕是否被锁定
static void lockState(CFNotificationCenterRef center, void* observer, CFStringRef name, const void* object, CFDictionaryRef userInfo) {
    
    uint64_t state;
    
    int token;
    
    notify_register_check("com.apple.springboard.lockstate", &token);
    
    notify_get_state(token, &state);
    
    notify_cancel(token);
    isLocked = state;
    [ZMSearrchSonggViewController checkoutIfSetLrc];
    //    NSLog(@"lockState状态：%llu",state);
}


+ (void)checkoutIfSetLrc {
    if (isLocked && isScreenBright) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kSetLockScreenLrcNoti object:nil];
    }
}




////-------------------------------------------------
////-------------------------------------------------

- (void)updateLockScreen {
    // 获取音乐播放信息中心
    MPNowPlayingInfoCenter *nowPlayingInfoCenter = [MPNowPlayingInfoCenter defaultCenter];
    // 创建可变字典存放信息
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    // 获取当前正在播放的音乐对象
    //WPFMusic *music = self.musics[self.currentMusicIndex];
    
    //WPFPlayManager *playManager = [WPFPlayManager sharedPlayManager];
    // 专辑名称
    info[MPMediaItemPropertyAlbumTitle] = self.lockScreenMusicNameStr;
    // 歌手
    info[MPMediaItemPropertyArtist] = self.lockScreenMusicSongerNameStr;
    // 专辑图片
    if (self.lockScreenMusicImage) {
        
        info[MPMediaItemPropertyArtwork] = [[MPMediaItemArtwork alloc] initWithImage:self.lockScreenMusicImage];
    }
    
    // 当前播放进度
    //info[MPNowPlayingInfoPropertyElapsedPlaybackTime] = @([[ZMAVPlayerManager playerManager] progress]);
    // 音乐总时间
    //info[MPMediaItemPropertyPlaybackDuration] = @(playManager.duration);
    // 音乐名称
    info[MPMediaItemPropertyTitle] = self.lockScreenMusicNameStr;
    
    nowPlayingInfoCenter.nowPlayingInfo = info;
    
}


- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    /*
     UIEventSubtypeRemoteControlPlay                 播放
     UIEventSubtypeRemoteControlPause                暂停
     UIEventSubtypeRemoteControlStop                 停止
     UIEventSubtypeRemoteControlTogglePlayPause      从暂停到播放
     UIEventSubtypeRemoteControlNextTrack            下一曲
     UIEventSubtypeRemoteControlPreviousTrack        上一曲
     UIEventSubtypeRemoteControlBeginSeekingBackward 开始快退
     UIEventSubtypeRemoteControlEndSeekingBackward   结束快退
     UIEventSubtypeRemoteControlBeginSeekingForward  开始快进
     UIEventSubtypeRemoteControlEndSeekingForward    结束快进
     */
    switch (event.subtype) {
        case UIEventSubtypeRemoteControlPlay:
        //case UIEventSubtypeRemoteControlPause:
            [[ZMAVPlayerManager playerManager] startPlay];
            break;
            
        case UIEventSubtypeRemoteControlPause:
            [[ZMAVPlayerManager playerManager] pausePlay];
            break;
        case UIEventSubtypeRemoteControlNextTrack:
            //[self next];
            break;
        case UIEventSubtypeRemoteControlPreviousTrack:
            //[self previous];
            break;
            
        default:
            break;
    }
}




////-------------------------------------------------
////-------------------------------------------------







#pragma mark -----------------------------------------UI

#pragma mark ------------------------------footerView
- (void)addFooterView
{
    
    self.footView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreen_Height, kScreen_Width, 80)];
    
    self.footView.backgroundColor = [UIColor whiteColor];
    self.footView.alpha = 0.8;
    
    [self.view addSubview:self.footView];
    
    self.musicTitle = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, [UIScreen mainScreen].bounds.size.width-80 - 80, 40)];
    self.musicTitle.textAlignment = NSTextAlignmentLeft;
    self.musicTitle.textColor = [UIColor blackColor];
    self.musicTitle.font = [UIFont systemFontOfSize:17];
    self.musicTitle.text = @"星伴";
    self.musicTitle.numberOfLines = 0;
    
    self.songerLbb = [[UILabel alloc]initWithFrame:CGRectMake(80, 30, [UIScreen mainScreen].bounds.size.width-80 - 80, 30)];
    self.songerLbb.textAlignment = NSTextAlignmentLeft;
    self.songerLbb.textColor = [UIColor blackColor];
    self.songerLbb.font = [UIFont systemFontOfSize:15];
    self.songerLbb.text = @"星伴";
    self.songerLbb.numberOfLines = 0;
    
    [self.footView addSubview:self.musicTitle];
    [self.footView addSubview:self.songerLbb];
    
    self.musicImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 5, 60, 60)];
    self.musicImageView.layer.cornerRadius = 30;
    self.musicImageView.layer.masksToBounds = YES;
    self.musicImageView.image = [UIImage imageNamed:@"logo"];
    [self.footView addSubview:self.musicImageView];

    [self.footView addSubview:self.playButton];
    
    [self.footView addSubview:self.nextButton];
    
    
#pragma mark -----------------------------------添加进度条
    
    _lineProgressV = [[CWProgressView alloc] initWithFrame:CGRectMake(10, 70, kScreen_Width - 20, 5)];
    _lineProgressV.type = NZProgressTypeDefault;
    //_lineProgressV.textColor = [UIColor redColor];
    _lineProgressV.progress = 0;
    _lineProgressV.progressColor = RGB(232, 20, 82);
    //_lineProgressV.alpha = 0.8;

    [self.footView addSubview:_lineProgressV];
    
    
    
    
}

- (UIButton *)playButton
{
    if (_playButton == nil) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _playButton.frame = CGRectMake(kScreen_Width - 22 - 34 - 100, 13, 34, 34);
        _playButton.backgroundColor = [UIColor clearColor];
        [_playButton setTitle:@"暂停" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //UIImage *image = [UIImage imageNamed:@"iconfont-bofang"];
        //image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_playButton setBackgroundImage:IMAGE(@"播放pp") forState:UIControlStateNormal];
        //_playButton.tintColor = MainColor;
       
        
    }
    
    return _playButton;
}


- (UIButton *)nextButton
{
    if (_nextButton == nil) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectMake(kScreen_Width - 22 - 34, 13, 34, 34);
        _nextButton.backgroundColor = [UIColor clearColor];
        [_nextButton setTitle:@"下一首" forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
       
        [_nextButton setBackgroundImage:IMAGE(@"下一首") forState:UIControlStateNormal];
        [_nextButton setBackgroundImage:IMAGE(@"下一首-点击") forState:UIControlStateHighlighted];
        
        
    }
    
    return _nextButton;
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


#pragma mark ----------------------------搜索 TableView
- (void)addSearchTableView
{

    self.searchSongTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64 )];
    
    self.searchSongTableView.backgroundColor = [UIColor clearColor];
    self.searchSongTableView.dataSource = self;
    self.searchSongTableView.delegate = self;
    self.searchSongTableView.rowHeight = 100;
    //分割线的颜色
    [self.searchSongTableView setSeparatorColor:[UIColor whiteColor]];
    
    self.searchSongTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self loadMoreSongData];//加载更多
    }];
    
    

    
    [self.tableBgImggV addSubview:self.searchSongTableView];

    self.searchSongTableView.tableFooterView = [UIView new];

    
    //设置观察者
    /* 观察 tableView 的 contentOffset */
    //[self.searchSongTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    

}



//当观察者的观察对象的属性一发生变化时, 就调用这个方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([object isEqual:self.searchSongTableView] && [keyPath isEqualToString:@"contentOffset"]) {
        
        [self resetSearchBarFrame];
    }
}




- (void)resetSearchBarFrame
{
    CGPoint offset = self.searchSongTableView.contentOffset;
    
    
    NSLog(@"%.f",offset.y);
    
    
    if (offset.y > 250) {
        //搜索框放大
        
        [self makeSearchBarLarge];
    } else {
        //搜索框缩小
    
        [self makeSearchBarSmall];
    }
    
}

- (void)makeSearchBarLarge
{

    [self.customSearchBar.bgView setSize:CGSizeMake(CGRectGetWidth(self.customSearchBar.bgView.frame) + 50, CGRectGetHeight(self.customSearchBar.bgView.frame))];
    
    [self.customSearchBar.searchBarTextField setSize:CGSizeMake(CGRectGetWidth(self.customSearchBar.searchBarTextField.frame) + 50, CGRectGetHeight(self.customSearchBar.searchBarTextField.frame))];
    
    [self.customSearchBar.clearnImageView setOrigin:CGPointMake(self.customSearchBar.clearnImageView.frame.origin.x + 50, self.customSearchBar.clearnImageView.frame.origin.y)];
    


}


- (void)makeSearchBarSmall
{
    
    [self.customSearchBar.bgView setSize:CGSizeMake(CGRectGetWidth(self.customSearchBar.bgView.frame) - 50, CGRectGetHeight(self.customSearchBar.bgView.frame))];
    
    
    [self.customSearchBar.searchBarTextField setSize:CGSizeMake(CGRectGetWidth(self.customSearchBar.searchBarTextField.frame) - 50, CGRectGetHeight(self.customSearchBar.searchBarTextField.frame))];
    
    [self.customSearchBar.clearnImageView setOrigin:CGPointMake(self.customSearchBar.clearnImageView.frame.origin.x - 50, self.customSearchBar.clearnImageView.frame.origin.y)];
    
    
    
    
}




#pragma mark ------------------------------加载更多
- (void)loadMoreSongData
{
    [self getSearchSongDataOutolaout];

}



- (void)addSorryLabel
{
    
    self.sorryV = [[UIView alloc] initWithFrame:CGRectMake(0, 130, kScreen_Width, kScreen_Height - 100)];
    self.sorryV.backgroundColor = [UIColor  whiteColor];
    
    [self.view addSubview:self.sorryV];
    
    
    
    self.sorryLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, kScreen_Width, 40)];
    self.sorryLb.backgroundColor = [UIColor whiteColor];
    self.sorryLb.text = @"对不起,未搜到相关结果,请重新搜索.";
    self.sorryLb.font = [UIFont systemFontOfSize:15];
    self.sorryLb.textColor = [UIColor blackColor];
    self.sorryLb.textAlignment = NSTextAlignmentCenter;
    
    [self.sorryV addSubview:self.sorryLb];
    self.sorryV.hidden = YES;
    

}


#pragma mark ----------------------------根据颜色 得到图片
////
- (UIImage *) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
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



#pragma mark ----------------- tableViewDelegate && dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellid = @"searchSong";
    
    ZMChooseSongFirstPgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (!cell){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMChooseSongFirstPgTableViewCell" owner:self options:nil] lastObject];
    }
    cell.backgroundColor = [UIColor clearColor];
    
    
    ZMSearchSonngModell *searchSongModel = [self.searchDataArray objectAtIndex:indexPath.row];
    
    [cell updateSearchSongCellWith:searchSongModel];
    
////
//    int index = (int)indexPath.row;
//    cell.cellDelegate = self;
//    cell.playPauseBtn.tag = index;
//    [cell.playPauseBtn setTitle:@"播放" forState:UIControlStateNormal];
//    [cell.playPauseBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    
    
    
    
    
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
    
    
    //_playButton.enabled = YES;
    
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.footView.frame = CGRectMake(0, kScreen_Height - 80, kScreen_Width, 80);
        
        self.searchSongTableView.frame = CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64 - 80);
        
    }];
    
    
    _searchSongIndex = (int)indexPath.row;
    
    
    //self.searchSongModel = self.searchDataArray[indexPath.row];
    self.searchSongModel = self.searchDataArray[_searchSongIndex];
    
    
    self.music_idd = self.searchSongModel.music_id;
    
    [self getSearchHPlayMusicID:self.music_idd];//统计播放历史

    
    
    
    //音乐名字  通知
    [APPTransmit shareInstance].isPlayingSongName = self.searchSongModel.song_name;
    
    
#pragma mark ----------------------------------向首页传值
    

    //向首页传值
    [APPTransmit shareInstance].diangeFirstPageHeadPoritStr = self.searchSongModel.music_pic;
    [APPTransmit shareInstance].diangeFirstPageSongNameStr = self.searchSongModel.song_name;
    [APPTransmit shareInstance].diangeFirstPageSongerNameeStr = self.searchSongModel.singer_name;
    
    //传值的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"transmitttttt" object:@"transsssmit"];
    
    
    
    
    
    self.musicTitle.text = self.searchSongModel.song_name;
    self.songerLbb.text = self.searchSongModel.singer_name;
    
    NSString *pic = self.searchSongModel.music_pic;
    
    if (pic == nil || pic == NULL || [pic isKindOfClass:[NSNull class]]) {
        
        self.musicImageView.image = [UIImage imageNamed:@"logo"];
        
    }else {

        [self.musicImageView sd_setImageWithURL:[NSURL URLWithString:self.searchSongModel.music_pic]];
        
        
        self.lockScreenMusicImage = self.musicImageView.image;
        
    }
    
    
    
    
////-----------------------------------------------------
////-----------------------------------------------------
    //传递锁屏信息
    self.lockScreenMusicNameStr = self.searchSongModel.song_name;
    //self.lockScreenMusicPicStr = searchSongModel.music_pic;
    self.lockScreenMusicSongerNameStr = self.searchSongModel.singer_name;
    
////-----------------------------------------------------
////-----------------------------------------------------
    
    
    
    [[ZMAVPlayerManager playerManager] loadNewSongg:self.searchSongModel.mp3_url];

    [[ZMAVPlayerManager playerManager] startPlay];

    
#pragma mark --------------------------------------添加进度条
    
    if ([[ZMAVPlayerManager playerManager] isPlaying]) {
        
        [self addCurrentTimer];//进度条
        
    }

    
    
    
    
    
    
    
    
////正在播放
////发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];
    
    
    
    
    ////按钮
    [_playButton setBackgroundImage:IMAGE(@"暂停ss") forState:UIControlStateNormal];
    
#pragma mark ------------------------------------播放按钮
    
    [_playButton addTarget:self action:@selector(playButtonClickedtt:) forControlEvents:UIControlEventTouchUpInside];

#pragma mark ------------------------------------下一首按钮
    
    [_nextButton addTarget:self action:@selector( nexttButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}


#pragma mark ------------------------------------设置进度条

/*
 添加定时器
 */
- (void)addCurrentTimer
{
    if (![[ZMAVPlayerManager playerManager] isPlaying] ) return;
    
    //在新增定时器之前，先移除之前的定时器
    [self removeCurrentTimer];
    
    [self updateProgressInfo];
    
    self.playSongTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressInfo) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.playSongTimer forMode:NSRunLoopCommonModes];
    
    
}


- (void)removeCurrentTimer
{
    [self.playSongTimer invalidate];
    self.playSongTimer = nil;
}

- (void)updateProgressInfo
{
    
    _lineProgressV.progress = CMTimeGetSeconds([ZMAVPlayerManager playerManager].player.currentTime) / CMTimeGetSeconds([ZMAVPlayerManager playerManager].player.currentItem.duration);
    
    
}


#pragma mark ----------------------------根据首页播放状态调整  暂停播放按钮
- (void)songisPausseedrd
{

    
    if ([[ZMAVPlayerManager playerManager] isPlaying]) {
        //
        [_playButton setBackgroundImage:IMAGE(@"暂停ss") forState:UIControlStateNormal];
        
        //
        
        
        [[ZMAVPlayerManager playerManager] startPlay];
        
    } else {
    
    
        [_playButton setBackgroundImage:IMAGE(@"播放pp") forState:UIControlStateNormal];
        
        
        [[ZMAVPlayerManager playerManager] pausePlay];
        
    }
    

}


#pragma mark -------------------------------------暂停播放按钮

- (void)playButtonClickedtt:(UIButton *)playButton
{
    
    if ([playButton.currentTitle isEqualToString:@"播放"]) {
        [playButton setTitle:@"暂停" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        //UIImage *image = [UIImage imageNamed:@"iconfont-zanting"];
        //image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_playButton setBackgroundImage:IMAGE(@"暂停ss") forState:UIControlStateNormal];
        //_playButton.tintColor = MainColor;
        //
        [[ZMAVPlayerManager playerManager] startPlay];
        
        
        //
        // 正在播放   发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];
        
        
        
        
        //改变点歌首页按钮状态
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ffsongPausseed" object:@"ffpaused"];
        
        
        
        
        
    }else{
        
        [playButton setTitle:@"播放" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        //UIImage *image = [UIImage imageNamed:@"iconfont-bofang"];
        //image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_playButton setBackgroundImage:IMAGE(@"播放pp") forState:UIControlStateNormal];
        //_playButton.tintColor = MainColor;
        //
        [[ZMAVPlayerManager playerManager] pausePlay];
        //
        // 暂停  发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayenddd" object:@"songendf"];
        
        
        
        
        //改变点歌首页按钮状态
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ffsongPausseed" object:@"ffpaused"];
        
        
    }
    
    
}



#pragma mark -------------------------------------下一首 按钮

- (void)nexttButtonClicked//:(UIButton *)nextButton
{
    
    _lineProgressV.progress = 0;//清除进度条
    
    
    _searchSongIndex ++;
    
    
    ////判断是否是最后一首
    if (_searchSongIndex == (int)(self.searchDataArray.count - 1)) {
        //
        _searchSongIndex = 0;
    }

    
    self.searchSongModel = self.searchDataArray[_searchSongIndex];
    
    
    self.music_idd = self.searchSongModel.music_id;
    
    [self getSearchHPlayMusicID:self.music_idd];//统计播放历史
    

#pragma mark ----------------------------------向首页传值
   
    //向首页传值
    [APPTransmit shareInstance].diangeFirstPageHeadPoritStr = self.searchSongModel.music_pic;
    [APPTransmit shareInstance].diangeFirstPageSongNameStr = self.searchSongModel.song_name;
    [APPTransmit shareInstance].diangeFirstPageSongerNameeStr = self.searchSongModel.singer_name;
    
    //传值的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"transmitttttt" object:@"transsssmit"];
    

    
    
    
    
    self.musicTitle.text = self.searchSongModel.song_name;
    self.songerLbb.text = self.searchSongModel.singer_name;
    
    NSString *pic = self.searchSongModel.music_pic;
    
    if (pic == nil || pic == NULL || [pic isKindOfClass:[NSNull class]]) {
        
        self.musicImageView.image = [UIImage imageNamed:@"logo"];
        
    }else {
        
        [self.musicImageView sd_setImageWithURL:[NSURL URLWithString:self.searchSongModel.music_pic]];
        
        
        self.lockScreenMusicImage = self.musicImageView.image;
        
    }
    
    
    
    

    [[ZMAVPlayerManager playerManager] pausePlay];
    
    [[ZMAVPlayerManager playerManager] loadNewSongg:self.searchSongModel.mp3_url];
    
    [[ZMAVPlayerManager playerManager] startPlay];



}


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
                //NSLog(@"播放__________%@",object);
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


#pragma mark ----------------------------------------播放完成
- (void)songPlaybackFinishheedd
{
    NSLog(@"songPlaybackFinishheedd");

//    UIImage *image = [UIImage imageNamed:@"iconfont-bofang"];
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    [_playButton setBackgroundImage:image forState:UIControlStateNormal];
//    _playButton.tintColor = MainColor;
//    
//    _playButton.enabled = NO;
    
//发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayenddd" object:@"songendf"];
    
    
////自动播放下一首
    [self nexttButtonClicked];
    

}




#pragma mark ---------playPauseButtonDelegate   cellDelegate

- (void)cellButtonAction:(UIButton *)sender
{
//    //UIButton *button = (UIButton *)sender;
//    int index = (int)sender.tag;
//
//    
//    
//    if (self.searchSongModelll) {
//        self.searchSongModelll.isSelected = !self.searchSongModelll.isSelected;
//    }
//    
//    
//    ZMSearchSonngModell *searchSongModel = self.searchDataArray[index];
//    
//    
//    
//    ZMChooseSongFirstPgTableViewCell *cell = (ZMChooseSongFirstPgTableViewCell *)[[sender superview] superview];
//    
//    NSIndexPath *indexPathh = [self.searchSongTableView indexPathForCell:cell];
//    
//    NSLog(@"____________%ld",(long)indexPathh.row);
//
//    
//    
//    if (!searchSongModel.isSelected) {
//        searchSongModel.isSelected = !searchSongModel.isSelected;
//        self.searchSongModelll = searchSongModel;
//    }
//
//    
//    
//    [self tableView:self.searchSongTableView didSelectRowAtIndexPath:indexPathh];
//    
//    
//    //[NSUserDefaults standardUserDefaults].songCellBtnTag = [NSString stringWithFormat:@"%d",index];
//    
//    
//    
//    
////    static dispatch_once_t onceToken;
////    dispatch_once(&onceToken, ^{
////        [self tableView:self.searchSongTableView didSelectRowAtIndexPath:indexPathh];
////    });
//    
//    
//    
//    
//    if ([sender.currentTitle isEqualToString:@"播放"]) {
//        
//        [sender setTitle:@"暂停" forState:UIControlStateNormal];
//        
//        //
//        UIImage *image = [UIImage imageNamed:@"暂停-图标"];
//        
//        [sender setBackgroundImage:image forState:UIControlStateNormal];
//        
//        //
//        
//        
//        [[ZMAVPlayerManager playerManager] startPlay];
//
//        
//        
//        /////发送通知
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];
//        
//        
//        
//        
//    }else if ([sender.currentTitle isEqualToString:@"暂停"]){
//        
//        [sender setTitle:@"播放" forState:UIControlStateNormal];
//        
//        UIImage *image = [UIImage imageNamed:@"播放-图标"];
//        
//        [sender setBackgroundImage:image forState:UIControlStateNormal];
//        
//        //
//        [[ZMAVPlayerManager playerManager] pausePlay];
//
//        
//    }else {}
//    
//
//    
//    
//    [self.searchSongTableView reloadData];
//
    
    
    
    
    
    
}



//#pragma mark -----------------------------SearchBarDelegate
//
//
//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
//{
//    
//    NSLog(@"searchBar   begin");
//
//    
//    [self.searchDataArray removeAllObjects];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.searchSongTableView reloadData];
//    });
//    //[self.searchSongTableView reloadData];
//
//
//}



//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//    
//    if (searchText.length == 0) {
//        self.speechImgV.hidden = NO;
//    }else {
//    
//        self.speechImgV.hidden = YES;
//    }
//    
//
//
//
//}

/////点击 search 按钮
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
//{
//    //self.sorryLb.hidden = YES;
//    
//    self.searchStr = searchBar.text;
//    
//
//    [self getSearchSongData];
//    
//    [AnyObjectActivityView showWithTitle:@"搜索中,请稍后..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
//
//    
//    //[self.searchBarView resignFirstResponder];
//
//
//}



//#pragma mark ------------------------------Event 
//- (void)cancelSearch
//{
//
//    [self.view endEditing:YES];
//}


#pragma mark -----------------------点击进入语音搜索界面
- (void)topsspeechTapImgVTaped
{


    ZMChooseSongSearchhViewController *voiceSongVC = [[ZMChooseSongSearchhViewController alloc] init];
    
    
    [self.navigationController pushViewController:voiceSongVC animated:YES];




}

#pragma mark -------------------------------文字搜索请求数据
- (void)getSearchSongData
{
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        //NSString *dev_unique_id = [[ZMHelper sharedHelp] getIdentifierStr];
        
        //NSDictionary *parmeters = @{ @"unique_id":@"22233455", @"start_time":@"0",@"music_src_type":@"0",@"keyword":self.searchStr, @"page":@"1" };
        
        if (self.customSearchBarStrr.length > 1) {
            //
            NSDictionary *parmeters = @{ @"unique_id":@"22233455", @"start_time":@"0",@"music_src_type":@"0",@"keyword":self.customSearchBarStrr, @"page":@"1" };
            
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"life_secretory/search.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"文字搜索________%@",object);
                
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                //NSInteger count = (NSInteger)[object objectForKey:@"count"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    NSDictionary *other = [data objectForKey:@"other"];
                    
                    NSInteger intttt = [[other objectForKey:@"music_src_type"] integerValue];
                    NSInteger intttt22 = [[other objectForKey:@"page"] integerValue];
                    NSInteger intttt33 = [[other objectForKey:@"start_time"] integerValue];
                    
                    
                    self.music_src_type = [NSString stringWithFormat:@"%ld",(long)intttt];
                    
                    self.page = [NSString stringWithFormat:@"%ld",(long)intttt22];
                    self.start_time = [NSString stringWithFormat:@"%ld",(long)intttt33];
                    
                    
                    
                    
                    
                    self.searchDataArray = [ZMSearchSonngModell parseRespondsSearchhSongData:object];
                    
                    //NSLog(@"--searchDataArray-----%ld",(unsigned long)self.searchDataArray.count);
                    
                    
                    
                    
                    
                    if (self.searchDataArray.count != 0) {
                        self.sorryV.hidden = YES;
                        
                        //self.speechImgV.hidden = YES;
                        
                        
                    }else {
                        
                        self.sorryV.hidden = NO;
                        
                        self.searchSongTableView.scrollEnabled = NO;//设置 tabelview 不能滚动
                        
                        
                        
                    }
                    
                    
                    
                    [self.searchSongTableView reloadData];//加载数据
                    
                    
                    
                }
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"错误_____%@",error);
                
                self.sorryV.hidden = NO;
                
            }];

            
            

        }
        
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
    
}




#pragma mark -------------------------------ScrollView滚动范围

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
    
    _contentOffsetY = scrollView.contentOffset.y;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    //NSLog(@"scrollViewDidScroll  %f",scrollView.contentOffset.y);
    
    _newContentOffsetY = scrollView.contentOffset.y;
    
    if (_newContentOffsetY > _oldContentOffsetY && _oldContentOffsetY > _contentOffsetY) {
        
        
        //NSLog(@"up");
        
    } else if (_newContentOffsetY < _oldContentOffsetY && _oldContentOffsetY < _contentOffsetY) {
        
        
        
        //NSLog(@"down");
        
        
        
    } else {
        
        
        //NSLog(@"dragging");
        
    }
    
    
    if (scrollView.dragging) {
        //
        if ((scrollView.contentOffset.y - _contentOffsetY) > kScreen_Height) {  // 向上拖拽
            
            //[self getSearchSongDataOutolaout];
            
        } else if ((_contentOffsetY - scrollView.contentOffset.y) > 20) {   // 向下拖拽
            
            
            
            
        } else {
            
            
            
        }
        
        
    }
    
    
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

{
    
    _oldContentOffsetY = scrollView.contentOffset.y;
    
}




#pragma mark ----------------------------------自动加载更多

- (void)getSearchSongDataOutolaout//自动加载更多
{
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if (![self.page isEqualToString:@""] && ![self.music_src_type isEqualToString:@""] && ![self.start_time isEqualToString:@""]) {
            //
            
            NSInteger paggee = [self.page integerValue];
            
            paggee ++;
            
            self.page = [NSString stringWithFormat:@"%ld",paggee];
            
            NSLog(@"加载更多: %@",self.page);
            
            
            if (self.customSearchBarStrr.length > 0) {
                //
                NSDictionary *parmeters = @{ @"unique_id":@"22233455", @"start_time":self.start_time, @"music_src_type":self.music_src_type, @"keyword":self.customSearchBarStrr, @"page":self.page };
                
                
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"life_secretory/search.php" theParmeters:parmeters sucess:^(id object) {
                    //
                    //NSLog(@"自动加载更多________%@",object);
                    
                    NSString *status = (NSString *)[object objectForKey:@"status"];
                    
                    //NSInteger count = (NSInteger)[object objectForKey:@"count"];
                    
                    
                    if ([status isEqualToString:@"0"] ) {
                        //
                        
                        NSDictionary *data = [object objectForKey:@"data"];
                        
                        NSDictionary *other = [data objectForKey:@"other"];
                        
                        NSInteger intttt111 = [[other objectForKey:@"music_src_type"] integerValue];
                        NSInteger intttt222 = [[other objectForKey:@"page"] integerValue];
                        NSInteger intttt333 = [[other objectForKey:@"start_time"] integerValue];
                        
                        
                        self.music_src_type = [NSString stringWithFormat:@"%ld",(long)intttt111];
                        
                        self.page = [NSString stringWithFormat:@"%ld",(long)intttt222];
                        self.start_time = [NSString stringWithFormat:@"%ld",(long)intttt333];
                        
                        
                        
                        
                        
                        self.autosearchDataArray = (NSArray *)[ZMSearchSonngModell parseRespondsSearchhSongData:object];
                        
                        if (self.autosearchDataArray.count != 0) {
                            
                            [self.searchDataArray addObjectsFromArray:self.autosearchDataArray];
                        }
                        
                        
                        
                        
                        if (self.searchDataArray.count != 0) {
                            self.sorryV.hidden = YES;
                            
                            //self.title = @"搜索结果";
                        }else {
                            
                            //self.title = @"搜索";
                            self.sorryV.hidden = YES;
                            
                            //self.searchSongTableView.scrollEnabled = NO;//设置 tabelview 不能滚动
                            
                            
                            
                        }
                        
                        [self.searchSongTableView reloadData];//加载数据
                    }
                    
                    
                } error:^(NSError *error) {
                    //
                    NSLog(@"错误_____%@",error);
                    
                    self.sorryV.hidden = YES;
                    
                }];

                
            }
            
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
