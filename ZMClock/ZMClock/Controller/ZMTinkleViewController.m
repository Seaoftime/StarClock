//
//  ZMTinkleViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTinkleViewController.h"
#import "CustomTinkleView.h"
#import "SystemTinkleView.h"
#import "HeadImageView.h"
#import "TinkleModel.h"

@interface ZMTinkleViewController ()


@property (nonatomic,strong) HeadImageView *headBackGroundImageView;  //!< 头部“系统铃声”和“自定义铃声”按钮背景视图
@property (nonatomic,strong) CustomTinkleView *customView; //!< 自定义铃声视图
@property (nonatomic,strong) SystemTinkleView *systemView; //!< 系统铃声视图



@property (nonatomic,strong) NSMutableArray *customTinkleArray; //!< 自定义铃声数据源数组
@property (nonatomic,strong) NSMutableArray *systemTinkleArray; //!< 系统铃声数据源数组

@end

@implementation ZMTinkleViewController


#pragma mark  DataRequest Method

#pragma mark  LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"选择铃声"];
    [self.view addSubview:self.headBackGroundImageView];
    
    [self.view addSubview:self.customView];
    [self.view addSubview:self.systemView];
    [self.systemView setHidden:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setRingName:@"开场雷声"];
}



#pragma mark  Getter/Setter Method
-(HeadImageView*)headBackGroundImageView
{
    if (_headBackGroundImageView == nil)
    {
        [_headBackGroundImageView setBackgroundColor:[UIColor redColor]];
        _headBackGroundImageView = [[HeadImageView alloc]initWithFrame:CGRectMake(0, 64, kScreen_Width, 60)];
         [_headBackGroundImageView.customTinkleButton addTarget:self action:@selector(Tinkleaction:) forControlEvents:UIControlEventTouchUpInside];
        [_headBackGroundImageView.systemTinkleButton addTarget:self action:@selector(Tinkleaction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _headBackGroundImageView;
}



-(NSMutableArray*)customTinkleArray
{
    if (_customTinkleArray == nil)
    {
        _customTinkleArray = [NSMutableArray array];
        
        
        TinkleModel *model1 = [[TinkleModel alloc]init];
        [model1 setRingName:@"特色开场"];
        [model1 setRingId:@"1"];
        [model1 setSelectType:no_select_type];
        [_customTinkleArray addObject:model1];
        
        
        TinkleModel *model2 = [[TinkleModel alloc]init];
        [model2 setRingName:@"特色唯美"];
        [model2 setRingId:@"1"];
        [model2 setSelectType:no_select_type];
        [_customTinkleArray addObject:model2];
        
        
        TinkleModel *model3 = [[TinkleModel alloc]init];
        [model3 setRingName:@"特色浪漫"];
        [model3 setRingId:@"1"];
        [model3 setSelectType:no_select_type];
        [_customTinkleArray addObject:model3];
        
        
        TinkleModel *model4 = [[TinkleModel alloc]init];
        [model4 setRingName:@"特色顶峰"];
        [model4 setRingId:@"1"];
        [model4 setSelectType:no_select_type];
        [_customTinkleArray addObject:model4];
        
        
        TinkleModel *model5 = [[TinkleModel alloc]init];
        [model5 setRingName:@"特色辐射"];
        [model5 setRingId:@"1"];
        [model5 setSelectType:no_select_type];
        [_customTinkleArray addObject:model5];
        
        TinkleModel *model6 = [[TinkleModel alloc]init];
        [model6 setRingName:@"特色海边"];
        [model6 setRingId:@"1"];
        [model6 setSelectType:select_type];
        [_customTinkleArray addObject:model6];
        
        
        
        TinkleModel *model7 = [[TinkleModel alloc]init];
        [model7 setRingName:@"特色欢乐时光"];
        [model7 setRingId:@"1"];
        [model7 setSelectType:no_select_type];
        [_customTinkleArray addObject:model7];
        
        
        TinkleModel *model8 = [[TinkleModel alloc]init];
        [model8 setRingName:@"特色缓慢上升"];
        [model8 setRingId:@"1"];
        [model8 setSelectType:no_select_type];
        [_customTinkleArray addObject:model8];
        
        TinkleModel *model9 = [[TinkleModel alloc]init];
        [model9 setRingName:@"特色煎茶"];
        [model9 setRingId:@"1"];
        [model9 setSelectType:no_select_type];
        [_customTinkleArray addObject:model9];
        
        TinkleModel *model10 = [[TinkleModel alloc]init];
        [model10 setRingName:@"特色举起"];
        [model10 setRingId:@"1"];
        [model10 setSelectType:no_select_type];
        [_customTinkleArray addObject:model10];
        
        TinkleModel *model11 = [[TinkleModel alloc]init];
        [model11 setRingName:@"特色雷达"];
        [model11 setRingId:@"1"];
        [model11 setSelectType:no_select_type];
        [_customTinkleArray addObject:model11];
        
        TinkleModel *model12 = [[TinkleModel alloc]init];
        [model12 setRingName:@"特色山顶"];
        [model12 setRingId:@"1"];
        [model12 setSelectType:no_select_type];
        [_customTinkleArray addObject:model12];
        
        TinkleModel *model13 = [[TinkleModel alloc]init];
        [model13 setRingName:@"特色山涧"];
        [model13 setRingId:@"1"];
        [model13 setSelectType:no_select_type];
        [_customTinkleArray addObject:model13];
        
        TinkleModel *model14 = [[TinkleModel alloc]init];
        [model14 setRingName:@"特色闪烁"];
        [model14 setRingId:@"1"];
        [model14 setSelectType:no_select_type];
        [_customTinkleArray addObject:model14];
        
        
        TinkleModel *model15 = [[TinkleModel alloc]init];
        [model15 setRingName:@"特色水晶"];
        [model15 setRingId:@"1"];
        [model15 setSelectType:no_select_type];
        [_customTinkleArray addObject:model15];
        
        
        
        TinkleModel *model16 = [[TinkleModel alloc]init];
        [model16 setRingName:@"特色丝绸"];
        [model16 setRingId:@"1"];
        [model16 setSelectType:no_select_type];
        [_customTinkleArray addObject:model16];
        
        TinkleModel *model17 = [[TinkleModel alloc]init];
        [model17 setRingName:@"特色往复"];
        [model17 setRingId:@"1"];
        [model17 setSelectType:no_select_type];
        [_customTinkleArray addObject:model17];
    
    }
    return _customTinkleArray;
}


-(CustomTinkleView*)customView
{
    if (_customView == nil)
    {
        _customView = [[CustomTinkleView alloc]initWithFrame:CGRectMake(0, 124, kScreen_Width, kScreen_Height-124) withCellSeparatorStyle:UITableViewCellSeparatorStyleNone withArray:self.customTinkleArray withDeletage:self];
    }
    return _customView;
}



-(NSMutableArray*)systemTinkleArray
{
    if (_systemTinkleArray == nil)
    {
        _systemTinkleArray = [NSMutableArray array];
        
        TinkleModel *model1 = [[TinkleModel alloc]init];
        [model1 setRingName:@"开场"];
        [model1 setRingId:@"1"];
        [model1 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model1];
        
        
        TinkleModel *model2 = [[TinkleModel alloc]init];
        [model2 setRingName:@"波浪"];
        [model2 setRingId:@"1"];
        [model2 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model2];
        
        
        TinkleModel *model3 = [[TinkleModel alloc]init];
        [model3 setRingName:@"灯塔"];
        [model3 setRingId:@"1"];
        [model3 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model3];
        
        
        TinkleModel *model4 = [[TinkleModel alloc]init];
        [model4 setRingName:@"顶峰"];
        [model4 setRingId:@"1"];
        [model4 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model4];
        
        
        TinkleModel *model5 = [[TinkleModel alloc]init];
        [model5 setRingName:@"辐射"];
        [model5 setRingId:@"1"];
        [model5 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model5];
        
        TinkleModel *model6 = [[TinkleModel alloc]init];
        [model6 setRingName:@"海边"];
        [model6 setRingId:@"1"];
        [model6 setSelectType:select_type];
        [_systemTinkleArray addObject:model6];
        
    

        TinkleModel *model7 = [[TinkleModel alloc]init];
        [model7 setRingName:@"欢乐时光"];
        [model7 setRingId:@"1"];
        [model7 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model7];
        
        
        TinkleModel *model8 = [[TinkleModel alloc]init];
        [model8 setRingName:@"缓慢上升"];
        [model8 setRingId:@"1"];
        [model8 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model8];
        
        TinkleModel *model9 = [[TinkleModel alloc]init];
        [model9 setRingName:@"煎茶"];
        [model9 setRingId:@"1"];
        [model9 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model9];
        
        TinkleModel *model10 = [[TinkleModel alloc]init];
        [model10 setRingName:@"举起"];
        [model10 setRingId:@"1"];
        [model10 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model10];
        
        TinkleModel *model11 = [[TinkleModel alloc]init];
        [model11 setRingName:@"雷达"];
        [model11 setRingId:@"1"];
        [model11 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model11];

        TinkleModel *model12 = [[TinkleModel alloc]init];
        [model12 setRingName:@"山顶"];
        [model12 setRingId:@"1"];
        [model12 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model12];
        
        TinkleModel *model13 = [[TinkleModel alloc]init];
        [model13 setRingName:@"山涧"];
        [model13 setRingId:@"1"];
        [model13 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model13];
        
        TinkleModel *model14 = [[TinkleModel alloc]init];
        [model14 setRingName:@"闪烁"];
        [model14 setRingId:@"1"];
        [model14 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model14];
        
        
        TinkleModel *model15 = [[TinkleModel alloc]init];
        [model15 setRingName:@"水晶"];
        [model15 setRingId:@"1"];
        [model15 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model15];
        
        
        
        TinkleModel *model16 = [[TinkleModel alloc]init];
        [model16 setRingName:@"丝绸"];
        [model16 setRingId:@"1"];
        [model16 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model16];
        
        TinkleModel *model17 = [[TinkleModel alloc]init];
        [model17 setRingName:@"往复"];
        [model17 setRingId:@"1"];
        [model17 setSelectType:no_select_type];
        [_systemTinkleArray addObject:model17];
    }
    return _systemTinkleArray;
}



-(SystemTinkleView*)systemView
{
    if (_systemView == nil)
    {
        _systemView = [[SystemTinkleView alloc]initWithFrame:CGRectMake(0, 124, kScreen_Width, kScreen_Height-124) withCellSeparatorStyle:UITableViewCellSeparatorStyleNone withArray:self.systemTinkleArray withDeletage:self];
    }
    return _systemView;
}


#pragma mark  Delegate Method





#pragma mark  Response Method
-(void)Tinkleaction:(ZMButton*)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            [self.customView setHidden:NO];
            [self.systemView setHidden:YES];
        }
            break;
        case 2:
        {
            [self.customView setHidden:YES];
            [self.systemView setHidden:NO];
        }
            break;
    }
}


#pragma mark  PrivateMethod


@end
