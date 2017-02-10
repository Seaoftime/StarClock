//
//  ZMRecordViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMClockRecordViewController.h"
#import "ZMClockStartRecordViewController.h"
#import "WeatherRecordTableViewCell.h"
#import "WeatherRecordModel.h"
#import "ZMClockCreateRecordViewController.h"
#import "CreateRecordToolView.h"
#import "ZMClockCreateRecordViewController.h"
#import "TraBookAVAudioRecorder.h"



@interface ZMClockRecordViewController () <UITableViewDataSource,UITableViewDelegate,CreateRecordToolViewDeletage,WeatherRecordViewTableViewContentViewDeletage>

/**
 录音表视图
 */
@property (nonatomic,strong) UITableView *recordTableView;

/**
 所有数据的数组
 */
@property (nonatomic,strong) NSMutableArray *allContentArray;


@property (nonatomic,strong) CreateRecordToolView *toolBarView;


@end

@implementation ZMClockRecordViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:PinkColor];
    [self setNavRightBtnHidden:YES];
    [self setTitle:@"录制语音"];
    
    
    //添加录音DIY表视图
    [self.view addSubview:self.recordTableView];
    [self.view addSubview:self.toolBarView];
    
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([[NSUserDefaults objectForKey:@"闹钟录音"] isEqualToString:@"闹钟录音完毕"])
    {
        [self.toolBarView.createButton setBackViewEnabled:YES];
    }
    else if ([[NSUserDefaults objectForKey:@"闹钟录音"] isEqualToString:@"生成闹钟录音完毕"])
    {
        [self.toolBarView.clearButton setHidden:NO];
        [self.toolBarView.createButton setHidden:YES];
        [self.toolBarView.resetButton setHidden:NO];
    }
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}




#pragma mark - Getter / Setter
-(UITableView *)recordTableView
{
    if (_recordTableView == nil)
    {
        _recordTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-(60+70)) style:UITableViewStylePlain];
        [_recordTableView setBackgroundColor:PinkColor];
        [_recordTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_recordTableView setDelegate:self];
        [_recordTableView setDataSource:self];
    }
    return _recordTableView;
}


-(NSMutableArray*)allContentArray
{
    if (_allContentArray == nil)
    {
        _allContentArray = [NSMutableArray array];
        
        _allContentArray = [[SQLiteDBManage sharedInstance] selectClockTable];
        
    }
    return _allContentArray;
}



-(CreateRecordToolView*)toolBarView
{
    if (_toolBarView == nil)
    {
        _toolBarView = [[CreateRecordToolView alloc]initWithFrame:CGRectMake(0, kScreen_Height-70, kScreen_Width, 70) setDeletage:self];
        [_toolBarView setBackgroundColor:RGB(106.0,221.0, 255.0)];
    }
    return _toolBarView;
}


#pragma mark - Deletage 代理方法
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.allContentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[WeatherRecordTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.tableViewContentView setContentModel:self.allContentArray[indexPath.row]];
    [cell.tableViewContentView setDeletage:self];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     固定值为75
     */
    return 75;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherRecordModel *model = self.allContentArray[indexPath.row];
    switch (model.weatherRecordType)
    {
        case WeatherNoRecordType:
        {
            TopicAlertView *alertView = [[TopicAlertView alloc]initWithTitle:@"录音提示" withMessage:@"请按照顺序录音" delegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
            [alertView show];
        }
            break;
        case WeatherCanRecordType:
        {
            NSLog(@"你可以录音");
            
            
            
            
            ZMClockStartRecordViewController *clock = [[ZMClockStartRecordViewController alloc] init];
            [clock setTransferArray:self.allContentArray];
            [clock setTransferTableView:self.recordTableView];
            [clock setIndexPath:indexPath.row];
            [clock setRecordModel:model];
            
            [self.navigationController pushViewController:clock animated:YES];
        }
            break;
        case WeatherRecordDoneType:
            break;
    }
    
}


#pragma mark 弹出框代理方法
-(void)topicAlertButton:(nonnull ZMButton*)sender
{
    
}


#pragma mark CreateRecordToolViewDeletage 代理方法
-(void)createRecordToolButtonAction:(ZMButton*)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            NSLog(@"清空重录");
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[[ZMClockCreateRecordViewController alloc] init] animated:YES];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[ZMClockCreateRecordViewController alloc]init] animated:YES];
        }
            break;
    }
}

#pragma mark WeatherRecordViewTableViewContentViewDeletage 代理方法 (点击播放按钮)
-(void)playRecordButton:(ZMButton *)sender
{
    switch (sender.recordModel.weatherRecordType)
    {
        case WeatherRecordDoneType:
        {
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncSartPlayWithPreparePathFileName:sender.recordModel.number withRecordType:ColockRecord Completion:^(NSString *recordPath)
             {
                 
             }];
        }
            break;
        case WeatherNoRecordType:
        case WeatherCanRecordType:
            break;
    }
}



-(void)recordButtonAction:(ZMButton *)sender
{
    
}




@end
