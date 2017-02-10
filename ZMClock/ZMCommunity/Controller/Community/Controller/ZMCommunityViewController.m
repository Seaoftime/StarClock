//
//  ZMCommunityViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMCommunityViewController.h"
#import "CommunityTableViewCell.h"
#import "ZMStoryViewController.h"
#import "ZMComicViewController.h"
#import "ZMNewsViewController.h"
#import "ZMMeViewController.h"
#import "ZMLoginViewController.h"
#import "ZMProgramInfoViewController.h"
#import "CommunityHedToolView.h"
#import "CommunityFrame.h"
#import "ZMMoreProgramViewController.h"
#import "ZMStoryInfoViewController.h"
#import "ZMNewsInfoViewController.h"
#import "ZMComicInfoViewController.h"
#import "SwitchStartView.h"
#import "SwitchStartModel.h"





@interface ZMCommunityViewController () <UITableViewDataSource,UITableViewDelegate,CommunityHedToolViewDeletage,CommunityViewDeletage,SwitchStartViewDeletage>

/**
 社区表视
 */
@property (nonatomic,strong) ZMTableView *communityTableView;

/**
 盛放社区数据数组
 */
@property (nonatomic,strong) NSMutableArray *communityArray;
@property (nonatomic,strong) NSMutableArray *startArray;


@property (nonatomic,strong) CommunityHedToolView *hedToolView;

@property (nonatomic,strong) SwitchStartView *switchStartView;

@end

@implementation ZMCommunityViewController

#pragma mark  DataRequest Method
#pragma mark 获取明星主页信息
/**
 changeStar:1 更换明星为 star_id  2 不更新明星（当从明星主页的切换地方进入的时候，需要将用户当前展示的明星切换，
 *      则 change_star 1,否则只是获取明星信息，但不会更新当前用户展示的明星）
 action_top:是否需要获取页面顶部信息（因为有的页面顶部刷新后会发生变化，有的不需要发生变化 1 需要获取 2 不需要获取）
 action_update_his:获取最新消息(1)还是下拉获取历史消息(2)
 endseq:最后一条行程信息的id
 */
-(void)getStartHomePageWithChangeStar:(NSString*)changeStar withStartId:(NSString*)startId withActionTop:(NSString*)actionTop withActionUpdateHis:(NSString *)actionUpdateHis withEndseq:(NSString*)endseq
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"star_id":startId,
                                        @"change_star":changeStar,
                                        @"action_top":actionTop,
                                        @"per_page":@"10",
                                        @"start_seq":@"0",
                                        @"end_seq":endseq,
                                        @"action_update_his":actionUpdateHis};
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"star/get_star_home_page.php" theParmeters:parmeters sucess:^(id object)
            {
                if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                {
                    
                    NSDictionary *data = [object objectForKey:@"data"];
                    if ([data count])
                    {
                        if ([changeStar isEqualToString:@"1"])
                        {
                            /*
                             如果是切换明星的话
                             */
                            [self.communityArray removeAllObjects];
                        }
                        
#pragma mark 明星的信息
                        NSDictionary *cur_star_info = [data objectForKey:@"cur_star_info"]; //!<明星的信息
                        if ([cur_star_info count])
                        {
                            NSString *star_name = [cur_star_info objectForKey:@"star_name"];
                            [self setTitle:star_name];
                            NSDictionary *image_banner = [cur_star_info objectForKey:@"image_banner"];
                            NSString *pathUrl = [image_banner objectForKey:@"path"];
                            
                            
                            CommunityFrame *frame = [[CommunityFrame alloc]init];
                            CommunityModel *model = [[CommunityModel alloc]init];
                            [model setStartName:star_name];
                            [model setStartImageUrl:pathUrl];
                            [model setCommunityType:startImageType];
                            [frame setModel:model];
                            [self.communityArray addObject:frame];
                        }
                        
                        
                        
#pragma mark 解析最近的行程信息
                        NSDictionary *nearest_schedule = [data objectForKey:@"nearest_schedule"];   //!<解析最近的行程信息
                        if ([nearest_schedule count])
                        {
                            if ([[nearest_schedule objectForKey:@"status"]integerValue]==0)
                            {
                                NSString *hour_min = [nearest_schedule objectForKey:@"hour_min"];
                                NSString *month_day = [nearest_schedule objectForKey:@"month_day"];
                                NSString *title = [nearest_schedule objectForKey:@"title"];
                                NSString *place = [nearest_schedule objectForKey:@"place"];
                                NSString *type = [nearest_schedule objectForKey:@"type"];
                                NSString *schedule_id = [nearest_schedule objectForKey:@"schedule_id"];
                                
                                
                                CommunityFrame *frame = [[CommunityFrame alloc]init];
                                CommunityModel *model = [[CommunityModel alloc]init];
                                [model setPrograminfoDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                              
                                
                                [model setPrograminfoTitle:title];
                                
                                [model setLocationInfo:[NSString stringWithFormat:@"%@%@",place,type]];
                                [model setSchedule_id:schedule_id];
                                [model setTime:hour_min];
                                [model setCommunityType:infoType];
                                [frame setModel:model];
                                [self.communityArray addObject:frame];
                            }
                            
                            
                            
                            
                         //下拉刷新
                            if ([[nearest_schedule objectForKey:@"status"]integerValue]==3)
                               // NSLog(@"",);
                            
                            {
                                NSString *msg = [nearest_schedule objectForKey:@"msg"];
                                

                                
                                NSLog(@"------====-%@",nearest_schedule);
                               
                                
                                CommunityFrame *frame = [[CommunityFrame alloc]init];
                                CommunityModel *model = [[CommunityModel alloc]init];
                                [model setPrograminfoDate:[[ZMHelper sharedHelp] localdDateAndTime]];
                                [model setPrograminfoTitle:msg];
                                [model setLocationInfo:msg];
                                [model setSchedule_id:@""];
                                [model setTime:@""];
                                [model setCommunityType:infoType];
                                [frame setModel:model];
                                [self.communityArray addObject:frame];
                            }
                        }
                        
                        
#pragma mark 解析关注的明星
                        NSArray *cur_follow_star_info = [data objectForKey:@"cur_follow_star_info"];  //解析关注的明星
                        if ([cur_follow_star_info count])
                        {
                            NSMutableArray *itemStartArray = [NSMutableArray array];
                            for (NSDictionary *itemData  in cur_follow_star_info)
                            {
                                NSString *star_id = [itemData objectForKey:@"star_id"];
                                NSString *star_name = [itemData objectForKey:@"star_name"];
                                
                                SwitchStartModel *model = [[SwitchStartModel alloc]init];
                                [model setStartId:star_id];
                                [model setStartName:star_name];
                                [itemStartArray addObject:model];
                                
                            }
                            [self.startArray setArray:itemStartArray];
                            itemStartArray = nil;
                        }
                        
                        
                        
#pragma mark 解析推荐列表
                        NSArray *recommend_articleArray = [data objectForKey:@"recommend_article"]; //!< 解析推荐列表
                        if ([recommend_articleArray count])
                        {
                            for (NSDictionary *data in recommend_articleArray)
                            {
                                NSString *article_id = [data objectForKey:@"article_id"];
                                NSString *category_type = [data objectForKey:@"category_type"];
                                NSString *title = [data objectForKey:@"title"];
                                NSString *intro = [data objectForKey:@"intro"];
                                NSString *author = [data objectForKey:@"author"];
                                NSString *datetime = [data objectForKey:@"datetime"];
                                NSString *comment_num = [data objectForKey:@"comment_num"];
                                NSDictionary *imageDictionary = [data objectForKey:@"image"];
                                NSString *pathUrl = [imageDictionary objectForKey:@"url"];
                                
                                
                                
                                CommunityFrame *frame = [[CommunityFrame alloc]init];
                                CommunityModel *model = [[CommunityModel alloc]init];
                                [model setSchedule_id:article_id];
                                [model setCategory_type:category_type];
                                [model setCommentUrl:pathUrl];
                                [model setDate:datetime];
                                [model setTitle:title];
                                [model setDescribe:intro];
                                [model setAuthor:author];
                                [model setSupportNumber:comment_num];
                                [model setSupportImageName:@"评论"];
                                [model setCommunityType:commentitemsType];
                                [frame setModel:model];
                                [self.communityArray addObject:frame];
                                
                            }
                        }
                        
                        
#pragma mark 解析分页文章
                        NSArray *articleArray = [data objectForKey:@"article"];  //!< 解析分页文章
                        if ([articleArray count])
                        {
                            for (NSDictionary *data in articleArray)
                            {
                                NSString *article_id = [data objectForKey:@"article_id"];
                                NSString *category_type = [data objectForKey:@"category_type"];
                                NSString *title = [data objectForKey:@"title"];
                                NSString *intro = [data objectForKey:@"intro"];
                                NSString *author = [data objectForKey:@"author"];
                                NSString *datetime = [data objectForKey:@"datetime"];
                                NSString *comment_num = [data objectForKey:@"comment_num"];
                                NSDictionary *imageDictionary = [data objectForKey:@"image"];
                                NSString *pathUrl = [imageDictionary objectForKey:@"path"];
                                
                                
                                CommunityFrame *frame = [[CommunityFrame alloc]init];
                                CommunityModel *model = [[CommunityModel alloc]init];
                                [model setSchedule_id:article_id];
                                [model setCategory_type:category_type];
                                [model setCommentUrl:pathUrl];
                                [model setDate:datetime];
                                [model setTitle:title];
                                [model setDescribe:intro];
                                [model setAuthor:author];
                                [model setSupportNumber:comment_num];
                                [model setSupportImageName:@"评论"];
                                [model setCommunityType:commentitemsType];
                                [frame setModel:model];
                                [self.communityArray addObject:frame];
                                
                            }
                            [self.communityTableView.footer endRefreshing];
                        }
                        else
                        {
                            [self.communityTableView.footer noticeNoMoreData];
                        }
                        [self.communityTableView reloadData];
                    }
                    else
                    {
                        [self.communityTableView.footer noticeNoMoreData];
                    }
                }
            } error:^(NSError *error) {}];
        }
    }
}


#pragma mark 社区签到
-(void)checkin:(BOOL)checkin
{
    if (checkin)
    {
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                //增加src_type判断社区签到
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign,@"src_type":@"1" };
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/user_check_in.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                         
                     {

                         [AnyObjectActivityView showWithTitle:@"签到成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
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
       }







#pragma mark  LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.hedToolView];
    [self.view addSubview:self.communityTableView];
    
    [self getStartHomePageWithChangeStar:@"2" withStartId:[ZMUserInfo sharedUserInfo].star_cur withActionTop:@"1" withActionUpdateHis:@"1" withEndseq:@"0"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}



#pragma mark - Getter/Setter Method
-(ZMTableView*)communityTableView
{
    if (_communityTableView == nil)
    {
        _communityTableView = [[ZMTableView alloc]initWithFrame:CGRectMake(0, 124, kScreen_Width,kScreen_Height-174) style:UITableViewStylePlain];
        [_communityTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_communityTableView setDelegate:self];
        [_communityTableView setDataSource:self];
        [_communityTableView setFooter:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterAction)]];
    }
    return _communityTableView;
}


-(CommunityHedToolView*)hedToolView
{
    if (_hedToolView == nil)
    {
        _hedToolView = [[CommunityHedToolView alloc]initWithFrame:CGRectMake(0, 64, kScreen_Width, 60) withDeletage:self];
    }
    return _hedToolView;
}

-(NSMutableArray *)communityArray
{
    if (_communityArray == nil)
    {
        _communityArray = [NSMutableArray array];
  
    }
    return _communityArray;
}


- (NSMutableArray *)startArray
{
    if (_startArray == nil)
    {
        _startArray = [NSMutableArray array];
    }
    return _startArray;
}


- (SwitchStartView*)switchStartView
{
    if (_switchStartView == nil)
    {
        _switchStartView = [[SwitchStartView alloc]initSwitchStartViewWithDeletage:self];
    }
    return _switchStartView;
}


#pragma mark - Delegate Method
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.communityArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CommunityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[CommunityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier setDeletage:self];
    }
    [cell setCommunityFrame:self.communityArray[indexPath.row]];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.communityArray[indexPath.row] cellHight];
}








-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    switch (indexPath.row)
    {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            CommunityFrame *frame = self.communityArray[indexPath.row];
            ZMProgramInfoViewController *programInfoViewController = [[ZMProgramInfoViewController alloc]init];
            [programInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:frame.model.schedule_id];
            [self.navigationController pushViewController:programInfoViewController animated:YES];
        }
            break;
        default:
        {
            CommunityFrame *frame = self.communityArray[indexPath.row];
            
            
            if ([frame.model.category_type isEqualToString:@"1"])
            {
                ZMNewsInfoViewController *newsInfoViewController = [[ZMNewsInfoViewController alloc]init];
                [newsInfoViewController setEditType:1];
                [newsInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:frame.model.schedule_id];
                [self.navigationController pushViewController:newsInfoViewController animated:YES];
                
            }
            else if ([frame.model.category_type isEqualToString:@"2"])
            {
                ZMStoryInfoViewController *storyInfoViewController = [[ZMStoryInfoViewController alloc]init];
                [storyInfoViewController setEditType:1];
                [storyInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:frame.model.schedule_id];
                [self.navigationController pushViewController:storyInfoViewController animated:YES];
            }
            else if ([frame.model.category_type isEqualToString:@"3"])
            {
                ZMComicInfoViewController *comicInfoViewController = [[ZMComicInfoViewController alloc]init];
                [comicInfoViewController setEditType:1];
                [comicInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:frame.model.schedule_id];
                [self.navigationController pushViewController:comicInfoViewController animated:YES];
            }
        }
            //社区里的对应的不一样,所以可以删掉的
            /*
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[ZMMeViewController alloc]init] animated:YES];
        }
            break;
        case 4:
        {
            [self.navigationController pushViewController:[[ZMLoginViewController alloc]init] animated:YES];
        }
            break;
        case 5:
        {
            [self.navigationController pushViewController:[[ZMProgramInfoViewController alloc]init] animated:YES];
        }
            break;
            */
            
            
    }
}


#pragma mark CommunityHedToolViewDeletage
-(void)communityHedToolViewButton:(ZMButton*)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            [self.navigationController pushViewController:[[ZMNewsViewController alloc]init] animated:YES];
           
        }
            break;
        case 2:
        {
              [self.navigationController pushViewController:[[ZMStoryViewController alloc]init] animated:YES];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[ZMComicViewController alloc]init] animated:YES];
        }
            break;
    }
}


#pragma mark  CommunityViewDeletage
-(void)moreProgramButtonAction:(ZMButton*)sender
{
    [self.navigationController pushViewController:[[ZMMoreProgramViewController alloc]init] animated:YES];
}


#pragma mark SwitchStartViewDeletage 切换明星
-(void)switchStartViewAction:(SwitchStartModel*)model
{
    [[ZMUserInfo sharedUserInfo] setStar_cur:model.startId];
    
    [self getStartHomePageWithChangeStar:@"1" withStartId:model.startId withActionTop:@"1" withActionUpdateHis:@"2" withEndseq:@"0"];
    
    
    
}



#pragma mark  Response Method
#pragma mark  Private Method
#pragma mark 签到
-(void)navMoreRightBtnAction:(UIButton *)sender
{
    [self checkin:YES];
}


#pragma mark 切换明星
-(void)navRightBtnAction:(UIButton *)sender
{
    [self.switchStartView showWithStartArray:self.startArray];
}




#pragma mark 上拉刷新
-(void)refreshFooterAction
{
    CommunityFrame *frame = [self.communityArray lastObject];
    [self getStartHomePageWithChangeStar:@"2" withStartId:@"1" withActionTop:@"2" withActionUpdateHis:@"2" withEndseq:frame.model.schedule_id];
    
        
}




@end
