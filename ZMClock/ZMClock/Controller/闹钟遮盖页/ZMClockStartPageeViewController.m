//
//  ZMClockStartPageeViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/11/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMClockStartPageeViewController.h"


#import "LocalNotificationManager.h"
#import "ZMBaseNavigationController.h"
#import "ZMMainViewController.h"
#import "ZMClockViewController.h"


@interface ZMClockStartPageeViewController ()

@property (nonatomic, strong) UIImageView *bggImgV;

@property (nonatomic, copy) NSString *dateString;

@property (nonatomic, strong) UIImageView *topImgV;
@property (nonatomic, strong) UILabel *clockTimeLb;
@property (nonatomic, strong) UIButton *getupBtn;//起床
@property (nonatomic, strong) UIButton *smallSleepBtn;//小睡



@property (nonatomic, strong) UIView *timeBgV;
@property (nonatomic, strong) UILabel *timeLbb;//时间
//@property (nonatomic, strong) UILabel *getupLb;//起床
//@property (nonatomic, strong) UILabel *smallSleepLb;



@property (nonatomic, strong) UIImageView *getupAnimationImgV;
@property (nonatomic, strong) UIImageView *smallSleepAnimationImgV;


@end

@implementation ZMClockStartPageeViewController




+ (ZMClockStartPageeViewController *)sharedZMClockStartPageeViewController
{
    static ZMClockStartPageeViewController *defautVC = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        defautVC = [[self alloc] init];
    });
    
    return defautVC;

}


- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    
    
    
    NSString *imgStr = [NSUserDefaults standardUserDefaults].clockListHeadPoritStr;
    
    if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
        
        ///self.topImgVV.backgroundColor = [UIColor orangeColor];
        
    }else {
        
        //NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        //UIImage *userImg = [UIImage imageWithData:decodeImgData];
        
        //self.topImgV.image = userImg;
        
        [self.topImgV sd_setImageWithURL:[NSURL URLWithString:imgStr]];
        
    }
    
    
    
    
    
    
    
    
    
    [self startGetupImgAnimationing];

    [self startSmallSleepImgAnimationing];
    


}




- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    self.baseNavigation.hidden = YES;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
///////////
    self.bggImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    self.bggImgV.backgroundColor = RGB(241, 236, 237);
    //self.bggImgV.image = IMAGE(@"clock背景图片");
    self.bggImgV.userInteractionEnabled = YES;

    [self.view addSubview:self.bggImgV];
    
    
    
//////////
    self.topImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/2 + 60)];
    self.topImgV.backgroundColor = [UIColor whiteColor];
    //self.topImgV.image = IMAGE(@"头像框help");
    //self.topImgV.layer.cornerRadius = 40;
    //self.topImgV.layer.masksToBounds = YES;
    
    //self.topImgV.userInteractionEnabled = YES;
    
    
    NSString *imgStr = [NSUserDefaults standardUserDefaults].clockListHeadPoritStr;
    
    if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
        
        ///self.topImgVV.backgroundColor = [UIColor orangeColor];
        
    }else {
        
        NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *userImg = [UIImage imageWithData:decodeImgData];
        
        self.topImgV.image = userImg;
        
    }
    
    
    [self.bggImgV addSubview:self.topImgV];
    
///////
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    self.dateString = [dateFormatter stringFromDate:currentDate];
    
    
    
    
    
    
//////时间背景
    self.timeBgV = [[UIView alloc] initWithFrame:CGRectMake(0, kScreen_Height/2 + 60 - 30, kScreen_Width, 100)];
    
    self.timeBgV.backgroundColor = RGB(236, 128, 172);
    
    [self.bggImgV addSubview:self.timeBgV];
    
    
    
    
    
    self.timeLbb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 100)];
    //self.timeLbb.numberOfLines = 0;
    self.timeLbb.text = self.dateString;
    self.timeLbb.textAlignment = NSTextAlignmentCenter;
    self.timeLbb.textColor = [UIColor whiteColor];
    //self.timeLbb.font = [UIFont systemFontOfSize:50];
    [self.timeLbb setFont:[UIFont fontWithName:@"Helvetica-Bold" size:80]];
    
    [self.timeBgV addSubview:self.timeLbb];
    

    
    
///////动画图片
    self.getupAnimationImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/4 - 60, (kScreen_Height/4 * 3) - 10 - 30, 120, 120)];
    self.getupAnimationImgV.backgroundColor = [UIColor clearColor];

    
    [self.bggImgV addSubview:self.getupAnimationImgV];

    
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        self.smallSleepAnimationImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 50, (kScreen_Height/4 * 3) - 0 - 30, 110, 110)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.smallSleepAnimationImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 40, (kScreen_Height/4 * 3) - 0 - 30, 105, 105)];
        
    } else  {
        
        self.smallSleepAnimationImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 50, (kScreen_Height/4 * 3) - 0 - 30, 110, 110)];
    }
    
    self.smallSleepAnimationImgV.backgroundColor = [UIColor clearColor];
    
    
    [self.bggImgV addSubview:self.smallSleepAnimationImgV];
    


    
/////
    if ([ZMSystemTool iPhone5Device]) {
        self.getupBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, (kScreen_Height/4 * 3) + 50 + 50, kScreen_Width/2 - 40, 65)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.getupBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, (kScreen_Height/4 * 3) + 50 + 50 - 10, kScreen_Width/2 - 40, 65)];
        
    } else  {
        
        self.getupBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, (kScreen_Height/4 * 3) + 50 + 50, kScreen_Width/2 - 40, 65)];
    }
    
    
    self.getupBtn.backgroundColor = [UIColor clearColor];
    //self.getupBtn.layer.cornerRadius = 50;
    //self.getupBtn.layer.masksToBounds = YES;
    
    [self.getupBtn setBackgroundImage:IMAGE(@"起床按钮-正常") forState:UIControlStateNormal];
    [self.getupBtn setBackgroundImage:IMAGE(@"起床按钮-点击") forState:UIControlStateHighlighted];
    
    
    [self.getupBtn addTarget:self action:@selector(getupBtneClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bggImgV addSubview:self.getupBtn];
    
/////

    if ([ZMSystemTool iPhone5Device]) {
        self.smallSleepBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 20, (kScreen_Height/4 * 3) + 50 + 50, kScreen_Width/2 - 40, 65)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.smallSleepBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 20, (kScreen_Height/4 * 3) + 50 + 50 - 10, kScreen_Width/2 - 40, 65)];
        
    } else  {
        
        self.smallSleepBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 20, (kScreen_Height/4 * 3) + 50 + 50, kScreen_Width/2 - 40, 65)];
    }
    
    
    self.smallSleepBtn.backgroundColor = [UIColor clearColor];
    //self.smallSleepBtn.layer.cornerRadius = 50;
    //self.smallSleepBtn.layer.masksToBounds = YES;
    
    [self.smallSleepBtn setBackgroundImage:IMAGE(@"小睡一会儿按钮-正常") forState:UIControlStateNormal];
    [self.smallSleepBtn setBackgroundImage:IMAGE(@"小睡一会儿按钮-点击") forState:UIControlStateHighlighted];
    
    
    
    [self.smallSleepBtn addTarget:self action:@selector(smallSleepBtneClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bggImgV addSubview:self.smallSleepBtn];
    
    
    

/////////
    
//    self.getupLb = [[UILabel alloc] initWithFrame:CGRectMake(0, (kScreen_Height/4 * 3) + 50 + 50, kScreen_Width/2, 50)];
//    //self.timeLbb.numberOfLines = 0;
//    self.getupLb.text = @"我要起床";
//    self.getupLb.textAlignment = NSTextAlignmentCenter;
//    self.getupLb.textColor = [UIColor whiteColor];
//    self.getupLb.font = [UIFont systemFontOfSize:20];
//    
//    [self.bggImgV addSubview:self.getupLb];
//
//    
//////////////
//    self.smallSleepLb = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2, (kScreen_Height/4 * 3) + 50 + 50, kScreen_Width/2, 50)];
//    //self.timeLbb.numberOfLines = 0;
//    self.smallSleepLb.text = @"小睡一会";
//    self.smallSleepLb.textAlignment = NSTextAlignmentCenter;
//    self.smallSleepLb.textColor = [UIColor whiteColor];
//    self.smallSleepLb.font = [UIFont systemFontOfSize:20];
//    
//    [self.bggImgV addSubview:self.smallSleepLb];

    
}




#pragma mark ------------------------------起床 按钮
- (void)getupBtneClicked
{

    //[[NSNotificationCenter defaultCenter] postNotificationName:@"GetUpBtn_Is_CLICKED" object:self];//关闭铃声
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GetUpBtn_Is_CLICKED_STOPPMUSICC" object:nil];
    
    
    [self.navigationController popViewControllerAnimated:NO];
    
//    [self dismissViewControllerAnimated:NO completion:^{
//        //
//    }];
    
    
    
    
    
    
    
//    
    //ZMClockViewController *clock = [ZMClockViewController sharedZMClockViewController];
    
    //[kWindow setRootViewController:clock];
    
    
    
    //ZMMainViewController *main = [[ZMMainViewController alloc] init];
    //[kWindow setRootViewController:main];


}




#pragma mark ------------------------------小睡 按钮
- (void)smallSleepBtneClicked
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GetUpBtn_Is_CLICKED_STOPPMUSICC" object:nil];
    

    [self.navigationController popViewControllerAnimated:NO];
    
    
    
    
///////////添加通知
    
    NSArray *array = [self.dateString componentsSeparatedByString:@":"];
    
    NSString *hourStt = array[0];
    NSString *minuteStt = array[1];
    NSInteger hourInteger = [hourStt integerValue];
    NSInteger minuteInteger = [minuteStt integerValue] + 5;
    
    
    [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hourInteger withMinute:minuteInteger withTitle:@"星伴闹钟叫你起床了~~" withSoundName:@"欢快口哨音.mp3" withNotifyRepeatInterval:0 withClockKey:@"小睡"];
    
    
    
}






#pragma mark ----------------------------起床 帧动画

- (void)startGetupImgAnimationing
{
    NSMutableArray *imagesArray = [NSMutableArray array];
    
    //加载全部图片，并放入数组中
    for (int i = 1; i < 5; i ++) {
        
        NSString *sting = [NSString stringWithFormat:@"起床-动画%d",i];
        
        UIImage *image = [UIImage imageNamed:sting];
        
        [imagesArray addObject:image];
        
        /*图片量比较大的时候
         NSString *name = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
         
         UIImage *image = [UIImage imageWithContentsOfFile:name];*/
        
    }
    
    
    //设置动画图片
    self.getupAnimationImgV.animationImages = imagesArray;
    
    //设置播放时长  1秒30帧, 一张图片的时间 = 1/30 = 0.03333 总耗时20 * 0.0333
    self.getupAnimationImgV.animationDuration = 0.5f;
    
    //默认为0，无限播放
    self.getupAnimationImgV.animationRepeatCount = 0;
    
    //开始播放
    [self.getupAnimationImgV startAnimating];
    
    
}



#pragma mark ---------------------------小睡一会 帧动画

- (void)startSmallSleepImgAnimationing
{
    NSMutableArray *imagesArray = [NSMutableArray array];
    
    //加载全部图片，并放入数组中
    for (int i = 1; i < 5; i ++) {
        
        NSString *sting = [NSString stringWithFormat:@"再睡一会-动画%d",i];
        
        UIImage *image = [UIImage imageNamed:sting];
        
        [imagesArray addObject:image];
        
        /*图片量比较大的时候
         NSString *name = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
         
         UIImage *image = [UIImage imageWithContentsOfFile:name];*/
        
    }
    
    
    //设置动画图片
    self.smallSleepAnimationImgV.animationImages = imagesArray;
    
    //设置播放时长  1秒30帧, 一张图片的时间 = 1/30 = 0.03333 总耗时20 * 0.0333
    self.smallSleepAnimationImgV.animationDuration = 1.0f;
    
    //默认为0，无限播放
    self.smallSleepAnimationImgV.animationRepeatCount = 0;
    
    //开始播放
    [self.smallSleepAnimationImgV startAnimating];
    
    
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
