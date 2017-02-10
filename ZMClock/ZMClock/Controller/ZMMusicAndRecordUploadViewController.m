//
//  ZMMusicAndRecordUploadViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMusicAndRecordUploadViewController.h"

#import "ZMMusicTaskModel.h"
#import "ZMRecordDBModel.h"
#import "ZMNewClockMusicLeftTableViewCell.h"
#import "AFNetworking.h"
#import "NSMutableURLRequest+MutilPartForm.h"
#import "TRENetworkTool.h"


@interface ZMMusicAndRecordUploadViewController ()<UITableViewDelegate,UITableViewDataSource>
{
   

}

@property (nonatomic, strong) NSArray *musicDownloadArray;//下载
@property (nonatomic, strong) NSArray *recordArray;//录音

//@property (nonatomic, strong) NSMutableArray *uploadArray;
@property (nonatomic, strong) UITableView *uploadTableV;

//
@property (nonatomic, copy) NSString *dataStr;
@property (nonatomic, copy) NSString *fileNameStr;
//
//cell 选中
@property (nonatomic,strong) ZMRecordDBModel *selectModelRecord;
@property (nonatomic,strong) ZMMusicTaskModel *selectModelDownload;
@property(assign, nonatomic) NSInteger clickCount;


@end

@implementation ZMMusicAndRecordUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.title = @"上传闹铃";
    self.view.backgroundColor = RGB(255, 239, 255);
    
    self.musicDownloadArray = [ZMMusicTaskModel findAll];
    self.recordArray = [ZMRecordDBModel findAll];
    NSLog(@"   %ld",(unsigned long)self.musicDownloadArray.count);
    NSLog(@"   %ld",(unsigned long)self.recordArray.count);
    
    
    //[self setNavRightBtnImage:@"确定"];
    [self setupUI];
}


- (void)setupUI
{
    _uploadTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 ,kScreen_Width,kScreen_Height - 64)];
    _uploadTableV.backgroundColor = RGB(255, 239, 255);
    _uploadTableV.dataSource = self;
    _uploadTableV.delegate = self;
    _uploadTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _uploadTableV.tag = 1001;
    
    [self.view addSubview:_uploadTableV];


}

#pragma mark - 设置右侧按钮图标
-(void)setNavRightBtnImage:(NSString*)imageName
{
    [self.baseNavigation.rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}


#pragma mark - 
- (void)navRightBtnAction:(UIButton*)sender
{
    
    NSLog(@".....上传.....");
    
    NSMutableDictionary *parmeters = [NSMutableDictionary dictionary];

    
 //////
//    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
//    {
//        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
//        {
//            [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
//            [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
//            [parmeters setObject:@"diy_alarm_voice" forKey:@"diy_alarm_voice"];
//            
//            [[AFNetworkingHelper sharedNetworkingHelper] postFormDataObjectWithUrl:@"alarm/upload_alarm_diy.php" theParmeters:parmeters constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
//             {
//                 
//                 //转成data
//                 //NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.dataStr]];
//                 
//                 NSLog(@"%@",parmeters);
//                 
//                 
//                 
//                 
//                 NSData *dataa = [NSData dataWithContentsOfFile:self.dataStr];
//                 
//                 NSString *stt = self.fileNameStr;
//                 
//                 [formData appendPartWithFileData: dataa name:@"diy_alarm_voice" fileName: stt mimeType:@"audio/mpeg"];
//                 
//                 
//                 
//             } sucess:^(id object)
//             {
//                 
//                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
//                 {
//                     //
//                     NSDictionary *data = [object objectForKey:@"data"];
//                     
//                 
//                 
//                 }
//                 
//                 
//             } error:^(NSError *error)
//             {
//                 [AnyObjectActivityView showWithTitle:@"上传失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//             }];
//        }
//
//    }
    
    
    
    
    ///////////////
    
    NSMutableDictionary *parmeterss = [NSMutableDictionary dictionary];
    
    [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
    [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
    [parmeters setObject:@"diy_alarm_voice" forKey:@"diy_alarm_voice"];
    
    
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    
    [requestManager POST:@"http://192.168.1.111/serverpro/alarm/upload_alarm_diy.php" parameters:parmeterss constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
       
        //[formData appendPartWithFileURL:[NSURL URLWithString:self.dataStr] name:@"diy_alarm_voice" fileName:self.fileNameStr mimeType:@"audio/mpeg" error:nil];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        [AnyObjectActivityView showWithTitle:@"上传中..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //
            [AnyObjectActivityView showWithTitle:@"上传完成" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
            
            
            [self.navigationController popViewControllerAnimated:YES];
            
        });
        
        
        
        NSString *status = [responseObject objectForKey:@"status"];
        
        NSLog(@"%@",status);
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"获取服务器响应出错");
        
    }];
    
    
    
    

}



#pragma mark - 代理
#pragma mark -tableview delegte && dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return self.recordArray.count;
    }else {
    
        return self.musicDownloadArray.count;
    }


}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static  NSString *cellIdentifier = @"upload";
    ZMNewClockMusicLeftTableViewCell *cell= [_uploadTableV dequeueReusableCellWithIdentifier:cellIdentifier];
    [_uploadTableV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMNewClockMusicLeftTableViewCell" owner:self options:nil] lastObject];
    }
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = RGB(254.0, 226.0, 254.0);
    }else {
        
        cell.backgroundColor = RGB(235.0, 255.0, 255.0);;
        
    }
    
    
    if (indexPath.section == 0) {//录制
        //
        ZMRecordDBModel *model = self.recordArray[indexPath.row];
        //cell.musicNameLb.text = model.recordDBName;
        
        
        cell.rightSelectedBtn.tag = indexPath.row;
        
        [cell.rightSelectedBtn addTarget:self action:@selector(ClickBtnRecord:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell setRecordDBModel:model];
        
    }else {//下载
    
        ZMMusicTaskModel *model = self.musicDownloadArray[indexPath.row];
        //cell.musicNameLb.text = model.musicName;
        
        cell.rightSelectedBtn.tag = indexPath.row;
        
        [cell.rightSelectedBtn addTarget:self action:@selector(ClickBtnDownload:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell setModel:model];
        
    
    }

    return cell;
}



#pragma mark - cell 选中
- (void)ClickBtnDownload:(UIButton *)btn
{
    
    
    //下载
    NSLog(@"下载下载下载下载下载   你选了第  %ld  行",(long)btn.tag);
    
    if (self.selectModelRecord.isSelected) {
        self.selectModelRecord.isSelected = NO;
    }
    
    
    
    
    if (self.selectModelDownload) {
        self.selectModelDownload.isSelected = !self.selectModelDownload.isSelected;
    }
    ZMMusicTaskModel *model = _musicDownloadArray[btn.tag];
    if (!model.isSelected) {
        model.isSelected = !model.isSelected;
        self.selectModelDownload = model;
    }
    
    
    [_uploadTableV reloadData];
    
}




- (void)ClickBtnRecord:(UIButton *)btn
{
    
    
    //下载
    NSLog(@"录音录音录音录音录音   你选了第  %ld  行",(long)btn.tag);
    
    if (self.selectModelDownload.isSelected) {
        self.selectModelDownload.isSelected = NO;
    }
    
    
    
    
    if (self.selectModelRecord) {
        self.selectModelRecord.isSelected = !self.selectModelRecord.isSelected;
    }
    ZMRecordDBModel *model = _recordArray[btn.tag];
    if (!model.isSelected) {
        model.isSelected = !model.isSelected;
        self.selectModelRecord = model;
    }
    
    
    [_uploadTableV reloadData];
    
}







- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        
//        //return @"录制铃声";
//        return [NSString stringWithFormat:@"录制铃声(%lu)",(unsigned long)self.recordArray.count];
//    }else {
//        
//        //return @"下载铃声";
//        return [NSString stringWithFormat:@"下载铃声(%lu)",(unsigned long)self.musicDownloadArray.count];
//    }
//
//}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if (tableView == _uploadTableV) {
//        
//        UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0)];
//        sectionHeadBackgroundView.backgroundColor = RGB(106.0, 221.0, 255.0);
//        
//        
//        UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreen_Width, 0)];
//        headLabel.backgroundColor = [UIColor clearColor];
//        headLabel.font = [UIFont systemFontOfSize:17];
//        headLabel.textColor = [UIColor blackColor];
//        headLabel.text = [self tableView:tableView titleForHeaderInSection:section];
//        [sectionHeadBackgroundView addSubview:headLabel];
//        
//        
//        return sectionHeadBackgroundView;
//        
//    }else {
//        
//        return nil;
//    }
//}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //点击后清除选中效果
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.selected = NO;
    
    if (indexPath.section == 0) {//录制
        
        ZMRecordDBModel *model = self.recordArray[indexPath.row];
        
        NSLog(@"%@",model.recordDBUrl);
        
    }else {
    
        ZMMusicTaskModel *model = self.musicDownloadArray[indexPath.row];
    
        NSLog(@"%@",model.musicDestinationPath);
        
        self.dataStr = model.musicDestinationPath;
        self.fileNameStr = model.musicName;
        
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
