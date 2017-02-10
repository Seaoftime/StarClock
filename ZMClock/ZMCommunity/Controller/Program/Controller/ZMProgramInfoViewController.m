//
//  ZMProgramInfoViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMProgramInfoViewController.h"
#import "ProgramInfoTableViewCell.h"
#import "StoryComicNewsInfoFrame.h"
#import "KeyBoardToolBar.h"


@interface ZMProgramInfoViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *programInfoTableView;
@property (nonatomic,strong) NSMutableArray *programInfoArray;
@property (nonatomic,retain) NSString *detailId; //!< 信息id
@property (nonatomic,retain) KeyBoardToolBar *keyBoardToolBar;



@end

@implementation ZMProgramInfoViewController

/**
 detailId:传递进去一个详情id
 */
-(void)starGetNewAndStoryAndComicInfoWithDetailId:(NSString*)detailId
{
    [self setDetailId:detailId];
    [self getNewAndStoryAndComicInfoWithCategoryType:@"4" withEndseq:@"0" withActionUpdateHis:@"1" withActionTop:@"1"];
}


#pragma mark 获取详情
/**
 categoryType:1为资讯 2为小说 3为漫画
 actionUpdateHis:1为获取最新 2为获取历史
 actionTop:   1 需要返回文章内容 包括阅读数量/评论数/点赞数 2 只获取评论内容
 */
-(void)getNewAndStoryAndComicInfoWithCategoryType:(NSString *)categoryType withEndseq:(NSString*)endseq withActionUpdateHis:(NSString *)actionUpdateHis withActionTop:(NSString *)actionTop
{
    if ([AFNetworkingHelper sharedNetworkingHelper])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
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
                         NSString *place = [contentDictionary objectForKey:@"place"];
                         NSInteger can_like = [[contentDictionary objectForKey:@"can_like"] integerValue];
                         NSString *type = [contentDictionary objectForKey:@"type"];
                         NSString *comment_num = [NSString stringWithFormat:@"%@",[contentDictionary objectForKey:@"comment_num"]];
                         NSString *hour_min = [contentDictionary objectForKey:@"hour_min"];
                         NSString *like_num = [NSString stringWithFormat:@"%@",[contentDictionary objectForKey:@"like_num"]];
                         NSString *read_num = [NSString stringWithFormat:@"%@",[contentDictionary objectForKey:@"read_num"]];
                         NSString *star_id = [contentDictionary objectForKey:@"star_id"];
                         NSString *title = [contentDictionary objectForKey:@"title"];
                         NSString *year_month_day = [contentDictionary objectForKey:@"year_month_day"];
                         
                         
                         NSDictionary *imageDictionary = [contentDictionary objectForKey:@"image_url"];
                         NSString *pathUrl = [imageDictionary objectForKey:@"path"];
                         
#pragma mark  设置明细图片数据
                         /**
                          设置明细图片数据
                          */
                         ProgramModel *imageModel = [[ProgramModel alloc]init];
                         ProgramFrame *titleFrame = [[ProgramFrame alloc]init];
                         [imageModel setStartImageUrl:pathUrl];
                         [imageModel setProgramType:startImageType];
                         [titleFrame setModel:imageModel];
                         [self.programInfoArray addObject:titleFrame];
                         
                         
                         /**
                          设置明细图片数据
                          */
                         ProgramModel *infoModel = [[ProgramModel alloc]init];
                         ProgramFrame *infoFrame = [[ProgramFrame alloc]init];
                         [infoModel setPrograminfoDate:year_month_day];
                         [infoModel setPrograminfoTitle:title];
                         [infoModel setLocationInfo:[NSString stringWithFormat:@"%@%@",place,type]];
                         [infoModel setTime:hour_min];
                         [infoModel setProgramType:infoType];
                         [infoFrame setModel:infoModel];
                         [self.programInfoArray addObject:infoFrame];
                         
                         
#pragma mark 设置作者数据
                         /**
                          设置作者数据
                          */
                         ProgramFrame *commentFrame = [[ProgramFrame alloc]init];
                         ProgramModel *commentModel = [[ProgramModel alloc]init];
                         [commentModel setComment:@"评论"];
                         [commentModel setCan_like:can_like];
                         [commentModel setRedNumber:read_num];
                         [commentModel setLikeNumber:like_num];
                         [commentModel setStarId:star_id];
                         [commentModel setCommentNumber:comment_num];
                         [commentModel setProgramType:commentNumberType];
                         [commentFrame setModel:commentModel];
                         [self.programInfoArray addObject:commentFrame];
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
                             
                             ProgramFrame *commentFrame = [[ProgramFrame alloc]init];
                             ProgramModel *commentModel = [[ProgramModel alloc]init];
                             [commentModel setHeadPortraiteUrl:imageUrl];
                             [commentModel setCommentNickName:nickname];
                             [commentModel setCommentDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                             [commentModel setCommentDescribe:content];
                             [commentModel setUserid:user_id];
                             [commentModel setCommentId:comment_id];
                             [commentModel setLevel:score];
                             [commentModel setCommentNumber:like_num];
                             [commentModel setProgramType:commentitemsType];
                             [commentFrame setModel:commentModel];
                             [self.programInfoArray addObject:commentFrame];
                         }
                         
                         [self.programInfoTableView.footer endRefreshing];
                     }
                     else
                     {
                         [self.programInfoTableView.footer noticeNoMoreData];
                     }
                     [self.programInfoTableView reloadData];
                 }
                 else
                 {
                     [self.programInfoTableView.footer noticeNoMoreData];
                 }
                 
             } error:^(NSError *error){}];
        }
    }
    else
    {
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
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
                         
                         ///////////////////
                         
                         
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
                             
                             
                             
                             
                             [self.programInfoArray enumerateObjectsUsingBlock:^(ProgramFrame  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
                              {
                                  switch (obj.model.programType)
                                  {
                                          
                                      case commentNumberType:
                                      {
                                          //首先更改评论数
                                          [obj.model setCommentNumber:content_comment_sum];
                                          
                                          
                                          //然后再把刚才发布的评论填充进数据模型里面
                                          ProgramFrame *commentFrame = [[ProgramFrame alloc]init];
                                          ProgramModel *commentModel = [[ProgramModel alloc]init];
                                          [commentModel setHeadPortraiteUrl:imageUrl];
                                          [commentModel setCommentNickName:nickname];
                                          [commentModel setCommentDate:[NSString stringWithFormat:@"%@ %@",month_day,hour_min]];
                                          [commentModel setCommentDescribe:content];
                                          [commentModel setUserid:user_id];
                                          [commentModel setCommentId:comment_id];
                                          [commentModel setLevel:score];
                                          [commentModel setCommentNumber:like_num];
                                          [commentModel setProgramType:commentitemsType];
                                          [commentFrame setModel:commentModel];
                                          
                                          [self.programInfoArray insertObject:commentFrame atIndex:(idx+1)];
                                          *stop = YES;
                                      }
                                          break;
                                      case infoType:
                                      case startImageType:
                                      case commentitemsType:
                                          break;
                                          
                                  }
                              }];
                             
                             
                             [self.programInfoTableView reloadData];
                         
                         
                         
                         
                         
                         
                         
                         
                         
/////////////////////////////////
                         
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








-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"行程详情"];
    [self.view addSubview:self.programInfoTableView];
    [self.view addSubview:self.keyBoardToolBar];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.keyBoardToolBar addNotification];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.keyBoardToolBar removeNotification];
}



-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}




#pragma mark - Getter / Setter 
-(NSMutableArray*)programInfoArray
{
    if (_programInfoArray == nil)
    {
        _programInfoArray = [NSMutableArray array];
        
        
       
        
    }
    return _programInfoArray;
}



-(UITableView *)programInfoTableView
{
    if (_programInfoTableView == nil)
    {
        _programInfoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-120) style:UITableViewStylePlain];
        [_programInfoTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_programInfoTableView setDelegate:self];
        [_programInfoTableView setDataSource:self];
        [_programInfoTableView setFooter:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooterAction)]];
    }
    return _programInfoTableView;
}

-(KeyBoardToolBar*)keyBoardToolBar
{
    if (_keyBoardToolBar == nil)
    {
        _keyBoardToolBar = [[KeyBoardToolBar alloc]initWithFrame:CGRectMake(0, kScreen_Height-40, kScreen_Width, 40) withDeletage:self setTableView:self.programInfoTableView setArray:self.programInfoArray];
    }
    return _keyBoardToolBar;
}



#pragma mark - Deletage
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.programInfoArray[indexPath.row] cellHight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.programInfoArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProgramInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[ProgramInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setProgramFrame:self.programInfoArray[indexPath.row]];
    NSLog(@"-----2---%@",self.programInfoArray[indexPath.row]);

    
  
    
    
    return cell;
}

#pragma mark KeyBoardToolBarDeletage
-(void)sendMessageButtonAction:(UIButton*)sender
{
    [self submitCommentWithContent:self.keyBoardToolBar.inputTextField.text withCategoryType:@"4"];
}





#pragma mark 上拉刷新
-(void)refreshFooterAction
{
    ProgramFrame *frame = [self.programInfoArray lastObject];
    
    
    [self getNewAndStoryAndComicInfoWithCategoryType:@"4" withEndseq:frame.model.commentId withActionUpdateHis:@"2" withActionTop:@"2"];
}

@end
