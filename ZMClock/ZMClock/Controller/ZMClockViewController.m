//
//  ZMClockViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMClockViewController.h"
#import "ClockTableViewCell.h"
#import "ZMAddClockViewController.h"
#import "ZMBaseNavigationController.h"
#import "ZMAddClockEditViewController.h"
#import "ZMDIYClockViewController.h"

//////////////
#import "GameItemTypeModel.h"
#import "ZMMainViewController.h"

//----------------------------------------------
//----------------------------------------------
#import "ZMNewwClockkFirstpageTableViewCell.h"
#import "ZMClockAddcModel.h"
#import <AVFoundation/AVFoundation.h>
#import "LocalNotificationManager.h"
#import "ZMClockStartPageeViewController.h"
#import "ZMCLockChooseLoveDouViewController.h"
#import "ZMEdittClockEditViewController.h"

#import "ZMCLockChooseLoveDouViewController22.h"


#define BG_COLOR RGB(175, 129, 139)
#define CELL_SWITCH_OFF_COLOR  RGB(204, 204, 204)


@interface ZMClockViewController () <UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) UIImageView *clockListBgImgV;


/*
 闹钟表视图
 */
@property (nonatomic, strong) UITableView *clockTableView;
@property (nonatomic, strong) UIView *talbleHeaderV;
@property (nonatomic, strong) UILabel *topTimeLb;
@property (nonatomic, strong) UIImageView *topImgVV;


@property (nonatomic, strong) NSMutableArray *allArray;


///---------------------------------------------------
///---------------------------------------------------

@property (nonatomic, strong) UIButton *addClockBtn;//添加闹钟
@property (nonatomic, strong) UIButton *inportantTishiBtn;//添加闹钟

@property (nonatomic, strong) NSArray *clockArray;

@property (nonatomic, strong) ZMClockAddcModel *clockModel;
@property (nonatomic, strong) UIButton *cancelBtnn;//测试

@property (nonatomic, strong) AVAudioPlayer *audioplayer;

//闹钟数组序号
@property (nonatomic, assign) NSInteger clockIndex;
///取消的闹钟序号
@property (nonatomic, assign) NSInteger cancelClockIndex;

///提示页面
@property (nonatomic, strong) UIImageView *tisiBgImgV;
@property (nonatomic, strong) UIView *tisBgV;
@property (nonatomic, strong) UILabel *tisiTitleLb;
@property (nonatomic, strong) UILabel *tisiLb11;
@property (nonatomic, strong) UILabel *tisiLb22;
@property (nonatomic, strong) UIButton *tisiButton;
@property (nonatomic, strong) UIView *tisiLineV11;
@property (nonatomic, strong) UIView *tisiLineV22;

@property (nonatomic, strong) UIImageView *jinggaoImgV;


//////
@property (nonatomic, strong) UIImageView *hhhbgImmgV;
@property (nonatomic, strong) UIImageView *hhhImmgV;
@property (nonatomic, strong) UIImageView *hhhImmgV11;
@property (nonatomic, strong) UIImageView *hhhImmgV22;
@property (nonatomic, strong) UIImageView *knowImgV;


@property (nonatomic, copy)   NSString *ringgName;


@end

@implementation ZMClockViewController


+ (ZMClockViewController *)sharedZMClockViewController
{
    static ZMClockViewController *defautVC = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        defautVC = [[self alloc] init];
    });
    
    return defautVC;
    
}


- (void)dealloc
{

    NSLog(@"______________闹钟列表 __________________dealloc");

}




- (void)dismissBtnnClicked
{

    [self.navigationController popToRootViewControllerAnimated:YES];

}




- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [NSUserDefaults standardUserDefaults].clockTiShiiStt = @"xdgs";//换闹钟爱豆


}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //self.baseNavigation.hidden = YES;
    
    
    
    //[self.allArray setArray:[[SQLiteDBManage sharedInstance] selectClockRingTable]];
    //[self.clockTableView reloadData];
    //[self.TabBarButtonView TabBarViewHidden:0];
    
    
    
    
///---------------------------------------------------
///---------------------------------------------------
    
    
    self.clockArray = [ZMClockAddcModel findAll];
    
    NSLog(@"闹钟个数_____________%ld______",self.clockArray.count);
    
    if (self.clockArray.count == 0) {
        
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
    
    
    
/////刷新
    [self.clockTableView reloadData];
    
    
    

//滚动到最后一行
    if (self.clockArray.count > 3) {
        //
        //[self.clockTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(self.clockArray.count - 1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        

    }
    
    
    NSDate *noww = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
    
    NSDateComponents *dd = [cal components:unitFlags fromDate:noww];
    
    //NSInteger y = [dd year];
    NSInteger m = [dd month];
    NSInteger d = [dd day];
    
    //NSInteger w = [dd weekday];
    NSString *week = [self weekdayStringFromDate:noww];
    
    NSInteger hour = [dd hour];
    NSInteger min = [dd minute];
    //NSInteger sec = [dd second];
    

    self.topTimeLb.text = [NSString stringWithFormat:@"%ld月%ld日 %@ %ld:%ld", m, d, week, hour, min];
    
    
    
    
    
///-----------------------------------------
    
    
    NSString *imgStr = [NSUserDefaults standardUserDefaults].clockListHeadPoritStr;
    
    if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
        
        self.topImgVV.backgroundColor = [UIColor orangeColor];
        
    }else {
        
        //NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        //UIImage *userImg = [UIImage imageWithData:decodeImgData];
        
        //self.topImgVV.image = userImg;
        
        [self.topImgVV sd_setImageWithURL:[NSURL URLWithString:imgStr]];
        
    }

    
    

    
    
    
///---------------------------------------------
    
    /////////更换图片提示
    self.hhhbgImmgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0 , kScreen_Width, kScreen_Height)];
    self.hhhbgImmgV.backgroundColor = [UIColor clearColor];
    self.hhhbgImmgV.image = IMAGE(@"40X40遮罩zz");
    self.hhhbgImmgV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.hhhbgImmgV];

    self.hhhbgImmgV.hidden = YES;
    
///////////////
    self.hhhImmgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - (kScreen_Width/4) , 70 + 64, kScreen_Width/2, kScreen_Width/2)];
    self.hhhImmgV.backgroundColor = [UIColor clearColor];

    
    [self.hhhImmgV sd_setImageWithURL:[NSURL URLWithString:imgStr]];

    
    self.hhhImmgV.userInteractionEnabled = YES;
    self.hhhImmgV.layer.cornerRadius = kScreen_Width/4;
    self.hhhImmgV.layer.borderWidth = 4.0f;
    self.hhhImmgV.layer.borderColor = MAIN_MAIN_APP_COLOR.CGColor;
    self.hhhImmgV.layer.masksToBounds = YES;
    [self.hhhbgImmgV addSubview:self.hhhImmgV];
    
    UITapGestureRecognizer *tappp22 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hhhImmgV22Taped)];
    
    [self.hhhImmgV addGestureRecognizer:tappp22];
    

    
    
    
 //////
    self.hhhImmgV11 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 70 + kScreen_Width/2, 80, 100)];
    self.hhhImmgV11.backgroundColor = [UIColor clearColor];
    self.hhhImmgV11.image = IMAGE(@"点击cloll");
    self.hhhImmgV11.userInteractionEnabled = YES;
    
    [self.hhhbgImmgV addSubview:self.hhhImmgV11];
    
    //self.hhhImmgV11.transform=CGAffineTransformMakeRotation(- M_PI*0.25);
    
    
///////
    self.knowImgV = [[UIImageView alloc] initWithFrame:CGRectMake(40, 200 + kScreen_Width/2 , kScreen_Width - 80, 60)];
//    self.knowLbb.numberOfLines = 0;
//    self.knowLbb.text = @"点击爱豆形象可以更换\n叫你起床的爱豆哦~";
//    self.knowLbb.textAlignment = NSTextAlignmentCenter;
//    self.knowLbb.textColor = [UIColor whiteColor];
//    self.knowLbb.font = [UIFont systemFontOfSize:20];
    
    self.knowImgV.image = IMAGE(@"提示语clookc");
    
    [self.hhhbgImmgV addSubview:self.knowImgV];
    
    
/////////
    self.hhhImmgV22 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 70, 70 + 64 + kScreen_Width/2 + 180, 140, 60)];
    self.hhhImmgV22.backgroundColor = [UIColor clearColor];
    self.hhhImmgV22.image = IMAGE(@"我知道了按钮-正常");
    self.hhhImmgV22.userInteractionEnabled = YES;
    //self.hhhImmgV22.layer.cornerRadius = 25;
    //self.hhhImmgV22.layer.masksToBounds = YES;
    
    [self.hhhbgImmgV addSubview:self.hhhImmgV22];
    

    UITapGestureRecognizer *tappp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hhhImmgV22Taped)];
    
    [self.hhhImmgV22 addGestureRecognizer:tappp];
    
    
    if ([[NSUserDefaults standardUserDefaults].clockTiShiiStt isEqualToString:@"一次"]) {
        //
        self.hhhbgImmgV.hidden = NO;
    }
    
    
    
    
    
}


- (void)hhhImmgV22Taped
{

    self.hhhbgImmgV.hidden = YES;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = BG_COLOR;
    
    
    
#pragma mark --------------------------- APP 在前台 收到通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clockIsRingPlaceCloseClock) name:@"ZMCLOCKISRING_STATE_ACTIVE" object:nil];
    
    
#pragma mark --------------------------- APP 在后台 收到通知
    
#pragma mark ---------------------------弹出闹钟开始页通知
    ////////没被杀死的时候
 //   (不是 appdelegate 发出的)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeBackgroundClockee) name:@"APP_RECEIVEED_CLOCKNOTIFY_BACKGROUND" object:nil];
    
    
    
#pragma mark --------------------- APP 在后台 响铃通知
    //没被杀死的时候
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerMusiccOnBackgrounud) name:@"PLAYMUSIC_ON_BACKGROUND" object:nil];
    
    
    
#pragma mark --------------------------- 起床按钮点击了
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getupBtnIsClickedted) name:@"GetUpBtn_Is_CLICKED" object:nil];
    
    
    
    
    
#pragma mark ------------------------------ 闹钟数据
    
    self.clockArray = [ZMClockAddcModel findAll];
    
    
    [self setupClockUI];
    
   
    
    
    
    
}







- (NSString *)weekdayStringFromDate:(NSDate *)inputDate
{

    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];

    [calendar setTimeZone: timeZone];

    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;

    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];

    return [weekdays objectAtIndex:theComponents.weekday];

}



#pragma mark --------------------------------- UI
- (void)setupClockUI
{
    
    self.clockListBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64)];
    self.clockListBgImgV.userInteractionEnabled = YES;
    self.clockListBgImgV.image = IMAGE(@"点歌-底图");
    
    [self.view addSubview:self.clockListBgImgV];
    


    self.talbleHeaderV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/2 - 64)];
    self.talbleHeaderV.backgroundColor = [UIColor clearColor];
 
    
//----------------------------------------------------
    
//----------------------------------------------------
    //////
    self.topTimeLb = [[UILabel alloc] initWithFrame:CGRectMake(0 - 20, 15, kScreen_Width, 44)];
    self.topTimeLb.backgroundColor = [UIColor clearColor];
    self.topTimeLb.textColor = [UIColor whiteColor];
    self.topTimeLb.font = [UIFont systemFontOfSize:20];
    //self.topTimeLb.text = @"10月22日 周六 10:30";
    
    self.topTimeLb.textAlignment = NSTextAlignmentCenter;
    
    [self.talbleHeaderV addSubview:self.topTimeLb];
    //////
    self.topImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - (kScreen_Width/4) - 20, 70, kScreen_Width/2, kScreen_Width/2)];
    self.topImgVV.backgroundColor = [UIColor whiteColor];
    
    self.topImgVV.layer.cornerRadius = kScreen_Width/4;
    self.topImgVV.layer.borderWidth = 4.0f;
    self.topImgVV.layer.borderColor = MAIN_MAIN_APP_COLOR.CGColor;
    self.topImgVV.layer.masksToBounds = YES;
    self.topImgVV.userInteractionEnabled = YES;
    
    [self.talbleHeaderV addSubview:self.topImgVV];

    
    
    
    
    
    UITapGestureRecognizer *tapp =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topImgVVISClickeed)];
    [self.topImgVV addGestureRecognizer:tapp];
    
//----------------------------------------------------
    
    
    [self.clockListBgImgV addSubview:self.clockTableView];
    
    self.clockTableView.tableHeaderView = self.talbleHeaderV;
    
//----------------------------------------------------
    
    
    [self.view addSubview:self.addClockBtn];
    
    
    UIImageView *clockAdd = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 20, 20)];
    clockAdd.backgroundColor = [UIColor whiteColor];
    clockAdd.image = IMAGE(@"clockadd");
    
    [self.addClockBtn addSubview:clockAdd];
    
    
    
    [self.view addSubview:self.inportantTishiBtn];
    
    
    [self addInportantTishiPage];
    
    
}


#pragma mark ----------------------------------UI

- (void)addInportantTishiPage
{
    self.tisiBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0 , kScreen_Width, kScreen_Height)];
    self.tisiBgImgV.backgroundColor = [UIColor clearColor];
    self.tisiBgImgV.image = IMAGE(@"40X40遮罩zz");
    self.tisiBgImgV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.tisiBgImgV];
    self.tisiBgImgV.hidden = YES;
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.tisBgV = [[UIView alloc] initWithFrame:CGRectMake(50, kScreen_Height/4, kScreen_Width - 100, kScreen_Height/2)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.tisBgV = [[UIView alloc] initWithFrame:CGRectMake(40, kScreen_Height/4 - 25, kScreen_Width - 80, kScreen_Height/2 + 50)];
        
    } else {
    
        self.tisBgV = [[UIView alloc] initWithFrame:CGRectMake(50, kScreen_Height/4, kScreen_Width - 100, kScreen_Height/2)];
    
    }

    
    
    self.tisBgV.backgroundColor = [UIColor whiteColor];
    //self.tisBgV.layer.cornerRadius = 10;
    //self.tisBgV.layer.masksToBounds = YES;
    [self.tisiBgImgV addSubview:self.tisBgV];
////////////
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.tisiTitleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, kScreen_Width - 100, 40)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.tisiTitleLb = [[UILabel alloc] initWithFrame:CGRectMake(13, 10, kScreen_Width - 100, 40)];
        
    } else  {
        self.tisiTitleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, kScreen_Width - 100, 40)];
    }

    
    
    self.tisiTitleLb.text = @"重要提示";
    self.tisiTitleLb.textAlignment = NSTextAlignmentCenter;
    self.tisiTitleLb.textColor = [UIColor blackColor];
    self.tisiTitleLb.font = [UIFont systemFontOfSize:20];
    
    [self.tisBgV addSubview:self.tisiTitleLb];
    
    
/////////////////
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.tisiLineV11 = [[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreen_Width - 80, 2)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.tisiLineV11 = [[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreen_Width - 80, 2)];
    } else {
    
        self.tisiLineV11 = [[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreen_Width - 100, 2)];
    }
    
    
    self.tisiLineV11.backgroundColor = [UIColor redColor];
    
    [self.tisBgV addSubview:self.tisiLineV11];
    
///////////
    self.tisiLb11 = [[UILabel alloc] initWithFrame:CGRectMake(20, 50 , kScreen_Width - 80 - 40, 80)];
    self.tisiLb11.numberOfLines = 0;
    self.tisiLb11.text = @"请不要从iOS系统后台清除星伴闹钟\n 否则下列情况出现时,将无法响铃";
    self.tisiLb11.textAlignment = NSTextAlignmentLeft;
    self.tisiLb11.textColor = [UIColor blackColor];
    self.tisiLb11.font = [UIFont systemFontOfSize:16];
    
    [self.tisBgV addSubview:self.tisiLb11];
    
    
    
//////////警告图
    
    if ([ZMSystemTool iPhone5Device]) {
        self.jinggaoImgV = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50 + 80 - 15, kScreen_Width - 100 - 60, 60)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.jinggaoImgV = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50 + 80 - 15, kScreen_Width - 100 - 60, 50)];
        
    } else  {
        
        self.jinggaoImgV = [[UIImageView alloc] initWithFrame:CGRectMake(30, 50 + 80 - 15, kScreen_Width - 100 - 60, 60)];
    }
    
    self.jinggaoImgV.backgroundColor = [UIColor clearColor];
    self.jinggaoImgV.image = IMAGE(@"clocktisi");
    //self.jinggaoImgV.userInteractionEnabled = YES;
    
    [self.tisBgV addSubview:self.jinggaoImgV];
    
///////////
    
    
    

    
///////////
    self.tisiLb22 = [[UILabel alloc] initWithFrame:CGRectMake(20, 50 + 80 + 50, kScreen_Width - 80 - 40, 120)];
    self.tisiLb22.numberOfLines = 0;
    self.tisiLb22.text = @"1.手机静音或关机;\n2.插着耳机;\n3.在勿扰模式状态中并锁屏;\n(详见:设置>通知>勿扰模式>说明)\n4.通知中心未开启闹钟通知.";
    self.tisiLb22.textAlignment = NSTextAlignmentLeft;
    self.tisiLb22.textColor = [UIColor blackColor];
    self.tisiLb22.font = [UIFont systemFontOfSize:16];
    
    [self.tisBgV addSubview:self.tisiLb22];
    
/////////////
    if ([ZMSystemTool iPhone5Device]) {
        self.tisiLineV22 = [[UIView alloc] initWithFrame:CGRectMake(0, self.tisBgV.frame.size.height - 54, kScreen_Width - 80, 1)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.tisiLineV22 = [[UIView alloc] initWithFrame:CGRectMake(0, self.tisBgV.frame.size.height - 54, kScreen_Width - 80, 1)];
    } else  {
        
        self.tisiLineV22 = [[UIView alloc] initWithFrame:CGRectMake(0, self.tisBgV.frame.size.height - 54, kScreen_Width - 100, 1)];
    }
    
    
    self.tisiLineV22.backgroundColor = [UIColor lightGrayColor];
    
    [self.tisBgV addSubview:self.tisiLineV22];
    
    
/////////////
    self.tisiButton = [[UIButton alloc] initWithFrame:CGRectMake(self.tisBgV.frame.size.width/2 - 50, self.tisBgV.frame.size.height - 54 + 5, 100, 40)];
    [self.tisiButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.tisiButton setTitle:@"我知道了" forState:UIControlStateNormal];
    self.tisiButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.tisiButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.tisiButton addTarget:self action:@selector(tisiButtontnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tisBgV addSubview:self.tisiButton];
    

    
    
    
}

#pragma mark -----------------------------重要提示按钮
- (void)tisiButtontnClicked
{
    
    self.tisiBgImgV.hidden = YES;


}



- (UITableView *)clockTableView
{
    
    if (!_clockTableView) {
        //_clockTableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 64, kScreen_Width - 40, kScreen_Height - 64) ];
        _clockTableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, kScreen_Width - 40, kScreen_Height - 64 - 100) style:UITableViewStyleGrouped];
        _clockTableView.backgroundColor = [UIColor clearColor];
        _clockTableView.dataSource = self;
        _clockTableView.delegate = self;
        _clockTableView.showsVerticalScrollIndicator = NO;
        
        //_boySpeakerTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _clockTableView.tableFooterView = [UIView new];
    }
    
    return _clockTableView;
}




- (UIButton *)addClockBtn
{
    if (_addClockBtn == nil)
    {
        _addClockBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/2 - 40, kScreen_Height - 100 + 10, 80, 80)];
        [_addClockBtn setBackgroundColor:[UIColor whiteColor]];
        _addClockBtn.layer.cornerRadius = 40;
        _addClockBtn.layer.masksToBounds = YES;
        //[_addClockBtn setTitle:@"添加" forState: UIControlStateNormal];
        
        
        //[_addClockBtn setImage:[UIImage imageNamed:@"DIY闹钟"] forState:UIControlStateNormal];
        [_addClockBtn addTarget:self action:@selector(addClockBtnnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addClockBtn;
}

//////////
- (UIButton *)inportantTishiBtn
{
    if (_inportantTishiBtn == nil)
    {
        _inportantTishiBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width - 80, kScreen_Height - 80, 60, 60)];
        _inportantTishiBtn.layer.cornerRadius = 30;
        _inportantTishiBtn.layer.masksToBounds = YES;
        [_inportantTishiBtn setBackgroundColor: MAIN_MAIN_APP_COLOR];
        [_inportantTishiBtn setTitle:@"重要提示" forState: UIControlStateNormal];
        [_inportantTishiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _inportantTishiBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_inportantTishiBtn addTarget:self action:@selector(inportantTishiBtnClcked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _inportantTishiBtn;
}





#pragma mark ------------------------------TableView 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.clockArray.count;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
    sectionHeadBackgroundView.backgroundColor = [UIColor clearColor];
    return sectionHeadBackgroundView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
    sectionHeadBackgroundView.backgroundColor = [UIColor clearColor];
    return sectionHeadBackgroundView;

}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}


//--------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.clockArray.count;
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellidd = @"clockkk";
    
    ZMNewwClockkFirstpageTableViewCell *cell= [self.clockTableView dequeueReusableCellWithIdentifier:cellidd];
    
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewwClockkFirstpageTableViewCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor whiteColor];
    
    
    
    //self.clockModel = [self.clockArray objectAtIndex:indexPath.row];
    self.clockModel = [self.clockArray objectAtIndex:indexPath.section];
    
//////////////
    cell.timeLb.text = self.clockModel.clockFireDateStr;
    cell.timeLb.textColor = MAIN_MAIN_APP_COLOR;
    
//////////////留言
    cell.remarkLb.textColor = MAIN_MAIN_APP_COLOR;
    
    if ([self isBlankString:self.clockModel.clockRepeat11] == NO || [self isBlankString:self.clockModel.clockRepeat22] == NO || [self isBlankString:self.clockModel.clockRepeat33] == NO || [self isBlankString:self.clockModel.clockRepeat44] == NO || [self isBlankString:self.clockModel.clockRepeat55] == NO || [self isBlankString:self.clockModel.clockRepeat66] == NO || [self isBlankString:self.clockModel.clockRepeat77] == NO) {
       
        //NSString *remarkStrr = [NSString stringWithFormat:@"%@ / %@",self.clockModel.clockRemarkStr,self.clockModel.clockRepeatType];
        
        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",self.clockModel.clockRepeat11]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",self.clockModel.clockRepeat22]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat33] == NO) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",self.clockModel.clockRepeat33]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat44] == NO) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",self.clockModel.clockRepeat44]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat55] == NO) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",self.clockModel.clockRepeat55]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat66] == NO) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",self.clockModel.clockRepeat66]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat77] == NO) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",self.clockModel.clockRepeat77]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat22] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat11,self.clockModel.clockRepeat22]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat11,self.clockModel.clockRepeat33]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat11,self.clockModel.clockRepeat44]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat11,self.clockModel.clockRepeat55]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat11,self.clockModel.clockRepeat66]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat11,self.clockModel.clockRepeat77]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat22,self.clockModel.clockRepeat33]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat22,self.clockModel.clockRepeat44]];
//            
//        }
//
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat22,self.clockModel.clockRepeat55]];
//            
//        }
//
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat22,self.clockModel.clockRepeat66]];
//            
//        }
//
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat22,self.clockModel.clockRepeat77]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat33,self.clockModel.clockRepeat44]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat33,self.clockModel.clockRepeat55]];
//            
//        }
//
//        if ([self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat33,self.clockModel.clockRepeat66]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat33,self.clockModel.clockRepeat77]];
//            
//        }
//        
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat44,self.clockModel.clockRepeat55]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat44,self.clockModel.clockRepeat66]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat44,self.clockModel.clockRepeat77]];
//            
//        }
//        
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat55] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat55,self.clockModel.clockRepeat66]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat55] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@",self.clockModel.clockRepeat55,self.clockModel.clockRepeat77]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat66] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",@"周末"]];
//            
//        }
//        
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@",@"工作日"]];
//            
//        }
//        
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat22, self.clockModel.clockRepeat33]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat22, self.clockModel.clockRepeat44]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat22, self.clockModel.clockRepeat55]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat22, self.clockModel.clockRepeat66]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat22, self.clockModel.clockRepeat77]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat33, self.clockModel.clockRepeat44]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat33, self.clockModel.clockRepeat55]];
//            
//        }
//        
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat33, self.clockModel.clockRepeat66]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat33, self.clockModel.clockRepeat77]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat44, self.clockModel.clockRepeat55]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat44, self.clockModel.clockRepeat66]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat11] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat11, self.clockModel.clockRepeat44, self.clockModel.clockRepeat77]];
//            
//        }
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat22, self.clockModel.clockRepeat33, self.clockModel.clockRepeat44]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat22, self.clockModel.clockRepeat33, self.clockModel.clockRepeat55]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat22, self.clockModel.clockRepeat33, self.clockModel.clockRepeat66]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat22] == NO && [self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat22, self.clockModel.clockRepeat33, self.clockModel.clockRepeat77]];
//            
//        }
//        
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat33, self.clockModel.clockRepeat44, self.clockModel.clockRepeat55]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat33, self.clockModel.clockRepeat44, self.clockModel.clockRepeat66]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat33] == NO && [self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat33, self.clockModel.clockRepeat44, self.clockModel.clockRepeat77]];
//            
//        }
//        
//        
//        
//        if ([self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat44, self.clockModel.clockRepeat55, self.clockModel.clockRepeat66]];
//            
//        }
//        
//        if ([self isBlankString:self.clockModel.clockRepeat44] == NO && [self isBlankString:self.clockModel.clockRepeat55] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat44, self.clockModel.clockRepeat55, self.clockModel.clockRepeat77]];
//            
//        }
//
//        if ([self isBlankString:self.clockModel.clockRepeat55] == NO && [self isBlankString:self.clockModel.clockRepeat66] == NO && [self isBlankString:self.clockModel.clockRepeat77] == NO ) {
//            //
//            
//            cell.remarkLb.text = [remarkStrr stringByAppendingString:[NSString stringWithFormat:@" %@ %@ %@",self.clockModel.clockRepeat55, self.clockModel.clockRepeat66, self.clockModel.clockRepeat77]];
//            
//        }
//
//        
        
        
    } else {
    
        //空字符串
        
        NSString *remarkStrr = [NSString stringWithFormat:@"%@ / %@",self.clockModel.clockRemarkStr,self.clockModel.clockRepeatType];
        
        cell.remarkLb.text = remarkStrr;
    }
    
    
    
    
    
    
    
    
    
    
    
    //NSLog(@"留言___%@",self.clockModel.clockRemarkStr);
    
    
    
//////////////
    cell.onOffSwitch.tintColor = [UIColor whiteColor];
    cell.onOffSwitch.onTintColor = MAIN_MAIN_APP_COLOR;
    cell.onOffSwitch.transform = CGAffineTransformMakeScale(1.2,1.2);
    
    [cell.onOffSwitch addTarget:self action:@selector(onOffSwitchClicked:) forControlEvents:UIControlEventValueChanged];
    
    //cell.onOffSwitch.tag = indexPath.row;
    cell.onOffSwitch.tag = indexPath.section;
    
    cell.onOffSwitch.on = self.clockModel.clockSwitchOn;
    
    
///////////改变 cell 背景色
    if (self.clockModel.clockSwitchOn) {
        cell.backgroundColor = [UIColor whiteColor];
        cell.timeLb.textColor = MAIN_MAIN_APP_COLOR;
        cell.remarkLb.textColor = MAIN_MAIN_APP_COLOR;
        
    } else {
    
        cell.backgroundColor = CELL_SWITCH_OFF_COLOR;
        cell.timeLb.textColor = [UIColor whiteColor];
        cell.remarkLb.textColor = [UIColor whiteColor];
    }
    
    
    return cell;
    
}



#pragma mark -----------------------点击 TableView cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZMEdittClockEditViewController *edit = [[ZMEdittClockEditViewController alloc] init];
    
    edit.titleeLb.text = @"编辑闹钟";
    
    edit.clockIndex = indexPath.section;//传值
    
    
    [self.navigationController pushViewController:edit animated:YES];
    
    
    
}



#pragma mark ----------------------------判断非空字符串
- (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
}





#pragma mark ---------------------------------闹钟开关

- (void)onOffSwitchClicked:(UISwitch *)switchhh
{
    
    /*
     首先获得Cell：button的父视图是contentView，再上一层才是UITableViewCell
     UITableViewCell *cell = (UITableViewCell *)sender.superview.superview; 	
     //然后使用indexPathForCell方法，就得到indexPath了
     NSIndexPath *indexPath = [_tableView indexPathForCell:cell]
     
     */
    
    //NSIndexPath *pathh = [NSIndexPath indexPathForRow:0 inSection:switchhh.tag];
    
    //ZMNewwClockkFirstpageTableViewCell *customCell = (ZMNewwClockkFirstpageTableViewCell *)[self.clockTableView cellForRowAtIndexPath:pathh];//自定义 cell
    
    //ZMNewwClockkFirstpageTableViewCell *customCell = (ZMNewwClockkFirstpageTableViewCell *)switchhh.superview.superview.superview;//自定义 cell
    
    
    self.clockModel = [self.clockArray objectAtIndex:switchhh.tag];
    
    self.clockIndex = switchhh.tag;
    
    
    if(switchhh.on){
        
        self.clockModel.clockSwitchOn = YES;
        
        NSLog(@"开了____%@",self.clockModel.clockRemarkStr);
        
        
        //更新数据库
        [self.clockModel update];
        
        
        
        //添加
        [self addLocalNotifyCloccckk];
        
        //更改 cell 背景色
        //customCell.backgroundColor = MAIN_MAIN_APP_COLOR;
        

        
        
        /////刷新界面
        [self.clockTableView reloadData];
        
        
    } else {
        
        
        self.clockModel.clockSwitchOn = NO;
        
        NSLog(@"关了____%@",self.clockModel.clockFireDateStr);
        
        
        //更新数据库
        [self.clockModel update];

        
        
        //关闭
        [self cancelLocalNotificationWithKey:self.clockModel.clockFireDateStr];
        
        
        //更改 cell 背景色
        //customCell.backgroundColor = CELL_SWITCH_OFF_COLOR;
        //customCell.timeLb.textColor = [UIColor whiteColor];
        
        
        /////刷新界面
        [self.clockTableView reloadData];
    }
    
    

    
}






#pragma mark --------------------------------添加按钮
- (void)addClockBtnnAction:(UIButton *)btn
{
    
    ZMAddClockViewController *addClock = [[ZMAddClockViewController alloc] init];
    addClock.titleeLb.text = @"新增闹钟";
    
    [self.navigationController pushViewController:addClock animated:YES];

}

#pragma mark --------------------------------重要提示
- (void)inportantTishiBtnClcked
{


    self.tisiBgImgV.hidden = NO;


}



#pragma mark --------------------------------添加闹钟⏰
- (void)addLocalNotifyCloccckk
{
    NSInteger tagg = self.clockIndex;
    
    self.clockModel = [self.clockArray objectAtIndex:tagg];
    NSInteger hourr = self.clockModel.clockFireHour;
    NSInteger minutee = self.clockModel.clockFireMinute;
    NSString *clockKeyy = self.clockModel.clockFireDateStr;
    
    //重复
    NSString *repeatStt = self.clockModel.clockRepeatType;
    
    if ([repeatStt isEqualToString:@"仅一次"]) {
        //
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hourr withMinute:minutee withTitle:@"星伴闹钟叫你起床了~~" withSoundName:@"清新鸟鸣声.mp3" withNotifyRepeatInterval:0 withClockKey:clockKeyy];
        
    }
    
    
    if ([repeatStt isEqualToString:@"每天"]) {
        //
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hourr withMinute:minutee withTitle:@"星伴闹钟叫你起床了~~" withSoundName:@"清新鸟鸣声.mp3" withNotifyRepeatInterval:NSCalendarUnitDay withClockKey:clockKeyy];
    }
    
    
    
    
    
    
    
    
}



#pragma mark -------------------------------取消闹钟⏰

- (void)cancelLocalNotificationWithKey:(NSString *)key
{
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    
    for (UILocalNotification *obj in localNotifications) {
        
        
        if ([obj.userInfo.allKeys containsObject:key]) {
            
            
            
            [[UIApplication sharedApplication] cancelLocalNotification:obj];
        }
    }


}



#pragma mark ---------------- 在前台 ----------收到闹钟通知

- (void)clockIsRingPlaceCloseClock
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"星伴提醒" message:@"闹铃响了~~" delegate: self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];

    [alert show];


///------------------------------------------------
    
    [self clockRingIsPlaying];//音乐
    
    
    
///------------------------------------------------
    
    //取消的闹钟
    NSString *clockKey = [NSUserDefaults standardUserDefaults].clock_Key;
    
    for (NSInteger i = 0; i < self.clockArray.count; i ++) {
        //
        self.clockModel = [self.clockArray objectAtIndex:i];
        
        NSString *key = self.clockModel.clockFireDateStr;
        
        
        //NSLog(@"__________key_______%@",key);
        
        
        if ([key isEqualToString:clockKey]) {
            
            //NSLog(@"取消的闹钟是______第%d列",i);
            
            self.cancelClockIndex = i;
            
        }
        
    }

    

}


#pragma mark -------- 在后台 -----没被杀死-----收到闹钟通知

- (void)closeBackgroundClockee
{
    ZMClockStartPageeViewController *clockStart = [[ZMClockStartPageeViewController alloc] init];
    
   

    [self.navigationController pushViewController:clockStart animated:NO];
    
//    [self presentViewController:clockStart animated:NO completion:^{
//        //
//    }];
    
    

}



#pragma mark ---------------------------后台 通知 播放音乐
- (void)playerMusiccOnBackgrounud
{
    

    [self clockRingIsPlaying];

}




#pragma mark ------------------------------- 响铃 🔔 音乐
- (void)clockRingIsPlaying
{
   
    
    if (self.audioplayer == nil) {
        
        NSLog(@"音乐播放器播放失败");
        
    }else {
        
        [self.audioplayer play];
    }
    

}


#pragma mark -------------------------------- 起床按钮
- (void)getupBtnIsClickedted
{
    //音乐停止
    //[self.audioplayer stop];
    //self.audioplayer = nil;
    
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"GetUpBtn_Is_CLICKED_STOPPMUSICC" object:nil];
    
    
    
}



#pragma mark ----------------------------------AlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        //
        //取消闹钟
        NSString *clockKey = [NSUserDefaults standardUserDefaults].clock_Key;
        
        [self cancelLocalNotificationWithKey:clockKey];
        
        
        NSLog(@"取消的闹钟Key_____%@",clockKey);

        
        
        //改变 switch 按钮
        NSInteger tagg = self.cancelClockIndex;
        
        self.clockModel = [self.clockArray objectAtIndex:tagg];
        
        self.clockModel.clockSwitchOn = NO;
        
        //更新数据库
        [self.clockModel update];

        
        /////刷新界面
        [self.clockTableView reloadData];
        
        
        //音乐停止
        [self.audioplayer stop];
        self.audioplayer = nil;

    }

    
}


#pragma mark ---------------------------------选男神 女神
- (void)topImgVVISClickeed
{
     
     ZMCLockChooseLoveDouViewController22 *chooseLove = [[ZMCLockChooseLoveDouViewController22 alloc] init];

     chooseLove.titleeLb.text = @"选择爱豆叫你起床";

     [self.navigationController pushViewController:chooseLove animated:YES];

    

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}





@end
