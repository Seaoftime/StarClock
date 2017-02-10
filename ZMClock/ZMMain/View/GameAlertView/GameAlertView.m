//
//  GameAlertView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "GameAlertView.h"




@implementation GameAlertView









#pragma mark - DataRequest Method
#pragma mark 获取用户金币 （游戏等级信息）
-(void)getUserInfo:(BOOL)userInfo
{
    if (userInfo)
    {
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"game/user_info.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         NSDictionary *data = [object objectForKey:@"data"];
                         
                         
                         
                         
                         if ([data count])
                         {
                             
                             
                             
                             
                             
                             NSString *user_gold1 = [data objectForKey:@"user_gold"];
                            self.jinbilabel.text=user_gold1;
                             
                             self.jinbilabel.text=[NSString stringWithFormat:@"X%@",user_gold1];
                             
                             
                  
                             
                         }
                     }
                 } error:^(NSError *error){}];
            }
        }
    }
}



-(NSMutableArray*)gameItemArray
{
    if (_gameItemArray == nil)
    {
        _gameItemArray = [NSMutableArray array];
    }
    return _gameItemArray;
}




#pragma mark 设置游戏弹出页面1加载到的 View
-(instancetype)initWithDeletae:(id)deletage
{
   // self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    
    //self = [super initWithFrame:CGRectMake(0, kScreen_Height-490, kScreen_Width, 300)];
    self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    
    
        if (self)
    {
        
        
        
        /*
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width-15, kScreen_Height-15)];
        image.image=[UIImage imageNamed:@"底板"];
        [self.gameBarView addSubview:image];
        UIView *viewww=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width-15, kScreen_Height-15)];
        [self addSubview:viewww];
        [viewww addSubview:image];
        
        */
        
        
        
        
        
        self.backgroundColor=[UIColor blackColor];
        self.alpha=0.8;
        
        [self setIsHiddenAndDismiss:YES];
        [self performSelector:@selector(hidden) withObject:nil afterDelay:3.0];
        [self addSubview:self.gameBarView];
        [self.gameBarView setGameBarDeletage:deletage];
        [self.gameBarView setCenter:self.center];
        
        [self addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchDown];
        
        
        
       

        
        
        //头上物品
        self.weishiSOnghuaQingjielabel.frame=CGRectMake(0, 20, kScreen_Width, 30);
        [self addSubview:self.weishiSOnghuaQingjielabel];
        
        
        self.button.frame=CGRectMake(kScreen_Width-50, 10, 40, 40);
        [self addSubview:self.button];

        
        
        
        self.jinbiview.frame=CGRectMake(kScreen_Width/2.9, kScreen_Height/1.1, kScreen_Width/1.8, 25);
        
        [self addSubview:self.jinbiview];
        
         self.jinbilabel.frame=CGRectMake(50, 0, kScreen_Width/3, 30);
        [self.jinbiview addSubview:self.jinbilabel];
        
        self.jinbiimageview.frame=CGRectMake(10, -15, 60, 40);
        [self.jinbiview addSubview:self.jinbiimageview];

        
        
         
    }
    return self;
}

#pragma mark - Getter / Setter


#pragma mark 设置游戏弹出页面2加载的View

-(GameBarView *)gameBarView
{
    if (_gameBarView == nil)
    {
        //_gameBarView = [[GameBarView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width-40, 100)];
                //_gameBarView = [[GameBarView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width-20, 100)];
        
        _gameBarView = [[GameBarView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width-15, kScreen_Height-15)];
        
        
      
        
        
        
        
        _gameBarView.alpha=1;
        _gameBarView.backgroundColor=[UIColor whiteColor];
        //_gameBarView.alpha=0.9;
         [_gameBarView.layer setCornerRadius:15];
        
        
        
                 //使_gameBarView视图四边显示白色
       // [_gameBarView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        //使_gameBarView视图四边显示黑边框
       // [_gameBarView.layer setBorderWidth:4];
        [_gameBarView addTarget:self action:@selector(gameBarViewAction:) forControlEvents:UIControlEventTouchDown];
    }
    return _gameBarView;
}

#pragma mark 物品全称
-(UILabel*)weishiSOnghuaQingjielabel
{
    if (_weishiSOnghuaQingjielabel==nil) {
        
   
    
    
    _weishiSOnghuaQingjielabel=[[UILabel alloc]init];
    [_weishiSOnghuaQingjielabel setTextAlignment:NSTextAlignmentCenter];
    [_weishiSOnghuaQingjielabel setFont:[UIFont systemFontOfSize:20.0]];
    _weishiSOnghuaQingjielabel.text=@"道具";
    _weishiSOnghuaQingjielabel.textColor=[UIColor blackColor];
 }
    return _weishiSOnghuaQingjielabel;
    

}


#pragma mark 金币个数
-(UILabel*)jinbilabel
{
    if (_jinbilabel==nil) {
        
        [self getUserInfo:YES];
       
        _jinbilabel=[[UILabel alloc]init];
        
        _jinbilabel.frame=CGRectMake(30, 5, 20, 20);
        [_jinbilabel setTextColor:RGB(255, 102, 145)];
        [_jinbilabel setTextAlignment:NSTextAlignmentCenter];
        [_jinbilabel setFont:[UIFont systemFontOfSize:25.0]];
        //_jinbilabel.text=@"金币个数";
        
        
       
        
        
    }
    return _jinbilabel;
    
    
}






#pragma mark 金币图片
-(UIImageView*)jinbiimageview
{
    if (_jinbiimageview==nil) {
        
        _jinbiimageview=[[UIImageView alloc]init];
        _jinbiimageview.frame=CGRectMake(5, 5, 30, 20);
        _jinbiimageview.image=[UIImage imageNamed:@"金币"];
        //_jinbiimageview. backgroundColor=[UIColor blackColor];
    }
    return _jinbiimageview;
    
    
}

#pragma mark 金币图片
-(UIView *)jinbiview
{
    if (_jinbiview==nil) {
        
        _jinbiview=[[UIView  alloc]init];
        
        _jinbiview.frame=CGRectMake(0, 0, 100, 25);
        
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 25)];
        imageview.image=[UIImage imageNamed:@"金币框"];
        [self.jinbiview addSubview:imageview];
        
        
        
         [_jinbiview.layer setCornerRadius:10];
        [self addSubview:self.jinbilabel];
        [self addSubview:self.jinbiimageview];
        
        
        _jinbiview. backgroundColor=[UIColor grayColor];
    }
    return _jinbiview;
    
    
}









#pragma mark Public Method 物品跳出方法
-(void)show
{
    [self.gameBarView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    
    [UIView animateWithDuration:0.15 animations:^{
        
        [self.gameBarView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
        [kWindow addSubview:self];
        
    } ];
}
#pragma mark Public Method 物品隐藏方法
-(void)dismiss
{
    [self.gameBarView removeFromSuperview];
    [self setGameBarView:nil];
    [self removeFromSuperview];
}


-(UIButton *)button
{
    
    if (_button==nil) {
        _button=[[UIButton alloc]init];
        //_button.backgroundColor=[UIColor redColor];
        [_button addTarget:self action:@selector(hidshitu:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    
    
    return _button;
    
    
    
}

-(void)hidshitu:(UIButton *)but
{


    [self hidden];

}









-(void)hidden
{
    if (self.isHiddenAndDismiss)
    {
        [self.gameBarView removeFromSuperview];
        [self setGameBarView:nil];
        [self removeFromSuperview];
    }
}


#pragma mark - Pirvate Method
-(void)gameBarViewAction:(GameBarView*)sender
{
   [self setIsHiddenAndDismiss:NO];
}

@end
