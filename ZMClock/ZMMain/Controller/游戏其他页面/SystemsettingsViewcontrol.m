//
//  SystemsettingsViewcontrol.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SystemsettingsViewcontrol.h"

#import "GameSettingTableViewCell.h"
#import "ZMGameExplainViewController.h"
#import "ZMHeadPortraitViewController.h"

#import "duanyuwomenviewcontroller.h"

#import "AppDelegate.h"

#import "ZMLoginViewController.h"
#import "YijianfankuiController.h"



////////张锐
#import "ZMSystemmSettingbTableViewCell.h"




@interface ZMGameBaseViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    GameSettingTableViewCell *_settingCell;
    

}


@property (nonatomic , copy) NSString *sizeStr;


@property (nonatomic, strong) UIView *topHeadV;
@property (nonatomic, strong) UIButton *dismissBtn;
@property (nonatomic, strong) UILabel *titleeLb;






@end

@implementation SystemsettingsViewcontrol



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //[self setTitle:@"系统设置"];
    //[self setNavRightBtnHidden: YES];
    
    
    [self.view addSubview:self.gameSettingTableView1];
    [self.gameSettingTableView1 addSubview:self.button];
    

///
    self.gameSettingTableView1.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    
}


//获取缓存
- (CGFloat)getCache
{
    NSUInteger size = [[SDImageCache sharedImageCache] getSize];//获取当前缓存的大小
    CGFloat sizeOfM = size * 1.0/1024/1024;
    
    return sizeOfM;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(UITableView *)gameSettingTableView1
{
    if (_gameSettingTableView1 == nil)
    {
        _gameSettingTableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, kScreen_Width, kScreen_Height - 70) style:UITableViewStylePlain];
        [_gameSettingTableView1 setDelegate:self];
        [_gameSettingTableView1 setDataSource:self];
    }
    return _gameSettingTableView1;
    
}


-(UIButton *)button
{
    if (_button == nil)
    {
        _button = [[UIButton alloc]initWithFrame:CGRectMake(45, kScreen_Height/2, kScreen_Width/1.3, 40)];
        [_button setBackgroundColor:RGB(208, 204, 204)];
        [_button.layer setCornerRadius:10];
        [_button setTitle:@"退出登录" forState:0];
       // _button.backgroundColor=[UIColor blueColor];
       // [_button setImage:@"123" forState:0];
        
        [_button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
            
        
        
        
    }
    return _button;
    
}

-(void)button:(UIButton *)button
{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"确定退出?" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
    
    [alert show];
    
    
   // [self.navigationController pushViewController:[[ZMMainViewController alloc] init] animated:YES];
    
    
    
    
   


}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    if(buttonIndex ==0){
        
        
        
        
        
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                //增加src_type判断社区签到
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign };
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"login/logout.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                         
                     {
                         [AnyObjectActivityView showWithTitle:@"已退出" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     }
                     
                 }
                 
                 
            error:^(NSError *error) {}];
                
            }
            
        }
        else
        {
            [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        
        

        
        [self.navigationController pushViewController:[[ZMLoginViewController alloc] init] animated:YES];
        
       // [self exitApplication ];
        
    }
    
}
#pragma mark 退出应用程序
- (void)exitApplication {
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    UIWindow *window = app.window;
    
    [UIView animateWithDuration:1.0f animations:^{
        window.alpha = 0;
        //window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
         exit(0);
       // window.frame = CGRectMake(window.bounds.size.width/2, window.bounds.size.width/2, 0, 0);
        
    } completion:^(BOOL finished) {
        exit(0);
    }];
    //exit(0);
    
}




-(NSMutableArray*)gameSettingArray
{
    if (_gameSettingArray == nil)
    {
        _gameSettingArray = [NSMutableArray array];
        
        [_gameSettingArray addObject:@"当前版本"];
        [_gameSettingArray addObject:@"清理缓存"];
        
        //[_gameSettingArray addObject:@"修改密码"];
    }
    return _gameSettingArray;

    
   

}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    return 50;

    
    
    //return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row)
    {
        case 1:
        {
          
            NSUInteger size = [[SDImageCache sharedImageCache] getSize];//获取当前缓存的大小
            CGFloat sizeOfM = size * 1.0/1024/1024;
            
            NSString *cacheString = [NSString stringWithFormat:@"缓存数据 %.2fM,是否清除",sizeOfM];
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:cacheString preferredStyle:UIAlertControllerStyleActionSheet];
            [alertController addAction:[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //清除缓存
                [[SDImageCache sharedImageCache] clearDisk];
                [[SDImageCache sharedImageCache] clearMemory];
                
                
                [AnyObjectActivityView showWithTitle:@"已清理" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime2];
                
                [_gameSettingTableView1 reloadData];
                
                
            
                
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //
            }]];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            

        }
            break;
        case 0:{
//            [self.navigationController pushViewController:[[YijianfankuiController alloc] init] animated:YES];
        
        }
            break;
            
        case 2:
        {
            //[self.navigationController pushViewController:[[duanyuwomenviewcontroller alloc] init] animated:YES];
            
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
    return [self.gameSettingArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellidd = @"textid";
    
    ZMSystemmSettingbTableViewCell *cell= [self.gameSettingTableView1 dequeueReusableCellWithIdentifier:cellidd];
    
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMSystemmSettingbTableViewCell" owner:self options:nil] lastObject];
        
    }
    
    
    if (indexPath.row == 0) {
        cell.contenttLb.text = @"2.0.0";
    }

    if (indexPath.row == 1) {
        
        //NSUInteger size = [[SDImageCache sharedImageCache] getSize];//获取当前缓存的大小
        //CGFloat sizeOfM = size*1.0/1024/1024;
        
        
        cell.contenttLb.text = [NSString stringWithFormat:@"%.2f M",[self getCache]];
    
    }
    
    [cell.titleeLb setText:self.gameSettingArray[indexPath.row]];
    
    
    
    
    
    
    return cell;
}






@end
