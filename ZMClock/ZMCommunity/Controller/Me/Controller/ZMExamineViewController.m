//
//  ZMExamineViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMExamineViewController.h"
#import "StoryComicNewsTableViewCell.h"
#import "CommunityHedToolView.h"
#import "ZMTableView.h"
#import "ZMNewsInfoViewController.h"
#import "ZMStoryInfoViewController.h"
#import "ZMComicInfoViewController.h"




#define Hight_Y 70

@interface ZMExamineViewController () <UITableViewDelegate,UITableViewDataSource,CommunityHedToolViewDeletage,ZMTableViewDeletage>

@property (nonatomic,strong) ZMTableView *examineTableView; //!< 审核标示图
@property (nonatomic,strong) NSMutableArray *examineArray; //!< 审核数组
@property (nonatomic,strong) NSMutableArray *alreadyArray; //!< 审核数组
@property (nonatomic,strong) NSMutableArray *examineingArray; //!< 审核数组
@property (nonatomic,strong) NSMutableArray *undoneArray; //!< 审核数组
@property (nonatomic) NSInteger examineType; //!< 类型（根据不同类型刷新）
@property (nonatomic,strong) CommunityHedToolView *hedToolView;  //头部选择工具视图

@end

@implementation ZMExamineViewController



#pragma mark - DataRequest Method
#pragma mark 获取已经通过的文章
-(void)getAlreadyWithEndSeq:(NSString*)endSeq
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *Parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"article_status":@"2",
                                        @"per_page":@"10",
                                        @"start_seq":@"0",
                                        @"end_seq":endSeq};
            
            
            
            [[[AFNetworkingHelper alloc]init] postWithUrl:@"user/get_user_article_list.php" theParmeters:Parmeters sucess:^(id object)
            {
                if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                {
                    NSDictionary *data = [object objectForKey:@"data"];
                    if ([data count])
                    {
                        NSArray *article_list = [data objectForKey:@"article_list"];
                        if ([article_list count])
                        {
                            for (NSDictionary *item in article_list)
                            {
                                NSString *article_id = [item objectForKey:@"article_id"];
                                NSString *category_type = [item objectForKey:@"category_type"];
                                NSString *title = [item objectForKey:@"title"];
                                NSString *author = [item objectForKey:@"author"];
                                NSString *source = [item objectForKey:@"source"];
                                NSString *star_id = [item objectForKey:@"star_id"];
                                NSString *audit_advice = [item objectForKey:@"audit_advice"];
                                NSString *hour_min = [item objectForKey:@"hour_min"];
                                NSString *month_day = [item objectForKey:@"month_day"];
                                NSString *intro = [item objectForKey:@"intro"];
                                NSString *comment_num = [item objectForKey:@"comment_num"];
                                NSDictionary *image_url = [item objectForKey:@"image_url"];
                                NSString *path = [image_url objectForKey:@"image_url"];
                                
                                
                                
                                
                                StoryComicNewsModel *model = [[StoryComicNewsModel alloc]init];
                                [model setArticle_id:article_id];
                                [model setCategory_type:category_type];
                                [model setTitle:title];
                                [model setDescribe:intro];
                                [model setExaminationFail:audit_advice];
                                [model setAuthor:author];
                                [model setSupportNumber:comment_num];
                                [model setDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                                [model setUrl:path];
                                [model setCellHight:120];
                                [model setSupportImageName:@"评论"];
                                [model setSupportType:showType];
                                [model setStoryComicNewsModelType:normalType];
                                [self.alreadyArray addObject:model];
                            }
                            [self examineActionType:1];
                            [self.examineTableView.footer endRefreshing];
                        }
                        else
                        {
                            [self.examineTableView.footer noticeNoMoreData];
                        }
                    }
                    else
                    {
                        [self.examineTableView.footer endRefreshing];
                    }
                }
                else
                {
                    [self.examineTableView.footer endRefreshing];
                }
                
            } error:^(NSError *error)
            {
                [self.examineTableView.footer endRefreshing];
            }];
        }
    }
}



#pragma mark 获取审核未通过的文章
-(void)getUndoneWithEndSeq:(NSString*)endSeq
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *Parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"article_status":@"3",
                                        @"per_page":@"10",
                                        @"start_seq":@"0",
                                        @"end_seq":endSeq};
            [[[AFNetworkingHelper alloc]init] postWithUrl:@"user/get_user_article_list.php" theParmeters:Parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     if ([data count])
                     {
                         NSArray *article_list = [data objectForKey:@"article_list"];
                         if ([article_list count])
                         {
                             for (NSDictionary *item in article_list)
                             {
                                 NSString *article_id = [item objectForKey:@"article_id"];
                                 NSString *category_type = [item objectForKey:@"category_type"];
                                 NSString *title = [item objectForKey:@"title"];
                                 NSString *author = [item objectForKey:@"author"];
                                 NSString *source = [item objectForKey:@"source"];
                                 NSString *star_id = [item objectForKey:@"star_id"];
                                 NSString *audit_advice = [item objectForKey:@"audit_advice"];
                                 NSString *hour_min = [item objectForKey:@"hour_min"];
                                 NSString *month_day = [item objectForKey:@"month_day"];
                                 NSString *intro = [item objectForKey:@"intro"];
                                 NSString *comment_num = [item objectForKey:@"comment_num"];
                                 NSDictionary *image_url = [item objectForKey:@"image_url"];
                                 NSString *path = [image_url objectForKey:@"image_url"];
                                 
                                 
                                 
                                 
                                 StoryComicNewsModel *model = [[StoryComicNewsModel alloc]init];
                                 [model setArticle_id:article_id];
                                 [model setCategory_type:category_type];
                                 [model setTitle:title];
                                 [model setDescribe:intro];
                                 [model setExaminationFail:audit_advice];
                                 [model setAuthor:author];
                                 [model setSupportNumber:comment_num];
                                 [model setDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                                 [model setUrl:path];
                                 [model setCellHight:120];
                                 [model setSupportImageName:@"评论"];
                                 [model setSupportType:hiddenType];
                                 [model setStoryComicNewsModelType:examinationFailType];
                                 [self.undoneArray addObject:model];
                             }
                             [self examineActionType:3];
                             [self.examineTableView.footer endRefreshing];
                         }
                         else
                         {
                             [self.examineTableView.footer noticeNoMoreData];
                         }
                     }
                     else
                     {
                         [self.examineTableView.footer endRefreshing];
                     }
                 }
                 else
                 {
                     [self.examineTableView.footer endRefreshing];
                 }
                 
             } error:^(NSError *error)
             {
                 [self.examineTableView.footer endRefreshing];
             }];
        }
    }
}

#pragma mark 获取审核中的文章
-(void)getExamineWithEndSeq:(NSString*)endSeq
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *Parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"article_status":@"1",
                                        @"per_page":@"10",
                                        @"start_seq":@"0",
                                        @"end_seq":endSeq};
            [[[AFNetworkingHelper alloc]init] postWithUrl:@"user/get_user_article_list.php" theParmeters:Parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     if ([data count])
                     {
                         NSArray *article_list = [data objectForKey:@"article_list"];
                         if ([article_list count])
                         {
                             for (NSDictionary *item in article_list)
                             {
                                 NSString *article_id = [item objectForKey:@"article_id"];
                                 NSString *category_type = [item objectForKey:@"category_type"];
                                 NSString *title = [item objectForKey:@"title"];
                                 NSString *author = [item objectForKey:@"author"];
                                 NSString *source = [item objectForKey:@"source"];
                                 NSString *star_id = [item objectForKey:@"star_id"];
                                 NSString *audit_advice = [item objectForKey:@"audit_advice"];
                                 NSString *hour_min = [item objectForKey:@"hour_min"];
                                 NSString *month_day = [item objectForKey:@"month_day"];
                                 NSString *intro = [item objectForKey:@"intro"];
                                 NSString *comment_num = [item objectForKey:@"comment_num"];
                                 NSDictionary *image_url = [item objectForKey:@"image_url"];
                                 NSString *path = [image_url objectForKey:@"image_url"];
                                 
                                 
                                 
                                 
                                 StoryComicNewsModel *model = [[StoryComicNewsModel alloc]init];
                                 [model setArticle_id:article_id];
                                 [model setCategory_type:category_type];
                                 [model setTitle:title];
                                 [model setDescribe:intro];
                                 [model setExaminationFail:audit_advice];
                                 [model setAuthor:author];
                                 [model setSupportNumber:comment_num];
                                 [model setDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                                 [model setUrl:path];
                                 [model setCellHight:120];
                                 [model setSupportImageName:@"评论"];
                                 [model setSupportType:hiddenType];
                                 [model setStoryComicNewsModelType:normalType];
                                 [self.examineArray addObject:model];
                             }
                             [self examineActionType:2];
                             [self.examineTableView.footer endRefreshing];
                         }
                         else
                         {
                             [self.examineTableView.footer noticeNoMoreData];
                         }
                     }
                     else
                     {
                         [self.examineTableView.footer endRefreshing];
                     }
                 }
                 else
                 {
                     [self.examineTableView.footer endRefreshing];
                 }
                 
             } error:^(NSError *error)
             {
                 [self.examineTableView.footer endRefreshing];
             }];
        }
    }
}












#pragma mark - LifeStyle Method
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavRightBtnHidden:YES];
    [self setTitle:@"我的文章"];
    [self.view addSubview:self.hedToolView];
    [self.view addSubview:self.examineTableView];
    [self getAlreadyWithEndSeq:@"0"];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark - Getter / Setter
-(UITableView *)examineTableView
{
    if (_examineTableView == nil)
    {
        _examineTableView = [[ZMTableView alloc]initWithFrame:CGRectMake(0, 124, kScreen_Width, kScreen_Height-124) withCellSeparatorStyle:UITableViewCellSeparatorStyleNone withImageName:@"没发布内容" withTiptitle:@"没发布内容" setDeletage:self];
        [_examineTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_examineTableView setDelegate:self];
        [_examineTableView setDataSource:self];
        [_examineTableView setFooter:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterAction)]];
    }
    return _examineTableView;
}

-(NSMutableArray *)examineArray
{
    if (_examineArray == nil)
    {
        _examineArray = [NSMutableArray array];
    }
    return _examineArray;
}



-(NSMutableArray *)alreadyArray
{
    if (_alreadyArray == nil)
    {
        _alreadyArray = [NSMutableArray array];
    }
    return _alreadyArray;
}



-(NSMutableArray *)examineingArray
{
    if (_examineingArray == nil)
    {
        _examineingArray = [NSMutableArray array];
    }
    return _examineingArray;
}


-(NSMutableArray *)undoneArray
{
    if (_undoneArray == nil)
    {
        _undoneArray = [NSMutableArray array];
    }
    return _undoneArray;
}







-(CommunityHedToolView*)hedToolView
{
    if (_hedToolView == nil)
    {
        _hedToolView = [[CommunityHedToolView alloc]initWithFrame:CGRectMake(0, 64, kScreen_Width, 60) withDeletage:self];
        [_hedToolView.newsButton setTitle:@"已发布" forState:UIControlStateNormal];
        [_hedToolView.storyButton setTitle:@"审核中" forState:UIControlStateNormal];
        [_hedToolView.comicButton setTitle:@"未通过" forState:UIControlStateNormal];
    }
    return _hedToolView;
}


#pragma mark - Deletage 方法
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.examineArray[indexPath.row] cellHight];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryComicNewsModel *model = self.examineArray[indexPath.row];
    switch (self.examineType)
    {
        case 1:
        {
            
            if ([model.category_type isEqualToString:@"1"])
            {
                ZMNewsInfoViewController *newsInfoViewController = [[ZMNewsInfoViewController alloc]init];
                [newsInfoViewController setEditType:1];
                [newsInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
                [self.navigationController  pushViewController:newsInfoViewController animated:YES];
            }
            else if ([model.category_type isEqualToString:@"2"])
            {
                ZMStoryInfoViewController *storyInfoViewController = [[ZMStoryInfoViewController alloc]init];
                [storyInfoViewController setEditType:1];
                [storyInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
                [self.navigationController  pushViewController:storyInfoViewController animated:YES];
            }
            else if ([model.category_type isEqualToString:@"3"])
            {
                ZMComicInfoViewController *comicInfoViewController = [[ZMComicInfoViewController alloc]init];
                [comicInfoViewController setEditType:1];
                [comicInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
                [self.navigationController  pushViewController:comicInfoViewController animated:YES];
            }
            else if ([model.category_type isEqualToString:@"4"])
            {
                ZMNewsInfoViewController *newsInfoViewController = [[ZMNewsInfoViewController alloc]init];
                [newsInfoViewController setEditType:1];
                [newsInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
                [self.navigationController  pushViewController:newsInfoViewController animated:YES];
            }
            
            
            
            
        }
            break;
        case 2:
        case 3:
        {
            if ([model.category_type isEqualToString:@"1"])
            {
                ZMNewsInfoViewController *newsInfoViewController = [[ZMNewsInfoViewController alloc]init];
                [newsInfoViewController setEditType:0];
                [newsInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
                [self.navigationController  pushViewController:newsInfoViewController animated:YES];
            }
            else if ([model.category_type isEqualToString:@"2"])
            {
                ZMStoryInfoViewController *storyInfoViewController = [[ZMStoryInfoViewController alloc]init];
                [storyInfoViewController setEditType:0];
                [storyInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
                [self.navigationController  pushViewController:storyInfoViewController animated:YES];
            }
            else if ([model.category_type isEqualToString:@"3"])
            {
                ZMComicInfoViewController *comicInfoViewController = [[ZMComicInfoViewController alloc]init];
                [comicInfoViewController setEditType:0];
                [comicInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
                [self.navigationController  pushViewController:comicInfoViewController animated:YES];
            }
            else if ([model.category_type isEqualToString:@"4"])
            {
                ZMNewsInfoViewController *newsInfoViewController = [[ZMNewsInfoViewController alloc]init];
                [newsInfoViewController setEditType:0];
                [newsInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
                [self.navigationController  pushViewController:newsInfoViewController animated:YES];
            }
        }
            break;
    }
}



#pragma mark UITableViewDataSource
- (NSInteger)tableView:(ZMTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView tableTipViewWithArray:self.examineArray];
    return [self.examineArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryComicNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[StoryComicNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setModel:self.examineArray[indexPath.row]];
    return cell;
}


#pragma mark ZMTableViewDeletage 点击没有内图标代理
-(void)tipAction:(TableTipView *)sender
{
    switch (self.examineType)
    {
        case 1:
        {
            [self getAlreadyWithEndSeq:@"0"];
        }
            break;
        case 2:
        {
            [self getExamineWithEndSeq:@"0"];
        }
            break;
        case 3:
        {
            [self getUndoneWithEndSeq:@"0"];
        }
            break;
    }
}



#pragma mark CommunityHedToolViewDeletage
-(void)communityHedToolViewButton:(ZMButton*)sender
{
    [self examineActionType:sender.tag];
}


-(void)examineActionType:(NSInteger)actionType
{
    switch (actionType)
    {
        case 1:
        {
            [self setExamineType:1];
            [self.examineArray setArray:self.alreadyArray];
        }
            break;
        case 2:
        {
            [self setExamineType:2];
            [self.examineArray setArray:self.examineingArray];
        }
            break;
        case 3:
        {
            [self setExamineType:3];
            [self.examineArray setArray:self.undoneArray];
        }
            break;
    }
    
    /**
     重置没有更多信息
     */
    [self.examineTableView.footer resetNoMoreData];
    [self.examineTableView reloadData];
}


#pragma mark 刷新表格视图
-(void)refreshFooterAction
{
    StoryComicNewsModel *model = [self.examineArray lastObject];
    switch (self.examineType)
    {
        case 1:
        {
            [self getAlreadyWithEndSeq:model.article_id];
        }
            break;
        case 2:
        {
            [self getExamineWithEndSeq:model.article_id];
        }
            break;
        case 3:
        {
            [self getUndoneWithEndSeq:model.article_id];
        }
            break;
    }
}


@end
