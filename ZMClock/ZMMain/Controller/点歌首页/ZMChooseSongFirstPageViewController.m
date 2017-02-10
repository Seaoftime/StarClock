//
//  ZMChooseSongFirstPageViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMChooseSongFirstPageViewController.h"

#import "ZMChooseSongFirstPgTableViewCell.h"
#import "ZMSearrchSonggViewController.h"
#import "ZMChooseSongSearchhViewController.h"
#import "ZMDIanGePageDataModel.h"
#import "ZMAVPlayerManager.h"
#import "MJRefresh.h"

#import "CWProgressView.h"

@interface ZMChooseSongFirstPageViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    BOOL _refreshEnd;


    CWProgressView *_lineProgressV;//进度条

}
/*
 显示播放进度条的定时器
 */
@property (nonatomic, strong) NSTimer *playSongTimer;

@property (nonatomic, assign) int searchSongIndex;//歌曲序号
@property (nonatomic, strong) UIImageView *tableBgImggV;

@property (nonatomic, strong) UIView *naviV;//navigation
@property (nonatomic, strong) UIView *topSearchV;//顶部搜索

@property (nonatomic, strong) UIView *tableVBgVv;//tableview背景
@property (nonatomic, strong) UILabel *beforePlayLb;//播放历史
@property (nonatomic, strong) UITableView *chooseSongTabV;
@property (nonatomic, strong) UIImageView *topSearchImgV;
@property (nonatomic, strong) UIImageView *speechImgV;//语音按钮
@property (nonatomic, strong) NSMutableArray *songPlayHistoryMuArry;//播放历史的数组
@property (nonatomic, strong) UIImageView *voiceImg;//放大镜
@property (nonatomic, strong) UIImageView *disssImgg;


//没有播放历史
@property (nonatomic, strong) UIImageView *noPlayHistroyImgV;
@property (nonatomic, strong) UILabel *noPlayHistoryLb;
@property (nonatomic, strong) UILabel *textSearchLb;

@property (nonatomic, strong) ZMSearchSonngModell *searchSongModel;
@property (nonatomic, strong) UIButton *cancellButton;//取消按钮

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

////添加刷新
@property (nonatomic, assign) NSInteger refreshPage; // 数据页数




@end

@implementation ZMChooseSongFirstPageViewController



+ (ZMChooseSongFirstPageViewController *)shareZMChooseSongFirstPageViewController
{

    static ZMChooseSongFirstPageViewController *defautVC = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        defautVC = [[self alloc] init];
    });
    
    return defautVC;
    
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
        
        
        //正在播放
        //发送通知
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];//不能写在定时器方法里面 一直在执行通知 内存一直在增加 很快系统会提示 没有内存空间了
        
        
    }
    
}


- (void)viewWillAppear:(BOOL)animated
{
    //开启定时器
    
    [self.displayLinkk addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    // 马上进入刷新状态
    [self.chooseSongTabV.header beginRefreshing];
    
    _refreshEnd = NO;
    
    
    
    
    
#pragma mark --------------------------------------添加进度条
    
    if ([[ZMAVPlayerManager playerManager] isPlaying]) {
        
        [self addCurrentTimer];//进度条
        
    }
    
    
    
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //[self.displayLinkk removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [_displayLinkk invalidate];
    _displayLinkk = nil;
    
    
#pragma mark -----------------------------移除进度条
    
    [self removeCurrentTimer];

    
    
}


- (void)cancellButtonClickede
{
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)dissfImgVTaped
{

    [self.navigationController popViewControllerAnimated:YES];


}

/////////////父类方法重写
- (void)setupTopV
{

}


- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    _refreshEnd = NO;
    
    
/////设置 navigation
    
    [self setNavLeftBtnImage:@""];
    
    self.baseNavigation.backgroundColor = RGB(236, 128, 172);
    
    UIView *basevv = [[UIView alloc] initWithFrame:CGRectMake(00, 00, kScreen_Width, 64)];
    basevv.backgroundColor = [UIColor clearColor];
    //basevv.alpha = 0.3;
    
    [self.baseNavigation addSubview:basevv];
    
    
    
    
    
    
    
    //点击文字按钮
    self.topSearchImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 50, 14, kScreen_Width - 20 - 50, 40)];
    self.topSearchImgV.backgroundColor = [UIColor whiteColor];
    self.topSearchImgV.layer.cornerRadius = 20;
    self.topSearchImgV.layer.masksToBounds = YES;
    
    self.topSearchImgV.userInteractionEnabled = YES;
    [basevv addSubview:self.topSearchImgV];
    
    UITapGestureRecognizer *searchTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topSearchImgVTaped)];
    [self.topSearchImgV addGestureRecognizer:searchTap];
    
    
//////////
    self.disssImgg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 50 , 50)];
    self.disssImgg.backgroundColor = [UIColor clearColor];
    self.disssImgg.image = IMAGE(@"返回按键");
    self.disssImgg.userInteractionEnabled = YES;
    [basevv addSubview:self.disssImgg];

    
    UITapGestureRecognizer *diss = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissfImgVTaped)];
    [self.disssImgg addGestureRecognizer:diss];
    
    
//////////
    
    ///
    self.textSearchLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,  self.topSearchImgV.frame.size.width , 40)];
    self.textSearchLb.text = @"搜索歌曲";
    self.textSearchLb.font = [UIFont systemFontOfSize:16];
    self.textSearchLb.textColor = [UIColor blackColor];
    self.textSearchLb.textAlignment = NSTextAlignmentCenter;
    
    [self.topSearchImgV addSubview:self.textSearchLb];
    
    ///放大镜
    self.voiceImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20 , 20)];
    self.voiceImg.backgroundColor = [UIColor clearColor];
    self.voiceImg.image = IMAGE(@"搜索-图标dian");
    self.voiceImg.userInteractionEnabled = YES;
    [self.topSearchImgV addSubview:self.voiceImg];
    
    
    //点击语音按钮
//    self.speechImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.topSearchImgV.frame.size.width - 25 - 20, 8, 20, 25)];
//    self.speechImgV.backgroundColor = [UIColor  clearColor];
//    self.speechImgV.userInteractionEnabled = YES;
//    self.speechImgV.image = IMAGE(@"语音-图标");
//    
//    //[self.topSearchImgV addSubview:self.speechImgV];
//    
//    UITapGestureRecognizer *speechTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topSspeechTapImgVTaped)];
//    [self.speechImgV addGestureRecognizer:speechTap];
    

    
////取消按钮
    //[basevv addSubview:self.cancellButton];
    
    
    
    
    
    
    
    
#pragma mark ---------------------------tableView 背景图片
    ////TableView 背景图片
    self.tableBgImggV = [[UIImageView alloc] initWithFrame:CGRectMake(0,  0, kScreen_Width, kScreen_Height)];
    self.tableBgImggV.image = IMAGE(@"点歌-底图");
    self.tableBgImggV.userInteractionEnabled = YES;
    
    
    [self.view addSubview:self.tableBgImggV];
    

    
#pragma mark ---------------------------点歌 tableView
    
    [self setupChooseSongTableView];//点歌 tableView
    
    
    ///播放历史数据
    [self fetchSongPlayHistory];
    
    
    [self addFooterView];
    
    
    //监听播放状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(songPlaybackFinishheedd) name:@"playbackFinishheedd" object:nil];
    //传值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transmitttSongSomething:) name:@"transmitttttt" object:nil];
    
    
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ffsongPausseed) name:@"ffsongPausseed" object:@"ffpaused"];
    
    
    
    
}



#pragma mark -------------------------------- UI 


- (UIButton *)cancellButton
{
    if (_cancellButton == nil) {
        _cancellButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancellButton.frame = CGRectMake(kScreen_Width - 60 + 5, 14, 40, 40);
        _cancellButton.backgroundColor = [UIColor clearColor];
        [_cancellButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancellButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_cancellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
       
        [_cancellButton addTarget:self action:@selector(cancellButtonClickede) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    return _cancellButton;
}






#pragma mark -----------------------------------刷新

/**
 *  停止刷新
 */
- (void)tableViewEndRefresh
{
    [self.chooseSongTabV.header endRefreshing];
    [self.chooseSongTabV.footer endRefreshing];
}


#pragma mark ------------------------------tableView
- (void)setupChooseSongTableView
{

//    if ([ZMSystemTool iPhone5Device]) {
//        self.tableVBgVv = [[UIView alloc] initWithFrame:CGRectMake(0, -15, kScreen_Width, kScreen_Height)];
//    }else {
//    
//        self.tableVBgVv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
//    }
    
    //self.tableVBgVv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    
    //self.tableVBgVv.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:self.tableVBgVv];
    
    
    //播放历史
    self.beforePlayLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 64 , kScreen_Width, 40)];
    self.beforePlayLb.backgroundColor = [UIColor clearColor];
    self.beforePlayLb.text = @"      播放历史";
    self.beforePlayLb.font = [UIFont systemFontOfSize:18];
    self.beforePlayLb.textColor = [UIColor blackColor];
    self.beforePlayLb.textAlignment = NSTextAlignmentLeft;
    
    //[self.tableBgImggV addSubview:self.beforePlayLb];
    
    

    
    //if ([ZMSystemTool iPhone5Device]) {
        //self.chooseSongTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];

    //}else {
        
        self.chooseSongTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 , kScreen_Width, kScreen_Height - 64 - 80)];

    //}
    
    self.chooseSongTabV.backgroundColor = [UIColor clearColor];
    self.chooseSongTabV.dataSource = self;
    self.chooseSongTabV.delegate = self;

    //分割线的颜色
    [self.chooseSongTabV setSeparatorColor:[UIColor whiteColor]];

    self.chooseSongTabV.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //self.page = 0;
        
        //[self updateData];
        
        [self fetchSongPlayHistory];
        
    }];
    
//    self.chooseSongTabV.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        //[self updateData];
//    }];
    
    
    [self.tableBgImggV addSubview:self.chooseSongTabV];
    //[self.view addSubview:self.chooseSongTabV];
    
    
    
    self.chooseSongTabV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    //tableHeaderView
//    self.topSearchV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 100)];
//    self.topSearchV.backgroundColor = [UIColor whiteColor];
//    
//    self.chooseSongTabV.tableHeaderView = self.topSearchV;
    
    
    
    
    
    
    
    
    
    
    //没有播放历史
    self.noPlayHistroyImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 50, kScreen_Height/2 - 170, 100 , 100)];
    self.noPlayHistroyImgV.image = IMAGE(@"星伴LOGO");
    self.noPlayHistroyImgV.userInteractionEnabled = YES;
    [self.chooseSongTabV addSubview:self.noPlayHistroyImgV];
    
    
    
    self.noPlayHistoryLb = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreen_Height/2 - 170 + 120, kScreen_Width, 40)];
    self.noPlayHistoryLb.text = @"你已播放的歌曲会在此显示";
    self.noPlayHistoryLb.font = [UIFont systemFontOfSize:15];
    self.noPlayHistoryLb.textColor = [UIColor lightGrayColor];
    self.noPlayHistoryLb.textAlignment = NSTextAlignmentCenter;
    
    [self.chooseSongTabV addSubview:self.noPlayHistoryLb];
    
    
    
    
}


#pragma mark ------------------------------footerView
- (void)addFooterView{
    
    self.footView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreen_Height - 80, kScreen_Width, 80)];
    
    self.footView.backgroundColor = [UIColor whiteColor];
    //self.footView.alpha = 0.8;
    
    [self.view addSubview:self.footView];
    
    self.musicTitle = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, [UIScreen mainScreen].bounds.size.width-80 - 80, 40)];
    self.musicTitle.textAlignment = NSTextAlignmentLeft;
    self.musicTitle.textColor = [UIColor blackColor];
    self.musicTitle.font = [UIFont systemFontOfSize:17];
    self.musicTitle.text = [APPTransmit shareInstance].diangeFirstPageSongNameStr ;
    
    self.musicTitle.numberOfLines = 0;
    
    self.songerLbb = [[UILabel alloc]initWithFrame:CGRectMake(80, 30, [UIScreen mainScreen].bounds.size.width-80 - 80, 30)];
    self.songerLbb.textAlignment = NSTextAlignmentLeft;
    self.songerLbb.textColor = [UIColor blackColor];
    self.songerLbb.font = [UIFont systemFontOfSize:15];
    self.songerLbb.text = [APPTransmit shareInstance].diangeFirstPageSongerNameeStr;
    
    self.songerLbb.numberOfLines = 0;
    
    [self.footView addSubview:self.musicTitle];
    [self.footView addSubview:self.songerLbb];
    
    self.musicImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 5, 60, 60)];
    self.musicImageView.layer.cornerRadius = 30;
    self.musicImageView.layer.masksToBounds = YES;
    [self.musicImageView sd_setImageWithURL:[NSURL URLWithString:[APPTransmit shareInstance].diangeFirstPageHeadPoritStr]] ;
    
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
        //[_playButton setBackgroundImage:image forState:UIControlStateNormal];
        //_playButton.tintColor = MainColor;
        [_playButton setBackgroundImage:IMAGE(@"暂停ss") forState:UIControlStateNormal];
        
        
        ////解决后一个页面传来的歌曲不能点击
        [_playButton addTarget:self action:@selector(playButtonClickedttee:) forControlEvents:UIControlEventTouchUpInside];
        
        
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
        
        [_nextButton addTarget:self action:@selector(nexttButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
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





#pragma mark ---------------------------- 搜索 Event

- (void)topSearchImgVTaped//文字搜索
{
    ZMSearrchSonggViewController *searchSongVC = [ZMSearrchSonggViewController shareZMSearrchSonggViewController];
    
    
    [self.navigationController pushViewController:searchSongVC animated:YES];
    
   


}


- (void)topSspeechTapImgVTaped//语音搜索
{
    ZMChooseSongSearchhViewController *voiceSongVC = [[ZMChooseSongSearchhViewController alloc] init];
    

     [self.navigationController pushViewController:voiceSongVC animated:YES];



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










#pragma mark ----------------- tableViewDelegate && dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellid = @"chooseSong";
    
    ZMChooseSongFirstPgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (!cell){
        //cell = [[ZMChooseSongFirstPgTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMChooseSongFirstPgTableViewCell" owner:self options:nil] lastObject];
        
    }
    cell.backgroundColor = [UIColor clearColor];
    
    
    ZMSearchSonngModell *searchSongModel = [self.songPlayHistoryMuArry objectAtIndex:indexPath.row];
    
    [cell updateSearchSongCellWith:searchSongModel];
    
    
    
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    return self.songPlayHistoryMuArry.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 100;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    NSLog(@"indexPath______%@", indexPath);
    
    //_playButton.enabled = YES;
    
    
    
//    [UIView animateWithDuration:0.5 animations:^{
//        
//        self.footView.frame = CGRectMake(0, kScreen_Height - 80, kScreen_Width, 80);
//        
//        self.chooseSongTabV.frame = CGRectMake(0, 64 , kScreen_Width, kScreen_Height - 64  - 80);
//        
//
//    }];
    
    
    _searchSongIndex = (int)indexPath.row;

    self.searchSongModel = self.songPlayHistoryMuArry[_searchSongIndex];
//    
//    
//    self.music_idd = searchSongModel.music_id;
//    
//    [self getSearchHPlayMusicID:self.music_idd];//统计播放历史
    
    
    
    
    //音乐名字  通知
    //[APPTransmit shareInstance].isPlayingSongName = searchSongModel.song_name;
    
    
    self.musicTitle.text = self.searchSongModel.song_name;
    self.songerLbb.text = self.searchSongModel.singer_name;
    
    NSString *pic = self.searchSongModel.music_pic;
    
    if (pic == nil || pic == NULL || [pic isKindOfClass:[NSNull class]]) {
        
        self.musicImageView.image = [UIImage imageNamed:@"logo"];
        
    }else {
        
        [self.musicImageView sd_setImageWithURL:[NSURL URLWithString:self.searchSongModel.music_pic]];
    }
    
    
    [[ZMAVPlayerManager playerManager] loadNewSongg:self.searchSongModel.mp3_url];
    
    [[ZMAVPlayerManager playerManager] startPlay];
    
    
#pragma mark --------------------------------------添加进度条
    
    if ([[ZMAVPlayerManager playerManager] isPlaying]) {
        
        [self addCurrentTimer];//进度条
        
    }
    
    
    
    
    
    
    //正在播放
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];
    
    
    
    
    //按钮
    [_playButton setBackgroundImage:IMAGE(@"暂停ss") forState:UIControlStateNormal];
    
#pragma mark ------------------------------------播放按钮
    
     [_playButton addTarget:self action:@selector(playButtonClickedttee:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark ------------------------------------下一首按钮
    
    [_nextButton addTarget:self action:@selector( nexttButtonClicked) forControlEvents:UIControlEventTouchUpInside];

    
    
    
}





#pragma mark ----------------------------搜索页 按钮状态 改变首页按钮状态

- (void)ffsongPausseed
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

- (void)playButtonClickedttee:(UIButton *)playButton
{
    
    if ([playButton.currentTitle isEqualToString:@"播放"]) {
        [playButton setTitle:@"暂停" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        [_playButton setBackgroundImage:IMAGE(@"暂停ss") forState:UIControlStateNormal];
        //
        [[ZMAVPlayerManager playerManager] startPlay];
        //
        // 正在播放   发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayinng" object:@"songing"];
        
        
        
        
        
        //改变搜索页按钮状态
        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPausseed" object:@"pausseed"];
        
        
    }else{
        
        [playButton setTitle:@"播放" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        [_playButton setBackgroundImage:IMAGE(@"播放pp") forState:UIControlStateNormal];
        //
        [[ZMAVPlayerManager playerManager] pausePlay];
        //
        // 暂停  发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayenddd" object:@"songendf"];
        
        
        
        
        
        //改变搜索页按钮状态
        [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPausseed" object:@"pausseed"];
        
        
    }
    
    
}


#pragma mark -------------------------------------下一首 按钮

- (void)nexttButtonClicked//:(UIButton *)nextButton
{
    
    _lineProgressV.progress = 0;//清除进度条
    
    
    _searchSongIndex ++;
    
    
    ////判断是否是最后一首
    if (_searchSongIndex == (int)(self.songPlayHistoryMuArry.count - 1)) {
        //
        _searchSongIndex = 0;
    }
    
    
    self.searchSongModel = self.songPlayHistoryMuArry[_searchSongIndex];
    
    
    
    
    
    
    self.musicTitle.text = self.searchSongModel.song_name;
    self.songerLbb.text = self.searchSongModel.singer_name;
    
    NSString *pic = self.searchSongModel.music_pic;
    
    if (pic == nil || pic == NULL || [pic isKindOfClass:[NSNull class]]) {
        
        self.musicImageView.image = [UIImage imageNamed:@"logo"];
        
    }else {
        
        [self.musicImageView sd_setImageWithURL:[NSURL URLWithString:self.searchSongModel.music_pic]];
        
        
        
    }
    
    
    
    
    
    [[ZMAVPlayerManager playerManager] pausePlay];
    
    [[ZMAVPlayerManager playerManager] loadNewSongg:self.searchSongModel.mp3_url];
    
    [[ZMAVPlayerManager playerManager] startPlay];
    
    
    
}




#pragma mark ----------------------------------------播放完成
- (void)songPlaybackFinishheedd
{
    NSLog(@"songPlaybackFinishheedd");
    
    //UIImage *image = [UIImage imageNamed:@"iconfont-bofang"];
    //image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    //[_playButton setBackgroundImage:image forState:UIControlStateNormal];
    //_playButton.tintColor = MainColor;
    
    //_playButton.enabled = NO;
    
    
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"songisPlayenddd" object:@"songendf"];
    
    
    
}



#pragma mark --------------------------传值 (正在播放)
- (void)transmitttSongSomething:(NSNotification* )Noti
{
    
    if ([Noti.object isEqual:@"transsssmit"]) {
        
 /////////////改变按钮状态
        //_playButton.enabled = YES;
        
        //[self.chooseSongTabV.header beginRefreshing];

        ///[self fetchSongPlayHistory];//开始刷新
        
        
        
//        [UIView animateWithDuration:0.5 animations:^{
//            
//            self.footView.frame = CGRectMake(0, kScreen_Height - 60, kScreen_Width, 60);
//            
//            self.chooseSongTabV.frame = CGRectMake(0, 110 - 5, kScreen_Width, kScreen_Height - 110 - 5 - 60);
//            
//        }];
    
        //按钮
        //UIImage *image = [UIImage imageNamed:@"暂停ss"];
        //image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"暂停ss"] forState:UIControlStateNormal];
        _playButton.tintColor = MainColor;
        
        
        
///////////
        
        self.musicTitle.text = [APPTransmit shareInstance].diangeFirstPageSongNameStr;
        self.songerLbb.text = [APPTransmit shareInstance].diangeFirstPageSongerNameeStr;
        
        if (![[APPTransmit shareInstance].diangeFirstPageHeadPoritStr isEqualToString:@""]) {
            [self.musicImageView sd_setImageWithURL:[NSURL URLWithString:[APPTransmit shareInstance].diangeFirstPageHeadPoritStr]];
        }
        
        
        _refreshEnd = NO;

        
        
        
    }
    
}

#pragma mark -----------------------------------请求播放历史
- (void)fetchSongPlayHistory
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]) {
            //
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign, @"per_page":@"20", @"seq":@"1", @"action_update_his":@"1"};
            
            
             NSLog(@"%@",[ZMUserInfo sharedUserInfo].user_id);
             NSLog(@"%@",[ZMUserInfo sharedUserInfo].sign);
            
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"life_secretory/get_play_history.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"播放历史__________%@",object);
                //NSLog(@"sign _____%@",[ZMUserInfo sharedUserInfo].sign);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    self.songPlayHistoryMuArry = [ZMDIanGePageDataModel parseRespondsDianGePageData:object];
                    
                    
                    if (self.songPlayHistoryMuArry.count == 0){
                        self.beforePlayLb.hidden = YES;
                        self.noPlayHistoryLb.hidden = NO;
                        self.noPlayHistroyImgV.hidden = NO;
                        
                        self.footView.hidden = YES;
                        
                        
                        //self.chooseSongTabV.frame = CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64);
                        
                        
                        [self tableViewEndRefresh];//停止刷新
                        
                    }else {
                    
                        self.beforePlayLb.hidden = NO;
                        self.noPlayHistoryLb.hidden = YES;
                        self.noPlayHistroyImgV.hidden = YES;
                        
                        self.footView.hidden = NO;
                        
                        
                        //self.chooseSongTabV.frame = CGRectMake(0, 110 - 5, kScreen_Width, kScreen_Height - 110 + 3);
                    
                    
                        [self tableViewEndRefresh];//停止刷新
                    }
                    
                    
                    [self.chooseSongTabV reloadData];//加载数据
                    
                    _refreshEnd = YES;
                    
                    
                    
                }
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
                [self tableViewEndRefresh];//停止刷新
                
            }];

        }else {
        
        //未登录
        
        
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
