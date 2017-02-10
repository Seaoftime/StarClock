//
//  ZMConstellationViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMConstellationViewController.h"
#import "ConstellationScrollView.h"
#import "ConstellationModel.h"

#import "ZMMainViewController.h"





@interface ZMConstellationViewController () 



@property (nonatomic,strong) ConstellationScrollView *constellationScrollView;
@property (nonatomic,strong) NSMutableArray *constellationArray;

@end


@implementation ZMConstellationViewController


#pragma mark - DataRequest Method
#pragma mark 获取星座信息
-(void)getConstellation:(NSString *)time
{
    NSString *url = [NSString stringWithFormat:@"constellation/constellation_by_name_type.php?consName=0&type=today&time=%@",time];
    [[[AFNetworkingHelper alloc]init] getWithUrl:url sucess:^(id object)
    {
        if (object)
        {
            if ([[object objectForKey:@"error_code"] intValue] == 0)
            {
                NSArray *infoArray = [object objectForKey:@"info"];
                for (int i = 0; i< [infoArray count]; i++)
                {
                    NSDictionary *item = [infoArray objectAtIndex:i];
                    ConstellationModel *model = [[ConstellationModel alloc]init];
                    NSString *date = [item objectForKey:@"date"];
                    NSString *name = [item objectForKey:@"name"];
                    NSString *QFriend = [item objectForKey:@"QFriend"];
                    NSString *all = [item objectForKey:@"all"];
                    NSString *color = [item objectForKey:@"color"];
                    NSString *datetime = [item objectForKey:@"datetime"];
                    NSString *health = [item objectForKey:@"health"];
                    NSString *love = [item objectForKey:@"love"];
                    NSString *money = [item objectForKey:@"money"];
                    NSString *number = [NSString stringWithFormat:@"%@",[item objectForKey:@"number"]];
                    NSString *summary = [item objectForKey:@"summary"];
                    NSString *work = [item objectForKey:@"work"];
                    
                        
                    
                    [model setDate:date];
                    [model setDatetime:datetime];
                    [model setName:name];
                    [model setQFriend:QFriend];
                    [model setAll:all];
                    [model setColor:color];
                    [model setHealth:health];
                    [model setLove:love];
                    [model setMoney:money];
                    [model setNumber:number];
                    [model setSummary:summary];
                    [model setWork:work];
                    
                    [self.constellationArray addObject:model];
                }
                
                /**
                 
                 */
                if ([self.constellationArray count])
                {
                    [self.constellationScrollView setConstellationModelArray:self.constellationArray];
                    [self.view addSubview:self.constellationScrollView];
                    [self.constellationArray enumerateObjectsUsingBlock:^(ConstellationModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
                    {
                        if (obj.isMark)
                        {
                            [self.constellationScrollView.icarousel scrollToItemAtIndex:idx duration:1.0];
                            *stop = YES;
                        }
                    }];
                }
            }
        }
        
    } error:^(NSError *error){}];
}



#pragma mark - DataRequest Method这个没走
#pragma mark post获取星座信息不会改你自己改吧
-(void)getConstellation2:(NSString *)time
{
    
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign,@"consName":@"",@"type":@"today",@"time":time };
    [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"constellation/constellation_by_name_type.php" theParmeters:parmeters sucess:^(id object)

             {
                if ([[object objectForKey:@"error_code"] intValue] == 0)
                     {
                 
                         NSArray *infoArray = [object objectForKey:@"info"];
                         for (int i = 0; i< [infoArray count]; i++)
                         {
                             NSDictionary *item = [infoArray objectAtIndex:i];
                             ConstellationModel *model = [[ConstellationModel alloc]init];
                             NSString *date = [item objectForKey:@"date"];
                             NSString *name = [item objectForKey:@"name"];
                             NSString *QFriend = [item objectForKey:@"QFriend"];
                             NSString *all = [item objectForKey:@"all"];
                             NSString *color = [item objectForKey:@"color"];
                             NSString *datetime = [item objectForKey:@"datetime"];
                             NSString *health = [item objectForKey:@"health"];
                             NSString *love = [item objectForKey:@"love"];
                             NSString *money = [item objectForKey:@"money"];
                             NSString *number = [NSString stringWithFormat:@"%@",[item objectForKey:@"number"]];
                             NSString *summary = [item objectForKey:@"summary"];
                             NSString *work = [item objectForKey:@"work"];
                             
                             [model setDate:date];
                             [model setDatetime:datetime];
                             [model setName:name];
                             [model setQFriend:QFriend];
                             [model setAll:all];
                             [model setColor:color];
                             [model setHealth:health];
                             [model setLove:love];
                             [model setMoney:money];
                             [model setNumber:number];
                             [model setSummary:summary];
                             [model setWork:work];
                             
                             [self.constellationArray addObject:model];
                         }
                         
                         /**
                           */
                         
                         if ([self.constellationArray count])
                         {
                            /// NSLog(@"------self.constellationArray------%@",self.constellationArray);
                             [self.constellationScrollView setConstellationModelArray:self.constellationArray];
                           //  [self.view addSubview:self.constellationScrollView];
                             [self.constellationArray enumerateObjectsUsingBlock:^(ConstellationModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
                              {
                                 
                                  if (obj.isMark)
                                  {
                                      [self.constellationScrollView.icarousel scrollToItemAtIndex:idx duration:1.0];
                                      
                                      *stop = YES;
                                  }
                                  
                              }];
                         }
                 
                  }
                 
             } error:^(NSError *error){
             
             
             
             }];
    
        }
    }
    
    
    
}






//没走
-(void)post:(NSString*)postid
{
    NSDictionary *d = @{@"user_id":postid};
    [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"http://192.168.1.211/feedback.php" theParmeters:d sucess:^(id object)
   // [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"http://192.168.1.111/feedback.php" theParmeters:d sucess:^(id object)
    {
        NSString *status = [object objectForKey:@"status"];
        
        if ([status integerValue] ==0)
        {
            NSString *user_id = [object objectForKey:@"user_id"];
           // NSLog(@"user_id=%@",user_id);
            //没什么用就是为了消一个小黄点
            UILabel*user_idlabel=[[UILabel alloc]init];
            user_idlabel.text=user_id;
        }
        
        
    } error:^(NSError *error){}];
}


#pragma mark - LifeStyle Method
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self getConstellation:@"0"];
    [self setTitle:@"星座运势"];
    [self setNavRightBtnHidden:YES];
    [self.view setBackgroundColor:PinkColor];
    
   // [self getConstellation2:@"0"];
   
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


#pragma mark - Getter/Setter Method
-(ConstellationScrollView*)constellationScrollView
{
    if (_constellationScrollView == nil)
    {
        _constellationScrollView = [[ConstellationScrollView alloc]initWithFrame:CGRectMake(0, 80, kScreen_Width, kScreen_Height-80) setDeletage:self];
    }
    return _constellationScrollView;
}


-(NSMutableArray*)constellationArray
{
    if (_constellationArray == nil)
    {
        _constellationArray = [NSMutableArray array];
    }
    return _constellationArray;
}

#pragma mark - Delegate Method

-(void)navLeftBtnAction:(UIButton *)sender
{
    
    //[self.navigationController pushViewController:[[ZMMainViewController alloc] init] animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
     //判断星座任务是否完成
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign,@"consName":@"处女座",@"type":@"today",@"time":@"0" };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"constellation/constellation_by_name_type.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                      NSDictionary*task=[object objectForKey:@"task"];
                         
                         if ([task isEqual:@""])
                         {
                             
                         }
                         
                         else
                         {
                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                             if (task_id==5)
                             {
                                 
                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                             }
                     }
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



#pragma mark - Response Method
#pragma mark - Private Method

@end
