//
//  ZMMeViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMeViewController.h"
#import "MeTableViewCell.h"
#import "MeModel.h"
#import "ZMMeInfoViewController.h"
#import "ZMExamineViewController.h"
#import "ZMLoginViewController.h"
#import "ZMHonourViewController.h"
#import "HonourModel.h"



@interface ZMMeViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *meTableView; //!< 我 表视图
@property (nonatomic,strong) NSMutableArray *meArray;  //!< 我 数据数组
@property (nonatomic,strong) NSMutableArray *honourArray;  //!< 头衔 数据数组


@end



@implementation ZMMeViewController


#pragma mark  DataRequest Method
#pragma mark 获取用户信息
-(void)getUserInfo:(BOOL)userInfo
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign};
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_user_info.php" theParmeters:parmeters sucess:^(id object)
            {
                if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                {
                    NSDictionary *data = [object objectForKey:@"data"];
                    //解析用户信息
                    NSDictionary *user_info = [data objectForKey:@"user_info"];
                    if ([user_info count])
                    {
                        NSString *user_id = [user_info objectForKey:@"user_id"];
                        NSString *nickname = [user_info objectForKey:@"nickname"];
                        NSString *score = [NSString stringWithFormat:@"%@",[user_info objectForKey:@"score"]];
                        NSString *level = [NSString stringWithFormat:@"%@",[user_info objectForKey:@"level"]];
                        NSString *editor_exp = [NSString stringWithFormat:@"%@",[user_info objectForKey:@"editor_exp"]];
                        NSString *editor_level = [NSString stringWithFormat:@"%@",[user_info objectForKey:@"editor_level"]];
                        NSString *editor_title = [user_info objectForKey:@"editor_title"];
                        NSString *upgrade_need_editor_exp = [NSString stringWithFormat:@"%@",[user_info objectForKey:@"upgrade_need_editor_exp"]];
                        NSDictionary *headPortrait = [user_info objectForKey:@"image_url"];
                        NSString *image_url = [headPortrait objectForKey:@"path"];
                    
                        
                        
                        
                        //昵称头衔
                        MeModel *nickNameModel = [[MeModel alloc]init];
                        [nickNameModel setUserId:user_id];
                        [nickNameModel setNickName:nickname];
                        [nickNameModel setPoints:score];
                        [nickNameModel setLevel:level];
                        [nickNameModel setHeadPortraitUrl:image_url];
                        [nickNameModel setMeType:nickNameType];
                        [nickNameModel setCellHight:80];
                        [self.meArray insertObject:nickNameModel atIndex:0];
                        
                        //社区头衔
                        MeModel *honourModel = [[MeModel alloc]init];
                        [honourModel setTitle:@"社区头衔"];
                        [honourModel setDescribe:editor_title];
                        [honourModel setCellHight:60];
                        [honourModel setMeType:honourType];
                        [self.meArray insertObject:honourModel atIndex:2];
                        
                        
                        
                        MeModel *model5 = [[MeModel alloc]init];
                        [model5 setTitle:@"我的明星"];
                        [model5 setMeType:startType];
                        [model5 setCellHight:60];
                        [self.meArray addObject:model5];
                        
                        
                        
                        
                        
#pragma mark 创建头衔信息
                        HonourModel *nickNameHonourModel = [[HonourModel alloc]init];
                        [nickNameHonourModel setHeadPortraitUrl:image_url];
                        [nickNameHonourModel setNickName:nickname];
                        [nickNameHonourModel setPoints:score];
                        [nickNameHonourModel setLevel:level];
                        [nickNameHonourModel setCellHight:80];
                        [nickNameHonourModel setHonourType:honourNickNameType];
                        [self.honourArray addObject:nickNameHonourModel];
                        
                        
                        HonourModel *honourEditModel = [[HonourModel alloc]init];
                        [honourEditModel setEditorLevelNmae:editor_title];
                        [honourEditModel setEditorExperience:editor_exp];
                        [honourEditModel setNextLevelExperience:upgrade_need_editor_exp];
                        [honourEditModel setEditorLevel:editor_level];
                        [honourEditModel setCellHight:250];
                        [honourEditModel setHonourType:honourHonourType];
                        [self.honourArray addObject:honourEditModel];
                        
                        
                        
                        HonourModel *experienceModel = [[HonourModel alloc]init];
                        [experienceModel setTitle:@"如何获得经验值"];
                        [experienceModel setCellHight:30];
                        [experienceModel setHonourType:experienceType];
                        [self.honourArray addObject:experienceModel];
                        
                        
                        HonourModel *actionModel = [[HonourModel alloc]init];
                        [actionModel setTitle:@"操作"];
                        [actionModel setDescribe:@"经验值"];
                        [actionModel setRemark:@"每日上限"];
                        [actionModel setCellHight:60];
                        [actionModel setHonourType:actionType];
                        [self.honourArray addObject:actionModel];
                        
                        
                        HonourModel *actionModel1 = [[HonourModel alloc]init];
                        [actionModel1 setTitle:@"成功发布一篇文章"];
                        [actionModel1 setDescribe:@"+10"];
                        [actionModel1 setRemark:@"--"];
                        [actionModel1 setCellHight:60];
                        [actionModel1 setHonourType:actionType];
                        [self.honourArray addObject:actionModel1];
                        
                        
                        HonourModel *actionModel2 = [[HonourModel alloc]init];
                        [actionModel2 setTitle:@"文章每收到10个评论"];
                        [actionModel2 setDescribe:@"+1"];
                        [actionModel2 setRemark:@"50"];
                        [actionModel2 setCellHight:60];
                        [actionModel2 setHonourType:actionType];
                        [self.honourArray addObject:actionModel2];
                        
                        
                        HonourModel *otherModel = [[HonourModel alloc]init];
                        [otherModel setTitle:@"贡献值每天24点结算一次"];
                        [otherModel setCellHight:30];
                        [otherModel setHonourType:otherType];
                        [self.honourArray addObject:otherModel];
                        
                    }
                }
                
            } error:^(NSError *error)
            {
                
            }];
            
            
            
        }
        
        
        
        
    }
}









#pragma mark  LifeStyle Method
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我的"];
    [self.view addSubview:self.meTableView];
    [self getUserInfo:YES];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Getter / Setter
-(UITableView *)meTableView
{
    if (_meTableView == nil)
    {
        _meTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-60) style:UITableViewStylePlain];
        [_meTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_meTableView setDelegate:self];
        [_meTableView setDataSource:self];
    }
    return _meTableView;
}



-(NSMutableArray *)meArray
{
    if (_meArray == nil)
    {
        _meArray = [NSMutableArray array];
        
        
        /**
         粉丝和关注（现在这个需求不做了）
         MeModel *model1 = [[MeModel alloc]init];
         [model1 setConcernNumer:@"102"];
         [model1 setFansNumber:@"61"];
         [model1 setMeType:fansType];
         [model1 setCellHight:60];
         [self.meArray insertObject:model1 atIndex:1];
         */
     
        
        MeModel *model3 = [[MeModel alloc]init];
        [model3 setTitle:@"我的消息"];
        [model3 setMeType:messageType];
        [model3 setCellHight:60];
        [_meArray addObject:model3];
        
        
        
        MeModel *model4 = [[MeModel alloc]init];
        [model4 setTitle:@"我的文章"];
        [model4 setMeType:messageType];
        [model4 setCellHight:60];
        [_meArray addObject:model4];
        
        
      
        
    }
    return _meArray;
}



-(NSMutableArray*)honourArray
{
    if (_honourArray == nil)
    {
        _honourArray = [NSMutableArray array];
    }
    return _honourArray;
}




#pragma mark - Deletage
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.meArray[indexPath.row] cellHight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            [self.navigationController pushViewController:[[ZMMeInfoViewController alloc]init] animated:YES];
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            ZMHonourViewController *honourViewController = [[ZMHonourViewController alloc]init];
            [honourViewController.honourArray addObjectsFromArray:self.honourArray];
            [self.navigationController pushViewController:honourViewController animated:YES];
            
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[ZMExamineViewController alloc]init] animated:YES];
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
    }
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.meArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[MeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setModel:self.meArray[indexPath.row]];
    return cell;
}






@end
