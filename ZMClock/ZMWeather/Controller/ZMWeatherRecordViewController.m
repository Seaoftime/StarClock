//
//  ZMWeatherRecordViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMWeatherRecordViewController.h"
#import "WeatherRecordTableViewCell.h"
#import "WeatherRecordModel.h"
#import "ZMWeatherStartRecordViewController.h"
#import "CreateRecordToolView.h"
#import "ZMWeatherCreateRecordViewController.h"
#import "TraBookAVAudioRecorder.h"
#import "DropperAVAudioPlayer.h"
#import "AVAudioPlayerHelper.h"





@interface ZMWeatherRecordViewController () <UITableViewDataSource,UITableViewDelegate,TopicAlertViewDeletage,CreateRecordToolViewDeletage,WeatherRecordViewTableViewContentViewDeletage>

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

@implementation ZMWeatherRecordViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:PinkColor];
    [self setTitle:@"录制语音"];
    [self setNavRightBtnImage:@"播放DIY"];
    
    //添加录音DIY表视图
    [self.view addSubview:self.recordTableView];
    [self.view addSubview:self.toolBarView];
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([[NSUserDefaults objectForKey:@"天气录音"] isEqualToString:@"天气录音完毕"])
    {
        [self.toolBarView.createButton setBackViewEnabled:YES];
    }
    else if ([[NSUserDefaults objectForKey:@"闹钟录音"] isEqualToString:@"生成天气录音完毕"])
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
        
        
        _allContentArray = [[SQLiteDBManage sharedInstance] selectWeatherTable];
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
    [cell.tableViewContentView setDeletage:self];
    [cell.tableViewContentView setContentModel:self.allContentArray[indexPath.row]];
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
            NSLog(@"你可以录音%@",model.recordContent);
            
        

            
            ZMWeatherStartRecordViewController *weather = [[ZMWeatherStartRecordViewController alloc] init];
            [weather setTransferArray:self.allContentArray];
            [weather setTransferTableView:self.recordTableView];
            [weather setIndexPath:indexPath.row];
            [weather setRecordModel:model];
            [self.navigationController pushViewController:weather animated:YES];
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
            
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[[ZMWeatherCreateRecordViewController alloc] init] animated:YES];
        }
            break;
        case 3:
        {
            
        }
            break;
    }
}


#pragma mark WeatherRecordViewTableViewContentViewDeletage 点击播放按钮代理
-(void)playRecordButton:(ZMButton *)sender
{
    
    switch (sender.recordModel.weatherRecordType)
    {
        case WeatherRecordDoneType:
        {
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncSartPlayWithPreparePathFileName:sender.recordModel.number withRecordType:WeatherRecord Completion:^(NSString *recordPath)
             {
                 NSLog(@"播放文件路径:%@",recordPath);
             }];
        }
            break;
        case WeatherNoRecordType:
        case WeatherCanRecordType:
            break;
    }
}





#pragma mark 右侧按钮触发的方法 (开始天气语音播报)
-(void)navRightBtnAction:(UIButton *)sender
{
    [[DropperAVAudioPlayer sharedAVAudioPlayer] startWithArray:[[AVAudioPlayerHelper sharedPlayerHelper] startPlayWeatherRecord:YES] withType:WeatherPlay];
    
}




@end
