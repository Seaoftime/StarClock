//
//  GAmerenwucontroller.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "GAmerenwucontroller.h"

#import "GameSettingTableViewCell.h"

#import "renwumodel.h"

#import "ZMPlayerTasksTableViewCell.h"



@interface ZMGameBaseViewController ()<UITableViewDelegate,UITableViewDataSource>




@end

@implementation GAmerenwucontroller




#pragma mark 获取玩家任务
-(void)getUserwanjiarenwu:(BOOL)userwanjiarenwu
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign
                                        };
            
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/get_task_list.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     if ([data count])
                     {

                         NSArray *starter_task = [data objectForKey:@"starter_task"];
                         if ([starter_task count])
                         {
                             [self.gamerenwuArray removeAllObjects];
                             [self.gamerenwuArray1 removeAllObjects];

                             [self.gamerenwuArray2 removeAllObjects];

                             
                    for (NSDictionary *item in starter_task)
                            {
                            renwumodel *model=[[renwumodel alloc]init];
                                 
                            NSString *unique_id=[item objectForKey:@"unique_id"];
                            NSString *task_id=[item objectForKey:@"task_id"];
                            NSString *task_status=[item objectForKey:@"task_status"];
                                [self.gamerenwuArray addObject:unique_id];
                                [self.gamerenwuArray1 addObject:task_id];
                                [self.gamerenwuArray2 addObject:task_status];
                                  
                                //model 不会使用,所以就放在这了
                                  [model setUnique_id:unique_id];
                                  [model setTask_id:task_id];
                                  [model setTask_status:task_status];
                                  
                 
                             
                }
                             
        }
                         
                         NSArray *day_task = [data objectForKey:@"day_task"];
                         if ([day_task count])
                         {
                             
                             for (NSDictionary *item in day_task)
                                 
                             {

                             renwumodel *model=[[renwumodel alloc]init];
                            NSString *unique_id=[item objectForKey:@"unique_id"];
                            NSString *task_id=[item objectForKey:@"task_id"];
                            NSString *task_status=[item objectForKey:@"task_status"];
                                 [self.gamerenwuArray addObject:unique_id];
                                 [self.gamerenwuArray1 addObject:task_id];
                                 [self.gamerenwuArray2 addObject:task_status];
                                 
                             [model setUnique_id:unique_id];
                             [model setTask_status:task_id];
                             [model setTask_status:task_status];
                               
                                
                                 
                             }
                             
                         }
                         [self.gameSettingTableView1 reloadData];
                         
                     }
                     
                     //获取unique_id
                     _unique_id0=self.gamerenwuArray[0];
                     _unique_id1=self.gamerenwuArray[1];
                    _unique_id2=self.gamerenwuArray[2];
                     _unique_id3=self.gamerenwuArray[3];
                     _unique_id4=self.gamerenwuArray[4];
                     _unique_id5=self.gamerenwuArray[5];
                     _unique_id6=self.gamerenwuArray[6];
                     _unique_id7=self.gamerenwuArray[7];
                     _unique_id8=self.gamerenwuArray[8];
                      //每日任务unique_id
                     _unique_id9=self.gamerenwuArray[9];                     
                      //获取task_id
                     
                     _task_id0=self.gamerenwuArray1[0];
                     _task_id1=self.gamerenwuArray1[1];
                     _task_id2=self.gamerenwuArray1[2];
                     _task_id3=self.gamerenwuArray1[3];
                     _task_id4=self.gamerenwuArray1[4];
                     _task_id5=self.gamerenwuArray1[5];
                     _task_id6=self.gamerenwuArray1[6];
                     _task_id7=self.gamerenwuArray1[7];
                    _task_id8=self.gamerenwuArray1[8];
                      //每日任务task_id
                     _task_id9=self.gamerenwuArray1[9];
                     
                     //获取task_status
                     _jiushu0=self.gamerenwuArray2[0];
                     _jiushu1=self.gamerenwuArray2[1];
                     _jiushu2=self.gamerenwuArray2[2];
                     _jiushu3=self.gamerenwuArray2[3];
                     _jiushu4=self.gamerenwuArray2[4];
                     _jiushu5=self.gamerenwuArray2[5];
                     _jiushu6=self.gamerenwuArray2[6];
                     _jiushu7=self.gamerenwuArray2[7];
                     _jiushu8=self.gamerenwuArray2[8];
                     //每日任务task_status
                     _jiushu9=self.gamerenwuArray2[9];

                 }
             } error:^(NSError *error){}];
            
        }
       
    }
}



#pragma mark 获取玩家领取任务

-(void)butdiji:(UIButton *)but
{
    
    but.enabled=!(but.enabled);
    
    if (but.tag==1) {
     
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id9};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                }];
            }
        }
    }
    
    if (but.tag==2) {
      
        
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id0};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }
    
    if (but.tag==3) {
        

        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id1};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }
    
    
    if (but.tag==4) {
        
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id2};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }
    
    if (but.tag==5) {
        

        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id3};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }
    
    if (but.tag==6) {

        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id4};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }
    
    if (but.tag==7) {

        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id5};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }
    
    if (but.tag==8) {

        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id6};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }
    
    if (but.tag==9) {

        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id7};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }
    
    if (but.tag==10) {

        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign
                                            ,@"unique_task_id":_unique_id8};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"task/receive_task.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *response = [object objectForKey:@"response"];
                         if ([response count])
                         {
                             renwumodel *model=[[renwumodel alloc]init];
                             
                             NSString *status=[response objectForKey:@"status"];
                             NSString *data=[response objectForKey:@"data"];
                             NSString *msg=[response objectForKey:@"msg"];
                             [model setStatus:status];
                             [model setData:data];
                             [model setMsg:msg];
                             [self.gamerenwuArray addObject:model];
                         }
                     }
                 } error:^(NSError *error){
                 }];
            }
        }
    }

//重装数据,以及调取改变 button 标题的条件
    [self  getUserwanjiarenwu:YES];
    [self.gameSettingTableView1 reloadData];



}


-(NSMutableArray*)gamerenwuArray
{
    if (_gamerenwuArray == nil)
    {
        _gamerenwuArray = [NSMutableArray array];
    }
    return _gamerenwuArray;
}

-(NSMutableArray*)gamerenwuArray1
{
    if (_gamerenwuArray1 == nil)
    {
        _gamerenwuArray1 = [NSMutableArray array];
    }
    return _gamerenwuArray1;
}

-(NSMutableArray*)gamerenwuArray2
{
    if (_gamerenwuArray2 == nil)
    {
        _gamerenwuArray2 = [NSMutableArray array];
    }
    return _gamerenwuArray2;
}

-(void)viewWillAppear:(BOOL)animated
{
  //[self getUserwanjiarenwu:YES];

}


-(void)viewDidAppear:(BOOL)animated
{
   
    
}

//////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _str1 = @"1";
    _str2 = @"2";
    _str3 = @"3";

    
    //获取任务列表
    
    [self getUserwanjiarenwu:YES];

  // [self panduanbuttondebiaoti:YES];
  
    self.view.backgroundColor=[UIColor greenColor];
    [self setTitle:@"玩家任务"];
    [self setNavRightBtnHidden: YES];
    [self.view addSubview:self.gameSettingTableView1];
     [self getUserwanjiarenwu:YES];
       
    

    UIView *vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width,100)];
    vie.backgroundColor=[UIColor whiteColor];
    [self.gameSettingTableView1 addSubview:vie];
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(10,20, kScreen_Width-10, 30)];
    lab.text=@"说明:玩家可以在该页面领取任务,每完成一项任务,都可以获得相应的奖励(道具或金币)";
    lab.numberOfLines=0;
    lab.font=[UIFont systemFontOfSize:18];
    [lab sizeToFit];
    [vie addSubview:lab];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UITableView *)gameSettingTableView1
{
    if (_gameSettingTableView1 == nil)
    {
        _gameSettingTableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, kScreen_Width, kScreen_Height-40) style:UITableViewStylePlain];
        [_gameSettingTableView1 setDelegate:self];
        [_gameSettingTableView1 setDataSource:self];
    }
    return _gameSettingTableView1;
    
}


#pragma mark 玩家任务字符

-(NSMutableArray*)gameSettingArray
{
    if (_gameSettingArray == nil)
    {
        _gameSettingArray = [NSMutableArray array];
        
    

        [_gameSettingArray addObject:@""];
        
      //  [_gameSettingArray addObject:@"[今日任务]给宝宝喂食一次           奖励:  20金币"];
       // [_gameSettingArray addObject:@"[今日任务]给宝宝送花一次           奖励:  20金币"];
        //[_gameSettingArray addObject:@"[今日任务]给宝宝清洁一次      奖励:  20金币"];
        
        [_gameSettingArray addObject:@"[新手任务]修改自己的个人资料一次\n奖励:  10金币"];
        [_gameSettingArray addObject:@"[新手任务]给宝宝设置一个昵称\n奖励:  10金币"];
        
        [_gameSettingArray addObject:@"[新手任务]给宝宝设置一个头像\n奖励:  10金币"];
        
        [_gameSettingArray addObject:@"[新手任务]进入闹钟页面并设置一个新的闹钟\n奖励:   10金币"];
         [_gameSettingArray addObject:@"[新手任务]进入星座页面并查看自己当天的运势\n奖励:   10金币"];
         [_gameSettingArray addObject:@"[新手任务]进入天气页面并查看未来几天的天气情况\n奖励:  10金币"];
        //[_gameSettingArray addObject:@"[新手任务]进入星伴社区并成功关注一个明星\n奖励:  10金币"];
        //[_gameSettingArray addObject:@"[新手任务]进入闹钟页面并diy一组报时语音\n奖励:  10金币"];
        //[_gameSettingArray addObject:@"[新手任务]进入天气页面并diy一组天气播报语音\n奖励:   10金币"];
    }
    return _gameSettingArray;
}

- (NSMutableArray*)gameSettingArray2
{
    if (_gameSettingArray2 == nil)
    {
        _gameSettingArray2 = [NSMutableArray array];
        
        
        
        [_gameSettingArray2 addObject:@""];
        
          [_gameSettingArray2 addObject:@"[今日任务]给宝宝喂食一次                 奖励:  20金币"];
         [_gameSettingArray2 addObject:@"[今日任务]给宝宝送花一次           奖励:  20金币"];
        [_gameSettingArray2 addObject:@"[今日任务]给宝宝清洁一次      奖励:  20金币"];
        
           }
    return _gameSettingArray2;
    
    
    
    
}




#pragma mark 玩家任务弹出字符

-(NSDictionary*)gameSettingArray1
{
    if (_gameSettingArray1 == nil)
    {
        _gameSettingArray1 = [NSDictionary dictionary];
    
        
        
        //[_gameSettingArray1 addObject:@"你已成功领取该任务,你可以点击游戏首页的'闹钟',进入闹钟页面设置闹钟来完成任务"];
      //  [_gameSettingArray1 addObject:@"你已成功领取该任务,你可以点击游戏首页的'星座',进入星座页面查看星座来完成任务"];
       // [_gameSettingArray1 addObject:@"你已成功领取该任务,你可以点击游戏首页的'天气',进入天气页面查看天气来完成任务"];
       // [_gameSettingArray1 addObject:@"你已成功领取该任务,你可以点击星伴社区的'明星',进入明星页面关注明星来完成任务"];
        // [_gameSettingArray1 addObject:@"你已成功领取该任务,你可以点击星伴社区的'明星',进入明星页面关注明星来完成任务"];
    }
    return _gameSettingArray1;
    
    
    
    
}







#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 100;
    
    
    
    //return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row)
    {
        case 0:
        {
            
        }
            break;
        case 1:
        {
           
            
            
        }
           break;
        case 2:
        {
            
            
            
        }
            break;
        case 3:
        {
            
            
            
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



-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}





#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.gameSettingArray count];
    return 8;
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    static NSString *str = @"qwe";
    
    
    
    //GameSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //GameSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    ZMPlayerTasksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil)
    {
        cell = [[ZMPlayerTasksTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.textLabel.frame = CGRectMake(12, 12, kScreen_Width - 100, 70);
    }
    
    
    
    
    cell.textLabel.font=[UIFont systemFontOfSize:17];
    [cell.textLabel  setNumberOfLines:0];
    //cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    _but = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/1.35, 60, 80, 30)];
    [_but setBackgroundColor:RGB(208, 204, 204)];
    [_but.layer setCornerRadius:10];
    _but.tag=indexPath.row;
    //[_but setTitle:@"领取任务" forState:0];
    
    //_zhengxingshu=(int)indexPath.row;
    [_but addTarget:self action:@selector(butdiji:) forControlEvents:UIControlEventTouchUpInside];
   
    //cell.label1.text=@"";

    
    
    if (indexPath.row==0)
    {
        NSString *str4;
        str4=_jiushu0;
        
        //cell.label1.text=@"";
        [_but setTitle:@"" forState:UIControlStateNormal];
        self.but.frame=CGRectMake(0, 0, 0, 0);
        [cell.textLabel setText:@""];
        
    }
        if (indexPath.row==1)
    {
        if ([_task_id9 isEqualToString:@"101"])
           
        {
             [cell.textLabel setText:self.gameSettingArray2[1]];
        }
        if ([_task_id9 isEqualToString:@"102"])
            
        {
            [cell.textLabel setText:self.gameSettingArray2[2]];
         
        }
        if ([_task_id9 isEqualToString:@"103"])
            
        {
             [cell.textLabel setText:self.gameSettingArray2[3]];
           
        }
        
        }
    if (indexPath.row==2)
    {
          [cell.textLabel setText:self.gameSettingArray[1]];
        
        
    }
    if (indexPath.row==3)
    {
        [cell.textLabel setText:self.gameSettingArray[2]];
    }
    if (indexPath.row==4)
    {
        [cell.textLabel setText:self.gameSettingArray[3]];
    }
    if (indexPath.row==5)
    {
        [cell.textLabel setText:self.gameSettingArray[4]];
    }
    if (indexPath.row==6)
    {
        [cell.textLabel setText:self.gameSettingArray[5]];
    }
    if (indexPath.row==7)
    {
        [cell.textLabel setText:self.gameSettingArray[6]];
    }
    if (indexPath.row==8)
    {
        [cell.textLabel setText:self.gameSettingArray[7]];
    }
    if (indexPath.row==9)
    {
        [cell.textLabel setText:self.gameSettingArray[8]];
    }
    if (indexPath.row==10)
    {
        [cell.textLabel setText:self.gameSettingArray[9]];
    }








    

    
       if (indexPath.row==1) {
        
        NSString *str4;
        str4=_jiushu9;
        
        if ([str4 isEqualToString:_str1]) {
           // _but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
           
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
            
                   }
       if ([str4 isEqualToString:_str3])
        {
           // _but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
            
        }
        
    }
    
    
    if (indexPath.row==2) {
        
        NSString *str4;
        
        str4=_jiushu0;
        
        if ([str4 isEqualToString:_str1]) {
            //_but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
            
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
            
        }
        if ([str4 isEqualToString:_str3])
        {
            //_but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }
    
    if (indexPath.row==3) {
        
        NSString *str4;
        
        str4=_jiushu1;
        
        if ([str4 isEqualToString:_str1]) {
           // _but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
            
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
            
        }
        if ([str4 isEqualToString:_str3])
        {
           // _but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }
    
    if (indexPath.row==4) {
        
        NSString *str4;
        
        str4=_jiushu2;
        
        if ([str4 isEqualToString:_str1]) {
           // _but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
            
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
            
        }
        if ([str4 isEqualToString:_str3])
        {
            //_but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }

    if (indexPath.row==5) {
        
        NSString *str4;
        
        str4=_jiushu3;
        
        if ([str4 isEqualToString:_str1]) {
         //_but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
            
        }
        if ([str4 isEqualToString:_str2])
        {
          //  _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
            
        }
        if ([str4 isEqualToString:_str3])
        {
          //  _but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }
    
    
    if (indexPath.row==6) {
        
        NSString *str4;
        
        str4=_jiushu4;
        
        if ([str4 isEqualToString:_str1]) {
           // _but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
            
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
           
        }
        if ([str4 isEqualToString:_str3])
        {
           // _but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }
    
    
    if (indexPath.row==7) {
        
        NSString *str4;
        
        str4=_jiushu5;
        
        if ([str4 isEqualToString:_str1]) {
           // _but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
          
            
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
                    }
        if ([str4 isEqualToString:_str3])
        {
            //_but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }
    
    if (indexPath.row==8) {
        
        NSString *str4;
        
        str4=_jiushu6;
        
        if ([str4 isEqualToString:_str1]) {
           // _but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
                    }
        if ([str4 isEqualToString:_str3])
        {
           // _but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }
    
    if (indexPath.row==9) {
        
        NSString *str4;
        
        str4=_jiushu7;
        
        if ([str4 isEqualToString:_str1]) {
           // _but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
            
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
           
        }
        if ([str4 isEqualToString:_str3])
        {
           // _but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }
    
    if (indexPath.row==10) {
        
        NSString *str4;
        
        str4=_jiushu8;
        
        if ([str4 isEqualToString:_str1]) {
           //  _but.enabled=!(_but.enabled);
            [_but setTitle:@"领取任务" forState:0];
             [cell addSubview:_but];
            
            
        }
        if ([str4 isEqualToString:_str2])
        {
           // _but.enabled=!(_but.enabled);
            
            [_but setTitle:@"进行中" forState:0];
             [cell addSubview:_but];
            
        }
        if ([str4 isEqualToString:_str3])
        {
            _but.enabled=!(_but.enabled);
            [self.but setTitle:@"已完成" forState:0];
             [cell addSubview:_but];
            
        }
        
    }

    

    
    return cell;
}





@end
