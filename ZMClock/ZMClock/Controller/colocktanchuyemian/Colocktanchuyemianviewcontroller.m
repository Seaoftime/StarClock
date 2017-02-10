//
//  Colocktanchuyemianviewcontroller.m
//  ZMClock
//
//  Created by ZhongMeng on 16/6/5.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "Colocktanchuyemianviewcontroller.h"


@interface Colocktanchuyemianviewcontroller()<UIScrollViewDelegate>
{UIScrollView *scrool;}

@end

@implementation Colocktanchuyemianviewcontroller










- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.baseNavigation.hidden=YES;
       [self.view setBackgroundColor:RGBAlpha(253, 239, 253, 1.0)];
    
    self.colockchengfang=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    [self.view addSubview:_colockchengfang];
    
    
    
    UILabel *tishilabel=[[UILabel alloc]initWithFrame:CGRectMake(0,  kScreen_Height/2, kScreen_Width, 80)];
    tishilabel.text=@"请5分钟后叫我";
    tishilabel.font=[UIFont systemFontOfSize:20];
    //[tishilabel setTextColor:RGB(242, 115, 154)];
    [tishilabel setTextColor:[UIColor whiteColor]];
    [tishilabel setTextAlignment:NSTextAlignmentCenter];
    
    
    
    UIImageView *colockbeijing=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    colockbeijing.image=[UIImage imageNamed:@"底图"];
    [self.colockchengfang addSubview:colockbeijing];
    UIImageView *biaopan=[[UIImageView alloc]initWithFrame:CGRectMake(tishilabel.center.x-125, kScreen_Height/6, 250, 200)];
    biaopan.image=[UIImage imageNamed:@"表盘"];
    [self.colockchengfang addSubview:biaopan];
    [self.colockchengfang addSubview: tishilabel];
    
    self.shijianlabel=[[UILabel alloc]initWithFrame:CGRectMake(65, 70, kScreen_Width, 50)];
    self.shijianlabel.text=@"12:07";
    self.shijianlabel.font=[UIFont systemFontOfSize:50];
    [self.shijianlabel setTextColor:RGB(242, 115, 154)];
    [biaopan addSubview:self.shijianlabel];
    self.dateFormatter=[[NSDateFormatter alloc]init];
    [_dateFormatter setDateFormat:@"HH:mm"];
    NSString *shijianstr=[_dateFormatter stringFromDate:[NSDate date]];

    
    
    
    self.shijianlabel.text=shijianstr;
    

    
    
    
    UIView *xianbianchengfang=[[UIView alloc]initWithFrame:CGRectMake(0, kScreen_Height/1.1, kScreen_Width, 50)];
    [xianbianchengfang setBackgroundColor:RGB(151, 188, 236)];
    [self.colockchengfang addSubview:xianbianchengfang];
    
    UIImageView*xiabianbeijin=[[UIImageView alloc]initWithFrame:CGRectMake(0, kScreen_Height/1.3, kScreen_Width, 60)];
    xiabianbeijin.image=[UIImage imageNamed:@""];
    [xianbianchengfang addSubview:xiabianbeijin];
    UILabel *xiabiantishilabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, kScreen_Width, 30)];
    [xiabiantishilabel setTextColor:RGB(242, 115, 154)];
    xiabiantishilabel.text=@"滑动关闭闹钟";
    xiabiantishilabel.font=[UIFont systemFontOfSize:20];
    [xiabiantishilabel setTextAlignment: NSTextAlignmentCenter];
    [xianbianchengfang addSubview:xiabiantishilabel];

    UIImageView *xiabianshanghuatu=[[UIImageView alloc]initWithFrame:CGRectMake(xiabiantishilabel.center.x-25, 5, 50, 15)];
    xiabianshanghuatu.image=[UIImage imageNamed:@"方向图标"];
    [xianbianchengfang addSubview:xiabianshanghuatu];
    
    
    UISwipeGestureRecognizer *swipecognizer=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(shoushishanghuafangfa:)];
    swipecognizer.direction= UISwipeGestureRecognizerDirectionUp ;
    swipecognizer.numberOfTouchesRequired=1;
    [_colockchengfang addGestureRecognizer:swipecognizer];
    
    
    
    
    scrool=[[UIScrollView  alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    scrool.delegate=self;
    [self.view addSubview:scrool];
    
    for (int i=0; i<2; i++) {
        
        NSString *str=[NSString stringWithFormat:@"图%d.jpg",i+1];
        
        UIImageView *ima=[[UIImageView alloc]initWithImage:[UIImage imageNamed:str]];
        
        ima.frame=CGRectMake(0,568*i, 320, 568);
        
        
        [scrool addSubview:ima];
        
        
    }
    
    scrool.contentSize=CGSizeMake(0, kScreen_Height*2);
    scrool.contentOffset=CGPointMake(0, 0);
    scrool.pagingEnabled=YES;
    


    
    
    
    
}


-(void)shoushishanghuafangfa:(UISwipeGestureRecognizer *)shanghua
{

    self.shijianlabel.text=@"滑动了";


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
