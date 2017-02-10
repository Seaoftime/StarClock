//
//  ZMComicInfoViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMComicInfoViewController.h"
#import "StoryComicNewsInfoViewTableViewCell.h"
#import "KeyBoardToolBar.h"
#import "ZMComicSubmitViewController.h"





@interface ZMComicInfoViewController () <UITableViewDelegate,UITableViewDataSource,KeyBoardToolBarDeletage,StoryComicNewsInfoViewTableViewCellDeletage>

@property (nonatomic,strong) UITableView *comicInfoTableView;
@property (nonatomic,strong) NSMutableArray *comicArray;
@property (nonatomic,strong) KeyBoardToolBar *keyBoardToolBar;

@property (nonatomic,retain) NSString *detailId; //!<详情id


@end


@implementation ZMComicInfoViewController



#pragma mark - DataRequest Method

/**
 detailId:传递进去一个详情id
 */
-(void)starGetNewAndStoryAndComicInfoWithDetailId:(NSString*)detailId
{
    [self setDetailId:detailId];
    [self getNewAndStoryAndComicInfoWithCategoryType:@"3" withEndseq:@"0" withActionUpdateHis:@"1" withActionTop:@"1"];
}
/**
 categoryType:1为资讯 2为小说 3为漫画
 actionUpdateHis:1为获取最新 2为获取历史
 actionTop:   1 需要返回文章内容 包括阅读数量/评论数/点赞数 2 只获取评论内容
 */
-(void)getNewAndStoryAndComicInfoWithCategoryType:(NSString *)categoryType withEndseq:(NSString*)endseq withActionUpdateHis:(NSString *)actionUpdateHis withActionTop:(NSString *)actionTop
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSLog(@"%@",self.detailId);
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"category_type":categoryType,
                                        @"per_page":@"10",
                                        @"detail_id":self.detailId,
                                        @"start_seq":@"0",
                                        @"end_seq":endseq,
                                        @"action_update_his":actionUpdateHis,
                                        @"action_top":actionTop};
            
            
        
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"article/content_detail.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
#pragma mark 解析数据
                     NSDictionary *data = [object objectForKey:@"data"];
                     NSDictionary *contentDictionary = [data objectForKey:@"content"]; //!< 内容详情
                     if ([contentDictionary count])
                     {
                         NSString *article_id = [contentDictionary objectForKey:@"article_id"];
                         NSString *author = [contentDictionary objectForKey:@"author"];
                         NSInteger can_like = [[contentDictionary objectForKey:@"can_like"] integerValue];
                         NSString *category_type = [contentDictionary objectForKey:@"category_type"];
                         NSString *comment_num = [contentDictionary objectForKey:@"comment_num"];
                         NSString *content = [contentDictionary objectForKey:@"content"];
                         NSString *hour_min = [contentDictionary objectForKey:@"hour_min"];
                         NSString *like_num = [contentDictionary objectForKey:@"like_num"];
                         NSString *month_day = [contentDictionary objectForKey:@"month_day"];
                         NSString *read_num = [contentDictionary objectForKey:@"read_num"];
                         NSString *source = [contentDictionary objectForKey:@"source"];
                         NSString *star_id = [contentDictionary objectForKey:@"star_id"];
                         NSString *title = [contentDictionary objectForKey:@"title"];
                         NSArray *imageArray = [contentDictionary objectForKey:@"image_list"];
                         
#pragma mark  设置标题数据
                         /**
                          设置标题数据
                          */
                         StoryComicNewsInfoModel *titleModel = [[StoryComicNewsInfoModel alloc]init];
                         StoryComicNewsInfoFrame *titleFrame = [[StoryComicNewsInfoFrame alloc]init];
                         [titleModel setTitle:title];
                         [titleModel setDateTime:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                         [titleModel setStartId:star_id];
                         [titleModel setCategoryType:category_type];
                         [titleModel setArticle_id:article_id];
                         [titleModel setSource:source];
                         [titleModel setType:titleType];
                         [titleFrame setModel:titleModel];
                         [self.comicArray addObject:titleFrame];
                         
#pragma mark 设置内容数据
                         /**
                          设置内容数据
                          */
                         StoryComicNewsInfoFrame *contentFrame = [[StoryComicNewsInfoFrame alloc]init];
                         StoryComicNewsInfoModel *contentModel = [[StoryComicNewsInfoModel alloc]init];
                         [contentModel setDescribe:content];
                         [contentModel setType:describeType];
                         [contentFrame setModel:contentModel];
                         [self.comicArray addObject:contentFrame];
                         
#pragma mark 设置图片数据
                         /**
                          设置图片数据
                          */
                         for (int i = 0; i< [imageArray count]; i++)
                         {
                             NSDictionary *items = [imageArray objectAtIndex:i];
                             NSString *pathUrl = [items objectForKey:@"path"];
                             NSString *hight = [items objectForKey:@"h"];
                             NSString *width = [items objectForKey:@"w"];
                             
                             
                             StoryComicNewsInfoFrame *imageFrame = [[StoryComicNewsInfoFrame alloc]init];
                             StoryComicNewsInfoModel *imageModel = [[StoryComicNewsInfoModel alloc]init];
                             [imageModel setImageUrl:pathUrl];
                             [imageModel setImageWidth:width];
                             [imageModel setImageHight:hight];
                             [imageModel setType:imageType];
                             [imageFrame setModel:imageModel];
                             [self.comicArray addObject:imageFrame];
                             
                         }
                         
#pragma mark 设置作者数据
                         /**
                          设置作者数据
                          */
                         StoryComicNewsInfoFrame *authorFrame = [[StoryComicNewsInfoFrame alloc]init];
                         StoryComicNewsInfoModel *authorModel = [[StoryComicNewsInfoModel alloc]init];
                         [authorModel setAuthor:author];
                         [authorModel setCan_like:can_like];
                         [authorModel setReadNumer:read_num];
                         [authorModel setCommentNumer:comment_num];
                         [authorModel setSupportNumer:like_num];
                         [authorModel setType:authorType];
                         [authorFrame setModel:authorModel];
                         [self.comicArray addObject:authorFrame];
                     }
                     
                     
#pragma mark 设置评论数据
                     /**
                      设置评论数据
                      */
                     NSArray *commentArray = [data objectForKey:@"comment"]; //!< 评论列表
                     if ([commentArray count])
                     {
                         for (int i=0; i<[commentArray count]; i++)
                         {
                             NSDictionary *items = [commentArray objectAtIndex:i];
                             
                             NSString *comment_id = [items objectForKey:@"comment_id"];
                             NSString *content = [items objectForKey:@"content"];
                             NSString *like_num = [items objectForKey:@"like_num"];
                             NSString *month_day = [items objectForKey:@"month_day"];
                             NSString *hour_min = [items objectForKey:@"hour_min"];
                             NSString *nickname = [items objectForKey:@"nickname"];
                             NSString *user_id = [items objectForKey:@"user_id"];
                             NSString *score = [items objectForKey:@"score"]; //!< 得分
                             NSDictionary *imageDictionary = [items objectForKey:@"image"];
                             NSString *imageUrl = [imageDictionary objectForKey:@"path"];
                             
                             
                             StoryComicNewsInfoFrame *frame = [[StoryComicNewsInfoFrame alloc]init];
                             StoryComicNewsInfoModel *model = [[StoryComicNewsInfoModel alloc]init];
                             [model setNickName:nickname];
                             [model setHeadPortraitUrl:imageUrl];
                             [model setCommentDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                             [model setCommentId:comment_id];
                             [model setUserId:user_id];
                             [model setCommentDescribe:content];
                             [model setLevel:score];
                             [model setSupportNumer:like_num];
                             [model setType:commentType];
                             [frame setModel:model];
                             [self.comicArray addObject:frame];
                         }
                         
                         [self.comicInfoTableView.footer endRefreshing];
                         
                     }
                     else
                     {
                         [self.comicInfoTableView.footer noticeNoMoreData];
                     }
                     [self.comicInfoTableView reloadData];
                 }
                 else
                 {
                     [self.comicInfoTableView.footer noticeNoMoreData];
                 }
                 
             } error:^(NSError *error){}];
        }
        
    }
}



#pragma mark  发布评论
-(void)submitCommentWithContent:(NSString*)content withCategoryType:(NSString *)categoryType
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([content isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"内容不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign,
                                            @"category_type":categoryType,
                                            @"detail_id":self.detailId,
                                            @"comment_id":@"0",
                                            @"content":content};
                
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"article/content_comment.php" theParmeters:parmeters sucess:^(id object)
                {
                    if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                    {
                        NSDictionary *itemData = [object objectForKey:@"data"];
                        if ([itemData count])
                        {
                            NSString *comment_id = [itemData objectForKey:@"comment_id"];
                            NSString *content_comment_sum = [itemData objectForKey:@"content_comment_sum"];
                            NSString *content = [NSString stringWithFormat:@"%@",[itemData objectForKey:@"content"]];
                            NSString *editor_exp = [NSString stringWithFormat:@"%@",[itemData objectForKey:@"editor_exp"]];
                            NSString *editor_level = [itemData objectForKey:@"editor_level"];
                            NSString *level = [NSString stringWithFormat:@"%@",[itemData objectForKey:@"level"]];
                            NSString *like_num = [itemData objectForKey:@"like_num"];
                            NSString *month_day = [itemData objectForKey:@"month_day"];
                            NSString *hour_min = [itemData objectForKey:@"hour_min"];
                            NSString *nickname = [itemData objectForKey:@"nickname"];
                            NSString *user_id = [itemData objectForKey:@"user_id"];
                            NSString *score = [NSString stringWithFormat:@"%@",[itemData objectForKey:@"score"]]; //!< 得分
                            NSDictionary *imageDictionary = [itemData objectForKey:@"image"];
                            NSString *imageUrl = [imageDictionary objectForKey:@"path"];
                            
                            
                            
                            
                            [self.comicArray enumerateObjectsUsingBlock:^(StoryComicNewsInfoFrame  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
                             {
                                 switch (obj.model.type)
                                 {
                                         
                                     case authorType:
                                     {
                                         //首先更改评论数
                                         [obj.model setCommentNumer:content_comment_sum];
                                         
                                         
                                         //然后再把刚才发布的评论填充进数据模型里面
                                         StoryComicNewsInfoFrame *frame = [[StoryComicNewsInfoFrame alloc]init];
                                         StoryComicNewsInfoModel *model = [[StoryComicNewsInfoModel alloc]init];
                                         [model setNickName:nickname];
                                         [model setHeadPortraitUrl:imageUrl];
                                         [model setCommentDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                                         [model setCommentId:comment_id];
                                         [model setUserId:user_id];
                                         [model setSupportNumer:like_num];
                                         [model setCommentDescribe:content];
                                         [model setLevel:level];
                                         [model setScore:score];
                                         [model setEditor_exp:editor_exp];
                                         [model setEditor_level:editor_level];
                                         [model setType:commentType];
                                         [frame setModel:model];
                                         
                                         [self.comicArray insertObject:frame atIndex:(idx+1)];
                                         *stop = YES;
                                     }
                                         break;
                                     case titleType:
                                     case describeType:
                                     case imageType:
                                     case commentType:
                                         break;
                                         
                                 }
                             }];
                            
                            
                            [self.comicInfoTableView reloadData];
                            [AnyObjectActivityView showWithTitle:@"发布成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                        }
                    }
            
                } error:^(NSError *error)
                {
                    [AnyObjectActivityView showWithTitle:@"发布失败，请稍后再试..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                }];
            }
        }
    }
}

#pragma mark  点击 赞
-(void)submitSupportWithCategoryType:(NSString *)categoryType withSupportView:(SupportView*)supportView
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"category_type":categoryType,
                                        @"detail_id":self.detailId,
                                        @"comment_id":@"0"};
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"article/content_like.php" theParmeters:parmeters sucess:^(id object)
             {
                 
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     NSString *like_num = [NSString stringWithFormat:@"%@",[data objectForKey:@"like_num"]];
                     [supportView.model setSupportNumer:like_num];
                     [supportView.model setCan_like:2];
                     [self.comicInfoTableView reloadData];
                 }
                 
             } error:^(NSError *error){}];
        }
    }
    else
    {
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
}

#pragma mark - LifeStyle Method

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"漫画详情"];
    [self setNavRightBtnImage:@"社区添加"];
    [self.view addSubview:self.comicInfoTableView];
    [self.view addSubview:self.keyBoardToolBar];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    switch (self.editType)
    {
        case 0:
        {
            [self.keyBoardToolBar setHidden:YES];
            [self.comicInfoTableView setFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-60)];
        }
            break;
        case 1:
        {
            [self.comicInfoTableView setFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-100)];
            [self.keyBoardToolBar setHidden:NO];
            [self.keyBoardToolBar addNotification];
        }
            break;
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    switch (self.editType)
    {
        case 0:
        {
            [self.keyBoardToolBar setHidden:YES];
        }
            break;
        case 1:
        {
            [self.keyBoardToolBar setHidden:NO];
            [self.keyBoardToolBar removeNotification];
        }
            break;
    }
    
    
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
-(UITableView *)comicInfoTableView
{
    if (_comicInfoTableView == nil)
    {
        _comicInfoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-60) style:UITableViewStylePlain];
        [_comicInfoTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_comicInfoTableView setDelegate:self];
        [_comicInfoTableView setDataSource:self];
        [_comicInfoTableView setFooter:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterAction)]];
    }
    return _comicInfoTableView;
}


-(KeyBoardToolBar*)keyBoardToolBar
{
    if (_keyBoardToolBar == nil)
    {
        _keyBoardToolBar = [[KeyBoardToolBar alloc]initWithFrame:CGRectMake(0, kScreen_Height-40, kScreen_Width, 40) withDeletage:self setTableView:self.comicInfoTableView setArray:self.comicArray];
    }
    return _keyBoardToolBar;
}


-(NSMutableArray *)comicArray
{
    if (_comicArray == nil)
    {
        _comicArray = [NSMutableArray array];
    }
    return _comicArray;
}





#pragma mark - Delegate Method
#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.comicArray[indexPath.row] cellHight];
}




#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.comicArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoryComicNewsInfoViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[StoryComicNewsInfoViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier setDeletage:self];
    }
    [cell setInfoframe:self.comicArray[indexPath.row]];
    return cell;
}


#pragma mark KeyBoardToolBarDeletage 键盘发送按钮代理方法
-(void)sendMessageButtonAction:(UIButton *)sender
{
    [self.keyBoardToolBar.inputTextField resignFirstResponder];
    [self submitCommentWithContent:self.keyBoardToolBar.inputTextField.text withCategoryType:@"3"];
    self.keyBoardToolBar.inputTextField.text=@"";

}


#pragma mark StoryComicNewsInfoViewTableViewCellDeletage 点赞代理方法
-(void)infoAuthorViewSupportViewAction:(SupportView*)sender
{
    [self submitSupportWithCategoryType:@"3" withSupportView:sender];
}


#pragma mark - Response Method
#pragma mark - Private Method
#pragma mark 发布资讯信息按钮触发的方法
-(void)navRightBtnAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[[ZMComicSubmitViewController alloc]init] animated:YES];
}


#pragma mark 上拉刷新
-(void)refreshFooterAction
{
    StoryComicNewsInfoFrame *frame = [self.comicArray lastObject];
    [self getNewAndStoryAndComicInfoWithCategoryType:@"2" withEndseq:frame.model.commentId withActionUpdateHis:@"2" withActionTop:@"2"];
}



@end
