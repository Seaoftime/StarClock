//
//  ZMCLockChooseLoveDouViewController22.m
//  ZMClock
//
//  Created by ZhongMeng on 16/11/17.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMCLockChooseLoveDouViewController22.h"


#import "ZMClockChooseLoveDouTableViewCell.h"
#import "ZMClockChooseLoveDouModel.h"
#import <AVFoundation/AVFoundation.h>
#import "FGGDownloadManager.h"

#import "ZMClockViewController.h"




#define BG_COLOR RGB(175, 129, 139)



#define kDocumentPath (NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0])





@interface ZMCLockChooseLoveDouViewController22 ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UISegmentedControl * segmentedContrl;
@property (nonatomic, strong) UITableView *chooseBoyTableV;
@property (nonatomic, strong) UITableView *chooseGirllTableV;

@property (nonatomic, strong) NSMutableArray *loveDouArray;
@property (nonatomic, strong) NSMutableArray *loveGirrlDouArray;


@property (nonatomic, strong) AVPlayer *onlinePlayer;

@property (nonatomic, strong) UILabel *shuomingLb;//下方说明
@property (nonatomic, strong) ZMClockChooseLoveDouModel *loveDoModel;
@property (nonatomic, strong) UIImageView *clockListBgImgV;
@property (nonatomic, strong) UIView *shuomingBgv;




@end

@implementation ZMCLockChooseLoveDouViewController22

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    self.view.backgroundColor = BG_COLOR;
    
    
    self.loveDouArray = [NSMutableArray array];
    
    
    self.clockListBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64)];
    self.clockListBgImgV.userInteractionEnabled = YES;
    self.clockListBgImgV.image = IMAGE(@"clock背景图片");
    
    [self.view addSubview:self.clockListBgImgV];
    
    
    
    [self setupUI];
    
    
    [self getChooseLoveDouNetData];//请求数据
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //
        [self getChooseLoveDouNetData_Girl];
        
        
        //通知主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    });
    
    
    

    
    
}






- (void)getChooseLoveDouNetData
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        NSDictionary *parmeters = @{@"dev_unique_id":@"22335545466", @"gender":@"1", @"start_seq":@"0", @"end_seq":@"1", @"per_page":@"20", @"action_update_his":@"1"};
        
        [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"alarm/get_alarm_voice_list.php" theParmeters:parmeters sucess:^(id object) {
            //
            NSLog(@"男神铃声__________%@",object);
            
            NSString *status = (NSString *)[object objectForKey:@"status"];
            
            
            if ([status isEqualToString:@"0"] ) {
                //
                
                //                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //                    // 耗时的操作
                //                    dispatch_async(dispatch_get_main_queue(), ^{
                //                        // 更新界面
                //                    });
                //                });
                //
                
                self.loveDouArray = [ZMClockChooseLoveDouModel parseRespondsChooseLoveDouData:object];
                
                //NSLog(@"数组______%@",self.loveDouArray);
                
                [self.chooseBoyTableV reloadData];
                
                
            }
            
            
        } error:^(NSError *error) {
            //
            NSLog(@"%@",error);
            
        }];
        
        
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
    
}


- (void)getChooseLoveDouNetData_Girl
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        NSDictionary *parmeters = @{@"dev_unique_id":@"22335545466", @"gender":@"2", @"start_seq":@"0", @"end_seq":@"1", @"per_page":@"20", @"action_update_his":@"1"};
        
        [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"alarm/get_alarm_voice_list.php" theParmeters:parmeters sucess:^(id object) {
            //
            NSLog(@"女神铃声__________%@",object);
            
            NSString *status = (NSString *)[object objectForKey:@"status"];
            
            
            if ([status isEqualToString:@"0"] ) {
                //
                self.loveGirrlDouArray = [ZMClockChooseLoveDouModel parseRespondsChooseLoveDouData:object];
                
                
                [self.chooseGirllTableV reloadData];
                
                
            }
            
            
        } error:^(NSError *error) {
            //
            NSLog(@"%@",error);
            
        }];
        
        
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
    
}







#pragma mark --------------------------------- UI
- (void)setupUI
{
    
    [self.clockListBgImgV addSubview:self.segmentedContrl];
    
    [self.clockListBgImgV addSubview:self.chooseBoyTableV];
    [self.clockListBgImgV addSubview:self.chooseGirllTableV];
    
    self.chooseGirllTableV.hidden = YES;
    
    
    
    
    self.shuomingBgv = [[UIView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 60, kScreen_Width , 60)];
    self.shuomingBgv.backgroundColor = MAIN_MAIN_APP_COLOR;
    [self.view addSubview:self.shuomingBgv];
    
    [self.shuomingBgv addSubview:self.shuomingLb];
    
}



- (UISegmentedControl *)segmentedContrl
{
    
    if (!_segmentedContrl) {
        _segmentedContrl = [[UISegmentedControl alloc]initWithItems:@[@"选男神" ,@"选女神"]];
        _segmentedContrl.frame = CGRectMake(kScreen_Width/2 - 90,  20 - 3, 180, 33);
        _segmentedContrl.backgroundColor = [UIColor whiteColor];
        
        
        //修改字体大小
        UIFont *font = [UIFont boldSystemFontOfSize:17.0f];
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        [_segmentedContrl setTitleTextAttributes:attributes forState:UIControlStateNormal];
        
        
        
        _segmentedContrl.layer.cornerRadius = 5;
        _segmentedContrl.layer.masksToBounds = YES;
        
        _segmentedContrl.tintColor = MAIN_MAIN_APP_COLOR;
        
        _segmentedContrl.selectedSegmentIndex = 0;
        
        [_segmentedContrl addTarget:self action:@selector(segmentedContrlChanged:)forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedContrl;
}


- (UITableView *)chooseBoyTableV
{
    if (!_chooseBoyTableV) {
        
        _chooseBoyTableV = [[UITableView alloc] initWithFrame:CGRectMake(15, 84 + 45 - 64 + 10, kScreen_Width - 30, kScreen_Height - 84 - 45 - 60 - 10)];
        _chooseBoyTableV.backgroundColor = [UIColor clearColor];
        _chooseBoyTableV.dataSource = self;
        _chooseBoyTableV.delegate = self;
        
        _chooseBoyTableV.showsVerticalScrollIndicator = NO;
        
        //_boySpeakerTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _chooseBoyTableV.tableFooterView = [UIView new];
    }
    
    return _chooseBoyTableV;
}


- (UITableView *)chooseGirllTableV
{
    if (!_chooseGirllTableV) {
        
        _chooseGirllTableV = [[UITableView alloc] initWithFrame:CGRectMake(15, 84 + 45 - 64 + 10, kScreen_Width - 30, kScreen_Height - 84 - 45 - 60 - 10)];
        _chooseGirllTableV.backgroundColor = [UIColor clearColor];
        _chooseGirllTableV.dataSource = self;
        _chooseGirllTableV.delegate = self;
        
        _chooseGirllTableV.showsVerticalScrollIndicator = NO;
        
        //_boySpeakerTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _chooseGirllTableV.tableFooterView = [UIView new];
    }
    
    return _chooseGirllTableV;
}


- (UILabel *)shuomingLb
{
    if (!_shuomingLb) {
        
        _shuomingLb = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreen_Width - 20, 60)];
        _shuomingLb.backgroundColor = MAIN_MAIN_APP_COLOR;
        _shuomingLb.numberOfLines = 0;
        _shuomingLb.text = @"男神女神铃声和图片来源于网友整理分享,如有侵权请联系我们,我们将会删除。";
        _shuomingLb.font = [UIFont systemFontOfSize:16];
        _shuomingLb.textColor = [UIColor whiteColor];
        _shuomingLb.textAlignment = NSTextAlignmentLeft;
    }
    return _shuomingLb;
}


- (void)segmentedContrlChanged:(UISegmentedControl *)sender
{
    if (self.chooseGirllTableV.hidden) {
        
        self.chooseBoyTableV.hidden = YES;
        self.chooseGirllTableV.hidden = NO;
        
        
        [self.chooseGirllTableV reloadData];
        
    }else if (self.chooseBoyTableV.hidden) {
        
        self.chooseGirllTableV.hidden = YES;
        self.chooseBoyTableV.hidden = NO;
        
        [self.chooseBoyTableV reloadData];
        
    }else {
        
    }
    
}




#pragma mark -------------------------------TableView 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.chooseBoyTableV) {
        
        return self.loveDouArray.count;
        
    } else {
        
        return self.loveGirrlDouArray.count;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 15)];
    sectionHeadBackgroundView.backgroundColor = [UIColor clearColor];
    return sectionHeadBackgroundView;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 25)];
    sectionHeadBackgroundView.backgroundColor = [UIColor clearColor];
    return sectionHeadBackgroundView;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 25;
}




///--------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    if (tableView == self.chooseBoyTableV) {
    //        return self.loveDouArray.count;
    //    } else {
    //
    //        return self.loveGirrlDouArray.count;
    //    }
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return (kScreen_Width - 30)/3;
    
}







- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.chooseBoyTableV) {
        //
        static NSString *cellidd = @"chooseLove";
        
        ZMClockChooseLoveDouTableViewCell *cell= [self.chooseBoyTableV dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMClockChooseLoveDouTableViewCell" owner:self options:nil] lastObject];
        }
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = [UIColor whiteColor];
        
        ZMClockChooseLoveDouModel *model = [self.loveDouArray objectAtIndex:indexPath.section];
        
        [cell.peopleImgV sd_setImageWithURL:[NSURL URLWithString:model.voice_pic]];
        
        //UIImage *immgg = cell.peopleImgV.image;
        
        
        cell.peopleNameLb.text = model.author_name;
        
        
        
        //试听按钮
        cell.listenBtn.backgroundColor = [UIColor clearColor];
        [cell.listenBtn setTitle:@"暂停" forState:UIControlStateNormal];
        [cell.listenBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        [cell.listenBtn setBackgroundImage:[UIImage imageNamed:@"song_item_play"] forState:UIControlStateNormal];
        //[cell.listenBtn setBackgroundImage:[UIImage imageNamed:@"songPause@2x"] forState:UIControlStateNormal];
        
        
        cell.listenBtn.tag = indexPath.section;
        
        
        [cell.listenBtn addTarget:self action:@selector(listenBtnClickedt:) forControlEvents:UIControlEventTouchUpInside];
        
        
        ///////////选他按钮
        
        //
        
        cell.chooseBtn.tag = indexPath.section;
        
        
        //[cell.chooseBtn addTarget:self action:@selector(chooseBtntnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell setLoveModel:model];
        
        //[cell updateChooseRingCellWithModel:model];
        
        //点击下载按钮时回调的代码块
        //__weak typeof(cell) weakCell = cell;
        
        cell.downloadBlock = ^(UIButton *sender){
            
            
            
            if (self.loveDoModel) {
                self.loveDoModel.choose_isSelected = !self.loveDoModel.choose_isSelected;
            }
            
            
            ZMClockChooseLoveDouModel *model = self.loveDouArray[indexPath.section];
            
            
            
            
            
            
            if (!model.choose_isSelected) {
                model.choose_isSelected = !model.choose_isSelected;
                self.loveDoModel = model;
            }
            
            
            [self.chooseBoyTableV reloadData];
            
            
            
            
            
            
            
            if([sender.currentTitle isEqualToString:@"选他"] ) {
                
                
                
//                BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:model.voice_pathh];
//                
//                if(exist) {
//                    
//                    
//                    [NSUserDefaults standardUserDefaults].clockListHeadPoritStr = model.clocklist_pic;
//                    
//                    [NSUserDefaults standardUserDefaults].clockRRinggStr = model.voice_pathh;
//                    
//                 
//                    
//                    
//                    [self.navigationController popViewControllerAnimated:YES];
//                    
//                    
//                    
//                    
//                    
//                } else {
//                    
//                    //添加下载任务
//                    [[FGGDownloadManager shredManager] downloadWithUrlString:model.voice_url toPath:model.voice_pathh process:^(float progress, NSString *sizeString, NSString *speedString) {
//                        
//                        
//                        
//                        
//                        
//                        //////通知下载的 url
//                        [NSUserDefaults standardUserDefaults].notifyDownloaddStt = model.voice_url;
//                        
//                        //////通知下载的 路径
//                        [NSUserDefaults standardUserDefaults].notifyDnloadPaath = model.voice_pathh;
//                        
//                        
//                        
//                        
//                        
//                        NSLog(@"下载路径___%@",model.voice_pathh);
//                        
//                        
//                    } completion:^{
//                        
//                        
//                        //插入一条数据
//                        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                            [model save];
//                        });
//                        
//                        
//                        
//                        
//                        
//                        [NSUserDefaults standardUserDefaults].notifyDnloadPaath = model.author_name;
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        ///-----------------------------------------⏰闹钟设置
//                       
//                        [NSUserDefaults standardUserDefaults].clockListHeadPoritStr = model.clocklist_pic;
//                        
//                        
//                        
//                        [NSUserDefaults standardUserDefaults].clockRRinggStr = model.voice_pathh;
//                        
//                        
//                        ///-------------------------------------------------
//                        
//                        [sender setTitle:@"已选" forState:UIControlStateNormal];
//                        
//                     
//                        
//                        
//                        [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"下载完成"] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
//                        
//                        
//                        
//                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                            //
//                            
//                            [self.navigationController popViewControllerAnimated:YES];
//                            
//                           
//                            
//                            
//                        });
//                        
//                        
//                        
//                        
//                        
//                        
//                    } failure:^(NSError *error) {
//                        
//                        [[FGGDownloadManager shredManager] cancelDownloadTask:model.voice_url];
//                        
//                        
//                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                        [alert show];
//                        
//                        
//                    }];
//                    
//                    
//                    
//                }
//
                
                
                NSString *urlStrr = model.voice_url; //下载文件地址
                
                NSURL *downloadUrl = [NSURL URLWithString:urlStrr];
                
                NSURLRequest *requestt = [[NSURLRequest alloc] initWithURL:downloadUrl];
                
                NSData *downloadData = [NSURLConnection sendSynchronousRequest:requestt returningResponse:nil error:nil];
                
                
                
                NSFileManager *fileManagerr = [NSFileManager defaultManager];
                
                NSString *filePathStrr = [kDocumentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp3",model.author_name]];
                
                BOOL filePath_isExist = [fileManagerr createFileAtPath:filePathStrr contents:downloadData attributes:nil];
                
                if (filePath_isExist) {
                    //
                    
//                    //插入一条数据
//                    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                        
//                        model.voice_pathh = filePathStrr;
//                        
//                        
//                        [model save];
//                        
//                    });
                    
                    
                    [NSUserDefaults standardUserDefaults].clockListHeadPoritStr = model.clocklist_pic;
                    
                    
                    [NSUserDefaults standardUserDefaults].clockRRinggStr = filePathStrr;
                    
                    
                    
                    [NSUserDefaults standardUserDefaults].notifyDownloaddStt = model.voice_url;
                    
                    
                    
                    [downloadData writeToFile:filePathStrr atomically:YES];
                    
                    
                    
                    
                    [sender setTitle:@"已选" forState:UIControlStateNormal];




                    [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"下载完成"] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];



                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        //
                        [self.navigationController popViewControllerAnimated:YES];
                        

                    });
                        
                        
                    
                    
                }
                
                
                
                
                
                
            
                
                
            }
            
            
            
            
            
            
            
            
            
        };
        
        
        
        
        
        return cell;
        
        
        
        
        
    } else {
        
        static NSString *cellidd = @"chooseLove";
        
        ZMClockChooseLoveDouTableViewCell *cell= [self.chooseGirllTableV dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMClockChooseLoveDouTableViewCell" owner:self options:nil] lastObject];
        }
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = [UIColor whiteColor];
        
        [cell.chooseBtn setTitle:@"选她" forState:UIControlStateNormal];
        
        ZMClockChooseLoveDouModel *model = [self.loveGirrlDouArray objectAtIndex:indexPath.section];
        
        [cell.peopleImgV sd_setImageWithURL:[NSURL URLWithString:model.voice_pic]];
        
        //UIImage *immgg = cell.peopleImgV.image;
        
        
        cell.peopleNameLb.text = model.author_name;
        
        
        ///-----------------------------------------------
        //试听按钮
        cell.listenBtn.backgroundColor = [UIColor clearColor];
        [cell.listenBtn setTitle:@"暂停" forState:UIControlStateNormal];
        [cell.listenBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        [cell.listenBtn setBackgroundImage:[UIImage imageNamed:@"song_item_play"] forState:UIControlStateNormal];
        //[cell.listenBtn setBackgroundImage:[UIImage imageNamed:@"songPause@2x"] forState:UIControlStateNormal];
        
        
        cell.listenBtn.tag = indexPath.section;
        
        
        [cell.listenBtn addTarget:self action:@selector(girl_listenBtnClickedt:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        ///--------------------------------------------------
        cell.chooseBtn.tag = indexPath.section;
        
        
        //[cell.chooseBtn addTarget:self action:@selector(chooseBtntnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell setLoveGirllModel:model];
        //[cell updateChooseRingCellWithModel:model];
        
        //点击下载按钮时回调的代码块
        //__weak typeof(cell) weakCell = cell;
        
        cell.downloadBlock = ^(UIButton *sender){
            
            
            
            
            
            
            if (self.loveDoModel) {
                self.loveDoModel.choose_isSelected = !self.loveDoModel.choose_isSelected;
            }
            
            
            ZMClockChooseLoveDouModel *model = self.loveGirrlDouArray[indexPath.section];
            
            if (!model.choose_isSelected) {
                model.choose_isSelected = !model.choose_isSelected;
                self.loveDoModel = model;
            }
            
            
            [self.chooseGirllTableV reloadData];
            
            
            
            
            
            
            
            if([sender.currentTitle isEqualToString:@"选她"] )
            {
                
                
//                BOOL exist = [[NSFileManager defaultManager] fileExistsAtPath:model.voice_pathh];
//                
//                if(exist) {
//                    
//                    
//                    [NSUserDefaults standardUserDefaults].clockListHeadPoritStr = model.clocklist_pic;
//                    
//                    ////测试
//                    [NSUserDefaults standardUserDefaults].clockRRinggStr = model.voice_pathh;
//                    //[NSUserDefaults standardUserDefaults].clockRRinggStr = model.voice_url;
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    [self.navigationController popViewControllerAnimated:YES];
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                } else {
//                    
//                    //添加下载任务
//                    [[FGGDownloadManager shredManager] downloadWithUrlString:model.voice_url toPath:model.voice_pathh process:^(float progress, NSString *sizeString, NSString *speedString) {
//                        
//                        
//                        
//                        //[AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"下载中..."] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
//                        
//                        
//                        //////通知下载的 url
//                        [NSUserDefaults standardUserDefaults].notifyDownloaddStt = model.voice_url;
//                        
//                        //////通知下载的 路径
//                        [NSUserDefaults standardUserDefaults].notifyDnloadPaath = model.voice_pathh;
//                        
//                        
//                        NSLog(@"下载路径___%@",model.voice_pathh);
//                        
//                        
//                    } completion:^{
//                        
//                        
//                        //插入一条数据
//                        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                            [model save];
//                        });
//                        
//                        ///-----------------------------------------⏰闹钟设置
//                        //图片转字符串
//                        //NSData *data = UIImageJPEGRepresentation(immgg, .2f);
//                        //NSString *encodeImgStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//                        [NSUserDefaults standardUserDefaults].clockListHeadPoritStr = model.clocklist_pic;
//                        
//                        [NSUserDefaults standardUserDefaults].clockRRinggStr = model.voice_pathh;
//                        
//                        
//                        ///-------------------------------------------------
//                        
//                        [sender setTitle:@"已选" forState:UIControlStateNormal];
//                        //
//                        //                    [sender setBackgroundColor:[UIColor whiteColor]];
//                        //
//                        //                    [sender setTitleColor:MAIN_MAIN_APP_COLOR forState:UIControlStateNormal];
//                        //
//                        //                    sender.enabled = NO;
//                        
//                        
//                        
//                        
//                        
//                        [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"下载完成"] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        [self.navigationController popViewControllerAnimated:YES];
//                        
//                        
//                        
//                        
//                    } failure:^(NSError *error) {
//                        
//                        [[FGGDownloadManager shredManager] cancelDownloadTask:model.voice_url];
//                        
//                        
//                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                        [alert show];
//                        
//                    }];
//                    
//                    
//                    
//                    
//                }
//                
                
                
                
                
                
                
                NSString *urlStrr = model.voice_url; //下载文件地址
                
                NSURL *downloadUrl = [NSURL URLWithString:urlStrr];
                
                NSURLRequest *requestt = [[NSURLRequest alloc] initWithURL:downloadUrl];
                
                NSData *downloadData = [NSURLConnection sendSynchronousRequest:requestt returningResponse:nil error:nil];
                
                
                
                NSFileManager *fileManagerr = [NSFileManager defaultManager];
                
                NSString *filePathStrr = [kDocumentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp3",model.author_name]];
                
                BOOL filePath_isExist = [fileManagerr createFileAtPath:filePathStrr contents:downloadData attributes:nil];
                
                if (filePath_isExist) {
                    //
                    
                   
                    
                    
                    [NSUserDefaults standardUserDefaults].clockListHeadPoritStr = model.clocklist_pic;
                    
                    
                    [NSUserDefaults standardUserDefaults].clockRRinggStr = filePathStrr;
                    
                    
                    [downloadData writeToFile:filePathStrr atomically:YES];
                    
                    
                    
                    
                    [sender setTitle:@"已选" forState:UIControlStateNormal];
                    
                    
                    
                    
                    [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"下载完成"] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                    
                    
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        //
                        [self.navigationController popViewControllerAnimated:YES];
                        
                        
                    });
                    
                    
                    
                    
                }
                
                
                
                
                

                
                
                
                
            }
            
            
            
            
            
            
            
        };
        
        
        
        
        
        return cell;
        
        
    }
    
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}





#pragma mark -----------------------------选他按钮
- (void)chooseBtntnClicked:(UIButton *)chooseBtn
{
    //NSInteger indexxx = chooseBtn.tag;
    
    //ZMClockChooseLoveDouModel *model = [self.loveDouArray objectAtIndex:indexxx];
    
    
    
    
    
}






#pragma mark ------------------------男生-----试听按钮
- (void)listenBtnClickedt:(UIButton *)listenBtn
{
    NSInteger indexx = listenBtn.tag;
    
    ZMClockChooseLoveDouModel *model = [self.loveDouArray objectAtIndex:indexx];
    
    
    
    
    if ([listenBtn.currentTitle isEqualToString:@"播放"]) {
        [listenBtn setTitle:@"暂停" forState:UIControlStateNormal];
        //[listenBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        [listenBtn setBackgroundImage:IMAGE(@"song_item_play") forState:UIControlStateNormal];
        
        [self.onlinePlayer pause];
        
        
        
    }else {
        
        [listenBtn setTitle:@"播放" forState:UIControlStateNormal];
        //[listenBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        [listenBtn setBackgroundImage:IMAGE(@"song_item_pause") forState:UIControlStateNormal];
        
        
        self.onlinePlayer = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:model.voice_url]];
        
        self.onlinePlayer.volume = 2.0;
        
        [self.onlinePlayer play];
        
        
        
    }
    
    
    
    
}





#pragma mark --------------------------女生---试听按钮
- (void)girl_listenBtnClickedt:(UIButton *)listenBtn
{
    NSInteger indexx = listenBtn.tag;
    
    ZMClockChooseLoveDouModel *model = [self.loveGirrlDouArray objectAtIndex:indexx];
    
    
    
    
    if ([listenBtn.currentTitle isEqualToString:@"播放"]) {
        [listenBtn setTitle:@"暂停" forState:UIControlStateNormal];
        //[listenBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        [listenBtn setBackgroundImage:IMAGE(@"song_item_play") forState:UIControlStateNormal];
        
        [self.onlinePlayer pause];
        
        
        
    }else {
        
        [listenBtn setTitle:@"播放" forState:UIControlStateNormal];
        //[listenBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        //
        [listenBtn setBackgroundImage:IMAGE(@"song_item_pause") forState:UIControlStateNormal];
        
        
        self.onlinePlayer = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:model.voice_url]];
        
        self.onlinePlayer.volume = 2.0;
        
        [self.onlinePlayer play];
        
        
        
    }
    
    
    
    
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
