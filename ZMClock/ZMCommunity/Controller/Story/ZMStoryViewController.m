//
//  ZMStoryViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMStoryViewController.h"
#import "ZMStoryInfoViewController.h"
#import "StoryComicNewsTableViewCell.h"
#import "ZMStorySubmitViewController.h"





@interface ZMStoryViewController () <UITableViewDelegate,UITableViewDataSource>

/**
 资讯表视图
 */
@property (nonatomic,strong) UITableView *storyTableView;


/**
 小说数据数组
 */
@property (nonatomic,strong) NSMutableArray *storyArray;




@end

@implementation ZMStoryViewController






#pragma mark - DataRequest Method
#pragma mark - DataRequest Method
/**
 categoryType:1为资讯 2为小说 3为漫画
 actionUpdateHis:1为获取最新 2为获取历史
 */
-(void)getNewAndStoryAndComicWithCategoryType:(NSString *)categoryType withEndseq:(NSString*)endseq withActionUpdateHis:(NSString *)actionUpdateHis
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"category_type":categoryType,
                                        @"per_page":@"10",
                                        @"start_seq":@"0",
                                        @"end_seq":endseq,
                                        @"action_update_his":actionUpdateHis};
            
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"article/article_list.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     NSArray *itemsArray = [data objectForKey:@"article"];
                     if ([itemsArray count])
                     {
                         for (int i = 0; i < [itemsArray count]; i++)
                         {
                             NSDictionary *itemsDictionary = [itemsArray objectAtIndex:i];
                             
                             NSString *article_id = [itemsDictionary objectForKey:@"article_id"];
                             NSString *author = [itemsDictionary objectForKey:@"author"];
                             NSString *comment_num = [itemsDictionary objectForKey:@"comment_num"];
                             NSString *hour_min = [itemsDictionary objectForKey:@"hour_min"];
                             NSString *intro = [itemsDictionary objectForKey:@"intro"];
                             NSString *month_day = [itemsDictionary objectForKey:@"month_day"];
                             NSString *title = [itemsDictionary objectForKey:@"title"];
                             NSDictionary *imageDictionary = [itemsDictionary objectForKey:@"image"];
                             NSString *pathUrl = [imageDictionary objectForKey:@"path"];
                             
                             StoryComicNewsModel *model = [[StoryComicNewsModel alloc]init];
                             [model setTitle:title];
                             [model setDescribe:intro];
                             [model setAuthor:author];
                             [model setSupportNumber:comment_num];
                             [model setSupportImageName:@"评论"];
                             [model setDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                             [model setArticle_id:article_id];
                             [model setUrl:pathUrl];
                             [model setCellHight:100];
                             [model setStoryComicNewsModelType:normalType];
                             [self.storyArray addObject:model];
                         }
                         
                         [self.storyTableView.footer endRefreshing];
                         
                         [self.storyTableView reloadData];
                     }
                     else
                     {
                         [self.storyTableView.footer noticeNoMoreData];
                     }
                 }
                 
                 
             } error:^(NSError *error){}];
            

        }
        
    }
}



#pragma mark - LifeStyle Method

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"小说"];
    [self setNavRightBtnImage:@"社区添加"];
    [self.view addSubview:self.storyTableView];
    [self getNewAndStoryAndComicWithCategoryType:@"2" withEndseq:@"0" withActionUpdateHis:@"1"];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}





#pragma mark - Getter / Setter
-(UITableView *)storyTableView
{
    if (_storyTableView == nil)
    {
        _storyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-60) style:UITableViewStylePlain];
        [_storyTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_storyTableView setDelegate:self];
        [_storyTableView setDataSource:self];
        [_storyTableView setFooter:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterAction)]];
    }
    return _storyTableView;
}


-(NSMutableArray*)storyArray
{
    if (_storyArray == nil)
    {
        _storyArray = [NSMutableArray array];
    }
    return _storyArray;
}





#pragma mark - Delegate Method
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.storyArray[indexPath.row] cellHight];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZMStoryInfoViewController *storyInfoViewController =[[ZMStoryInfoViewController alloc]init];
    [storyInfoViewController setEditType:1];
    StoryComicNewsModel *model = self.storyArray[indexPath.row];
    [storyInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
    [self.navigationController pushViewController:storyInfoViewController animated:YES];
}



#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.storyArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryComicNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[StoryComicNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setModel:self.storyArray[indexPath.row]];
    return cell;
}


#pragma mark - Response Method
#pragma mark - Private Method
#pragma mark 发布资讯信息按钮触发的方法
-(void)navRightBtnAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[[ZMStorySubmitViewController alloc]init] animated:YES];
}


#pragma mark 上拉刷新
-(void)refreshFooterAction
{
    StoryComicNewsModel *model = [self.storyArray lastObject];
    [self getNewAndStoryAndComicWithCategoryType:@"2" withEndseq:model.article_id withActionUpdateHis:@"2"];
}



@end


