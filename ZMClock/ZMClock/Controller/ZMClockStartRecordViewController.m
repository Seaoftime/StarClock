//
//  ZMStartRecordViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/12.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMClockStartRecordViewController.h"
#import "TraBookAVAudioRecorder.h"

#import "RecordView.h"
#import "WeatherRecordModel.h"


@interface ZMClockStartRecordViewController () <RecordViewDeletage>

@property (nonatomic,strong) RecordView *recordView;

@end

@implementation ZMClockStartRecordViewController








-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:PinkColor];
    [self setNavRightBtnHidden:YES];
    
    [self.view addSubview:self.recordView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:self.recordModel.recordContent];
    [self setTitle:self.recordModel.recordContent];
    [self.recordView.tipTitleLabel setText:self.recordModel.recordContent];
    NSLog(@"%@",self.recordModel.recordContent);
}






#pragma mark - Deletage 代理方法
#pragma mark RecordViewDeletage 代理方法
-(void)recordViewButtonAction:(ZMButton *)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncSartPlayWithPreparePathFileName:self.recordModel.number withRecordType:ColockRecord Completion:^(NSString *recordPath)
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
                      更新当前这条录音为完成状态
                      */
                     [[SQLiteDBManage sharedInstance] updateClockTableWithrecordContent:obj.number withrecordType:@"2"];
                     if ([obj isEqual:[self.transferArray lastObject]])
                     {
                         [NSUserDefaults setObject:@"闹钟录音完毕" forKey:@"闹钟录音"];
                         NSLog(@"这是最后一个了，你可以做一些其他处理");
                        
                     }
                     else
                     {
                         obj = self.transferArray[idx + 1];
                         [obj setWeatherRecordType:WeatherCanRecordType];
                         /**
                          更新当前这条录音为可以状态
                          */
                         [[SQLiteDBManage sharedInstance] updateClockTableWithrecordContent:obj.number withrecordType:@"1"];
                         
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
            NSLog(@"开始录制");
            
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncStartRecordingWithPreparePathFileName:self.recordModel.number withRecordType:ColockRecord completion:^(NSError *error)
            {
                if (error)
                {
                    NSLog(@"是有问题的@");
                }
                
            }];
            
        }
            break;
        case 30:
        {
            NSLog(@"停止");
            
            
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncStopRecordingWithCompletion:^(NSString *recordPath)
             {
                 NSLog(@"文件名字:%@",recordPath);
                 
             }];
        }
            break;
        case 40:
        {
            NSLog(@"重录");
            
            
            [[TraBookAVAudioRecorder shareAVAudioRecorder] asyncStartRecordingWithPreparePathFileName:self.recordModel.number withRecordType:ColockRecord completion:^(NSError *error)
             {
                 if (error)
                 {
                     NSLog(@"是有问题的@");
                 }
                 
             }];
        }
            break;
    }
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(RecordView*)recordView
{
    if (_recordView == nil)
    {
        _recordView = [[RecordView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) setDeletage:self];
    }
    return _recordView;
}

@end
