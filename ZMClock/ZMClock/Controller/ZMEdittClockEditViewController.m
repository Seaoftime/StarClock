//
//  ZMEdittClockEditViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/11/9.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMEdittClockEditViewController.h"


#import "AddClockTableViewCell.h"
#import "ZMAddClockEditViewController.h"
#import "LocalNotificationManager.h"
#import "ZMTinkleViewController.h"


//
#import "ZMNewPersonalityClockViewController.h"
#import <AVFoundation/AVFoundation.h>


//-------------------------------------------------
//-------------------------------------------------
#import "ZMNewClockAddClockTableViewCellone.h"
#import "ZMNewClockAddClockTableViewCellTwo.h"
#import "ZMNewClockAddClocokTableViewCellzero.h"
#import "ZMClockAddcModel.h"


#define DayToIntervals 24*3600

#define BG_COLOR RGB(175, 129, 139)

@interface ZMEdittClockEditViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate>





/**
 添加闹钟表视图
 */
@property (nonatomic, strong) UITableView *addClockTableView;
@property (nonatomic, strong) UIImageView *bggImggV;

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) NSMutableArray *allTableArray;
@property (nonatomic,strong) NSMutableArray *allArray;
@property (nonatomic,strong) NSMutableArray *hourArray;
@property (nonatomic,strong) NSMutableArray *minuteArray;

@property (nonatomic) NSInteger hour;
@property (nonatomic) NSInteger minute;


@property (nonatomic, assign) NSInteger clockkhour;
@property (nonatomic, assign) NSInteger clockkminute;




@property (nonatomic,strong) NSMutableDictionary *weekDictionary;  //!< 定时闹钟字典
@property (nonatomic,strong) NSArray *weekArray;  //!< 定时闹钟数组
@property (nonatomic,retain) NSString *week;  //!< 定时闹钟数组

@property (nonatomic,strong) ZMTinkleViewController *tinkleViewController; //!< 用于全局设置


//------------------------------------------------
//------------------------------------------------

@property (nonatomic, copy)    NSString *fireDateHour;
@property (nonatomic, copy)    NSString *fireDateMinute;
@property (nonatomic, strong)  UIView *lineV;
@property (nonatomic, strong)  UITextField *remarkTF;

@property (nonatomic, strong) ZMClockAddcModel *clockModel;

@property (nonatomic, strong) ZMClockAddcModel *clockAgainnModel;


@property (nonatomic, strong) UIButton *saveClockBtn;//保存按钮
@property (nonatomic, strong) UIButton *deleteClockBtn;//删除按钮


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

@property (nonatomic, strong) NSMutableArray *clockArray;//闹列表数组

@property (nonatomic, strong) NSMutableArray *compentArray;


//----------------删除--------------------------
@property (nonatomic, strong) UIImageView *deleteBGGV;
@property (nonatomic, strong) UIView *deleteBgV;
@property (nonatomic, strong) UILabel *deleteLb11;
@property (nonatomic, strong) UILabel *deleteLb22;
@property (nonatomic, strong) UIButton *deleteSureBtn;
@property (nonatomic, strong) UIButton *deleteCancelBtn;



@end

@implementation ZMEdittClockEditViewController



@synthesize hour;
@synthesize minute;


- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    NSLog(@"编辑的是哪一个___%ld",self.clockIndex);
    
    
    self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];
    NSLog(@"重复___%@",self.clockModel.clockRepeatType);
    
    NSLog(@"留言___%@",self.clockModel.clockRemarkStr);
    
    
    
    
    
    
    
    
//    self.compentArray = [NSMutableArray array];
//    [self.compentArray addObject:self.clockModel.clockFireHour];
    
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    self.view.backgroundColor = BG_COLOR;
    
    
/////------------------------------------删除的对象
    
    self.clockArray = (NSMutableArray *)[ZMClockAddcModel findAll];
    
    
    self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];
    
//////----------------------------------------------
    
    
    
    
#pragma mark ---------------------------------闹钟模型初始化
    
    self.clockAgainnModel = [[ZMClockAddcModel alloc] init];
    
    
    self.clockRepeatStr = @"0";
    
    

    
    
    
    
    [self setupAddClockUI];
    
    
    
    
    
    
#pragma mark ------------------------------按钮状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonState_ChangedEdit) name:@"ButtonState_Changed_Edit" object:nil];
    
    
    
    
    
    
    
    
    
    
    
    
#pragma mark ---------------------------监听键盘
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    

    
    
    
    
    
    
}











- (void)keyBoardWillShow:(NSNotification *)note
{
    
    //获取键盘弹出或收回时frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //获取键盘弹出所需时长
    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //添加弹出动画
    [UIView animateWithDuration:duration animations:^{
        
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            self.bggImggV.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height + 200 - 50);
            
        } else if ([ZMSystemTool iPhone6Device]) {
            
            self.bggImggV.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height + 200 - 50);
            
        } else  {
            
            self.bggImggV.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height + 200 );
        }
        
        
    
        
        
    }];
    
    
}




- (void)keyBoardWillHidden:(NSNotification *)note
{
    //获取键盘弹出或收回时frame
    //CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //获取键盘弹出所需时长
    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //添加弹出动画
    [UIView animateWithDuration:duration animations:^{
        
        self.bggImggV.transform = CGAffineTransformMakeTranslation(0,0);
        
    }];
    
    
    
    
}









#pragma mark ------------------------------ 监听 按钮
- (void)buttonState_ChangedEdit
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
    self.bggImggV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64)];
    self.bggImggV.userInteractionEnabled = YES;
    self.bggImggV.image = IMAGE(@"点歌-底图");
    
    [self.view addSubview:self.bggImggV];
    

    
    
    [self.bggImggV addSubview:self.addClockTableView];
    
    [self addSaveBtn];
    
    [self addDeleteClockBtn];
    
    [self addDeleteTishiVV];
    
    
    //[self.addClockTableView addSubview:self.pickerView];
    
}


- (void)addDeleteTishiVV
{
    self.deleteBGGV = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kScreen_Height , kScreen_Width, kScreen_Height)];
    self.deleteBGGV.backgroundColor = [UIColor clearColor];
    self.deleteBGGV.image = IMAGE(@"40X40遮罩zz");
    self.deleteBGGV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.deleteBGGV];
    self.deleteBGGV.hidden = YES;

    
    self.deleteBgV = [[UIView alloc] initWithFrame:CGRectMake(30, - kScreen_Height + 50, kScreen_Width - 60, kScreen_Height/2 - 100)];
    
    self.deleteBgV.backgroundColor = RGB(241, 238, 238);
    self.deleteBgV.layer.cornerRadius = 10;
    self.deleteBgV.layer.masksToBounds = YES;
    [self.view addSubview:self.deleteBgV];
    
    self.deleteLb11 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 60, 50)];
    self.deleteLb11.text = @"提  示";
    self.deleteLb11.textAlignment = NSTextAlignmentCenter;
    self.deleteLb11.backgroundColor = MAIN_MAIN_APP_COLOR;
    
    self.deleteLb11.textColor = [UIColor whiteColor];
    self.deleteLb11.font = [UIFont systemFontOfSize:22];
    
    [self.deleteBgV addSubview:self.deleteLb11];
    
    self.deleteLb22 = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreen_Height/4 - 100, kScreen_Width - 60, 40)];
    self.deleteLb22.text = @"确定要删除这个闹钟吗?";
    self.deleteLb22.textAlignment = NSTextAlignmentCenter;
    self.deleteLb22.textColor = RGB(70, 70, 70);
    self.deleteLb22.font = [UIFont systemFontOfSize:20];
    
    [self.deleteBgV addSubview:self.deleteLb22];
    

    self.deleteSureBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.deleteBgV.frame.size.width/2 - 100 - 60 + 30, kScreen_Height/4 , 120, 44)];
    [self.deleteSureBtn setBackgroundColor:[UIColor clearColor]];
    [self.deleteSureBtn setBackgroundImage:IMAGE(@"确定-1") forState:UIControlStateNormal];
    
    //self.deleteSureBtn.layer.cornerRadius = 10;
    //self.deleteSureBtn.layer.masksToBounds = YES;
    
    //[self.deleteSureBtn setTitle:@"确定" forState:UIControlStateNormal];
    //self.deleteSureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    //[self.deleteSureBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.deleteSureBtn addTarget:self action:@selector(deleteSureBtnClickedg) forControlEvents:UIControlEventTouchUpInside];
    
    [self.deleteBgV addSubview:self.deleteSureBtn];

    
    self.deleteCancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.deleteBgV.frame.size.width/2 + 60 - 30, kScreen_Height/4 , 120, 44)];
    [self.deleteCancelBtn setBackgroundColor:[UIColor  clearColor]];
    [self.deleteCancelBtn setBackgroundImage:IMAGE(@"取消-2") forState:UIControlStateNormal];
    
    
    //self.deleteCancelBtn.layer.cornerRadius = 10;
    //self.deleteCancelBtn.layer.masksToBounds = YES;
    
    //[self.deleteCancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    //self.deleteCancelBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    //[self.deleteCancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.deleteCancelBtn addTarget:self action:@selector(deleteCancelBtntnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.deleteBgV addSubview:self.deleteCancelBtn];
    

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
    [self.saveClockBtn addTarget:self action:@selector(saveClockBtnClickedtdf) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.addClockTableView addSubview:self.saveClockBtn];
    
}

- (void)addDeleteClockBtn
{
    //保存按钮
    self.deleteClockBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 40 - 10, 15 + 2, 40, 40)];
    
    [self.deleteClockBtn setBackgroundColor:MAIN_MAIN_APP_COLOR];
    
    //self.deleteClockBtn.layer.cornerRadius = 20;
    //self.deleteClockBtn.layer.masksToBounds = YES;
    
    [self.deleteClockBtn setTitle:@"删除" forState:UIControlStateNormal];
    self.deleteClockBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.deleteClockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.deleteClockBtn addTarget:self action:@selector(deleteClockBtnClickedt:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.topHeadImggV addSubview:self.deleteClockBtn];
    
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
    
//    NSArray *componentArray = self.allArray[component];
//    NSString *title = componentArray[row];
//    return title;
    
    
    
    NSArray *componentArray = self.allArray[component];
    
    NSString *title = componentArray[row];
    
    return title;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    //self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];
    
    switch (component)
    {
        case 0:
        {
            [self setHour:row];
            
            self.clockModel.clockFireHour = row;
            
            NSLog(@"选择的小时: %ld",row);

            
        }
            break;
        case 1:
        {
            [self setMinute:row];
            
            self.clockModel.clockFireMinute = row;
            

            NSLog(@"选择的分钟: %ld",row);
            
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
        //[cell.everyDayBtn setBackgroundImage:[UIImage imageNamed:@"round_gray"] forState:UIControlStateNormal];
        [cell.everyDayBtn setBackgroundImage:[UIImage imageNamed:@"fang_color"] forState:UIControlStateSelected];
        
        self.everyDayButton = cell.everyDayBtn;
        
        
        [cell.everyDayBtn addTarget:self action:@selector(everyDayyBtnClicked:) forControlEvents:UIControlEventTouchDown];
        
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
        
        
        
        
        
        
///------------------------------------------------
        
        //self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];

        
        if ([self.clockModel.clockRepeatType isEqualToString:@"每天"]) {
            //
            self.everyDayButton.selected = YES;
            
            self.oneButton.selected = YES;
            self.twoButton.selected = YES;
            self.threeButton.selected = YES;
            self.fourButton.selected = YES;
            self.fiveButton.selected = YES;
            
            
            self.sixButton.selected = YES;
            self.sevenButton.selected = YES;
            
            
            
            self.clockRepeatStr = @"everyDay";//每天
            
            
        }
        
        if ([self.clockModel.clockRepeatType isEqualToString:@"工作日"]) {
            //
            self.workDayButton.selected = YES;
            
            self.oneButton.selected = YES;
            self.twoButton.selected = YES;
            self.threeButton.selected = YES;
            self.fourButton.selected = YES;
            self.fiveButton.selected = YES;
            
            
            
            
            self.clockRepeatStr = @"workDay";//每天
            
            
        }

        
        if ([self.clockModel.clockRepeatType isEqualToString:@"周末"]) {
            //
            self.nonoworkDayButton.selected = YES;
            
            self.sixButton.selected = YES;
            self.sevenButton.selected = YES;
            
            
            self.clockRepeatStr = @"nonoworkDay";//每天
            
            
        }

        

        
        
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
        
        
        
        //拿到这个 闹钟
        //self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];
        
        
        
        
        ////------------------------------------
        NSString *hourStt = [NSString stringWithFormat:@"%ld",(long)hour];
        
        NSString *minuteStt = [NSString stringWithFormat:@"%ld",(long)minute];
        
        self.clockAgainnModel.clockFireHour = hour;
        self.clockAgainnModel.clockFireMinute = minute;
        
        
        
        if (hourStt.length == 1 && minuteStt.length == 1)
        {
            
            //cell.timeLb.text = [NSString stringWithFormat:@"0%ld:0%ld",(long)hour,(long)minute];
            
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"HH:mm"];
            
            self.clockAgainnModel.clockFireDate = [format dateFromString:cell.timeLb.text];
            
            self.clockAgainnModel.clockFireDateStr = [NSString stringWithFormat:@"0%ld:0%ld",(long)hour,(long)minute];
            
            
        } else if (hourStt.length == 1) {
            
            //cell.timeLb.text = [NSString stringWithFormat:@"0%ld:%ld",(long)hour,(long)minute];
            
            //self.fireDateHour = [NSString stringWithFormat:@"0%@",hourStt];
            
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"HH:mm"];
            
            self.clockAgainnModel.clockFireDate = [format dateFromString:cell.timeLb.text];
            
            self.clockAgainnModel.clockFireDateStr = [NSString stringWithFormat:@"0%ld:%ld",(long)hour,(long)minute];
            
        } else if (minuteStt.length == 1) {
            
            //cell.timeLb.text = [NSString stringWithFormat:@"%ld:0%ld",(long)hour,(long)minute];
            
            //self.fireDateMinute = [NSString stringWithFormat:@"0%@",minuteStt];
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"HH:mm"];
            
            self.clockAgainnModel.clockFireDate = [format dateFromString:cell.timeLb.text];
            
            self.clockAgainnModel.clockFireDateStr = [NSString stringWithFormat:@"%ld:0%ld",(long)hour,(long)minute];
            
        } else {
            
            //cell.timeLb.text = [NSString stringWithFormat:@"%ld:%ld",(long)hour,(long)minute];
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"HH:mm"];
            
            self.clockAgainnModel.clockFireDate = [format dateFromString:cell.timeLb.text];
            
            self.clockAgainnModel.clockFireDateStr = [NSString stringWithFormat:@"%ld:%ld",(long)hour,(long)minute];
            
        }
        
        
        NSLog(@"cell 选择的小时: %ld", self.clockAgainnModel.clockFireHour);
        
        NSLog(@"cell 选择的分钟: %ld", self.clockAgainnModel.clockFireMinute);
        

        
        
        
        
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
        
        
        
        cell.titleLb.text = @"留言:";
        
        //self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];
        self.remarkTF.text = self.clockModel.clockRemarkStr;
        
        
        
        
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
        //NSArray *localdTimeArray = [[[ZMHelper sharedHelp] localdTime] componentsSeparatedByString:@":"];
        
        
        
        
        self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];

        
        NSInteger houurr = self.clockModel.clockFireHour;
        
        NSInteger minuttee = self.clockModel.clockFireMinute;
        
        
        
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0 - 20, 0, kScreen_Width, 140)];
        [_pickerView setBackgroundColor:[UIColor whiteColor]];
        [_pickerView setShowsSelectionIndicator:YES];
        [_pickerView setDelegate:self];
        [_pickerView setDataSource:self];
        
//        if ([localdTimeArray count])
//        {
//            [self setHour:[localdTimeArray[0] integerValue]];
//            [self setMinute:[localdTimeArray[1] integerValue]];
//            [_pickerView selectRow:hour inComponent:0 animated:YES];
//            [_pickerView selectRow:minute inComponent:1 animated:YES];
//        }
        
        
        
        
        [self setHour:houurr];
        [self setMinute:minuttee];
        
        [_pickerView selectRow:hour inComponent:0 animated:YES];
        [_pickerView selectRow:minute inComponent:1 animated:YES];
        
        
        
        
    }
    return _pickerView;
}




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






#pragma mark ---------------------------------点击 周一

- (void)dayOneBtnClickedtt:(UIButton *)dayOneBtn
{
    dayOneBtn.selected = !dayOneBtn.selected;
    
    if (dayOneBtn.selected) {
        
        self.clockRepeatStr11 = @"周一";
        
        //
        self.buttonStateStt11 = @"点了周一";
        
        // [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
        
    } else {
        
        self.clockRepeatStr11 = @"";
        
        self.buttonStateStt11 = @"没点";
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed_Edit" object:nil];
    
}


#pragma mark ---------------------------------点击 周二

- (void)dayTwoBtnClickedttTwo:(UIButton *)dayTwoBtn
{
    dayTwoBtn.selected = !dayTwoBtn.selected;
    
    if (dayTwoBtn.selected) {
        
        self.clockRepeatStr22 = @"周二";
        
        //
        self.buttonStateStt22 = @"点了周二";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        
        self.clockRepeatStr22 = @"";
        
        self.buttonStateStt22 = @"没点";
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed_Edit" object:nil];
    
    
}


#pragma mark ---------------------------------点击 周三

- (void)dayThreeBtnClickedttThree:(UIButton *)dayThreeBtn
{
    dayThreeBtn.selected = !dayThreeBtn.selected;
    
    if (dayThreeBtn.selected) {
        
        self.clockRepeatStr33 = @"周三";
        
        //
        self.buttonStateStt33 = @"点了周三";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        
        self.clockRepeatStr33 = @"";
        
        self.buttonStateStt33 = @"没点";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed_Edit" object:nil];
    
}


#pragma mark ---------------------------------点击 周四

- (void)dayFourBtnClickedttFour:(UIButton *)dayFourBtn
{
    dayFourBtn.selected = !dayFourBtn.selected;
    
    if (dayFourBtn.selected) {
        
        self.clockRepeatStr44 = @"周四";
        
        //
        self.buttonStateStt44 = @"点了周四";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        
        self.clockRepeatStr44 = @"";
        
        self.buttonStateStt44 = @"没点";
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed_Edit" object:nil];
    
    
}



#pragma mark --------------------------------点击 周五

- (void)dayFiveBtnClickedtt:(UIButton *)dayFiveBtn
{
    dayFiveBtn.selected = !dayFiveBtn.selected;
    
    
    if (dayFiveBtn.selected) {
        
        self.clockRepeatStr55 = @"周五";
        
        //
        self.buttonStateStt55 = @"点了周五";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        
        self.clockRepeatStr55 = @"";
        
        self.buttonStateStt55 = @"没点";
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed_Edit" object:nil];
    
}


#pragma mark ---------------------------------点击 周六

- (void)daySixBtnClicked:(UIButton *)daySixBtn
{
    daySixBtn.selected = !daySixBtn.selected;
    
    if (daySixBtn.selected) {
        
        self.clockRepeatStr66 = @"周六";
        
        //
        self.buttonStateStt66 = @"点了周六";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        
        self.clockRepeatStr66 = @"";
        
        self.buttonStateStt66 = @"没点";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed_Edit" object:nil];
    
}



#pragma mark ---------------------------------点击 周日

- (void)dayEightBtnClicked:(UIButton *)dayEightBtn
{
    dayEightBtn.selected = !dayEightBtn.selected;
    
    
    if (dayEightBtn.selected) {
        
        self.clockRepeatStr77 = @"周日";
        
        //
        self.buttonStateStt77 = @"点了周日";
        
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed" object:nil];
        
    } else {
        
        self.clockRepeatStr77 = @"";
        
        self.buttonStateStt77 = @"没点";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ButtonState_Changed_Edit" object:nil];
    
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

- (void)cancelLocalNotifyyyWithKey:(NSString *)key
{
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    
    for (UILocalNotification *obj in localNotifications) {
        
        
        if ([obj.userInfo.allKeys containsObject:key]) {
            
            
            
            [[UIApplication sharedApplication] cancelLocalNotification:obj];
        }
    }
    
    
}



#pragma mark -----------------------------------删除按钮

- (void)deleteClockBtnClickedt:(UIButton *)deleteBtn
{
    self.deleteBGGV.hidden = NO;
    
    [UIView animateWithDuration:0.001 animations:^{
        //
        
        self.deleteBGGV.frame = CGRectMake(0, 0 , kScreen_Width, kScreen_Height);
        
        
    } completion:^(BOOL finished) {
        //
        
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        //
        
       self.deleteBgV.frame = CGRectMake(30,kScreen_Height/4 + 50, kScreen_Width - 60, kScreen_Height/2 - 100);
        
        
    } completion:^(BOOL finished) {
        //
        
    }];
    
    
    


}

#pragma mark ---------------------------------弹窗 确定按钮
- (void)deleteSureBtnClickedg
{

    self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];
    
    NSString *keey = self.clockModel.clockFireDateStr;
    
    [self cancelLocalNotifyyyWithKey:keey];//删除通知
    
    [self.clockModel deleteObject];//删除模型
    
    [self.clockArray removeObjectAtIndex:self.clockIndex];//删除数组元素
    
    
    [AnyObjectActivityView showWithTitle:@"闹钟删除成功~" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
    
    
/////
    [self.navigationController popViewControllerAnimated:YES];



}


#pragma mark ---------------------------------弹窗 取消按钮
- (void)deleteCancelBtntnClicked
{
    self.deleteBGGV.hidden = YES;
    
    [UIView animateWithDuration:0.01 animations:^{
        //
        
        self.deleteBGGV.frame = CGRectMake(0, kScreen_Height , kScreen_Width, kScreen_Height);
        
        
    } completion:^(BOOL finished) {
        //
        self.deleteBGGV.frame = CGRectMake(0, -kScreen_Height , kScreen_Width, kScreen_Height);
    }];
    
    
    [UIView animateWithDuration:0.1 animations:^{
        //
        
        self.deleteBgV.frame = CGRectMake(50,kScreen_Height, kScreen_Width - 100, kScreen_Height/2);
        
        
    } completion:^(BOOL finished) {
        //
        self.deleteBgV.frame = CGRectMake(50, -kScreen_Height, kScreen_Width - 100, kScreen_Height/2);
    }];

    
    
}



#pragma mark -----------------------------------保存按钮

- (void)saveClockBtnClickedtdf
{
    
    
    
//////------------------------------------先删除再添加
    
    self.clockModel = [self.clockArray objectAtIndex:self.clockIndex];
    
    NSString *keey = self.clockModel.clockFireDateStr;
    
    [self cancelLocalNotifyyyWithKey:keey];//删除通知
    
    [self.clockModel deleteObject];//删除模型
    
    [self.clockArray removeObjectAtIndex:self.clockIndex];//删除数组元素

    
//////---------------------------------------------
    
    
    
    //赋值
    
    self.clockAgainnModel.clockRemarkStr = self.remarkTF.text;
    
    self.clockAgainnModel.clockSwitchOn = YES;
    
    
    
    
    
    //添加闹钟并触发本地通知
    /*
     APP 在后台的时候(没被杀死)  以通知的形式提醒
     */
    
    
    NSString *musicName = @"清新鸟鸣声";
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:musicName ofType:@"mp3"];
    
    
    
    if ([self.clockRepeatStr isEqualToString:@"0"]) {
        //
        
        self.clockAgainnModel.clockRepeatType = @"仅一次";
        
#pragma mark ------------------------------------模型保存
        [self.clockAgainnModel save];//保存
        
        
        
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:0 withClockKey:self.clockAgainnModel.clockFireDateStr];
        
    }
    
    
    
    if ([self.clockRepeatStr isEqualToString:@"everyDay"]) {
        //
        
        self.clockAgainnModel.clockRepeatType = @"每天";
        //模型保存
        [self.clockAgainnModel save];//保存
        
        
        
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitDay withClockKey:self.clockAgainnModel.clockFireDateStr];
        
    }
    
    
    
    
    if ([self.clockRepeatStr isEqualToString:@"workDay"]) {
        //
        
        self.clockAgainnModel.clockRepeatType = @"工作日";
        //模型保存
        [self.clockAgainnModel save];//保存
        
        
        
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekday withClockKey:self.clockAgainnModel.clockFireDateStr];
        
    }
    
    
    
    if ([self.clockRepeatStr isEqualToString:@"nonoworkDay"]) {
        //
        
        self.clockAgainnModel.clockRepeatType = @"周末";
        //模型保存
        [self.clockAgainnModel save];//保存
        
        
        
        [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekday withClockKey:self.clockAgainnModel.clockFireDateStr];
        
    }
    
    
    
#pragma mark ---------------------------周一 至 周日
    //------------------------------------------------
    //------------------------------------------------
    
    
    //-----------------------周一-------------------------
    
//    int w11 = [self.clockModel.clockFireDate weekdayyy];
//    
//    NSDate *date11 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(0 +1-w11)];
//    
//    //date 转 string
//    NSDateFormatter *format11 = [[NSDateFormatter alloc] init];
//    [format11 setDateFormat:@"HH:mm"];
//    
//    NSString *dateStt11 = [format11 stringFromDate:date11];
//    
//    NSArray *dateArray11 = [dateStt11 componentsSeparatedByString:@":"];
//    
//    NSString *hourStt11 = [NSString stringWithFormat:@"%@",[dateArray11 objectAtIndex:0]];
//    NSString *minuteStt11 = [NSString stringWithFormat:@"%@",[dateArray11 objectAtIndex:1]];
//    
//    
//    _integerHour11 = [hourStt11 integerValue];
//    
//    _integerMinute11 = [minuteStt11 integerValue];
//    
//    
//    if ([[NSDate date] weekday] == 0 +1) { //如果是当天
//        date11 = [date11 judgeAndSetToNextWeekkk];
//        
//        //date 转 string
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setDateFormat:@"HH:mm"];
//        
//        NSString *dateStt = [format stringFromDate:date11];
//        
//        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
//        
//        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
//        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
//        
//        
//        _integerHour11 = [hourStt integerValue];
//        
//        _integerMinute11 = [minuteStt integerValue];
//        
//        
//        
//    }
//    
//    if ([self.clockRepeatStr11 isEqualToString:@"周一"]) {
//        //
//        self.clockModel.clockRepeat11 = @"周一";
//        //模型保存
//        //[self.clockModel update];//保存
//        
//        
//        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour11 withMinute:_integerMinute11 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    //------------------------------------------------
//    
//    
//    
//    //-----------------------周二-------------------------
//    
//    int w22 = [self.clockModel.clockFireDate weekdayyy];
//    
//    NSDate *date22 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(1 +1-w22)];
//    
//    //date 转 string
//    NSDateFormatter *format22 = [[NSDateFormatter alloc] init];
//    [format22 setDateFormat:@"HH:mm"];
//    
//    NSString *dateStt22 = [format22 stringFromDate:date22];
//    
//    NSArray *dateArray22 = [dateStt22 componentsSeparatedByString:@":"];
//    
//    NSString *hourStt22 = [NSString stringWithFormat:@"%@",[dateArray22 objectAtIndex:0]];
//    NSString *minuteStt22 = [NSString stringWithFormat:@"%@",[dateArray22 objectAtIndex:1]];
//    
//    
//    _integerHour22 = [hourStt22 integerValue];
//    
//    _integerMinute22 = [minuteStt22 integerValue];
//    
//    
//    if ([[NSDate date] weekday] == 1 +1) { //如果是当天
//        date22 = [date22 judgeAndSetToNextWeekkk];
//        
//        //date 转 string
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setDateFormat:@"HH:mm"];
//        
//        NSString *dateStt = [format stringFromDate:date22];
//        
//        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
//        
//        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
//        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
//        
//        
//        _integerHour22 = [hourStt integerValue];
//        
//        _integerMinute22 = [minuteStt integerValue];
//        
//        
//        
//    }
//    
//    if ([self.clockRepeatStr22 isEqualToString:@"周二"]) {
//        //
//        self.clockModel.clockRepeat22 = @"周二";
//        //模型保存
//       // [self.clockModel update];//保存
//        
//        
//       // [[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour22 withMinute:_integerMinute22 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    //------------------------------------------------
//    
//    
//    
//    
//    //-----------------------周三-------------------------
//    
//    int w33 = [self.clockModel.clockFireDate weekdayyy];
//    
//    NSDate *date33 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(2 +1-w33)];
//    
//    //date 转 string
//    NSDateFormatter *format33 = [[NSDateFormatter alloc] init];
//    [format33 setDateFormat:@"HH:mm"];
//    
//    NSString *dateStt33 = [format33 stringFromDate:date33];
//    
//    NSArray *dateArray33 = [dateStt33 componentsSeparatedByString:@":"];
//    
//    NSString *hourStt33 = [NSString stringWithFormat:@"%@",[dateArray33 objectAtIndex:0]];
//    NSString *minuteStt33 = [NSString stringWithFormat:@"%@",[dateArray33 objectAtIndex:1]];
//    
//    
//    _integerHour33 = [hourStt33 integerValue];
//    
//    _integerMinute33 = [minuteStt33 integerValue];
//    
//    
//    if ([[NSDate date] weekday] == 2 +1) { //如果是当天
//        date33 = [date33 judgeAndSetToNextWeekkk];
//        
//        //date 转 string
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setDateFormat:@"HH:mm"];
//        
//        NSString *dateStt = [format stringFromDate:date33];
//        
//        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
//        
//        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
//        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
//        
//        
//        _integerHour33 = [hourStt integerValue];
//        
//        _integerMinute33 = [minuteStt integerValue];
//        
//        
//        
//    }
//    
//    if ([self.clockRepeatStr33 isEqualToString:@"周三"]) {
//        //
//        self.clockModel.clockRepeat33 = @"周三";
//        //模型保存
//        //[self.clockModel update];//保存
//        
//        
//        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour33 withMinute:_integerMinute33 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    //------------------------------------------------
//    
//    
//    
//    //-----------------------周四-------------------------
//    
//    int w44 = [self.clockModel.clockFireDate weekdayyy];
//    
//    NSDate *date44 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(3 +1-w44)];
//    
//    //date 转 string
//    NSDateFormatter *format44 = [[NSDateFormatter alloc] init];
//    [format44 setDateFormat:@"HH:mm"];
//    
//    NSString *dateStt44 = [format44 stringFromDate:date44];
//    
//    NSArray *dateArray44 = [dateStt44 componentsSeparatedByString:@":"];
//    
//    NSString *hourStt44 = [NSString stringWithFormat:@"%@",[dateArray44 objectAtIndex:0]];
//    NSString *minuteStt44 = [NSString stringWithFormat:@"%@",[dateArray44 objectAtIndex:1]];
//    
//    
//    _integerHour44 = [hourStt44 integerValue];
//    
//    _integerMinute44 = [minuteStt44 integerValue];
//    
//    
//    if ([[NSDate date] weekday] == 3 +1) { //如果是当天
//        date44 = [date44 judgeAndSetToNextWeekkk];
//        
//        //date 转 string
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setDateFormat:@"HH:mm"];
//        
//        NSString *dateStt = [format stringFromDate:date44];
//        
//        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
//        
//        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
//        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
//        
//        
//        _integerHour44 = [hourStt integerValue];
//        
//        _integerMinute44 = [minuteStt integerValue];
//        
//        
//        
//    }
//    
//    if ([self.clockRepeatStr44 isEqualToString:@"周四"]) {
//        //
//        self.clockModel.clockRepeat44 = @"周四";
//        //模型保存
//        //[self.clockModel update];//保存
//        
//        
//        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour44 withMinute:_integerMinute44 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    //------------------------------------------------
//    
//    
//    //-----------------------周五-------------------------
//    
//    int w55 = [self.clockModel.clockFireDate weekdayyy];
//    
//    NSDate *date55 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(4 +1-w55)];
//    
//    //date 转 string
//    NSDateFormatter *format55 = [[NSDateFormatter alloc] init];
//    [format55 setDateFormat:@"HH:mm"];
//    
//    NSString *dateStt55 = [format55 stringFromDate:date55];
//    
//    NSArray *dateArray55 = [dateStt55 componentsSeparatedByString:@":"];
//    
//    NSString *hourStt55 = [NSString stringWithFormat:@"%@",[dateArray55 objectAtIndex:0]];
//    NSString *minuteStt55 = [NSString stringWithFormat:@"%@",[dateArray55 objectAtIndex:1]];
//    
//    
//    _integerHour55 = [hourStt55 integerValue];
//    
//    _integerMinute55 = [minuteStt55 integerValue];
//    
//    
//    if ([[NSDate date] weekday] == 4 +1) { //如果是当天
//        date55 = [date55 judgeAndSetToNextWeekkk];
//        
//        //date 转 string
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setDateFormat:@"HH:mm"];
//        
//        NSString *dateStt = [format stringFromDate:date55];
//        
//        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
//        
//        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
//        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
//        
//        
//        _integerHour55 = [hourStt integerValue];
//        
//        _integerMinute55 = [minuteStt integerValue];
//        
//        
//        
//    }
//    
//    if ([self.clockRepeatStr55 isEqualToString:@"周五"]) {
//        //
//        self.clockModel.clockRepeat55 = @"周五";
//        //模型保存
//        //[self.clockModel update];//保存
//        
//        
//        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour55 withMinute:_integerMinute55 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    //------------------------------------------------
//    
//    
//    
//    
//    //-----------------------周六-------------------------
//    
//    int w66 = [self.clockModel.clockFireDate weekdayyy];
//    
//    NSDate *date66 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(5 +1-w66)];
//    
//    //date 转 string
//    NSDateFormatter *format66 = [[NSDateFormatter alloc] init];
//    [format66 setDateFormat:@"HH:mm"];
//    
//    NSString *dateStt66 = [format66 stringFromDate:date66];
//    
//    NSArray *dateArray66 = [dateStt66 componentsSeparatedByString:@":"];
//    
//    NSString *hourStt66 = [NSString stringWithFormat:@"%@",[dateArray66 objectAtIndex:0]];
//    NSString *minuteStt66 = [NSString stringWithFormat:@"%@",[dateArray66 objectAtIndex:1]];
//    
//    
//    _integerHour66 = [hourStt66 integerValue];
//    
//    _integerMinute66 = [minuteStt66 integerValue];
//    
//    
//    if ([[NSDate date] weekday] == 5+1) { //如果是当天
//        date66 = [date66 judgeAndSetToNextWeekkk];
//        
//        //date 转 string
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setDateFormat:@"HH:mm"];
//        
//        NSString *dateStt = [format stringFromDate:date66];
//        
//        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
//        
//        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
//        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
//        
//        
//        _integerHour66 = [hourStt integerValue];
//        
//        _integerMinute66 = [minuteStt integerValue];
//        
//        
//        
//    }
//    
//    if ([self.clockRepeatStr66 isEqualToString:@"周六"]) {
//        //
//        self.clockModel.clockRepeat66 = @"周六";
//        //模型保存
//        //[self.clockModel update];//保存
//        
//        
//        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour66 withMinute:_integerMinute66 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
//    //------------------------------------------------
//    
//    //----------------------周日--------------------------
//    
//    int w77 = [self.clockModel.clockFireDate weekdayyy];
//    
//    NSDate *date77 = [self.clockModel.clockFireDate dateByAddingTimeInterval:DayToIntervals*(6 +1-w77)];
//    
//    NSDateFormatter *format77 = [[NSDateFormatter alloc] init];
//    [format77 setDateFormat:@"HH:mm"];
//    
//    NSString *dateStt77 = [format77 stringFromDate:date77];
//    
//    NSArray *dateArray77 = [dateStt77 componentsSeparatedByString:@":"];
//    
//    NSString *hourStt77 = [NSString stringWithFormat:@"%@",[dateArray77 objectAtIndex:0]];
//    NSString *minuteStt77 = [NSString stringWithFormat:@"%@",[dateArray77 objectAtIndex:1]];
//    
//    
//    _integerHour77 = [hourStt77 integerValue];
//    
//    _integerMinute77 = [minuteStt77 integerValue];
//    
//    
//    if ([[NSDate date] weekday] == 6 +1) { //如果是当天
//        date77 = [date77 judgeAndSetToNextWeekkk];
//        
//        //date 转 string
//        NSDateFormatter *format = [[NSDateFormatter alloc] init];
//        [format setDateFormat:@"HH:mm"];
//        
//        NSString *dateStt = [format stringFromDate:date66];
//        
//        NSArray *dateArray = [dateStt componentsSeparatedByString:@":"];
//        
//        NSString *hourStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:0]];
//        NSString *minuteStt = [NSString stringWithFormat:@"%@",[dateArray objectAtIndex:1]];
//        
//        
//        _integerHour77 = [hourStt integerValue];
//        
//        _integerMinute77 = [minuteStt integerValue];
//        
//        
//        
//    }
//    
//    if ([self.clockRepeatStr77 isEqualToString:@"周日"]) {
//        //
//        
//        self.clockModel.clockRepeat77 = @"周末";
//        //模型保存
//        //[self.clockModel update];//保存
//        
//        
//        
//        //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:_integerHour77 withMinute:_integerMinute77 withTitle:@"星伴闹钟叫你起床了~~" withSoundName:soundPath withNotifyRepeatInterval:NSCalendarUnitWeekOfYear withClockKey:self.clockModel.clockFireDateStr];
//        
//    }
    
    
    
    
    
    
    //------------------------------------------------
    
    
    
    
    
    
    
    
    
    
//------------------------------------------------
//------------------------------------------------
    
    [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
    
#pragma mark ------------------------发送下载铃声的通知
    
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max) {
        //iOS 10
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"DOWNLOAD_CLOCK_RING_MUSIIIC" object:nil];
        
        
    } else {
        //
        
    }

    
    
    NSLog(@"保存__的小时: %ld", self.clockModel.clockFireHour);
    
    NSLog(@"保存__的分钟: %ld", self.clockModel.clockFireMinute);
    
    
    
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
