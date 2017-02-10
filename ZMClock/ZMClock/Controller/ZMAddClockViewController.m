//
//  ZMAddClockViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMAddClockViewController.h"

#import "AddClockTableViewCell.h"
#import "ZMAddClockEditViewController.h"
#import "LocalNotificationManager.h"
#import "ZMTinkleViewController.h"


//
#import "ZMNewPersonalityClockViewController.h"
//#import "ZMNewPersonalityClockViewController.h"
#import <AVFoundation/AVFoundation.h>


//-------------------------------------------------
//-------------------------------------------------
#import "ZMNewClockAddClockTableViewCellone.h"
#import "ZMNewClockAddClockTableViewCellTwo.h"
#import "ZMNewClockAddClocokTableViewCellzero.h"
#import "ZMClockAddcModel.h"




/*
 NSCalendarUnitEra                = kCFCalendarUnitEra,
 NSCalendarUnitYear               = kCFCalendarUnitYear,
 NSCalendarUnitMonth              = kCFCalendarUnitMonth,
 NSCalendarUnitDay                = kCFCalendarUnitDay,
 NSCalendarUnitHour               = kCFCalendarUnitHour,
 NSCalendarUnitMinute             = kCFCalendarUnitMinute,
 NSCalendarUnitSecond             = kCFCalendarUnitSecond,
 NSCalendarUnitWeekday            = kCFCalendarUnitWeekday,
 NSCalendarUnitWeekdayOrdinal     = kCFCalendarUnitWeekdayOrdinal,
 */


#define DayToIntervals 24*3600

#define BG_COLOR RGB(175, 129, 139)




#define IOS_VERSION_10 (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max)?(YES):(NO)



@interface ZMAddClockViewController () <UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate,TopicAlertViewDeletage>{
    //NSTimer * _timer;  //定时器
}


/**
 添加闹钟表视图
 */
@property (nonatomic,strong) UITableView *addClockTableView;
@property (nonatomic, strong) UIImageView *bgImmgV;

@property (nonatomic,strong) UIPickerView *pickerView;

@property (nonatomic,strong) NSMutableArray *allTableArray;
@property (nonatomic,strong) NSMutableArray *allArray;
@property (nonatomic,strong) NSMutableArray *hourArray;
@property (nonatomic,strong) NSMutableArray *minuteArray;

@property (nonatomic) NSInteger hour;
@property (nonatomic) NSInteger minute;

@property (nonatomic,strong) NSMutableDictionary *weekDictionary;  //!< 定时闹钟字典
@property (nonatomic,strong) NSArray *weekArray;  //!< 定时闹钟数组
@property (nonatomic,retain) NSString *week;  //!< 定时闹钟数组

@property (nonatomic,strong) ZMTinkleViewController *tinkleViewController; //!< 用于全局设置

//////传过来的铃声名称/路径地址
@property (nonatomic, copy) NSString *ringgName;
@property (nonatomic, copy) NSString *ringgMusic;
@property (nonatomic, strong) AVAudioPlayer * player;
@property (nonatomic, assign) NSInteger hour1;
@property (nonatomic, assign) NSInteger hour2;
@property (nonatomic, assign) NSInteger hour3;
//

//------------------------------------------------
//------------------------------------------------

@property (nonatomic, copy)    NSString *fireDateHour;
@property (nonatomic, copy)    NSString *fireDateMinute;
@property (nonatomic, strong)  UIView *lineV;
@property (nonatomic, strong)  UITextField *remarkTF;

@property (nonatomic, strong) ZMClockAddcModel *clockModel;
@property (nonatomic, strong) UIButton *saveClockBtn;//保存按钮


@property (nonatomic, strong) UIButton *oneButton;//周一
@property (nonatomic, strong) UIButton *twoButton;
@property (nonatomic, strong) UIButton *threeButton;
@property (nonatomic, strong) UIButton *fourButton;
@property (nonatomic, strong) UIButton *fiveButton;

@property (nonatomic, strong) UIButton *sixButton;
@property (nonatomic, strong) UIButton *sevenButton;

@property (nonatomic, strong) UIButton *everyDayButton;//每天
@property (nonatomic, strong) UIButton *workDayButton;
@property (nonatomic, strong) UIButton *nonoworkDayButton;


#pragma mark -----------------------------闹钟重复
@property (nonatomic, copy) NSString *clockRepeatStr;

@property (nonatomic, copy) NSString *clockRepeatStr11;
@property (nonatomic, copy) NSString *clockRepeatStr22;
@property (nonatomic, copy) NSString *clockRepeatStr33;
@property (nonatomic, copy) NSString *clockRepeatStr44;
@property (nonatomic, copy) NSString *clockRepeatStr55;
@property (nonatomic, copy) NSString *clockRepeatStr66;
@property (nonatomic, copy) NSString *clockRepeatStr77;


//////
@property (nonatomic, assign) NSInteger integerHour11;
@property (nonatomic, assign) NSInteger integerMinute11;

@property (nonatomic, assign) NSInteger integerHour22;
@property (nonatomic, assign) NSInteger integerMinute22;

@property (nonatomic, assign) NSInteger integerHour33;
@property (nonatomic, assign) NSInteger integerMinute33;

@property (nonatomic, assign) NSInteger integerHour44;
@property (nonatomic, assign) NSInteger integerMinute44;

@property (nonatomic, assign) NSInteger integerHour55;
@property (nonatomic, assign) NSInteger integerMinute55;

@property (nonatomic, assign) NSInteger integerHour66;
@property (nonatomic, assign) NSInteger integerMinute66;

@property (nonatomic, assign) NSInteger integerHour77;
@property (nonatomic, assign) NSInteger integerMinute77;


// 监听改变按钮状态
@property (nonatomic, copy) NSString *buttonStateStt11;
@property (nonatomic, copy) NSString *buttonStateStt22;
@property (nonatomic, copy) NSString *buttonStateStt33;
@property (nonatomic, copy) NSString *buttonStateStt44;
@property (nonatomic, copy) NSString *buttonStateStt55;
@property (nonatomic, copy) NSString *buttonStateStt66;
@property (nonatomic, copy) NSString *buttonStateStt77;


@end

@implementation ZMAddClockViewController


@synthesize hour;
@synthesize minute;


- (void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   

}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];


}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //[self setTitle:@"添加闹钟"];
    
    self.view.backgroundColor = BG_COLOR;
    
    
#pragma mark ---------------------------------闹钟模型初始化
    
    self.clockModel = [[ZMClockAddcModel alloc] init];
    

    self.clockRepeatStr = @"0";
    
    
    [self setupAddClockUI];
    
   
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonState_Changed) name:@"ButtonState_Changed" object:nil];
    
    
    
#pragma mark ---------------------------监听键盘
    
    //监听键盘弹出或收回通知
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardChangeed:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
}




- (void)keyBoardWillShow:(NSNotification *)note
{

    //self.addClockTableView.frame = CGRectMake(20, - 50, kScreen_Width - 40, kScreen_Height - 65 + 50);
    
    
    //获取键盘弹出或收回时frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //获取键盘弹出所需时长
    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //添加弹出动画
    [UIView animateWithDuration:duration animations:^{
        
        
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.bgImmgV.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height + 200 - 50);
            
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.bgImmgV.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height + 200 - 50);
            
        } else  {
            
            self.bgImmgV.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height + 200 );
        }

        
        
        
    }];


}




- (void)keyBoardWillHidden:(NSNotification *)note
{
    
    //self.addClockTableView.frame = CGRectMake(20, 0, kScreen_Width - 40, kScreen_Height - 65);
    
    
    //获取键盘弹出或收回时frame
    //CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //获取键盘弹出所需时长
    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //添加弹出动画
    [UIView animateWithDuration:duration animations:^{
        
        self.bgImmgV.transform = CGAffineTransformMakeTranslation(0,0);
        
        
    }];

    
    
}




#pragma mark ------------------------------ 监听 按钮
- (void)buttonState_Changed
{

    if ([self.buttonStateStt11 isEqualToString:@"点了周一"] && [self.buttonStateStt22 isEqualToString:@"点了周二"] && [self.buttonStateStt33 isEqualToString:@"点了周三"] && [self.buttonStateStt44 isEqualToString:@"点了周四"] && [self.buttonStateStt55 isEqualToString:@"点了周五"] && [self.buttonStateStt66 isEqualToString:@"点了周六"] && [self.buttonStateStt77 isEqualToString:@"点了周日"] ) {
        //
        
        self.everyDayButton.selected = YES;
        
        self.clockRepeatStr = @"everyDay";//每天
        
        
//    } else if ([self.buttonStateStt11 isEqualToString:@"没点"] || [self.buttonStateStt22 isEqualToString:@"没点"] || [self.buttonStateStt33 isEqualToString:@"没点"] || [self.buttonStateStt44 isEqualToString:@"没点"] || [self.buttonStateStt55 isEqualToString:@"没点"] || [self.buttonStateStt66 isEqualToString:@"没点"] || [self.buttonStateStt77 isEqualToString:@"没点"]){
//    
//        self.everyDayButton.selected = NO;
//        
//        self.clockRepeatStr = @"0";//
//        
    } else {
    
        self.everyDayButton.selected = NO;
        
        //self.clockRepeatStr = @"0";//
        
    }

    
    
    
    
    
    if ([self.buttonStateStt11 isEqualToString:@"点了周一"] && [self.buttonStateStt22 isEqualToString:@"点了周二"] && [self.buttonStateStt33 isEqualToString:@"点了周三"] && [self.buttonStateStt44 isEqualToString:@"点了周四"] && [self.buttonStateStt55 isEqualToString:@"点了周五"]  ) {
        //
        
        if ([self.buttonStateStt66 isEqualToString:@"点了周六"] || [self.buttonStateStt77 isEqualToString:@"点了周日"]  ){
            
            self.workDayButton.selected = NO;
            
            //self.clockRepeatStr = @"0";//
            
        } else {
            
            self.workDayButton.selected = YES;
            
            self.clockRepeatStr = @"workDay";//工作日
            
            
        }

        
       
    } else {
        
        self.workDayButton.selected = NO;
        
        //self.clockRepeatStr = @"0";//
        
    }
    
    
    
    
    if ( [self.buttonStateStt66 isEqualToString:@"点了周六"] && [self.buttonStateStt77 isEqualToString:@"点了周日"] ) {
        //
        
        if ([self.buttonStateStt11 isEqualToString:@"点了周一"] || [self.buttonStateStt22 isEqualToString:@"点了周二"] || [self.buttonStateStt33 isEqualToString:@"点了周三"] || [self.buttonStateStt44 isEqualToString:@"点了周四"] || [self.buttonStateStt55 isEqualToString:@"点了周五"] ){
            
            self.nonoworkDayButton.selected = NO;
            
            //self.clockRepeatStr = @"0";//
            

           
        } else {
        
            self.nonoworkDayButton.selected = YES;
            
            self.clockRepeatStr = @"nonoworkDay";//周末
            

        }
        
        
    } else {
        
        self.nonoworkDayButton.selected = NO;
        
        //self.clockRepeatStr = @"0";//
        
    }
    

    
}



#pragma mark -------------------------------- UI
- (void)setupAddClockUI
{

    self.bgImmgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64)];
    self.bgImmgV.userInteractionEnabled = YES;
    self.bgImmgV.image = IMAGE(@"点歌-底图");
    
    [self.view addSubview:self.bgImmgV];
    

    
    [self.bgImmgV addSubview:self.addClockTableView];
 
    [self addSaveBtn];

    //[self.addClockTableView addSubview:self.pickerView];

}

- (UITableView *)addClockTableView
{
    
    if (!_addClockTableView) {
        _addClockTableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, kScreen_Width - 40, kScreen_Height - 65) style:UITableViewStyleGrouped];
        
        _addClockTableView.backgroundColor = [UIColor clearColor];
        _addClockTableView.dataSource = self;
        _addClockTableView.delegate = self;
        //_boySpeakerTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _addClockTableView.tableFooterView = [UIView new];
    }
    
    return _addClockTableView;
}


- (void)addSaveBtn
{
    //保存按钮
    if ([ZMSystemTool iPhone5Device]) {
        
        self.saveClockBtn = [[UIButton alloc] initWithFrame:CGRectMake(40 - 20, kScreen_Height - 250 + 50, kScreen_Width - 80, 44)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.saveClockBtn = [[UIButton alloc] initWithFrame:CGRectMake(40 - 20, kScreen_Height - 250 + 50, kScreen_Width - 80, 44)];
        
        
    } else {
    
        self.saveClockBtn = [[UIButton alloc] initWithFrame:CGRectMake(40 - 20, kScreen_Height - 250, kScreen_Width - 80, 44)];
    
    }

    
    [self.saveClockBtn setBackgroundColor:MAIN_MAIN_APP_COLOR];
    self.saveClockBtn.layer.cornerRadius = 10;
    self.saveClockBtn.layer.masksToBounds = YES;
    
    [self.saveClockBtn setTitle:@"保存闹钟" forState:UIControlStateNormal];
    self.saveClockBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.saveClockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.saveClockBtn addTarget:self action:@selector(saveClockBtnClickedtt) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.addClockTableView addSubview:self.saveClockBtn];
    
}






#pragma mark--------------------  UIPickerViewDataSource
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return kScreen_Width/3;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    
    return 44;
    
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [self.allArray count];
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.allArray[component] count];
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *componentArray = self.allArray[component];
    NSString *title = componentArray[row];
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    switch (component)
    {
        case 0:
        {
            [self setHour:row];
            
        }
            break;
        case 1:
        {
            [self setMinute:row];
        }
            break;
    }
    
    
    [self.addClockTableView reloadData];
    
}



#pragma mark ------------------------------TableView 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 3;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
    sectionHeadBackgroundView.backgroundColor = [UIColor clearColor];
    return sectionHeadBackgroundView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}


//--------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 200;
        
    } else if (indexPath.section == 1) {
        
        return 100;
        
    } else
        return 60;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        //
        static NSString *cellidd = @"addClockCelltwo";
        
        ZMNewClockAddClockTableViewCellTwo *cell = [self.addClockTableView dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewClockAddClockTableViewCellTwo" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //周一
        //[cell.dayOneBtn setBackgroundColor:[UIColor clearColor]];
        //[cell.dayOneBtn setBackgroundImage:[UIImage imageNamed:@"round_noclolr"] forState:UIControlStateNormal];
        [cell.dayOneBtn setBackgroundImage:[UIImage imageNamed:@"round_color"] forState:UIControlStateSelected];
        //[cell.dayOneBtn addTarget:self action:@selector(dayOneBtnClickedtt:) forControlEvents:UIControlEventTouchDown];
        
        self.oneButton = cell.dayOneBtn;
        [self.oneButton addTarget:self action:@selector(dayOneBtnClickedtt:) forControlEvents:UIControlEventTouchDown];
        
        
        
        //周二
        //[cell.dayTwoBtn setBackgroundImage:[UIImage imageNamed:@"round_noclolr"] forState:UIControlStateNormal];
        [cell.dayTwoBtn setBackgroundImage:[UIImage imageNamed:@"round_color"] forState:UIControlStateSelected];
        
        self.twoButton = cell.dayTwoBtn;
        [self.twoButton addTarget:self action:@selector(dayTwoBtnClickedttTwo:) forControlEvents:UIControlEventTouchDown];
        //周三
        //[cell.dayThreeBtn setBackgroundImage:[UIImage imageNamed:@"round_gray"] forState:UIControlStateNormal];
        [cell.dayThreeBtn setBackgroundImage:[UIImage imageNamed:@"round_color"] forState:UIControlStateSelected];
        
        self.threeButton = cell.dayThreeBtn;
        [self.threeButton addTarget:self action:@selector(dayThreeBtnClickedttThree:) forControlEvents:UIControlEventTouchDown];
        //周四
        //[cell.dayFourBtn setBackgroundImage:[UIImage imageNamed:@"round_gray"] forState:UIControlStateNormal];
        [cell.dayFourBtn setBackgroundImage:[UIImage imageNamed:@"round_color"] forState:UIControlStateSelected];
        
        self.fourButton = cell.dayFourBtn;
        [self.fourButton addTarget:self action:@selector(dayFourBtnClickedttFour:) forControlEvents:UIControlEventTouchDown];
        //周五
        //[cell.dayFiveBtn setBackgroundImage:[UIImage imageNamed:@"round_gray"] forState:UIControlStateNormal];
        [cell.dayFiveBtn setBackgroundImage:[UIImage imageNamed:@"round_color"] forState:UIControlStateSelected];

        self.fiveButton = cell.dayFiveBtn;
        [self.fiveButton addTarget:self action:@selector(dayFiveBtnClickedtt:) forControlEvents:UIControlEventTouchDown];
        
        
        
        
        //周六
        //[cell.daySixBtn setBackgroundImage:[UIImage imageNamed:@"round_gray"] forState:UIControlStateNormal];
        [cell.daySixBtn setBackgroundImage:[UIImage imageNamed:@"round_color"] forState:UIControlStateSelected];
        
        self.sixButton = cell.daySixBtn;
        [self.sixButton addTarget:self action:@selector(daySixBtnClicked:) forControlEvents:UIControlEventTouchDown];
        
        //周日
        //[cell.dayEightBtn setBackgroundImage:[UIImage imageNamed:@"round_gray"] forState:UIControlStateNormal];
        [cell.dayEightBtn setBackgroundImage:[UIImage imageNamed:@"round_color"] forState:UIControlStateSelected];
        
        self.sevenButton = cell.dayEightBtn;
        [self.sevenButton addTarget:self action:@selector(dayEightBtnClicked:) forControlEvents:UIControlEventTouchDown];
        
        
#pragma mark -------------------------------- 每天
        //[cell.everyDayBtn setBackgroundImage:[UIImage imageNamed:@"fang_noclolr"] forState:UIControlStateHighlighted];
        [cell.everyDayBtn setBackgroundImage:[UIImage imageNamed:@"fang_color"] forState:UIControlStateSelected];
        //cell.everyDayBtn.backgroundColor = [UIColor whiteColor];
        
        self.everyDayButton = cell.everyDayBtn;
       
        
        [cell.everyDayBtn addTarget:self action:@selector(everyDayyBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
#pragma mark --------------------------------- 工作日
        //[cell.workDayBtn setBackgroundImage:[UIImage imageNamed:@"round_gray"] forState:UIControlStateNormal];
        [cell.workDayBtn setBackgroundImage:[UIImage imageNamed:@"fang_color"] forState:UIControlStateSelected];
        
        self.workDayButton = cell.workDayBtn;
        
        [cell.workDayBtn addTarget:self action:@selector(workDayBtnynClicked:) forControlEvents:UIControlEventTouchDown];
        
#pragma mark --------------------------------- 周末
        //[cell.noworkDayBtn setBackgroundImage:[UIImage imageNamed:@"round_gray"] forState:UIControlStateNormal];
        [cell.noworkDayBtn setBackgroundImage:[UIImage imageNamed:@"fang_color"] forState:UIControlStateSelected];
        
        self.nonoworkDayButton = cell.noworkDayBtn;
        
        [cell.noworkDayBtn addTarget:self action:@selector(noworkDayBtnynClicked:) forControlEvents:UIControlEventTouchDown];
        
        
       
        
        
        
        return cell;
        
    } else if (indexPath.section == 0) {
        
        
        static NSString *cellidd = @"addClockCellzero";
        
        ZMNewClockAddClocokTableViewCellzero *cell = [self.addClockTableView dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewClockAddClocokTableViewCellzero" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.datePickerBgImgV.userInteractionEnabled = YES;
        
        [cell.datePickerBgImgV addSubview:self.pickerView];
        [cell.datePickerBgImgV addSubview:self.lineV];
        
        
        
        
        ////------------------------------------
        NSString *hourStt = [NSString stringWithFormat:@"%ld",(long)hour];
        
        NSString *minuteStt = [NSString stringWithFormat:@"%ld",(long)minute];
        
        self.clockModel.clockFireHour = hour;
        self.clockModel.clockFireMinute = minute;

        
        
        if (hourStt.length == 1 && minuteStt.length == 1)
        {
            
            //cell.timeLb.text = [NSString stringWithFormat:@"0%ld:0%ld",(long)hour,(long)minute];
            
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"HH:mm"];
            
            self.clockModel.clockFireDate = [format dateFromString:cell.timeLb.text];
            
            self.clockModel.clockFireDateStr = [NSString stringWithFormat:@"0%ld:0%ld",(long)hour,(long)minute];
            
        } else if (hourStt.length == 1) {
            
            //cell.timeLb.text = [NSString stringWithFormat:@"0%ld:%ld",(long)hour,(long)minute];
            
            //self.fireDateHour = [NSString stringWithFormat:@"0%@",hourStt];
            
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"HH:mm"];
            
            self.clockModel.clockFireDate = [format dateFromString:cell.timeLb.text];
            
            self.clockModel.clockFireDateStr = [NSString stringWithFormat:@"0%ld:%ld",(long)hour,(long)minute];
            
        } else if (minuteStt.length == 1) {
            
            //cell.timeLb.text = [NSString stringWithFormat:@"%ld:0%ld",(long)hour,(long)minute];
            
            //self.fireDateMinute = [NSString stringWithFormat:@"0%@",minuteStt];
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"HH:mm"];
            
            self.clockModel.clockFireDate = [format dateFromString:cell.timeLb.text];
            
            self.clockModel.clockFireDateStr = [NSString stringWithFormat:@"%ld:0%ld",(long)hour,(long)minute];
        } else {
            
            //cell.timeLb.text = [NSString stringWithFormat:@"%ld:%ld",(long)hour,(long)minute];
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"HH:mm"];
            
            self.clockModel.clockFireDate = [format dateFromString:cell.timeLb.text];
            
            self.clockModel.clockFireDateStr = [NSString stringWithFormat:@"%ld:%ld",(long)hour,(long)minute];
        }
        
        
        
        
        
        
        
        
        return cell;
        
        
    } else {
        
        static NSString *cellidd = @"addClockCellone";
        
        ZMNewClockAddClockTableViewCellone *cell = [self.addClockTableView dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewClockAddClockTableViewCellone" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.textFImgBgV.userInteractionEnabled = YES;
        
        [cell.textFImgBgV addSubview:self.remarkTF];
        //[cell.textFImgBgV addSubview:self.lineV];
        
        
        
        
        //if (indexPath.row == 2) {
            cell.titleLb.text = @"留言:";
            
        self.remarkTF.text = @"起床了!";
        //}
        
        
        return cell;
        
    }
    
    
}



- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




- (UITextField *)remarkTF
{
    if (_remarkTF == nil) {
        _remarkTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 40, 40)];
        _remarkTF.placeholder = @"点击留言";
        _remarkTF.textColor = [UIColor blackColor];
        _remarkTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _remarkTF.textAlignment = NSTextAlignmentLeft;
        _remarkTF.font = [UIFont systemFontOfSize:17];
    }
    return _remarkTF;
}

- (UIView *)lineV
{
    if (_lineV == nil) {
        _lineV = [[UIView alloc] initWithFrame:CGRectMake(0 , 0, kScreen_Width - 40, 1)];
        _lineV.backgroundColor = MAIN_MAIN_APP_COLOR;
        
    }
    return _lineV;
}




//#pragma mark --------------------------- DataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [self.allTableArray count];
//}
//
//- (AddClockTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    AddClockTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//    {
//        cell = [[AddClockTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    if (indexPath.row == 0) {
//        
//        [cell addSubview:self.pickerView];
//    } else {
//    
//        [cell setAddClockDeletage:self];
//        [cell setModel:self.allTableArray[indexPath.row]];
//    
//    }
//    
//    return cell;
//}
//
//#pragma mark UITableViewDelegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row == 0) {
//        return 160;
//    } else
//        
//        return 50;
//}
//
//-(void)tableView:(ZMTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    switch (indexPath.row)
//    {
//        case 0:
//        {
//            [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
//            {
//                if (idx == 0)
//                {
//                    TopicAlertView *alertView = [[TopicAlertView alloc]initWithTitle:@"重复方式" withTopicTitle:obj.describe setDelegate:self];
//                    [alertView showTopicAlertView];
//                    
//                    *stop = YES;
//                }
//            }];
//           
//        }
//            break;
//        case 1:
//        {
//            TopicAlertView *inputAlertView = [[TopicAlertView alloc]initInpputWithTitle:@"标签" setDelegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
//            [inputAlertView showInpputAlertView];
//            
//            
//            
//        }
//            break;
//        case 2:
//        {
//            
//            ZMNewPersonalityClockViewController *new = [[ZMNewPersonalityClockViewController alloc] init];
//            
//            [self.navigationController pushViewController:new animated:YES];
//            
//            
////            [self.navigationController pushViewController:self.tinkleViewController animated:YES];
//        }
//            break;
//    }
//}





////设置重复标签
//#pragma mark TopicAlertViewDeletage (弹出框代理方法)
//-(void)topicAlertSelectRowAtIndexPathWithModel:(TinkleModel*)model
//{
//    if ([model.ringName isEqualToString:@"自定义"])
//    {
//        TopicAlertView *alertView = [[TopicAlertView alloc]initWithMoreTitle:@"自定义重复方式" setDelegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
//        [alertView showTopicMoreAlertView];
//    }
//    else
//    {
//        [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
//         {
//             if (idx == 0)
//             {
//                 [obj setDescribe:model.ringName];
//                 
//                 
//                 [self.addClockTableView reloadData];
//                 *stop = YES;
//             }
//         }];
//    }
//}
//
//
//#pragma mark 周一...周日弹出框
//-(void)topicMoreAlertSelectRowAtIndexPathWithModel:(TinkleModel*)model
//{
//    switch (model.selectType)
//    {
//        case select_type:
//        {
//            //添加已经选择的
//            [self.weekDictionary setObject:model.ringName forKey:model.ringName];
//        }
//            break;
//        case no_select_type:
//        {
//            //移除已经选择的
//            [self.weekDictionary removeObjectForKey:model.ringName];
//        }
//            break;
//    }
//}
//
//
//#pragma arguments
//-(void)topicInputAlertButton:(NSString*)sender
//{
//    //然后修改重复方式的内容
//    [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
//     {
//         if (idx == 1)
//         {
//             [obj setDescribe:sender];
//             [self.addClockTableView reloadData];
//             *stop = YES;
//         }
//     }];
//}
//
//
//-(void)topicAlertButton:(ZMButton*)sender
//{
//    switch (sender.tag)
//    {
//        case 1:
//            break;
//        case 2:
//        {
//            if ([self.weekDictionary count] == 7)
//            {
//                [self setWeek:@"每天"];
//            }
//            else
//            {
//                for (NSString *itemWeek in self.weekArray)
//                {
//                    if ([self.weekDictionary objectForKey:itemWeek])
//                    {
//                        [self setWeek:[NSString stringWithFormat:@"%@.%@",itemWeek,self.week]];
//                    }
//                }
//            }
//            
//            
//            //然后修改重复方式的内容
//            [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
//             {
//                 if (idx == 0)
//                 {
//                     [obj setDescribe:self.week];
//                     [self.addClockTableView reloadData];
//                     *stop = YES;
//                 }
//             }];
//            
//            
//            [self setWeek:@""];
//            //移除数组中的所有内容
//            [self.weekDictionary removeAllObjects];
//            
//            
//        }
//            break;
//    }
//}
//
//
//#pragma mark AddClockTableViewCellDeletage 点击切换按钮触发的方法
//-(void)switchAction:(ZMSwitch*)sender
//{
//    if (sender.isOn)
//    {
//        [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
//        {
//            if (idx == 3)
//            {
//                [obj setSwitchOn:@"开启"];
//            }
//        }];
//        [self.addClockTableView reloadData];
//    }
//    else
//    {
//        [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
//         {
//             if (idx == 3)
//             {
//                 [obj setSwitchOn:@"关闭"];
//             }
//         }];
//        [self.addClockTableView reloadData];
//    }
//}
//




#pragma mark - Getter/Setter Method

- (ZMTinkleViewController*)tinkleViewController
{
    if (_tinkleViewController == nil)
    {
        _tinkleViewController = [[ZMTinkleViewController alloc]init];
    }
    return _tinkleViewController;
}




- (UIPickerView *)pickerView
{
    if (_pickerView == nil)
    {
        NSArray *localdTimeArray = [[[ZMHelper sharedHelp] localdTime] componentsSeparatedByString:@":"];
        
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0 - 20, 0, kScreen_Width, 140)];
        [_pickerView setBackgroundColor:[UIColor whiteColor]];
        [_pickerView setShowsSelectionIndicator:YES];
        [_pickerView setDelegate:self];
        [_pickerView setDataSource:self];
        
        if ([localdTimeArray count])
        {
            [self setHour:[localdTimeArray[0] integerValue]];
            [self setMinute:[localdTimeArray[1] integerValue]];
            [_pickerView selectRow:hour inComponent:0 animated:YES];
            [_pickerView selectRow:minute inComponent:1 animated:YES];
        }
    }
    return _pickerView;
}




//- (NSMutableArray *)allTableArray
//{
//    if (_allTableArray == nil)
//    {
//        _allTableArray = [NSMutableArray array];
//        
//        AddClockViewModel *model1 = [[AddClockViewModel alloc]init];
//        [model1 setAccessoryType:AccessoryDisclosureIndicator];
//        [model1 setTitle:@"重复"];
//        [model1 setDescribe:@"只响一次"];
//        [model1 setCellType:MeNormal];
//        [_allTableArray addObject:model1];
//        
//        
//        AddClockViewModel *model2 = [[AddClockViewModel alloc]init];
//        [model2 setAccessoryType:AccessoryDisclosureIndicator];
//        [model2 setTitle:@"标签"];
//        [model2 setDescribe:@"每天"];
//        [model2 setCellType:MeNormal];
//        [_allTableArray addObject:model2];
//        
//        
//        AddClockViewModel *model3 = [[AddClockViewModel alloc]init];
//        [model3 setAccessoryType:AccessoryDisclosureIndicator];
//        [model3 setTitle:@"铃声"];
//        [model3 setDescribe:@"雷达"];
//        [model3 setCellType:MeNormal];
//        [_allTableArray addObject:model3];
//        
//        
//        AddClockViewModel *model4 = [[AddClockViewModel alloc]init];
//        [model4 setAccessoryType:AccessoryNone];
//        [model4 setTitle:@"稍后提醒"];
//        [model4 setDescribe:@"开启"];
//        [model4 setSwitchOn:@"开启"];
//        [model4 setCellType:MeNoNormal];
//        [_allTableArray addObject:model4];
//    }
//    return _allTableArray;
//}
//

- (NSMutableArray *)allArray
{
    if (_allArray == nil)
    {
        _allArray = [NSMutableArray array];
        [_allArray addObject:self.hourArray];
        [_allArray addObject:self.minuteArray];
    
    }
    return _allArray;
}

- (NSMutableArray *)hourArray
{
    if (_hourArray == nil)
    {
        _hourArray = [NSMutableArray array];
        [_hourArray addObject:@"00"];
        [_hourArray addObject:@"01"];
        [_hourArray addObject:@"02"];
        [_hourArray addObject:@"03"];
        [_hourArray addObject:@"04"];
        [_hourArray addObject:@"05"];
        [_hourArray addObject:@"06"];
        [_hourArray addObject:@"07"];
        [_hourArray addObject:@"08"];
        [_hourArray addObject:@"09"];
        [_hourArray addObject:@"10"];
        [_hourArray addObject:@"11"];
        [_hourArray addObject:@"12"];
        [_hourArray addObject:@"13"];
        [_hourArray addObject:@"14"];
        [_hourArray addObject:@"15"];
        [_hourArray addObject:@"16"];
        [_hourArray addObject:@"17"];
        [_hourArray addObject:@"18"];
        [_hourArray addObject:@"19"];
        [_hourArray addObject:@"20"];
        [_hourArray addObject:@"21"];
        [_hourArray addObject:@"22"];
        [_hourArray addObject:@"23"];
        
    }
    return _hourArray;
}


- (NSMutableArray *)minuteArray
{
    if (_minuteArray == nil)
    {
        _minuteArray = [NSMutableArray array];
    
        [_minuteArray addObject:@"00"];
        [_minuteArray addObject:@"01"];
        [_minuteArray addObject:@"02"];
        [_minuteArray addObject:@"03"];
        [_minuteArray addObject:@"04"];
        [_minuteArray addObject:@"05"];
        [_minuteArray addObject:@"06"];
        [_minuteArray addObject:@"07"];
        [_minuteArray addObject:@"08"];
        [_minuteArray addObject:@"09"];
        
        [_minuteArray addObject:@"10"];
        [_minuteArray addObject:@"11"];
        [_minuteArray addObject:@"12"];
        [_minuteArray addObject:@"13"];
        [_minuteArray addObject:@"14"];
        [_minuteArray addObject:@"15"];
        [_minuteArray addObject:@"16"];
        [_minuteArray addObject:@"17"];
        [_minuteArray addObject:@"18"];
        [_minuteArray addObject:@"19"];
        
        [_minuteArray addObject:@"20"];
        [_minuteArray addObject:@"21"];
        [_minuteArray addObject:@"22"];
        [_minuteArray addObject:@"23"];
        [_minuteArray addObject:@"24"];
        [_minuteArray addObject:@"25"];
        [_minuteArray addObject:@"26"];
        [_minuteArray addObject:@"27"];
        [_minuteArray addObject:@"28"];
        [_minuteArray addObject:@"29"];
        
        [_minuteArray addObject:@"30"];
        [_minuteArray addObject:@"31"];
        [_minuteArray addObject:@"32"];
        [_minuteArray addObject:@"33"];
        [_minuteArray addObject:@"34"];
        [_minuteArray addObject:@"35"];
        [_minuteArray addObject:@"36"];
        [_minuteArray addObject:@"37"];
        [_minuteArray addObject:@"38"];
        [_minuteArray addObject:@"39"];
        
        [_minuteArray addObject:@"40"];
        [_minuteArray addObject:@"41"];
        [_minuteArray addObject:@"42"];
        [_minuteArray addObject:@"43"];
        [_minuteArray addObject:@"44"];
        [_minuteArray addObject:@"45"];
        [_minuteArray addObject:@"46"];
        [_minuteArray addObject:@"47"];
        [_minuteArray addObject:@"48"];
        [_minuteArray addObject:@"49"];
        
        [_minuteArray addObject:@"50"];
        [_minuteArray addObject:@"51"];
        [_minuteArray addObject:@"52"];
        [_minuteArray addObject:@"53"];
        [_minuteArray addObject:@"54"];
        [_minuteArray addObject:@"55"];
        [_minuteArray addObject:@"56"];
        [_minuteArray addObject:@"57"];
        [_minuteArray addObject:@"58"];
        [_minuteArray addObject:@"59"];
    }
    return _minuteArray;
}


- (NSMutableDictionary *)weekDictionary
{
    if (_weekDictionary == nil)
    {
        _weekDictionary = [NSMutableDictionary dictionary];
    }
    return _weekDictionary;
}


- (NSArray *)weekArray
{
    if (_weekArray == nil)
    {
        _weekArray = [[NSArray alloc]initWithObjects:@"周日",@"周六",@"周五",@"周四",@"周三",@"周二",@"周一",nil];
    }
    return _weekArray;
}



- (NSString *)week
{
    if (_week == nil)
    {
        _week = @"";
    }
    return _week;
}



//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//    UILabel* pickerLabel = (UILabel*)view;
//    if (!pickerLabel){
//        pickerLabel = [[UILabel alloc] init];
//        // Setup label properties - frame, font, colors etc
//        //adjustsFontSizeToFitWidth property to YES
//        pickerLabel.minimumFontSize = 8.;
//        pickerLabel.adjustsFontSizeToFitWidth = YES;
//        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
//        [pickerLabel setBackgroundColor:[UIColor orangeColor]];
//        [pickerLabel setFont:[UIFont boldSystemFontOfSize:22]];
//    }
//    //
//    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
//    return pickerLabel;
//}




#pragma mark ---------------------------------点击 周一

- (void)dayOneBtnClickedtt:(UIButton *)dayOneBtn
{
    dayOneBtn.selected = !dayOneBtn.selected;
    
    if (dayOneBtn.selected) {
        
        self.clockRepeatStr = @"";//改变状态
        ///
        self.clockRepeatStr11 = @"周一";
        
        //
        self.buttonStateStt11 = @"点了周一";
        
        
        
       // [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
        
    } else {
    
        self.clockRepeatStr = @"0";//改变状态
        
        self.clockRepeatStr11 = @"";
        
        self.buttonStateStt11 = @"没点";
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];

}


#pragma mark ---------------------------------点击 周二

- (void)dayTwoBtnClickedttTwo:(UIButton *)dayTwoBtn
{
    dayTwoBtn.selected = !dayTwoBtn.selected;
    
    if (dayTwoBtn.selected) {
        
        self.clockRepeatStr = @"";//改变状态
        
        self.clockRepeatStr22 = @"周二";
        
        //
        self.buttonStateStt22 = @"点了周二";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        
        self.clockRepeatStr = @"0";//改变状态
        
        self.clockRepeatStr22 = @"";
        
        self.buttonStateStt22 = @"没点";
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
    
    
}


#pragma mark ---------------------------------点击 周三

- (void)dayThreeBtnClickedttThree:(UIButton *)dayThreeBtn
{
    dayThreeBtn.selected = !dayThreeBtn.selected;
    
    if (dayThreeBtn.selected) {
        
        self.clockRepeatStr = @"";//改变状态
        
        self.clockRepeatStr33 = @"周三";
        
        //
        self.buttonStateStt33 = @"点了周三";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        self.clockRepeatStr = @"0";//改变状态
        self.clockRepeatStr33 = @"";
        
        self.buttonStateStt33 = @"没点";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
    
}


#pragma mark ---------------------------------点击 周四

- (void)dayFourBtnClickedttFour:(UIButton *)dayFourBtn
{
    dayFourBtn.selected = !dayFourBtn.selected;
    
    if (dayFourBtn.selected) {
        
        self.clockRepeatStr = @"";//改变状态
        
        self.clockRepeatStr44 = @"周四";
        
        //
        self.buttonStateStt44 = @"点了周四";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        self.clockRepeatStr = @"0";//改变状态
        self.clockRepeatStr44 = @"";
        
        self.buttonStateStt44 = @"没点";
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
    
    
}



#pragma mark --------------------------------点击 周五

- (void)dayFiveBtnClickedtt:(UIButton *)dayFiveBtn
{
    dayFiveBtn.selected = !dayFiveBtn.selected;
    
    
    if (dayFiveBtn.selected) {
        
        self.clockRepeatStr = @"";//改变状态
        self.clockRepeatStr55 = @"周五";
        
        //
        self.buttonStateStt55 = @"点了周五";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        self.clockRepeatStr = @"0";//改变状态
        self.clockRepeatStr55 = @"";
        
        self.buttonStateStt55 = @"没点";
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
    
}


#pragma mark ---------------------------------点击 周六

- (void)daySixBtnClicked:(UIButton *)daySixBtn
{
    daySixBtn.selected = !daySixBtn.selected;
    
    if (daySixBtn.selected) {
        
        self.clockRepeatStr = @"";//改变状态
        self.clockRepeatStr66 = @"周六";
        
        //
        self.buttonStateStt66 = @"点了周六";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        self.clockRepeatStr = @"0";//改变状态
        self.clockRepeatStr66 = @"";
        
        self.buttonStateStt66 = @"没点";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
    
}



#pragma mark ---------------------------------点击 周日

- (void)dayEightBtnClicked:(UIButton *)dayEightBtn
{
    dayEightBtn.selected = !dayEightBtn.selected;
    
    
    if (dayEightBtn.selected) {
        
        self.clockRepeatStr = @"";//改变状态
        self.clockRepeatStr77 = @"周日";
        
        //
        self.buttonStateStt77 = @"点了周日";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        
        self.clockRepeatStr = @"0";//改变状态
        self.clockRepeatStr77 = @"";
        
        self.buttonStateStt77 = @"没点";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
    
}


#pragma mark ---------------------------------点击 每天

- (void)everyDayyBtnClicked:(UIButton *)everydayBtn
{
    everydayBtn.selected = !everydayBtn.selected;
    
    
    
    
    if (everydayBtn.selected) {
        //
        self.oneButton.selected = YES;
        self.twoButton.selected = YES;
        self.threeButton.selected = YES;
        self.fourButton.selected = YES;
        self.fiveButton.selected = YES;
        
        
        self.sixButton.selected = YES;
        self.sevenButton.selected = YES;
        
        
        
        self.clockRepeatStr = @"everyDay";//每天
        
        
    } else {
    
        self.oneButton.selected = NO;
        self.twoButton.selected = NO;
        self.threeButton.selected = NO;
        self.fourButton.selected = NO;
        self.fiveButton.selected = NO;
        
        
        self.sixButton.selected = NO;
        self.sevenButton.selected = NO;

        
        
        self.clockRepeatStr = @"0";//仅一次
    }
    
    
    
}



#pragma mark ---------------------------------点击 工作日

- (void)workDayBtnynClicked:(UIButton *)workBtn
{
    workBtn.selected = !workBtn.selected;
    
    if (workBtn.selected) {
        //
        self.oneButton.selected = YES;
        self.twoButton.selected = YES;
        self.threeButton.selected = YES;
        self.fourButton.selected = YES;
        self.fiveButton.selected = YES;
        
        
        self.clockRepeatStr = @"workDay";
        
    } else {
    
        self.oneButton.selected = NO;
        self.twoButton.selected = NO;
        self.threeButton.selected = NO;
        self.fourButton.selected = NO;
        self.fiveButton.selected = NO;
        
        self.clockRepeatStr = @"0";
    }
    
}



#pragma mark ---------------------------------点击 周末

- (void)noworkDayBtnynClicked:(UIButton *)noworkBtn
{
    noworkBtn.selected = !noworkBtn.selected;
    
    if (noworkBtn.selected) {
        //
        self.sixButton.selected = YES;
        self.sevenButton.selected = YES;
        
        
        self.clockRepeatStr = @"nonoworkDay";
        
    } else {
    
        self.sixButton.selected = NO;
        self.sevenButton.selected = NO;
        
        
        self.clockRepeatStr = @"0";
    }
    
    
}












//- (NSString *)weekdayStringFromDate:(NSDate *)inputDate
//{
//    
//    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
//    
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    
//    NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
//    
//    [calendar setTimeZone: timeZone];
//    
//    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
//    
//    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
//    
//    return [weekdays objectAtIndex:theComponents.weekday];
//    
//}

#pragma mark -----------------------------------保存按钮

- (void)saveClockBtnClickedtt
{
    //赋值
    
    self.clockModel.clockRemarkStr = self.remarkTF.text;
    
    self.clockModel.clockSwitchOn = YES;
    

    
    
    
//添加闹钟并触发本地通知
/*
 APP 在后台的时候(没被杀死)  以通知的形式提醒
 */
    
    
    NSString *musicName = @"清新鸟鸣声";
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:musicName ofType:@"mp3"];
    
    
    
    if ([self.clockRepeatStr isEqualToString:@"0"]) {
        //
        
        self.clockModel.clockRepeatType = @"仅一次";
        
#pragma mark ------------------------------------模型保存
        [self.clockModel save];//保存
        

        
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:0 withClockKey:self.clockModel.clockFireDateStr];
        
    }
    
    
    
    if ([self.clockRepeatStr isEqualToString:@"everyDay"]) {
        //
        
        self.clockModel.clockRepeatType = @"每天";
        //模型保存
        [self.clockModel save];//保存
        
        
        
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitDay withClockKey:self.clockModel.clockFireDateStr];
        
    }
    
    
    
    
    if ([self.clockRepeatStr isEqualToString:@"workDay"]) {
        //
        
        self.clockModel.clockRepeatType = @"工作日";
        //模型保存
        [self.clockModel save];//保存
        
        
        
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekday withClockKey:self.clockModel.clockFireDateStr];
        
    }

    
    
    if ([self.clockRepeatStr isEqualToString:@"nonoworkDay"]) {
        //
        
        self.clockModel.clockRepeatType = @"周末";
        //模型保存
        [self.clockModel save];//保存
        
        
        
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitDay withClockKey:self.clockModel.clockFireDateStr];
        
    }
    
    
    
#pragma mark ---------------------------周一 至 周日
//------------------------------------------------
//------------------------------------------------
    
    
//-----------------------周一-------------------------
    
    int w11 = [self.clockModel.clockFireDate weekdayyy];
    
    NSDate *date11 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(0 +1-w11)];
    
    //date 转 string
    NSDateFormatter *format11 = [[NSDateFormatter alloc] init];
    [format11 setDateFormat:@"HH:mm"];
    
    NSString *dateStt11 = [format11 stringFromDate:date11];
    
    NSArray *dateArray11 = [dateStt11 componentsSeparatedByString:@":"];
    
    NSString *hourStt11 = [NSString stringWithFormat:@"%@",[dateArray11 objectAtIndex:0]];
    NSString *minuteStt11 = [NSString stringWithFormat:@"%@",[dateArray11 objectAtIndex:1]];
    
    
    _integerHour11 = [hourStt11 integerValue];
    
    _integerMinute11 = [minuteStt11 integerValue];
    
    
    if ([[NSDate date] weekday] == 0 +1) { //如果是当天
        date11 = [date11 judgeAndSetToNextWeekkk];
        
        //date 转 string
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"HH:mm"];
        
        NSString *dateStt = [format stringFromDate:date11];
        
        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
        
        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
        
        
        _integerHour11 = [hourStt integerValue];
        
        _integerMinute11 = [minuteStt integerValue];
        
        
        
    }
    
    
//------------------------------------------------
    
    

//-----------------------周二-------------------------
    
    int w22 = [self.clockModel.clockFireDate weekdayyy];
    
    NSDate *date22 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(1 +1-w22)];
    
    //date 转 string
    NSDateFormatter *format22 = [[NSDateFormatter alloc] init];
    [format22 setDateFormat:@"HH:mm"];
    
    NSString *dateStt22 = [format22 stringFromDate:date22];
    
    NSArray *dateArray22 = [dateStt22 componentsSeparatedByString:@":"];
    
    NSString *hourStt22 = [NSString stringWithFormat:@"%@",[dateArray22 objectAtIndex:0]];
    NSString *minuteStt22 = [NSString stringWithFormat:@"%@",[dateArray22 objectAtIndex:1]];
    
    
    _integerHour22 = [hourStt22 integerValue];
    
    _integerMinute22 = [minuteStt22 integerValue];
    
    
    if ([[NSDate date] weekday] == 1 +1) { //如果是当天
        date22 = [date22 judgeAndSetToNextWeekkk];
        
        //date 转 string
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"HH:mm"];
        
        NSString *dateStt = [format stringFromDate:date22];
        
        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
        
        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
        
        
        _integerHour22 = [hourStt integerValue];
        
        _integerMinute22 = [minuteStt integerValue];
        
        
        
    }
    
//------------------------------------------------
    
    

    
//-----------------------周三-------------------------
    
    int w33 = [self.clockModel.clockFireDate weekdayyy];
    
    NSDate *date33 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(2 +1-w33)];
    
    //date 转 string
    NSDateFormatter *format33 = [[NSDateFormatter alloc] init];
    [format33 setDateFormat:@"HH:mm"];
    
    NSString *dateStt33 = [format33 stringFromDate:date33];
    
    NSArray *dateArray33 = [dateStt33 componentsSeparatedByString:@":"];
    
    NSString *hourStt33 = [NSString stringWithFormat:@"%@",[dateArray33 objectAtIndex:0]];
    NSString *minuteStt33 = [NSString stringWithFormat:@"%@",[dateArray33 objectAtIndex:1]];
    
    
    _integerHour33 = [hourStt33 integerValue];
    
    _integerMinute33 = [minuteStt33 integerValue];
    
    
    if ([[NSDate date] weekday] == 2 +1) { //如果是当天
        date33 = [date33 judgeAndSetToNextWeekkk];
        
        //date 转 string
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"HH:mm"];
        
        NSString *dateStt = [format stringFromDate:date33];
        
        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
        
        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
        
        
        _integerHour33 = [hourStt integerValue];
        
        _integerMinute33 = [minuteStt integerValue];
        
        
        
    }
    
//------------------------------------------------
    

    
//-----------------------周四-------------------------
    
    int w44 = [self.clockModel.clockFireDate weekdayyy];
    
    NSDate *date44 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(3 +1-w44)];
    
    //date 转 string
    NSDateFormatter *format44 = [[NSDateFormatter alloc] init];
    [format44 setDateFormat:@"HH:mm"];
    
    NSString *dateStt44 = [format44 stringFromDate:date44];
    
    NSArray *dateArray44 = [dateStt44 componentsSeparatedByString:@":"];
    
    NSString *hourStt44 = [NSString stringWithFormat:@"%@",[dateArray44 objectAtIndex:0]];
    NSString *minuteStt44 = [NSString stringWithFormat:@"%@",[dateArray44 objectAtIndex:1]];
    
    
    _integerHour44 = [hourStt44 integerValue];
    
    _integerMinute44 = [minuteStt44 integerValue];
    
    
    if ([[NSDate date] weekday] == 3 +1) { //如果是当天
        date44 = [date44 judgeAndSetToNextWeekkk];
        
        //date 转 string
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"HH:mm"];
        
        NSString *dateStt = [format stringFromDate:date44];
        
        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
        
        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
        
        
        _integerHour44 = [hourStt integerValue];
        
        _integerMinute44 = [minuteStt integerValue];
        
        
        
    }
    
   
//------------------------------------------------
    

//-----------------------周五-------------------------
    
    int w55 = [self.clockModel.clockFireDate weekdayyy];
    
    NSDate *date55 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(4 +1-w55)];
    
    //date 转 string
    NSDateFormatter *format55 = [[NSDateFormatter alloc] init];
    [format55 setDateFormat:@"HH:mm"];
    
    NSString *dateStt55 = [format55 stringFromDate:date55];
    
    NSArray *dateArray55 = [dateStt55 componentsSeparatedByString:@":"];
    
    NSString *hourStt55 = [NSString stringWithFormat:@"%@",[dateArray55 objectAtIndex:0]];
    NSString *minuteStt55 = [NSString stringWithFormat:@"%@",[dateArray55 objectAtIndex:1]];
    
    
    _integerHour55 = [hourStt55 integerValue];
    
    _integerMinute55 = [minuteStt55 integerValue];
    
    
    if ([[NSDate date] weekday] == 4 +1) { //如果是当天
        date55 = [date55 judgeAndSetToNextWeekkk];
        
        //date 转 string
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"HH:mm"];
        
        NSString *dateStt = [format stringFromDate:date55];
        
        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
        
        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
        
        
        _integerHour55 = [hourStt integerValue];
        
        _integerMinute55 = [minuteStt integerValue];
        
        
        
    }
    
    
//------------------------------------------------
    

    
    
//-----------------------周六-------------------------
    
    int w66 = [self.clockModel.clockFireDate weekdayyy];

    NSDate *date66 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(5 +1-w66)];
    
    //date 转 string
    NSDateFormatter *format66 = [[NSDateFormatter alloc] init];
    [format66 setDateFormat:@"HH:mm"];
    
    NSString *dateStt66 = [format66 stringFromDate:date66];
    
    NSArray *dateArray66 = [dateStt66 componentsSeparatedByString:@":"];
    
    NSString *hourStt66 = [NSString stringWithFormat:@"%@",[dateArray66 objectAtIndex:0]];
    NSString *minuteStt66 = [NSString stringWithFormat:@"%@",[dateArray66 objectAtIndex:1]];
    
    
    _integerHour66 = [hourStt66 integerValue];
    
    _integerMinute66 = [minuteStt66 integerValue];
    
    
    if ([[NSDate date] weekday] == 5+1) { //如果是当天
        date66 = [date66 judgeAndSetToNextWeekkk];
        
        //date 转 string
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"HH:mm"];
        
        NSString *dateStt = [format stringFromDate:date66];
        
        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
        
        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
        
        
        _integerHour66 = [hourStt integerValue];
        
        _integerMinute66 = [minuteStt integerValue];
        
        
        
    }
    
    
//------------------------------------------------

//----------------------周日--------------------------
    
    int w77 = [self.clockModel.clockFireDate weekdayyy];
    
    NSDate *date77 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(6 +1-w77)];
    
    NSDateFormatter *format77 = [[NSDateFormatter alloc] init];
    [format77 setDateFormat:@"HH:mm"];
    
    NSString *dateStt77 = [format77 stringFromDate:date77];
    
    NSArray *dateArray77 = [dateStt77 componentsSeparatedByString:@":"];
    
    NSString *hourStt77 = [NSString stringWithFormat:@"%@",[dateArray77 objectAtIndex:0]];
    NSString *minuteStt77 = [NSString stringWithFormat:@"%@",[dateArray77 objectAtIndex:1]];
    
    
    _integerHour77 = [hourStt77 integerValue];
    
    _integerMinute77 = [minuteStt77 integerValue];
    
    
    if ([[NSDate date] weekday] == 6 +1) { //如果是当天
        date77 = [date77 judgeAndSetToNextWeekkk];
        
        //date 转 string
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"HH:mm"];
        
        NSString *dateStt = [format stringFromDate:date66];
        
        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
        
        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
        
        
        _integerHour77 = [hourStt integerValue];
        
        _integerMinute77 = [minuteStt integerValue];
        
        
        
    }
    
    
    
    
///------------------------------------------------
///------------------------------------------------
    
    
//    if ([self.clockRepeatStr11 isEqualToString:@"周一"]) {
//        //
//        self.clockModel.clockRepeat11 = @"周一";
//        //模型保存
//        [self.clockModel save];//保存
//        
//        
//        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour11 withMinute:_integerMinute11 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    
//    if ([self.clockRepeatStr22 isEqualToString:@"周二"]) {
//        //
//        self.clockModel.clockRepeat22 = @"周二";
//        //模型保存
//        [self.clockModel save];//保存
//        
//        
//        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour22 withMinute:_integerMinute22 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//
//    if ([self.clockRepeatStr33 isEqualToString:@"周三"]) {
//        //
//        self.clockModel.clockRepeat33 = @"周三";
//        //模型保存
//        [self.clockModel save];//保存
//        
//        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour33 withMinute:_integerMinute33 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
// 
//    if ([self.clockRepeatStr44 isEqualToString:@"周四"]) {
//        //
//        self.clockModel.clockRepeat44 = @"周四";
//        //模型保存
//        [self.clockModel save];//保存
//        
//        
//        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour44 withMinute:_integerMinute44 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    
//    if ([self.clockRepeatStr55 isEqualToString:@"周五"]) {
//        //
//        self.clockModel.clockRepeat55 = @"周五";
//        //模型保存
//        [self.clockModel save];//保存
//        
//        
//        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour55 withMinute:_integerMinute55 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    
//    if ([self.clockRepeatStr66 isEqualToString:@"周六"]) {
//        //
//        self.clockModel.clockRepeat66 = @"周六";
//        //模型保存
//        [self.clockModel save];//保存
//        
//        
//        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour66 withMinute:_integerMinute66 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
    
    
    
    
///------------------------------------------------
///------------------------------------------------
    
    
    
    
    if ([self.clockRepeatStr11 isEqualToString:@"周一"] || [self.clockRepeatStr22 isEqualToString:@"周二"] || [self.clockRepeatStr33 isEqualToString:@"周三"] || [self.clockRepeatStr44 isEqualToString:@"周四"] || [self.clockRepeatStr55 isEqualToString:@"周五"] || [self.clockRepeatStr66 isEqualToString:@"周六"] ||[self.clockRepeatStr77 isEqualToString:@"周日"]) {
        //
        self.clockModel.clockRepeat11 = @"周一";
        self.clockModel.clockRepeat22 = @"周二";
        self.clockModel.clockRepeat33 = @"周三";
        self.clockModel.clockRepeat44 = @"周四";
        self.clockModel.clockRepeat55 = @"周五";
        self.clockModel.clockRepeat66 = @"周六";
        self.clockModel.clockRepeat77 = @"周日";
        
        
        
        
        //模型保存
        //[self.clockModel save];//保存

    
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour11 withMinute:_integerMinute11 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
        
        
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour22 withMinute:_integerMinute22 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
        
        
        
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour33 withMinute:_integerMinute33 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
        
        
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour44 withMinute:_integerMinute44 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
        
        
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour55 withMinute:_integerMinute55 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
        
        
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour66 withMinute:_integerMinute66 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
        
        
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour77 withMinute:_integerMinute77 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
        
        
    }
    
    
//------------------------------------------------
    
    

    
    
    
    
    
    
    
//------------------------------------------------
//------------------------------------------------
   
    [AnyObjectActivityView showWithTitle:@"闹钟添加成功~" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
    
    
#pragma mark ------------------------发送下载铃声的通知
    
/////////判断系统版本
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max) {
        //iOS 10
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"DOWNLOAD_CLOCK_RING_MUSIIIC" object:nil];

        
    } else {
        //
        
    }
    
    
    
   
    [self.navigationController popViewControllerAnimated:YES];
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





#pragma mark - Private Method
- (void)navRightBtnAction:(UIButton *)sender
{
    
  
    
    
    
//-----------------------------------------------------
    AddClockViewModel *modell = self.allTableArray[0];
    NSString *strrr = modell.describe;
    
    NSLog(@"_______________ strr ____________%@",strrr);
    
//只响一次
    [APPTransmit shareInstance].ringOnce = strrr;
    
    
    
    //NSString *date = [NSString stringWithFormat:@"%d:%d",(int)self.hour,(int)self.minute];
    
    //传值
    [APPTransmit shareInstance].hour = [NSString stringWithFormat:@"%ld",(long)hour];
    [APPTransmit shareInstance].min = [NSString stringWithFormat:@"%ld",(long)minute];
    
//添加闹钟并触发本地通知
//    [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"该起床了" withSoundName:@"google.mp3"];
    
    self.ringgName = [APPTransmit shareInstance].ringName;
    self.ringgMusic = [APPTransmit shareInstance].ringLocalPath;
    
    
    
    
    NSString * date11;
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    
    [format setDateFormat:@"hh:mm:ss"];
    
    date11 = [format stringFromDate:[NSDate date]];
    
    
    NSLog(@"______________date  %@",date11);
    
//    
    NSArray *arry = [date11 componentsSeparatedByString:@":"];
    NSString *sttt1 = [arry[0] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *sttt2 = [arry[1] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *sttt3 = [arry[2] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"%@ %@ %@",sttt1,sttt2,sttt3);
    _hour1 = [sttt1 integerValue];//小时
    _hour2 = [sttt2 integerValue];//分
    _hour3 = [sttt3 integerValue];//秒
   
   // NSLog(@"______________%ld %ld %ld",_hour1,_hour2,_hour3);
    
    
    
    //每隔1秒刷新一次页面
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runAction) userInfo:nil repeats:YES];
//    [_timer setFireDate:[NSDate distantPast]];//开启定时器
//    
//    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    
    
    if ([self.ringgName isEqualToString:@"公鸡打鸣声.mp3"] || [self.ringgName isEqualToString:@"欢快口哨音.mp3"] || [self.ringgName isEqualToString:@"清新鸟鸣声.mp3"] || [self.ringgName isEqualToString:@"舒缓口琴声.mp3"]) {
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"该起床了" withSoundName:self.ringgName];
        
        
        
    }else {
        
        
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"该起床了" withSoundName:self.ringgMusic];
        
        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"该起床了" withSoundMusicPath:self.ringgMusic];
        
//        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runAction) userInfo:nil repeats:YES];
//        [_timer setFireDate:[NSDate distantPast]];//开启定时器
//
//        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];        
    
    }
    
    
    
    
    NSLog(@"%@",[APPTransmit shareInstance].ringName);
    
    NSLog(@"闹钟订在  %d:%d",(int)hour,(int)minute);
    
//    [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
//    {
//        if (idx == 0)
//        {
//            [self setSqlRepeatType:obj.describe];
//        }
//        else if (idx == 1)
//        {
//            [self setSqlMark:obj.describe];
//        }
//        else if (idx == 2)
//        {
//            [self setSqlRingId:obj.describe];
//        }
//        else if (idx == 3)
//        {
//            [self setSqlSwitchOn:obj.describe];
//        }
//    }];
//
//    
//    [[SQLiteDBManage sharedInstance] insertIntoClockRingTableWithDateTime:date withMark:self.sqlMark withSwitch:self.sqlSwitchOn withRingId:self.sqlRingId withRepeatType:self.sqlRepeatType];
//    
//    
    

    
//    //添加闹钟返回闹钟主页
//    
//    [self dismissViewControllerAnimated:YES completion:^{
//     //判断闹钟任务是否完成
//        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
//        {
//            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
//            {
//                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign };
//                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"alarm/add_alarm.php" theParmeters:parmeters sucess:^(id object)
//                 {
//                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
//                     {
//                         NSDictionary *data = [object objectForKey:@"data"];
//                         if ([data count])
//                         {
//                             NSDictionary*task=[data objectForKey:@"task"];
//                             
//                        if ([task isEqual:@""])
//                             
//                             {
//                                
//                             }
//                             
//                        else
//                        {
//                            NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
//                              NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
//                            if (task_id==4)
//                            {
//
//                                [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                            }
//                        }
//                    }
//                }
//            }
//            error:^(NSError *error) {}];
//            }
//        }
//        else
//        {
//            [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//        }
//    }];
//    
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}







@end





