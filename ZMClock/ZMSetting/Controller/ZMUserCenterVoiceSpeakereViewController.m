//
//  ZMUserCenterVoiceSpeakereViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMUserCenterVoiceSpeakereViewController.h"


#import "ZMUserCenterrVoiceSpeakerTableViewCell.h"
#import "ZMUserCennnterVoiceSpeakerModel.h"

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
///科大讯飞语音合成
#import <iflyMSC/IFlyMSC.h>
#import "TTSConfig.h"



//#define VOICESPEAKER @"xiaoyu"



@interface ZMUserCenterVoiceSpeakereViewController ()<UITableViewDataSource,UITableViewDelegate,IFlySpeechSynthesizerDelegate>

@property (nonatomic, copy)  NSString *speakerStt;//说话者


@property (nonatomic, strong) IFlySpeechSynthesizer * iFlySpeechSynthesizer;

@property (nonatomic, strong) UISegmentedControl * speakerSegControl;
@property (nonatomic, strong) UIButton *boyBttn;
@property (nonatomic, strong) UIButton *girllBttn;


@property (nonatomic, strong) UITableView *boySpeakerTableV;
@property (nonatomic, strong) UITableView *girlSpeakerTableV;



@property (nonatomic, strong) NSMutableArray *boySpeakerArray;
@property (nonatomic, strong) NSMutableArray *girlSpeakerArray;
@property (nonatomic, strong) ZMUserCennnterVoiceSpeakerModel *boySpeakerModel;

@property (nonatomic, strong) ZMUserCennnterVoiceSpeakerModel *girlSpeakerModel;


///语音试听
@property (nonatomic, strong) NSMutableArray *listenSpeakerArray;



////男声 tag
@property (nonatomic, assign) NSInteger boyyTagg;


@end


@implementation ZMUserCenterVoiceSpeakereViewController



+ (ZMUserCenterVoiceSpeakereViewController *)sharedZMUserCenterVoiceSpeakereViewController
{
    static ZMUserCenterVoiceSpeakereViewController *defautVC = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        defautVC = [[self alloc] init];
    });
    
    return defautVC;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    




}


- (void)viewDidLoad {
    [super viewDidLoad];
    //
      
    self.listenSpeakerArray = [NSMutableArray arrayWithObjects:@"快来星伴和我聊天啊,啊,啊,啊", @"快来星伴和我聊天啊,哈,哈,哈", @"快来星伴和我聊天啊,额,额,额", nil];
    
    
#pragma mark --------------------------------男声-数据源
    
    
    self.boySpeakerArray = [NSMutableArray array];
    
    
    ZMUserCennnterVoiceSpeakerModel *boyModel = [[ZMUserCennnterVoiceSpeakerModel alloc] init];
    boyModel.boy_speakerName = @"小宇-青年男声-普通话";
    
    [self.boySpeakerArray addObject:boyModel];
    
    ZMUserCennnterVoiceSpeakerModel *boyModel2 = [[ZMUserCennnterVoiceSpeakerModel alloc] init];
    boyModel2.boy_speakerName = @"小峰-青年男声-普通话";
    
    [self.boySpeakerArray addObject:boyModel2];
    
    ZMUserCennnterVoiceSpeakerModel *boyModel3 = [[ZMUserCennnterVoiceSpeakerModel alloc] init];
    boyModel3.boy_speakerName = @"小新-青年男声-普通话";
    
    [self.boySpeakerArray addObject:boyModel3];
    
    
    
    
#pragma mark --------------------------------女声-数据源
    
    
    self.girlSpeakerArray = [NSMutableArray array];
    
    
    ZMUserCennnterVoiceSpeakerModel *girlModel = [[ZMUserCennnterVoiceSpeakerModel alloc] init];
    girlModel.girl_speakerName = @"小妍-青年女声-普通话";
    
    [self.girlSpeakerArray addObject:girlModel];
    
    ZMUserCennnterVoiceSpeakerModel *girlModel2 = [[ZMUserCennnterVoiceSpeakerModel alloc] init];
    girlModel2.girl_speakerName = @"小琪-青年女声-普通话";
    
    [self.girlSpeakerArray addObject:girlModel2];
    
    ZMUserCennnterVoiceSpeakerModel *girlModel3 = [[ZMUserCennnterVoiceSpeakerModel alloc] init];
    girlModel3.girl_speakerName = @"楠楠-青年女声-普通话";
    
    [self.girlSpeakerArray addObject:girlModel3];
    

    
    
#pragma mark ---------------------------------分段控制器
    //[self.view addSubview:self.speakerSegControl];
    [self.view addSubview:self.boyBttn];
    [self.view addSubview:self.girllBttn];
    
#pragma mark --------------------------------男生 TableView
    
    [self.view addSubview:self.boySpeakerTableV];
    
#pragma mark --------------------------------男生 TableView

    [self.view addSubview:self.girlSpeakerTableV];
    
    self.girlSpeakerTableV.hidden = YES;
    
#pragma mark -----------------------------------配置语音合成
    [self initSpeakTexttSynthesizer];
    
    
    
}


#pragma mark ------------------------------- 设置合成参数
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
    [_iFlySpeechSynthesizer setParameter:self.speakerStt forKey:[IFlySpeechConstant VOICE_NAME]];//
    //音频采样率,目前支持的采样率有 16000 和 8000
    [_iFlySpeechSynthesizer setParameter:@"8000" forKey:[IFlySpeechConstant SAMPLE_RATE]];
    ////asr_audio_path保存录音文件路径，如不再需要，设置value为nil表示取消，默认目录是documents
    [_iFlySpeechSynthesizer setParameter:@"tts.pcm" forKey:[IFlySpeechConstant TTS_AUDIO_PATH]];
    
    
    
}


/**
 *  结束回调
 *  当整个合成结束之后会回调此函数
 *
 *  @param error 错误码
 */
- (void) onCompleted:(IFlySpeechError*) error
{




}


//////////////////////////////////////////////////////
//////////////////////////////////////////////////////



- (UIButton *)boyBttn
{
    if (!_boyBttn) {
        
        _boyBttn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 70, 70, 70, 35)];
        _boyBttn.backgroundColor = [UIColor clearColor];
        [_boyBttn setImage:IMAGE(@"男声女声1a") forState:UIControlStateNormal];
        [_boyBttn setImage:IMAGE(@"男声女声1a") forState:UIControlStateHighlighted];
        
        
        [_boyBttn addTarget:self action:@selector(_boyBttnnClicked) forControlEvents:UIControlEventTouchUpInside];

    }
    return _boyBttn;
}

- (UIButton *)girllBttn
{
    if (!_girllBttn) {
        _girllBttn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/2 , 70, 70, 35)];
        _girllBttn.backgroundColor = [UIColor clearColor];
        [_girllBttn setImage:IMAGE(@"男声女声1b") forState:UIControlStateNormal];
        [_girllBttn setImage:IMAGE(@"男声女声3b") forState:UIControlStateHighlighted];
        
        
        [_girllBttn addTarget:self action:@selector(_girllBttnnClicked) forControlEvents:UIControlEventTouchUpInside];
    }

    return _girllBttn;
}

- (UISegmentedControl *)speakerSegControl
{
    if (!_speakerSegControl) {
        _speakerSegControl = [[UISegmentedControl alloc]initWithItems:@[@"" ,@""]];
        _speakerSegControl.frame = CGRectMake(kScreen_Width/2 - 100, 70, 200, 30);
        
        _speakerSegControl.selectedSegmentIndex = 0;
        
        //[_speakerSegControl setImage:IMAGE(@"男声女声1a") forSegmentAtIndex:0];
        //[_speakerSegControl setImage:IMAGE(@"男声女声1b") forSegmentAtIndex:1];
        
        //[_speakerSegControl setBackgroundImage:IMAGE(@"男声女声1") forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        
        
        
        
        //_speakerSegControl.segmentedControlStyle =UISegmentedControlStylePlain;
        
        //[_speakerSegControl setBackgroundImage:IMAGE(@"男声女声1") forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        //[_speakerSegControl setBackgroundImage:IMAGE(@"男声女声3") forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
       
    
      
        
        [_speakerSegControl setDividerImage:IMAGE(@"男声女声1a") forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        [_speakerSegControl setDividerImage:IMAGE(@"男声女声3a") forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        
        
        //_speakerSegControl.segmentedControlStyle= UISegmentedControlStyleBar;//设置
        _speakerSegControl.tintColor = [UIColor clearColor];
        
        
        [_speakerSegControl addTarget:self action:@selector(speakerSegControlClicked:)forControlEvents:UIControlEventValueChanged];
    }
    return _speakerSegControl;
}


- (UITableView *)boySpeakerTableV
{

    if (!_boySpeakerTableV) {
        _boySpeakerTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, kScreen_Width, kScreen_Height - 120)];
        _boySpeakerTableV.backgroundColor = [UIColor whiteColor];
        _boySpeakerTableV.dataSource = self;
        _boySpeakerTableV.delegate = self;
        //_boySpeakerTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _boySpeakerTableV.tag = 2000;
        

    }

    return _boySpeakerTableV;
}


- (UITableView *)girlSpeakerTableV
{
    if (!_girlSpeakerTableV) {
        _girlSpeakerTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, kScreen_Width, kScreen_Height - 120)];
        _girlSpeakerTableV.backgroundColor = [UIColor whiteColor];
        _girlSpeakerTableV.dataSource = self;
        _girlSpeakerTableV.delegate = self;
        //_boySpeakerTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _girlSpeakerTableV.tag = 2000;
        
        
    }
    
    return _girlSpeakerTableV;
}



- (void)_boyBttnnClicked
{
    [_girllBttn setImage:IMAGE(@"男声女声1b") forState:UIControlStateNormal];
    [_boyBttn setImage:IMAGE(@"男声女声1a") forState:UIControlStateNormal];
    self.boySpeakerTableV.hidden = NO;
    self.girlSpeakerTableV.hidden = YES;


}

- (void)_girllBttnnClicked
{
    [_boyBttn setImage:IMAGE(@"男声女声3a") forState:UIControlStateNormal];
    [_girllBttn setImage:IMAGE(@"男声女声3b") forState:UIControlStateNormal];
    self.girlSpeakerTableV.hidden = NO;
    self.boySpeakerTableV.hidden = YES;

    
}




- (void)speakerSegControlClicked:(UISegmentedControl*)sender
{

    if (self.girlSpeakerTableV.hidden) {
        
        self.girlSpeakerTableV.hidden = NO;
        self.boySpeakerTableV.hidden = YES;
        
    } else if (self.boySpeakerTableV.hidden) {
        
        self.boySpeakerTableV.hidden = NO;
        self.girlSpeakerTableV.hidden = YES;
        
    } else {}



}




#pragma mark ------------------------------TableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.boySpeakerTableV) {
        return  self.boySpeakerArray.count;
    } else {
    
        return  self.girlSpeakerArray.count;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.boySpeakerTableV) {
        //
        
        static NSString *cellidd = @"speaker";
        
        ZMUserCenterrVoiceSpeakerTableViewCell *cell= [self.boySpeakerTableV dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMUserCenterrVoiceSpeakerTableViewCell" owner:self options:nil] lastObject];
        }
        
        [cell.useOrnotBtn addTarget:self action:@selector(boyTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.useOrnotBtn.tag = indexPath.row;
        

        
        ZMUserCennnterVoiceSpeakerModel *boyModel = [self.boySpeakerArray objectAtIndex:indexPath.row];
        
        
        cell.voiceStyleLb.text = boyModel.boy_speakerName;
        
        
//////////////
        
        [cell.playBtn addTarget:self action:@selector(playBtntnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.playBtn.tag = indexPath.row;
        
        
        
        
        
        
        [cell setBoySpeakerModel:boyModel];
        
        
        
        NSString *stt11 = [NSString stringWithFormat:@"%ld",self.boyyTagg];
        
        NSString *stt22 = [NSString stringWithFormat:@"%ld",indexPath.row];
        
        
        if ( [stt11 isEqualToString:stt22] ) {
            //
            //[cell.useOrnotBtn setBackgroundImage:[UIImage imageNamed:@"使用中speaker"] forState:UIControlStateNormal];
            
            
        }
        

        return cell;
        
    } else {
    
        static NSString *cellidd = @"speaker";
        
        ZMUserCenterrVoiceSpeakerTableViewCell *cell= [self.boySpeakerTableV dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMUserCenterrVoiceSpeakerTableViewCell" owner:self options:nil] lastObject];
        }
        
        [cell.useOrnotBtn addTarget:self action:@selector(girllTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.useOrnotBtn.tag = indexPath.row;
        
        
        
        ZMUserCennnterVoiceSpeakerModel *girlModel = [self.girlSpeakerArray objectAtIndex:indexPath.row];
        
        
        cell.voiceStyleLb.text = girlModel.girl_speakerName;
        
        
        //////////////
        [cell.playBtn addTarget:self action:@selector(girl_playBtntnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.playBtn.tag = indexPath.row;
        
        
        
        
        
        
        [cell setGirllSpeakerModel:girlModel];
        
        return cell;
    
    }


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

#pragma mark -----------------------------------boy

#pragma mark -----------------------------------男声试听
- (void)playBtntnClicked:(UIButton *)boyBtn
{
    NSString *voice = [self.listenSpeakerArray objectAtIndex:boyBtn.tag];
    //启动合成会话(科大讯飞)
    if ([_iFlySpeechSynthesizer isSpeaking]) {
        return;
    }
    
    if (boyBtn.tag == 0) {
        self.speakerStt = @"xiaoyu";
        [self initSpeakTexttSynthesizer];
        
        [_iFlySpeechSynthesizer startSpeaking:voice];
    }
    
    if (boyBtn.tag == 1) {
        self.speakerStt = @"vixf";
        [self initSpeakTexttSynthesizer];
        
        [_iFlySpeechSynthesizer startSpeaking:voice];
    }
    
    if (boyBtn.tag == 2) {
        self.speakerStt = @"vixx";
        
        [self initSpeakTexttSynthesizer];
        
        [_iFlySpeechSynthesizer startSpeaking:voice];
    }
    
    

}

- (void)boyTableVSelectedBtnClicked:(UIButton *)btn
{
    
    if (self.boySpeakerModel) {
        self.boySpeakerModel.useOrnot_isSelected = !self.boySpeakerModel.useOrnot_isSelected;
    }
    
    
    ZMUserCennnterVoiceSpeakerModel *model = self.boySpeakerArray[btn.tag];
    
    if (!model.useOrnot_isSelected) {
        model.useOrnot_isSelected = !model.useOrnot_isSelected;
        self.boySpeakerModel = model;
    }
    
    
    ///
    if (btn.tag == 0) {
        
        
        [NSUserDefaults standardUserDefaults].speaker_Namee = @"xiaoyu";
        
        
    } else if (btn.tag == 1) {
        
        [NSUserDefaults standardUserDefaults].speaker_Namee = @"vixf";
        
    } else {
    
        [NSUserDefaults standardUserDefaults].speaker_Namee = @"vixx";
    
    }
    
    
    NSLog(@"男声:% ld",btn.tag);
    
    
    
    //self.boyyTagg = btn.tag;
    
    
    
    
    [self.boySpeakerTableV reloadData];
    
    
    
}





#pragma mark -----------------------------------女声试听
- (void)girl_playBtntnClicked:(UIButton *)girlBtn
{
    NSString *voice = [self.listenSpeakerArray objectAtIndex:girlBtn.tag];
    //启动合成会话(科大讯飞)
    if ([_iFlySpeechSynthesizer isSpeaking]) {
        return;
    }
    
    if (girlBtn.tag == 0) {
        self.speakerStt = @"vixy";
        [self initSpeakTexttSynthesizer];
        
        [_iFlySpeechSynthesizer startSpeaking:voice];
    }
    
    if (girlBtn.tag == 1) {
        self.speakerStt = @"vixq";
        [self initSpeakTexttSynthesizer];
        
        [_iFlySpeechSynthesizer startSpeaking:voice];
    }
    
    if (girlBtn.tag == 2) {
        self.speakerStt = @"vinn";
        
        [self initSpeakTexttSynthesizer];
        
        [_iFlySpeechSynthesizer startSpeaking:voice];
    }
    
    
    
}


- (void)girllTableVSelectedBtnClicked:(UIButton *)btn
{
    
    if (self.girlSpeakerModel) {
        self.girlSpeakerModel.useOrnot_isSelected = !self.girlSpeakerModel.useOrnot_isSelected;
    }
    
    
    ZMUserCennnterVoiceSpeakerModel *model = self.girlSpeakerArray[btn.tag];
    
    if (!model.useOrnot_isSelected) {
        model.useOrnot_isSelected = !model.useOrnot_isSelected;
        self.girlSpeakerModel = model;
    }
    
    
    ///
    if (btn.tag == 0) {
        
        
        [NSUserDefaults standardUserDefaults].speaker_Namee = @"vixy";
        
        
    } else if (btn.tag == 1) {
        
        [NSUserDefaults standardUserDefaults].speaker_Namee = @"vixq";
        
    } else {
        
        [NSUserDefaults standardUserDefaults].speaker_Namee = @"vinn";
        
    }

    
    
    
    
    
    [self.girlSpeakerTableV reloadData];
    
    
    
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
