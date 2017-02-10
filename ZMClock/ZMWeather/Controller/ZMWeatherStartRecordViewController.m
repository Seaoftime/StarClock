//
//  ZMWeatherStartRecordViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMWeatherStartRecordViewController.h"
#import "RecordView.h"
#import "WeatherRecordModel.h"
#import "TraBookAVAudioRecorder.h"


@interface ZMWeatherStartRecordViewController () <RecordViewDeletage>

@property (nonatomic,strong) RecordView *recordView;



@end

@implementation ZMWeatherStartRecordViewController



-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:PinkColor];
    
    [self setNavRightBtnHidden:YES];
    [self.view addSubview:self.recordView];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTitle:self.recordModel.recordContent];
    [self.recordView.tipTitleLabel setText:self.recordModel.recordContent];
}



-(RecordView*)recordView
{
    if (_recordView == nil)
    {
        _recordView = [[RecordView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) setDeletage:self];
    }
    return _recordView;
}




#pragma mark - Deletage 代理方法
#pragma mark RecordViewDeletage 代理方法
-(void)recordViewButtonAction:(ZMButton *)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncSartPlayWithPreparePathFileName:self.recordModel.number withRecordType:WeatherRecord Completion:^(NSString *recordPath)
            {
                NSLog(@"播放文件路径:%@",recordPath);
            }];
        }
            break;
        case 3:
        {
            NSLog(@"完成");
            [self.transferArray enumerateObjectsUsingBlock:^(WeatherRecordModel   * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
            {
                if (self.indexPath == idx)
                {
                    [obj setWeatherRecordType:WeatherRecordDoneType];
                    
                    /**
                     更新当前这条录音为可以录音状态
                     */
                    [[SQLiteDBManage sharedInstance] updateWeatherTableWithrecordContent:self.recordModel.number withrecordType:@"2"];
                    
                    if ([obj isEqual:[self.transferArray lastObject]])
                    {
                        NSLog(@"这是最后一个了，你可以做一些其他处理");
                        [NSUserDefaults setObject:@"天气录音完毕" forKey:@"天气录音"];
                        
                        
                        
                        
                    }
                    else
                    {
                        obj = self.transferArray[idx + 1];
                        [obj setWeatherRecordType:WeatherCanRecordType];
                        /**
                         更新当前这条录音为可以录音状态
                         */
                        [[SQLiteDBManage sharedInstance] updateWeatherTableWithrecordContent:obj.number withrecordType:@"1"];
                    }
                    *stop = YES;
                }
            }];
            [self.transferTableView reloadData];
            
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 20:
        {
            NSLog(@"开始录音");
            
            [self startTime:YES];
            
            
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncStartRecordingWithPreparePathFileName:self.recordModel.number withRecordType:WeatherRecord completion:^(NSError *error)
            {
                if (error)
                {
                    NSLog(@"录音有错误！");
                }
            }];
            
            
        }
            break;
        case 30:
        {
            
            [self startTime:NO];
            NSLog(@"停止");
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncStopRecordingWithCompletion:^(NSString *recordPath)
            {
                NSLog(@"录音路径:%@",recordPath);
            }];
        }
            break;
        case 40:
        {
            NSLog(@"重录");
            [self startTime:YES];
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncStartRecordingWithPreparePathFileName:self.recordModel.number withRecordType:WeatherRecord completion:^(NSError *error)
             {
                 if (error)
                 {
                     NSLog(@"录音有错误！");
                 }
             }];
        }
            break;
    }
}


#pragma mark Private 
-(void)startTime:(BOOL)start
{
}

@end
