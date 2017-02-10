//
//  ZMMoreProgramViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMoreProgramViewController.h"
#import "MoreProgramFrame.h"
#import "MoreProgramView.h"
#import "ProgramScrollView.h"
#import "MoreProgramTableViewCell.h"
#import "ZMProgramInfoViewController.h"
#import "CommunityFrame.h"




@interface ZMMoreProgramViewController  () <ProgramScrollViewDeletage,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) MoreProgramView *programView; //!< 行程详情
@property (nonatomic,strong) ProgramScrollView *programScrollView;  //!< 行程
@property (nonatomic,strong) NSMutableArray *programArray;
@property (nonatomic,strong) UITableView *prograTableView; //!< 表视图

@end


@implementation ZMMoreProgramViewController




#pragma mark 获取更多行程数据
-(void)getwithMoreProgram
{
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *item = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                   @"sign":[ZMUserInfo sharedUserInfo].sign};
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"article/schedule_list.php" theParmeters:item sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     if ([data count])
                     {
                         /**
                          解析“schedule_list”数据信息
                          */
                         NSArray *schedule_listArray = [data objectForKey:@"schedule_list"];
                         for (NSDictionary *item in schedule_listArray)
                         {
                             NSMutableArray *modelArray = [NSMutableArray array];
                             NSString *year_month = [item objectForKey:@"year_month"];
                             NSArray *schedule_month_listArray = [item objectForKey:@"schedule_month_list"];
                             
                             for (int i = 0; i< [schedule_month_listArray count]; i++)
                             {
                                 NSDictionary *items = [schedule_month_listArray objectAtIndex:i];
                                 NSString *day = [items objectForKey:@"day"];
                                 NSString *hour_min = [items objectForKey:@"hour_min"];
                                 NSString *place = [items objectForKey:@"place"];
                                 NSString *schedule_id = [items objectForKey:@"schedule_id"];
                                 NSString *title = [items objectForKey:@"title"];
                                 NSString *type = [items objectForKey:@"type"];
                                 NSString *weekth = [items objectForKey:@"weekth"];
                                 
                                 MoreProgramFrame *frame = [[MoreProgramFrame alloc]init];
                                 MoreProgramModel *model = [[MoreProgramModel alloc]init];
                                 [model setProgramDay:day];
                                 [model setProgramMonth:@""];
                                 [model setProgramStartTime:hour_min];
                                 [model setLocationInfo:place];
                                 [model setSchedule_id:schedule_id];
                                 [model setProgramTitle:title];
                                 [model setProgramWeek:weekth];
                                 [model setType:type];
                                 [model setMoreProgramModelType:MoreProgramBriefType];
                                 [frame setModel:model];
                                 
                                 [modelArray addObject:frame];
                             }
                             
                             NSDictionary *modelDictionary = @{@"key":year_month,
                                                               @"value":modelArray};
                             [self.programArray addObject:modelDictionary];
                             [self.programArray addObject:modelDictionary];
                             [self.programArray addObject:modelDictionary];
                             [self.programArray addObject:modelDictionary];
                             [self.programArray addObject:modelDictionary];
                             [self.programArray addObject:modelDictionary];
                             [self.programArray addObject:modelDictionary];
                             [self.programArray addObject:modelDictionary];
                             [self.programArray addObject:modelDictionary];
                         }
                         
                         if ([self.programArray count])
                         {
                             [self.programScrollView setprogramArray:self.programArray];
                         }
                         
                         
                         /**
                          解析“nearest_schedule”最近行程
                          */
                         NSDictionary *nearest_scheduleDictionary = [data objectForKey:@"nearest_schedule"];
                         if ([nearest_scheduleDictionary count])
                         {
                             if ([[nearest_scheduleDictionary objectForKey:@"status"]integerValue] == 0)
                             {
                                 NSString *month_day = [nearest_scheduleDictionary objectForKey:@"month_day"];
                                 NSString *time = [nearest_scheduleDictionary objectForKey:@"time"];
                                 NSString *title = [nearest_scheduleDictionary objectForKey:@"title"];
                                 NSString *type = [nearest_scheduleDictionary objectForKey:@"type"];
                                 NSString *place = [nearest_scheduleDictionary objectForKey:@"place"];
                                 NSString *schedule_id = [nearest_scheduleDictionary objectForKey:@"schedule_id"];
                                 
                                 
                                 
                                 
                                 MoreProgramFrame *frame = [[MoreProgramFrame alloc]init];
                                 MoreProgramModel *model = [[MoreProgramModel alloc]init];
                                 [model setProgramDate:month_day];
                                 [model setProgramTitle:title];
                                 [model setLocationInfo:[NSString stringWithFormat:@"%@%@",place,type]];
                                 [model setProgramStartTime:time];
                                 [model setSchedule_id:schedule_id];
                                 [model setMoreProgramModelType:MoreProgramInfoType];
                                 [frame setModel:model];
                                 
                                 [self.programView resetWithMoreProgramInfoFrame:frame.MoreProgramViewFrame withdateLabelFrame:frame.dateLabelFrame withtitleLabelFrame:frame.titleLabelFrame withlocalctionViewFrame:frame.localctionViewFrame withtimeViewFrame:frame.timeViewFrame withModel:frame.model];
                             }
                         }
                     }
                 }
                 
             } error:^(NSError *error){}];
        }
    }
}





-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"行程"];
    [self getwithMoreProgram];
    [self.view addSubview:self.programView];
    [self.view addSubview:self.programScrollView];
    [self.view addSubview:self.prograTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}




#pragma mark - Getter / Setter
-(UITableView *)prograTableView
{
    if (_prograTableView == nil)
    {
        _prograTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 215, kScreen_Width, kScreen_Height-215) style:UITableViewStylePlain];
        [_prograTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_prograTableView setDelegate:self];
        [_prograTableView setDataSource:self];
    }
    return _prograTableView;
}
-(MoreProgramView*)programView
{
    if (_programView == nil)
    {
        _programView = [[MoreProgramView alloc]initWithMoreProgramInfoFrame];
    }
    return _programView;
}


-(ProgramScrollView *)programScrollView
{
    if (_programScrollView == nil)
    {
        _programScrollView = [[ProgramScrollView alloc]initWithFrame:CGRectMake(0,175, kScreen_Width, 40) setDeletage:self];
    }
    return _programScrollView;
}


-(NSMutableArray *)programArray
{
    if (_programArray == nil)
    {
        _programArray = [NSMutableArray array];
    }
    return _programArray;
}


#pragma mark - Deletage
#pragma mark ProgramScrollViewDeletage 代理方法
-(void)programScrollViewButtonAction:(ZMButton *)sender
{
    
    
    [self.programArray setArray:sender.programArray];
    [self.prograTableView reloadData];
    
    NSLog(@"%@",sender.programArray);
}



#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.programArray[indexPath.row] cellHight];

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityFrame *frame = self.programArray[indexPath.row];
    ZMProgramInfoViewController *programInfoViewController = [[ZMProgramInfoViewController alloc]init];
    [programInfoViewController starGetNewAndStoryAndComicInfoWithDetailId:frame.model.schedule_id];
    [self.navigationController pushViewController:programInfoViewController animated:YES];
}




#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.programArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoreProgramTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[MoreProgramTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setMoreProgramFrame:self.programArray[indexPath.row]];
    return cell;
}


@end

