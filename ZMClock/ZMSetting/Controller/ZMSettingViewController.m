//
//  ZMSettingViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  设置视图控制器
//
//

#import "ZMSettingViewController.h"
#import "SettingViewModel.h"
#import "SettingTableViewCell.h"
#import "ZMRecordDiscViewController.h"

@interface ZMSettingViewController () <UITableViewDataSource,UITableViewDelegate,SettingHeaderDeletage>

/**
 设置表视图
 */
@property (nonatomic,strong) ZMTableView *settingTableView;
/**
 用于盛放数据的数组
 */
@property (nonatomic,strong) NSMutableArray *settingArray;

@end

@implementation ZMSettingViewController


#pragma mark - DataRequest Method


#pragma mark - LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.settingTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.TabBarButtonView TabBarViewHidden:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}





#pragma mark - Getter/Setter Method
-(ZMTableView*)settingTableView
{
    if (_settingTableView == nil)
    {
        _settingTableView = [[ZMTableView alloc]initWithFrame:CGRectMake(0, 44.0, kScreen_Width, kScreen_Height - 44.0) style:UITableViewStylePlain];
        [_settingTableView setDelegate:self];
        [_settingTableView setDataSource:self];
    }
    return _settingTableView;
}

-(NSMutableArray*)settingArray
{
    if (_settingArray == nil)
    {
        _settingArray = [NSMutableArray array];
        SettingViewModel *model1 = [[SettingViewModel alloc]init];
        [model1 setImageName:@"defaultPortrait"];
        [model1 setIsLogin:NO];
        [model1 setTitleText:@"天气背景"];
        [model1 setCellType:MeNoNormal];
        [model1 setCelllineType:LineAlignmentCenter];
        [model1 setAccessoryType:AccessoryNone];
        [model1 setCellHight:200.0];
        [_settingArray addObject:model1];
        
        SettingViewModel *model2 = [[SettingViewModel alloc]init];
        [model2 setImageName:@"defaultPortrait"];
        [model2 setIsLogin:NO];
        [model2 setTitleText:@"城市管理"];
        [model2 setCellType:MeNormal];
        [model2 setCelllineType:LineAlignmentCenter];
        [model2 setAccessoryType:AccessoryNone];
        [model2 setCellHight:50.0];
        [_settingArray addObject:model2];
        
        SettingViewModel *model3 = [[SettingViewModel alloc]init];
        [model3 setImageName:@"defaultPortrait"];
        [model3 setIsLogin:NO];
        [model3 setTitleText:@"通知提醒"];
        [model3 setCellType:MeNormal];
        [model3 setCelllineType:LineAlignmentCenter];
        [model3 setAccessoryType:AccessoryNone];
        [model3 setCellHight:50.0];
        [_settingArray addObject:model3];
        
        SettingViewModel *model4 = [[SettingViewModel alloc]init];
        [model4 setImageName:@"defaultPortrait"];
        [model4 setIsLogin:NO];
        [model4 setTitleText:@"意见反馈"];
        [model4 setCellType:MeNormal];
        [model4 setCelllineType:LineAlignmentCenter];
        [model4 setAccessoryType:AccessoryNone];
        [model4 setCellHight:50.0];
        [_settingArray addObject:model4];
        
        SettingViewModel *model5 = [[SettingViewModel alloc]init];
        [model5 setImageName:@"defaultPortrait"];
        [model5 setIsLogin:NO];
        [model5 setTitleText:@"给我们评分吧"];
        [model5 setCellType:MeNormal];
        [model5 setCelllineType:LineAlignmentCenter];
        [model5 setAccessoryType:AccessoryNone];
        [model5 setCellHight:50.0];
        [_settingArray addObject:model5];
        
        SettingViewModel *model6 = [[SettingViewModel alloc]init];
        [model6 setImageName:@"defaultPortrait"];
        [model6 setIsLogin:NO];
        [model6 setTitleText:@"关于"];
        [model6 setCellType:MeNormal];
        [model6 setCelllineType:LineAlignmentCenter];
        [model6 setAccessoryType:AccessoryNone];
        [model6 setCellHight:50.0];
        [_settingArray addObject:model6];
        
        SettingViewModel *model7 = [[SettingViewModel alloc]init];
        [model7 setImageName:@"defaultPortrait"];
        [model7 setIsLogin:NO];
        [model7 setTitleText:@"产品概述"];
        [model7 setCellType:MeNormal];
        [model7 setCelllineType:LineAlignmentCenter];
        [model7 setAccessoryType:AccessoryNone];
        [model7 setCellHight:50.0];
        [_settingArray addObject:model7];
        
    }
    return _settingArray;
}



#pragma mark - Delegate Method
#pragma mark SettingHeaderDeletage
-(void)settingHeaderAction:(ZMButton*)sender
{
    [self.navigationController pushViewController:[[ZMRecordDiscViewController alloc] init]animated:YES];
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.settingArray count]>0 ? [self.settingArray count] : 0;
}

- (SettingTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[SettingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setModel:self.settingArray[indexPath.row]];
    [cell.headerView setHeaderDeletage:self];
    return cell;
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.settingArray[indexPath.row] cellHight];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"你好啊!");
//     [self.TabBarButtonView TabBarViewHidden:1];
}

#pragma mark - Response Method


#pragma mark - PrivateMethod
@end
