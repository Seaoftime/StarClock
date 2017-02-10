//
//  ZMAddClockEditViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMAddClockEditViewController.h"
#import "AddClockTableViewCell.h"
#import "ZMAddClockEditViewController.h"
#import "LocalNotificationManager.h"
#import "ZMTinkleViewController.h"


//
#import "ZMClockViewController.h"
#import "ZMNewPersonalityClockViewController.h"

@interface ZMAddClockEditViewController () <UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate,TopicAlertViewDeletage,AddClockTableViewCellDeletage>


/**
 添加闹钟表视图
 */
@property (nonatomic,strong) ZMTableView *addClockTableView;


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

#pragma mark ----
@property (nonatomic,retain) NSString *sqlRepeatType;//!< 需要插入数据库重复类型
@property (nonatomic,retain) NSString *sqlMark; //!< 需要插入数据库的类型
@property (nonatomic,retain) NSString *sqlRingName; //!< 需要插入数据库的类型
@property (nonatomic,retain) NSString *sqlSwitchOn; //!< 需要插入数据库的类型
@property (nonatomic,retain) NSString *sqlPrimary_id; //!< 需要插入数据库的数据对象的id

@property (nonatomic,strong) ZMButton *deleteButton; //!< 需要插入数据库的类型


//////传过来的铃声名称/路径地址
@property (nonatomic, copy) NSString *ringgName;
@property (nonatomic, copy) NSString *ringgMusic;

@end

@implementation ZMAddClockEditViewController





@synthesize hour;
@synthesize minute;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"编辑闹钟"];
    [self.view setBackgroundColor:RGBAlpha(253, 239, 253, 1.0)];
    [self.view addSubview:self.pickerView];
    [self.view addSubview:self.addClockTableView];
    [self.view addSubview:self.deleteButton];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //if (self.tinkleViewController.ringName)
    //{
        [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             if (idx == 2)
             {
                 
//接收传过来的值
//用 NSUserDefaults 保存(还没做)
                 
                 NSString *strr = [APPTransmit shareInstance].ringName;
                 
                 NSLog(@"%@",strr);

                 
                 
                 [obj setDescribe:strr];
                 
                 [self.addClockTableView reloadData];
                 *stop = YES;
             }
         }];
   // }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -重新设置的闹钟内容
-(void)setModel:(AddClockViewModel *)model //!< 数据模型
{
    _model = model;
    
    AddClockViewModel *model1 = [[AddClockViewModel alloc]init];
    [model1 setAccessoryType:AccessoryDisclosureIndicator];
    [model1 setTitle:@"重复"];
    [model1 setDescribe:model.repeatType];
    [model1 setPrimary_id:model.primary_id];
    [model1 setCellType:MeNormal];
    [self.allTableArray addObject:model1];
    
    
    AddClockViewModel *model2 = [[AddClockViewModel alloc]init];
    [model2 setAccessoryType:AccessoryDisclosureIndicator];
    [model2 setTitle:@"标签"];
    [model2 setDescribe:model.mark];
    [model1 setPrimary_id:model.primary_id];
    [model2 setCellType:MeNormal];
    [self.allTableArray addObject:model2];
    
    
    AddClockViewModel *model3 = [[AddClockViewModel alloc]init];
    [model3 setAccessoryType:AccessoryDisclosureIndicator];
    [model3 setTitle:@"铃声"];
    [model3 setDescribe:model.ringName];
    [model1 setPrimary_id:model.primary_id];
    [model3 setCellType:MeNormal];
    [self.allTableArray addObject:model3];
    
    
    AddClockViewModel *model4 = [[AddClockViewModel alloc]init];
    [model4 setAccessoryType:AccessoryNone];
    [model4 setTitle:@"稍后提醒"];
    [model4 setDescribe:model.switchOn];
    [model4 setSwitchOn:model.switchOn];
    [model4 setPrimary_id:model.primary_id];
    [model4 setCellType:MeNoNormal];
    [self.allTableArray addObject:model4];
    
}


#pragma mark - Delegate Method
#pragma mark  UIPickerViewDataSource
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 80.0;
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
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allTableArray count];
}

- (AddClockTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddClockTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[AddClockTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setAddClockDeletage:self];
    [cell setModel:self.allTableArray[indexPath.row]];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

-(void)tableView:(ZMTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0:
        {
            [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
             {
                 if (idx == 0)
                 {
                     TopicAlertView *alertView = [[TopicAlertView alloc]initWithTitle:@"重复方式" withTopicTitle:obj.describe setDelegate:self];
                     [alertView showTopicAlertView];
                     
                     *stop = YES;
                 }
             }];
            
        }
            break;
        case 1:
        {
            TopicAlertView *inputAlertView = [[TopicAlertView alloc]initInpputWithTitle:@"标签" setDelegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
            [inputAlertView showInpputAlertView];
        }
            break;
        case 2:
        {
            
            //ZMNewPersonalityClockViewController *newPersonality = [ZMNewPersonalityClockViewController  sharedPersonalityClockViewController];
            ZMNewPersonalityClockViewController *newPersonality = [[ZMNewPersonalityClockViewController  alloc] init];
            
            [self.navigationController pushViewController:newPersonality animated:YES];
            
            //[self.navigationController pushViewController:self.tinkleViewController animated:YES];
        }
            break;
    }
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark TopicAlertViewDeletage (弹出框代理方法)
-(void)topicAlertSelectRowAtIndexPathWithModel:(TinkleModel*)model
{
    if ([model.ringName isEqualToString:@"自定义"])
    {
        TopicAlertView *alertView = [[TopicAlertView alloc]initWithMoreTitle:@"自定义重复方式" setDelegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
        [alertView showTopicMoreAlertView];
    }
    else
    {
        [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             if (idx == 0)
             {
                 [obj setDescribe:model.ringName];
                 [self.addClockTableView reloadData];
                 *stop = YES;
             }
         }];
    }
}


#pragma mark 周一...周日弹出框
-(void)topicMoreAlertSelectRowAtIndexPathWithModel:(TinkleModel*)model
{
    switch (model.selectType)
    {
        case select_type:
        {
            //添加已经选择的
            [self.weekDictionary setObject:model.ringName forKey:model.ringName];
        }
            break;
        case no_select_type:
        {
            //移除已经选择的
            [self.weekDictionary removeObjectForKey:model.ringName];
        }
            break;
    }
}


#pragma arguments
-(void)topicInputAlertButton:(NSString*)sender
{
    //然后修改重复方式的内容
    [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         if (idx == 1)
         {
             [obj setDescribe:sender];
             [self.addClockTableView reloadData];
             *stop = YES;
         }
     }];
}


#pragma mark - alertView 按钮代理方法
//alertView 按钮代理方法
-(void)topicAlertButton:(ZMButton*)sender
{
    switch (sender.tag)
    {
        case 1:
            break;
        case 2:
        {
            if ([self.weekDictionary count] == 7)
            {
                [self setWeek:@"每天"];
            }
            else
            {
                for (NSString *itemWeek in self.weekArray)
                {
                    if ([self.weekDictionary objectForKey:itemWeek])
                    {
                        [self setWeek:[NSString stringWithFormat:@"%@.%@",itemWeek,self.week]];
                    }
                }
            }
            
            
            //然后修改重复方式的内容
            [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
             {
                 if (idx == 0)
                 {
                     [obj setDescribe:self.week];
                     [self.addClockTableView reloadData];
                     *stop = YES;
                 }
             }];
            
            
            [self setWeek:@""];
            //移除数组中的所有内容
            [self.weekDictionary removeAllObjects];
        }
            break;
        case 3:
        {
            //删除闹钟
             [[SQLiteDBManage sharedInstance] deleteWithRingId:self.model.primary_id];
            
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;

    }
}


#pragma mark AddClockTableViewCellDeletage 点击切换按钮触发的方法
-(void)switchAction:(ZMSwitch*)sender
{
    if (sender.isOn)
    {
        [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             if (idx == 3)
             {
                 [obj setSwitchOn:@"开启"];
             }
         }];
        [self.addClockTableView reloadData];
    }
    else
    {
        [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             if (idx == 3)
             {
                 [obj setSwitchOn:@"关闭"];
             }
         }];
        [self.addClockTableView reloadData];
    }
}





#pragma mark - Getter/Setter Method

-(ZMTinkleViewController*)tinkleViewController
{
    if (_tinkleViewController == nil)
    {
        _tinkleViewController = [[ZMTinkleViewController alloc]init];
    }
    return _tinkleViewController;
}



-(ZMButton*)deleteButton
{
    if (_deleteButton == nil)
    {
        _deleteButton = [[ZMButton alloc]initWithFrame:CGRectMake(0, kScreen_Height-50, kScreen_Width, 50)];
        [_deleteButton setBackgroundColor:[UIColor whiteColor]];
        [_deleteButton setImage:[UIImage imageNamed:@"删除闹钟图标"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}



-(UIPickerView*)pickerView
{
    if (_pickerView == nil)
    {
        NSArray *localdTimeArray = [[[ZMHelper sharedHelp] localdTime] componentsSeparatedByString:@":"];
        
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 64, kScreen_Width, 120)];
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



-(ZMTableView*)addClockTableView
{
    if (_addClockTableView == nil)
    {
        _addClockTableView = [[ZMTableView alloc]initWithFrame:CGRectMake(0, 204, kScreen_Width, kScreen_Height-274) style:UITableViewStylePlain];
        [_addClockTableView setBackgroundColor:[UIColor clearColor]];
        [_addClockTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_addClockTableView setDataSource:self];
        [_addClockTableView setDelegate:self];
    }
    return _addClockTableView;
}


-(NSMutableArray*)allTableArray
{
    if (_allTableArray == nil)
    {
        _allTableArray = [NSMutableArray array];

    }
    return _allTableArray;
}


-(NSMutableArray*)allArray
{
    if (_allArray == nil)
    {
        _allArray = [NSMutableArray array];
        [_allArray addObject:self.hourArray];
        [_allArray addObject:self.minuteArray];
        
    }
    return _allArray;
}

-(NSMutableArray*)hourArray
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


-(NSMutableArray*)minuteArray
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


- (NSMutableDictionary*)weekDictionary
{
    if (_weekDictionary == nil)
    {
        _weekDictionary = [NSMutableDictionary dictionary];
    }
    return _weekDictionary;
}


- (NSArray*)weekArray
{
    if (_weekArray == nil)
    {
        _weekArray = [[NSArray alloc]initWithObjects:@"周日",@"周六",@"周五",@"周四",@"周三",@"周二",@"周一",nil];
    }
    return _weekArray;
}



- (NSString*)week
{
    if (_week == nil)
    {
        _week = @"";
    }
    return _week;
}


#pragma mark - 右边按钮点击方法
#pragma mark - Private Method
- (void)navRightBtnAction:(UIButton *)sender
{
    
    AddClockViewModel *modell = self.allTableArray[0];
    NSString *strrr2 = modell.describe;
    
    NSLog(@"_______________ strr ____________%@",strrr2);
    
//只响一次
    [APPTransmit shareInstance].ringOnce2 = strrr2;


    
    
    NSString *date = [NSString stringWithFormat:@"%d:%d",(int)self.hour,(int)self.minute];
    
    
    [self.allTableArray enumerateObjectsUsingBlock:^(AddClockViewModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         if (idx == 0)
         {
             [self setSqlRepeatType:obj.describe];
             [self setSqlPrimary_id:obj.primary_id];
         }
         else if (idx == 1)
         {
             [self setSqlMark:obj.describe];
             [self setSqlPrimary_id:obj.primary_id];
             
             //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:obj.describe withSoundName:@"google.mp3"];
             
             
             if ([self.ringgName isEqualToString:@"公鸡打鸣声.mp3"] || [self.ringgName isEqualToString:@"欢快口哨音.mp3"] || [self.ringgName isEqualToString:@"清新鸟鸣声.mp3"] || [self.ringgName isEqualToString:@"舒缓口琴声.mp3"]) {
                 
                 //[[LocalNotificationManager sharedLocalNotificationManager] registerLocalNotification:hour withMinute:minute withTitle:@"该起床了" withSoundName:self.ringgName];
                 
                 
                 
             }else {
                 
                 
                 
             }
             
             
         }
         else if (idx == 2)
         {
             [self setSqlRingName:obj.describe];
             [self setSqlPrimary_id:obj.primary_id];
         }
         else if (idx == 3)
         {
             [self setSqlSwitchOn:obj.describe];
             [self setSqlPrimary_id:obj.primary_id];
         }
     }];
    
    [[SQLiteDBManage sharedInstance] updateClockRingTableWithDateTime:date withMark:self.sqlMark withSwitch:self.sqlSwitchOn withRingName:self.sqlRingName withRepeatType:self.sqlRepeatType withPrimary_id:self.sqlPrimary_id];
    [self.navigationController popViewControllerAnimated:YES];
    
   
    
}


#pragma mark - 点击删除闹钟
-(void)deleteButtonAction:(ZMButton*)seneder
{
    TopicAlertView *alertView = [[TopicAlertView alloc]initWithTitle:@"删除闹钟" withMessage:@"你确定要删除该闹钟吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
     //TopicAlertView *alertView = [[TopicAlertView alloc]initWithTitle:@"删除闹钟" withMessage:@"闹钟已删除" delegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
    [alertView.doneButton setTag:3];
    
    
    [alertView show];
    
 
}






@end
