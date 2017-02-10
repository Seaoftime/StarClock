//
//  ZMDIYClockViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMDIYClockViewController.h"
#import "DIYClockTableViewCell.h"
#import "ZMClockRecordViewController.h"
#import "DropperAVAudioPlayer.h"
#import "AVAudioPlayerHelper.h"

///////////
#import "ZMClockViewController.h"
//#import "ZMClockPersonalityMusicViewController.h"

@interface ZMDIYClockViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *diyTableView; //!< diy表视图
@property (nonatomic,strong) NSMutableArray *diyArray; //!< diy数组
@end

@implementation ZMDIYClockViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"闹钟DIY"];
    [self.view setBackgroundColor:RGBAlpha(253, 239, 253, 1.0)];
    [self.view addSubview:self.diyTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSMutableArray*)diyArray
{
    if (_diyArray == nil)
    {
        _diyArray = [NSMutableArray array];
        [_diyArray addObject:@"报时语音DIY"];
        [_diyArray addObject:@"闹铃语音DIY"];
    }
    return _diyArray;
}


-(UITableView *)diyTableView
{
    if (_diyTableView == nil)
    {
        _diyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, kScreen_Width, kScreen_Height-40) style:UITableViewStylePlain];
        [_diyTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_diyTableView setDelegate:self];
        [_diyTableView setDataSource:self];
        [_diyTableView setBackgroundColor:[UIColor clearColor]];
    }
    return _diyTableView;
}




#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            ZMClockRecordViewController *recordVC = [[ZMClockRecordViewController alloc] init];
            
            [self.navigationController pushViewController:recordVC animated:YES];
        }
            break;
        case 1:
        {
            //ZMClockPersonalityMusicViewController *personalityVC = [ZMClockPersonalityMusicViewController sharedClockPersonalityMusicViewController];
            
            //ZMMusicDownloadViewController *music = [[ZMMusicDownloadViewController alloc] init];
            
            //[self.navigationController pushViewController:music animated:YES];
            
        }
            break;
    }
    
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.diyArray count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DIYClockTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[DIYClockTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withHight:80.0];
    }
    [cell.textLabel setText:self.diyArray[indexPath.row]];
    return cell;
}

-(void)navLeftBtnAction:(UIButton *)sender
{
   // [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
    [self.navigationController pushViewController:[[ZMClockViewController alloc]init] animated:YES];
    
     //判断闹钟 DIY任务是否完成
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
           
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign };
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"alarm/add_alarm_diy.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     
                     if ([data count])
                     {
                         NSDictionary*task=[data objectForKey:@"task"];
                         if ([task isEqual:@""])
                             
                         {
                             
                         }
                         
                         else
                         {
                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                             if (task_id==8)
                             {
                                 
                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                             }
                         }
                     }
                 }
             }
            error:^(NSError *error) {}];
        }
    }
    else
    {
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }

    
    



}




#pragma mark - 播报当前时间(根据当前录音播放当前的录音)
-(void)navRightBtnAction:(UIButton *)sender
{
    [[DropperAVAudioPlayer sharedAVAudioPlayer] startWithArray:[[AVAudioPlayerHelper sharedPlayerHelper] startPlayClockRecord:YES] withType:ClockPlay];
}

@end
