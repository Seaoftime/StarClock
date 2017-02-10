//
//  ZMComicViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMComicViewController.h"
#import "ZMComicInfoViewController.h"
#import "StoryComicNewsTableViewCell.h"
#import "ZMComicSubmitViewController.h"


@interface ZMComicViewController () <UITableViewDelegate,UITableViewDataSource>

/**
 资讯表视图
 */
@property (nonatomic,strong) UITableView *comicTableView;


/**
动漫数据数组
 */
@property (nonatomic,strong) NSMutableArray *comicsArray;




@end

@implementation ZMComicViewController






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
                            [self.comicsArray addObject:model];
                        }
                        [self.comicTableView.footer endRefreshing];
                        [self.comicTableView reloadData];
                    }
                    else
                    {
                        [self.comicTableView.footer noticeNoMoreData];
                    }
                }
             
                
                
            } error:^(NSError *error){
            
            
                NSLog(@"%@",error);
            
            
            }];
            
            
            
            
            
        }
    }
}












#pragma mark - LifeStyle Method

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"漫画"];
    [self setNavRightBtnImage:@"社区添加"];
    [self.view addSubview:self.comicTableView];
    
    
    [self getNewAndStoryAndComicWithCategoryType:@"3" withEndseq:@"0" withActionUpdateHis:@"1"];
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
-(UITableView *)comicTableView
{
    if (_comicTableView == nil)
    {
        _comicTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-60) style:UITableViewStylePlain];
        [_comicTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_comicTableView setDelegate:self];
        [_comicTableView setDataSource:self];
    }
    return _comicTableView;
}

-(NSMutableArray*)comicsArray
{
    if (_comicsArray == nil)
    {
        _comicsArray = [NSMutableArray array];
    }
    return _comicsArray;
}





#pragma mark - Delegate Method
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.comicsArray[indexPath.row] cellHight];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZMComicInfoViewController *comicInfoViewController =[[ZMComicInfoViewController alloc]init];
    StoryComicNewsModel *model = self.comicsArray[indexPath.row];
    [comicInfoViewController setEditType:1];
    [comicInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:model.article_id];
    [self.navigationController pushViewController:comicInfoViewController animated:YES];
}



#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.comicsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryComicNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[StoryComicNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setModel:self.comicsArray[indexPath.row]];
    return cell;
}


#pragma mark - Response Method
#pragma mark - Private Method
#pragma mark 发布资讯信息按钮触发的方法
-(void)navRightBtnAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[[ZMComicSubmitViewController alloc]init] animated:YES];
}



@end