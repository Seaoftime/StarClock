//
//  ZMGameSettingViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMGameSettingViewController.h"
#import "GameSettingTableViewCell.h"
#import "ZMGameExplainViewController.h"
#import "ZMHeadPortraitViewController.h"


#pragma  mark 游客返回登录界面方法
#import "ZMMainViewController.h"
#import "ZMTourist.h"

#pragma  mark 游戏的其他控制方法
#import "XIUgaibaobaonicheng.h"

#import "GAmerenwucontroller.h"

#import "SystemsettingsViewcontrol.h"



//////
#pragma  mark 个人资料的其他控制方法
#import "ZMMeInfoViewController.h"

#import "YijianfankuiController.h"


#import "MeInfoModel.h"
#import "MeInfoTableViewCell.h"
#import "ZMEditNickNameViewController.h"
#import "ImagePickerHelper.h"
#import "EditMeInfoHelper.h"

#import "GameItemTypeModel.h"
#import "GameView.h"


#import "baobaomodel.h"


///////张锐
#import "duanyuwomenviewcontroller.h"
#import "ZMMeeLoveLevellViewController.h"
#import "ZMMeeMyGolddsViewController.h"
#import "ZMUseerrCenterListeTableViewCell.h"
#import "ZMUserCennterrTableViewCell.h"
#import "ZMUserCenterVoiceSpeakereViewController.h"
#import "ZMUsserCenterRobotNikNameViewController.h"



@interface ZMGameSettingViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *topHeadImggVvv;
@property (nonatomic, strong) UIButton *dismissBtn;
@property (nonatomic, strong) UIImageView *headImggV;
@property (nonatomic, strong) UILabel *userNameLb;
@property (nonatomic, strong) UILabel *xingbanNumLb;//星伴号
@property (nonatomic, strong) UILabel *myGolddLb;
@property (nonatomic, strong) UILabel *lineeLb;
@property (nonatomic, strong) UILabel *myLevellLb;



@property (nonatomic, strong) UITableView *userSettingTableView; //
@property (nonatomic, strong) NSMutableArray * voiceSettingArray; //
@property (nonatomic,strong) NSMutableArray * voiceListImgArray;
@property (nonatomic, strong) NSMutableArray * voiceSettingArray2;


@property(nonatomic, strong) UILabel*youxilabel;

@property (nonatomic,strong) NSMutableArray *gameItemArray; //!< 数组

//@property (nonatomic,strong) GameView *gameView;//游戏喂食视图
@property (nonatomic, copy) NSString *xingStt;//星伴号
@property (nonatomic, copy) NSString *robotNickN;//机器人昵称
@property (nonatomic, copy) NSString *robot_pathUrl;//机器人头像




@end

@implementation ZMGameSettingViewController


#pragma mark 获取个人资料
-(void)getUserProfile
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign
                                        };
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_user_info.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     
                     
                     NSLog(@"个人中心 %@",object);
                     
                     NSDictionary *data = [object objectForKey:@"data"];
                     
                     NSDictionary *image_url = [data objectForKey:@"image_url"];
                     NSString *pathUrl = [image_url objectForKey:@"path"];//头像 url
                     NSString *nickN = [data objectForKey:@"nickname"];//昵称
                     NSString *xing = [data objectForKey:@"user_id"];//星伴号
                     NSString *gold = [data objectForKey:@"gold"];//金币数
                     NSString *love_level = [data objectForKey:@"love_level"];//亲密度等级
                     ///增加字段
                     self.robotNickN = [data objectForKey:@"robot_nickname"];//机器人昵称
                     ////增加字段
                     NSDictionary *robot_avatar = [data objectForKey:@"robot_avatar"];
                     self.robot_pathUrl = [robot_avatar objectForKey:@"path"];//机器人头像 url
                     
                     
                     
                     //NSString *phone = [data objectForKey:@"phone"];//手机号
                     //NSString *sex = [data objectForKey:@"sex"];//性别 1 男 2 女
                     //NSString *birth = [data objectForKey:@"birth"];//生日
                     
                     //baobaomodel *headPortraitModel = [[baobaomodel alloc] init];
                     //[headPortraitModel setHeadPortraitUrl:pathUrl];
                     
                     ////用户头像
                     [self.headImggV sd_setImageWithURL:[NSURL URLWithString:pathUrl]];
                     
                     //////用户昵称
                     self.userNameLb.text = nickN;
                    //////星伴号
                     self.xingbanNumLb.text = [NSString stringWithFormat:@"星伴号:%@",xing];
                     
                     self.xingStt = xing;
                     /////我的金币
                     self.myGolddLb.text = [NSString stringWithFormat:@"我的金币  %@",gold];
                     /////我的等级
                     self.myLevellLb.text = [NSString stringWithFormat:@"我的等级  %@",love_level];
                     
                     
                     [self.userSettingTableView reloadData];
                     
                     
                     
//                     if ([data count])
//                     {
//                         NSDictionary *user_info = [data objectForKey:@"user_info"];
//                         
//                         
//                         
//                         
//                          if ([user_info count])
//                           {
//                               NSDictionary *image_url=[user_info objectForKey:@"image_url"];
//                          NSString *path = [image_url objectForKey:@"path"];
//                        baobaomodel *headPortraitModel = [[baobaomodel alloc] init];
//                        [headPortraitModel setHeadPortraitUrl:path];
//                        [self.touxiangview sd_setImageWithURL:[NSURL URLWithString:headPortraitModel.headPortraitUrl]];
//                               
//                       NSString *nickname = [user_info objectForKey:@"nickname"];
//                            self.nichenglabel.text=nickname;
//                        }
//                         
//                         NSDictionary *game = [data objectForKey:@"game"];
//                         if ([game count])
//                         {
//                           //  NSString *nickname=[game objectForKey:@"nickname"];
//                             NSString *gold=[game objectForKey:@"gold"];
//                             NSString *love_level=[game objectForKey:@"love_level"];
//                            // self.baobaonichenglabel.text=nickname;
//                             self.baobaojingbilabel.text=gold;
//                             self.baobaodengjilabel.text=love_level;
//                             [self.gameSettingTableView reloadData];
//                             
//                         }
//                         
//                     }
                     
                     
                     
                     
                     
                 }
             } error:^(NSError *error){}];
        }
    }
}



- (void)dismissBtnnClicked
{

    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    
    [self.userSettingTableView reloadData];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.baseNavigation.hidden = YES;
    
    
    self.voiceListImgArray = [NSMutableArray arrayWithObjects: @"秘书声音", @"爱豆昵称", nil];
    self.voiceSettingArray2 = [NSMutableArray arrayWithObjects:@"系统设置", @"意见反馈", @"联系我们", nil];
    
    
////
    if ([ZMSystemTool iPhone5Device]) {
        
        self.topHeadImggVvv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/3.5)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.topHeadImggVvv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/3.5 + 20)];
        
        
    } else {
    
        self.topHeadImggVvv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/3.5)];
        
    }

    
    
    self.topHeadImggVvv.backgroundColor = RGB(236, 128, 172);
    self.topHeadImggVvv.userInteractionEnabled = YES;
    
    //[self.view addSubview:self.topHeadImggV];
    
////
    self.dismissBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 50, 50)];
    self.dismissBtn.backgroundColor = [UIColor clearColor];
    [self.dismissBtn setImage:IMAGE(@"返回按键") forState:UIControlStateNormal] ;
    
    
    [self.dismissBtn addTarget:self action:@selector(dismissBtnnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.topHeadImggVvv addSubview:self.dismissBtn];
    
////
    self.headImggV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 50, 10, 100, 100)];
    self.headImggV.layer.cornerRadius = 50;
    
    self.headImggV.layer.borderWidth = 2.0;
    self.headImggV.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    self.headImggV.layer.masksToBounds = YES;
    self.headImggV.userInteractionEnabled = YES;
    
    self.headImggV.backgroundColor = [UIColor whiteColor];
    
    [self.topHeadImggVvv addSubview:self.headImggV];
    
    
    UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImggVwTaped)];
    [self.headImggV addGestureRecognizer:headTap];
    
    
////用户姓名
    self.userNameLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 105,  kScreen_Width , 40)];
    self.userNameLb.text = @"我爱星伴~~";
    self.userNameLb.font = [UIFont systemFontOfSize:17];
    self.userNameLb.textColor = [UIColor whiteColor];
    self.userNameLb.textAlignment = NSTextAlignmentCenter;
    
    [self.topHeadImggVvv addSubview:self.userNameLb];
////星伴号
    self.xingbanNumLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 150 - 20,  kScreen_Width , 40)];
    self.xingbanNumLb.text = @"星伴号:88888888";
    self.xingbanNumLb.font = [UIFont systemFontOfSize:16];
    self.xingbanNumLb.textColor = [UIColor whiteColor];
    self.xingbanNumLb.textAlignment = NSTextAlignmentCenter;
    
    [self.topHeadImggVvv addSubview:self.xingbanNumLb];
    
//我的金币
    self.myGolddLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 150 + 40 - 25,  kScreen_Width/2 , 40)];
    self.myGolddLb.text = @"我的金币   0";
    self.myGolddLb.font = [UIFont systemFontOfSize:17];
    self.myGolddLb.textColor = [UIColor whiteColor];
    self.myGolddLb.textAlignment = NSTextAlignmentCenter;
    self.myGolddLb.userInteractionEnabled = YES;
    
    [self.topHeadImggVvv addSubview:self.myGolddLb];
    
    
    UITapGestureRecognizer *tapd = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goldLbbClickdedd)];
    
    [self.myGolddLb addGestureRecognizer:tapd];
    
////
    self.lineeLb = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2, 150 + 40 - 15,  2 , 20)];
    self.lineeLb.backgroundColor = [UIColor whiteColor];
    
    [self.topHeadImggVvv addSubview:self.lineeLb];
////
//我的等级
    self.myLevellLb = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2, 150 + 40 - 25,  kScreen_Width/2 , 40)];
    self.myLevellLb.text = @"我的等级  0";
    self.myLevellLb.userInteractionEnabled = YES;
    self.myLevellLb.font = [UIFont systemFontOfSize:17];
    self.myLevellLb.textColor = [UIColor whiteColor];
    self.myLevellLb.textAlignment = NSTextAlignmentCenter;
    
    [self.topHeadImggVvv addSubview:self.myLevellLb];
    

    
    UITapGestureRecognizer *tapddd = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myLevellLbClickdedd)];
    
    [self.myLevellLb addGestureRecognizer:tapddd];
    
    
#pragma mark ---------------------------------中心 tableView

    [self.view addSubview:self.userSettingTableView];
    
    self.userSettingTableView.backgroundColor = RGB(238, 238, 238);
    
    self.userSettingTableView.tableHeaderView = self.topHeadImggVvv;
    
    self.userSettingTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    
    
    
    
    
    
#pragma mark -------------------------------请求数据
    
    [self getUserProfile];
    
}




- (void)goldLbbClickdedd
{

    ZMMeeMyGolddsViewController *gold = [[ZMMeeMyGolddsViewController alloc] init];
    gold.titleeLb.text = @"我的金币";
    
    [self.navigationController pushViewController:gold animated:YES];


}



- (void)myLevellLbClickdedd
{
    
    ZMMeeLoveLevellViewController *myLevel = [[ZMMeeLoveLevellViewController alloc] init];
    myLevel.titleeLb.text = @"我的亲密度等级";
    
    [self.navigationController pushViewController:myLevel animated:YES];
    
    
}



- (UITableView *)userSettingTableView
{
    if (_userSettingTableView == nil) {
        
        _userSettingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height - 0) style:UITableViewStyleGrouped];///UITableViewStyleGrouped 分组
                                 
                                 
        [_userSettingTableView setDelegate:self];
        [_userSettingTableView setDataSource:self];
    }
    return _userSettingTableView;
}


- (NSMutableArray *)voiceSettingArray
{
    if (_voiceSettingArray == nil)
    {
        _voiceSettingArray = [NSMutableArray array];
        //[_voiceSettingArray addObject:@""];
        [_voiceSettingArray addObject:@"语音秘书声音"];
        [_voiceSettingArray addObject:@"爱豆昵称"];
      
    }
    return _voiceSettingArray;
}

#pragma mark -----------------------------进入个人资料
- (void)headImggVwTaped
{
    //ZMUserCenterUserInnfoViewController *userInfo = [[ZMUserCenterUserInnfoViewController alloc] init];
    
    //[self.navigationController pushViewController:userInfo animated:YES];
 
    [APPTransmit shareInstance].xingbanStr = self.xingStt;
    
    ZMMeInfoViewController *meInfo = [[ZMMeInfoViewController alloc] init];
    meInfo.titleeLb.text = @"个人资料";
    [self.navigationController pushViewController:meInfo animated:YES];

}



#pragma mark ---------------------UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //
//        if(indexPath.row==0){
//            return 100;
//            
//        }else{
        
            return 60;
//        }
    } else {
    
        return 60;
    }
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 0) {
        //
        if (indexPath.row == 0) {
            //语音秘书声音
            ZMUserCenterVoiceSpeakereViewController *speaker = [ZMUserCenterVoiceSpeakereViewController sharedZMUserCenterVoiceSpeakereViewController];
            speaker.titleeLb.text = @"语音秘书声音";
            
            [self.navigationController pushViewController:speaker animated:YES];
        }
        
        if (indexPath.row == 1) {
            //爱豆昵称
            ZMUsserCenterRobotNikNameViewController *nickName = [[ZMUsserCenterRobotNikNameViewController alloc] init];
            nickName.titleeLb.text = @"爱豆昵称";

            [self.navigationController pushViewController:nickName animated:YES];
            
        }
        
        
        
        
    } else {
    
        if (indexPath.row == 0) {
            //系统设置
            SystemsettingsViewcontrol *system =[[SystemsettingsViewcontrol alloc] init];
            system.titleeLb.text = @"系统设置";
            [self.navigationController pushViewController:system animated:YES];
        }
        
        if (indexPath.row == 1) {
            //意见反馈
            YijianfankuiController *yijian = [[YijianfankuiController alloc] init];
            yijian.titleeLb.text = @"意见反馈";
            
            [self.navigationController pushViewController:yijian animated:YES];
        }
        
        if (indexPath.row == 2) {
            //联系我们
            duanyuwomenviewcontroller *women = [[duanyuwomenviewcontroller alloc] init];
            women.titleeLb.text = @"联系我们";
            [self.navigationController pushViewController:women animated:YES];
        }
    
    }
    
    
}



-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        
        UIView *sectionHeadBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
        sectionHeadBackgroundView.backgroundColor = [UIColor clearColor];
        return sectionHeadBackgroundView;

    } else {
    
        return nil;
    }
    
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.voiceSettingArray count];
    } else {
    
        return 3;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        //
        
//        if (indexPath.row == 0) {
//           
//            
//            static NSString *cellId = @"head";
//            
//            ZMUserCennterrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
//            
//            if (!cell)
//            {
//                cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMUserCennterrTableViewCell" owner:self options:nil] lastObject];
//                
//            }
//            
//            //机器人头像
//           [cell.voiceHeadImgV sd_setImageWithURL:[NSURL URLWithString:self.robot_pathUrl]];
//           
//            
//            
//            return cell;
//            
//            
//        }else {
        
            
            static NSString *cellidd = @"textid";
            
            ZMUseerrCenterListeTableViewCell *cell= [self.userSettingTableView dequeueReusableCellWithIdentifier:cellidd];
            
            if(!cell){
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMUseerrCenterListeTableViewCell" owner:self options:nil] lastObject];
                
            }
            
            cell.titleLb.text = self.voiceSettingArray[indexPath.row];
            
            NSString *strr = [self.voiceListImgArray objectAtIndex:indexPath.row];
            
            cell.liebiaoListImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",strr]];
            
//            if (indexPath.row == 2) {
//                cell.contentLb.text = @"小星";
//            }
            
            if (indexPath.row == 1) {
                
                
                NSString *imgStr = [NSUserDefaults standardUserDefaults].aidouNickName;
                
                //字符串转图片
                
                if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
                    
                     cell.contentLb.text = self.robotNickN;
                    
                    
                } else {
                
                     cell.contentLb.text = imgStr;
                
                }
                
                
                
                
            }
            
            
            //        if (indexPath.row == 1){
            //            cell.contentLb.text=[NSString stringWithFormat:@"%@",self.baobaojingbilabel.text];
            //    
            //        }
            //        if (indexPath.row == 2){
            //            
            //    
            //            cell.contentLb.text = [NSString stringWithFormat:@"%@",self.baobaodengjilabel.text];
            //            
            //        }
            
            
            
            return cell;
            
            
//        }
        
        

    } else {
    
        static NSString *cellidd = @"textid";
        
        ZMUseerrCenterListeTableViewCell *cell= [self.userSettingTableView dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMUseerrCenterListeTableViewCell" owner:self options:nil] lastObject];
            
        }
        
        cell.titleLb.text = self.voiceSettingArray2[indexPath.row];
        NSString *strr = [self.voiceSettingArray2 objectAtIndex:indexPath.row];
        
        cell.liebiaoListImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",strr]];

        
        return cell;
        
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)navLeftBtnAction:(UIButton *)sender
{
    //[self.navigationController popViewControllerAnimated:YES];


}


@end
