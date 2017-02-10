//
//  Shengjihoutanchuyemianview.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "Shengjihoutanchuyemianview.h"
//////////////////////
#import "ZMMainViewController.h"

#define rew(x) ((x*M_PI)/180)

@interface ZMGameBaseViewController ()


@end

@implementation Shengjihoutanchuyemianview



#pragma mark 解析数据调方法的位置
-(void)viewWillAppear:(BOOL)animated
{

 //[self jiexidangqianyonghudengji];


}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // [self setTitle:@"升级界面"];
    
    _str1=@"1";
     _str2=@"2";
     _str3=@"3";
     _str4=@"4";
     _str5=@"5";
    _str6=@"6";
    _str7=@"7";
    _str8=@"8";
    _str9=@"9";
    _str10=@"10";
    _str11=@"11";
    _str12=@"12";

    
    
    
    _shengjiview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    [self.view addSubview:_shengjiview];
    
   
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    view.backgroundColor=[UIColor redColor];
    [_shengjiview addSubview:view];
    UIImageView *im=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    im.image=[UIImage imageNamed:@"亲密度升级-底图a"];
    [_shengjiview addSubview:im];
    
    
#pragma mark but1未升级
     //ipone5
   self.but1=[[UIImageView alloc]initWithFrame:CGRectMake(6, kScreen_Height/1.15, 80, 80)];
    
    self.but1.image=[UIImage imageNamed:@"未升级"];
    
    [_shengjiview addSubview:_but1];
    self.but2=[[UIImageView alloc]initWithFrame:CGRectMake(45, kScreen_Height/1.4, 80, 80)];
   self.but2.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but2];
    
    _but3=[[UIImageView alloc]initWithFrame:CGRectMake(130, kScreen_Height/1.6, 80, 80)];
   self.but3.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but3];
    
    _but4=[[UIImageView alloc]initWithFrame:CGRectMake(220, kScreen_Height/1.8, 80, 80)];
   self.but4.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but4];
    
    _but5=[[UIImageView alloc]initWithFrame:CGRectMake(240, kScreen_Height/2.3, 80, 80)];
   self.but5.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but5];
    
    _but6=[[UIImageView alloc]initWithFrame:CGRectMake(180, kScreen_Height/2.8, 80, 80)];
   self.but6.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but6];
    
    _but7=[[UIImageView alloc]initWithFrame:CGRectMake(100, kScreen_Height/2.7, 80, 80)];
  self.but7.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but7];
    
    _but8=[[UIImageView alloc]initWithFrame:CGRectMake(10, kScreen_Height/2.9, 80, 80)];
   self.but8.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but8];
    
    _but9=[[UIImageView alloc]initWithFrame:CGRectMake(0, kScreen_Height/5, 80, 80)];
    self.but9.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but9];
    
    _but10=[[UIImageView alloc]initWithFrame:CGRectMake(50, kScreen_Height/13, 80, 80)];
   self.but10.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but10];
    
    _but11=[[UIImageView alloc]initWithFrame:CGRectMake(140, kScreen_Height/25, 80, 80)];
   self.but11.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but11];
    
    _but12=[[UIImageView alloc]initWithFrame:CGRectMake(220, kScreen_Height/90, 80, 80)];
   self.but12.image=[UIImage imageNamed:@"未升级"];
    [_shengjiview addSubview:_but12];
    
    
    
    #pragma mark 奖励界面
    _jianglijiemian=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];

    _jianglijiemian.backgroundColor=[UIColor whiteColor];
    
    _jianglijiemianfanhuibutton=[[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width-60, kScreen_Height/90,40, 40)];
    [_jianglijiemianfanhuibutton setImage:[UIImage imageNamed:@"isMark"] forState:0];
    [_jianglijiemianfanhuibutton addTarget:self action:@selector(jianglifanhui:) forControlEvents:UIControlEventTouchUpInside];
    [_jianglijiemian addSubview:_jianglijiemianfanhuibutton];
    
     _gongxilabel=[[UILabel alloc]initWithFrame:CGRectMake(0, kScreen_Height/5.5, kScreen_Width, 80)];
     _gongxilabel.text=@"恭喜你获得以下奖励:";
     [_gongxilabel setTextAlignment:NSTextAlignmentCenter];
       [_jianglijiemian addSubview:_gongxilabel];
    
    _jingbiabel=[[UILabel alloc]initWithFrame:CGRectMake(0, kScreen_Height/4.0, kScreen_Width, 80)];
    _jingbiabel.text=@"金币*50";
    [_jingbiabel setTextAlignment:NSTextAlignmentCenter];
    [_jianglijiemian addSubview:_jingbiabel];
    
    _huashubel=[[UILabel alloc]initWithFrame:CGRectMake(0, kScreen_Height/3.3, kScreen_Width, 80)];
    _huashubel.text=@"花束*2";
    [_huashubel setTextAlignment:NSTextAlignmentCenter];
    [_jianglijiemian addSubview:_huashubel];
    
    _xiyuyongpingbel=[[UILabel alloc]initWithFrame:CGRectMake(0, kScreen_Height/2.7, kScreen_Width, 80)];
    _xiyuyongpingbel.text=@"高档洗浴用品*2";
    [_xiyuyongpingbel setTextAlignment:NSTextAlignmentCenter];
    [_jianglijiemian addSubview:_xiyuyongpingbel];
    
    _shipingbel=[[UILabel alloc]initWithFrame:CGRectMake(0, kScreen_Height/2.3, kScreen_Width, 80)];
    _shipingbel.text=@"高档食品*2";
    [_shipingbel setTextAlignment:NSTextAlignmentCenter];
    [_jianglijiemian addSubview:_shipingbel];
    
    #pragma mark图片上的数字
    _yilabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _yilabel.text=@"1";
    _yilabel.font=[UIFont systemFontOfSize:30];
    [ _yilabel setTextColor:RGB(242, 115, 154)];
    [ _yilabel setTextAlignment:NSTextAlignmentCenter];
    [_but1 addSubview: _yilabel];
    
    _erlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _erlabel.text=@"2";
    _erlabel.font=[UIFont systemFontOfSize:30];
    [_erlabel setTextColor:RGB(242, 115, 154)];
    [_erlabel setTextAlignment:NSTextAlignmentCenter];
    [_but2 addSubview:_erlabel];
    
    _sanlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _sanlabel.text=@"3";
    _sanlabel.font=[UIFont systemFontOfSize:30];
    [_sanlabel setTextColor:RGB(242, 115, 154)];
    [_sanlabel setTextAlignment:NSTextAlignmentCenter];
    [_but3 addSubview:_sanlabel];
    
    _silabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _silabel.text=@"4";
    _silabel.font=[UIFont systemFontOfSize:30];
    [_silabel setTextColor:RGB(242, 115, 154)];
    [_silabel setTextAlignment:NSTextAlignmentCenter];
    [_but4 addSubview:_silabel];
    
    _wulabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _wulabel.text=@"5";
    _wulabel.font=[UIFont systemFontOfSize:30];
    [_wulabel setTextColor:RGB(242, 115, 154)];
    [_wulabel setTextAlignment:NSTextAlignmentCenter];
    [_but5 addSubview:_wulabel];
    
    _liulabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
   _liulabel.text=@"6";
    _liulabel.font=[UIFont systemFontOfSize:30];
    [_liulabel setTextColor:RGB(242, 115, 154)];
    [_liulabel setTextAlignment:NSTextAlignmentCenter];
    [_but6 addSubview:_liulabel];
    
    _qilabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
     _qilabel.text=@"7";
     _qilabel.font=[UIFont systemFontOfSize:30];
    [_qilabel setTextColor:RGB(242, 115, 154)];
    [_qilabel setTextAlignment:NSTextAlignmentCenter];
    [_but7 addSubview: _qilabel];
    
    _balabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _balabel.text=@"8";
    _balabel.font=[UIFont systemFontOfSize:30];
    [_balabel setTextColor:RGB(242, 115, 154)];
    [_balabel setTextAlignment:NSTextAlignmentCenter];
    [_but8 addSubview:_balabel];
    
    _jiulabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
  _jiulabel.text=@"9";
    _jiulabel.font=[UIFont systemFontOfSize:30];
    [_jiulabel setTextColor:RGB(242, 115, 154)];
    [_jiulabel setTextAlignment:NSTextAlignmentCenter];
    [_but9 addSubview: _jiulabel];
    
    _shilabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _shilabel.text=@"10";
    _shilabel.font=[UIFont systemFontOfSize:30];
    [_shilabel setTextColor:RGB(242, 115, 154)];
    [_shilabel setTextAlignment:NSTextAlignmentCenter];
    [_but10 addSubview: _shilabel];
    
    _shiyilabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _shiyilabel.text=@"11";
    _shiyilabel.font=[UIFont systemFontOfSize:30];
    [_shiyilabel setTextColor:RGB(242, 115, 154)];
    [_shiyilabel setTextAlignment:NSTextAlignmentCenter];
    [_but11 addSubview:_shiyilabel];
    
    _shierlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    _shierlabel.text=@"12";
    _shierlabel.font=[UIFont systemFontOfSize:30];
    [_shiyilabel setTextColor:RGB(242, 115, 154)];
    [_shierlabel setTextAlignment:NSTextAlignmentCenter];
    [_but12 addSubview:_shierlabel];
    
    
    
    
    
    self.view.backgroundColor=[UIColor yellowColor];
    
    [self setTitle:@""];
    [self setNavRightBtnHidden: YES];
    self.baseNavigation.hidden=YES;
    
    [self setNavLeftBtnHidden:YES];
    
#pragma mark 解析数据
    
    [self jiexidangqianyonghudengji];
    
#pragma mark 加载控件
   // [self jiazaikongjian];

    
   
    
#pragma mark 动画效果
    
    //[self maodiandonghua];
    
    
}



#pragma mark   判断等级
-(void)panduandengjishidijige
{
   
       NSString*str13;
    str13=self.dangqiandengjistr;
    
    if ([str13 isEqualToString:_str1])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"未升级"];
        self.but3.image=[UIImage imageNamed:@"未升级"];
        self.but4.image=[UIImage imageNamed:@"未升级"];
        self.but5.image=[UIImage imageNamed:@"未升级"];
        self.but6.image=[UIImage imageNamed:@"未升级"];
        self.but7.image=[UIImage imageNamed:@"未升级"];
        self.but8.image=[UIImage imageNamed:@"未升级"];
        self.but9.image=[UIImage imageNamed:@"未升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
           
           
           [_yilabel setTextColor:RGB(242, 115, 154)];
           [_erlabel setTextColor:RGB(157, 150, 152)];
           [_sanlabel setTextColor:RGB(157, 150, 152)];
           [_silabel setTextColor:RGB(157, 150, 152)];
           [_wulabel setTextColor:RGB(157, 150, 152)];
           [_liulabel setTextColor:RGB(157, 150, 152)];
           [_qilabel setTextColor:RGB(157, 150, 152)];
           [_balabel setTextColor:RGB(157, 150, 152)];
           [_jiulabel setTextColor:RGB(157, 150, 152)];
           [_shilabel setTextColor:RGB(157, 150, 152)];
           [_shiyilabel setTextColor:RGB(157, 150, 152)];
           [_shierlabel setTextColor:RGB(157, 150, 152)];
           
           _but1.layer.anchorPoint=CGPointMake(0.5, 0.5);
            [UIView animateWithDuration:5 animations:^{
               _but1.transform=CGAffineTransformMakeRotation(rew(-50));
           } completion:^(BOOL gf){
               _but1.transform=CGAffineTransformIdentity;
               [self.view addSubview:_jianglijiemian];
           }];
        
        
    }

    
    if ([str13 isEqualToString:_str2])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"未升级"];
        self.but4.image=[UIImage imageNamed:@"未升级"];
        self.but5.image=[UIImage imageNamed:@"未升级"];
        self.but6.image=[UIImage imageNamed:@"未升级"];
        self.but7.image=[UIImage imageNamed:@"未升级"];
        self.but8.image=[UIImage imageNamed:@"未升级"];
        self.but9.image=[UIImage imageNamed:@"未升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(157, 150, 152)];
        [_silabel setTextColor:RGB(157, 150, 152)];
        [_wulabel setTextColor:RGB(157, 150, 152)];
        [_liulabel setTextColor:RGB(157, 150, 152)];
        [_qilabel setTextColor:RGB(157, 150, 152)];
        [_balabel setTextColor:RGB(157, 150, 152)];
        [_jiulabel setTextColor:RGB(157, 150, 152)];
        [_shilabel setTextColor:RGB(157, 150, 152)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but2.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but2.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but2.transform=CGAffineTransformIdentity;
            [self.view addSubview:_jianglijiemian];
        }];
        


    }
    
    
    if ([str13 isEqualToString:_str3])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"未升级"];
        self.but5.image=[UIImage imageNamed:@"未升级"];
        self.but6.image=[UIImage imageNamed:@"未升级"];
        self.but7.image=[UIImage imageNamed:@"未升级"];
        self.but8.image=[UIImage imageNamed:@"未升级"];
        self.but9.image=[UIImage imageNamed:@"未升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(157, 150, 152)];
        [_wulabel setTextColor:RGB(157, 150, 152)];
        [_liulabel setTextColor:RGB(157, 150, 152)];
        [_qilabel setTextColor:RGB(157, 150, 152)];
        [_balabel setTextColor:RGB(157, 150, 152)];
        [_jiulabel setTextColor:RGB(157, 150, 152)];
        [_shilabel setTextColor:RGB(157, 150, 152)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but3.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but3.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but3.transform=CGAffineTransformIdentity;
            
            [self.view addSubview:_jianglijiemian];
        }];
        
        
    }
    
    
    if ([str13 isEqualToString:_str4])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"未升级"];
        self.but6.image=[UIImage imageNamed:@"未升级"];
        self.but7.image=[UIImage imageNamed:@"未升级"];
        self.but8.image=[UIImage imageNamed:@"未升级"];
        self.but9.image=[UIImage imageNamed:@"未升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(157, 150, 152)];
        [_liulabel setTextColor:RGB(157, 150, 152)];
        [_qilabel setTextColor:RGB(157, 150, 152)];
        [_balabel setTextColor:RGB(157, 150, 152)];
        [_jiulabel setTextColor:RGB(157, 150, 152)];
        [_shilabel setTextColor:RGB(157, 150, 152)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but4.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but4.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but4.transform=CGAffineTransformIdentity;
            
            [self.view addSubview:_jianglijiemian];
        }];
        


        
    }
    
    if ([str13 isEqualToString:_str5])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"已升级"];
        self.but6.image=[UIImage imageNamed:@"未升级"];
        self.but7.image=[UIImage imageNamed:@"未升级"];
        self.but8.image=[UIImage imageNamed:@"未升级"];
        self.but9.image=[UIImage imageNamed:@"未升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(242, 115, 154)];
        [_liulabel setTextColor:RGB(157, 150, 152)];
        [_qilabel setTextColor:RGB(157, 150, 152)];
        [_balabel setTextColor:RGB(157, 150, 152)];
        [_jiulabel setTextColor:RGB(157, 150, 152)];
        [_shilabel setTextColor:RGB(157, 150, 152)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but5.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but5.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but5.transform=CGAffineTransformIdentity;
            
            [self.view addSubview:_jianglijiemian];
        }];
        
        
    }
    
    if ([str13 isEqualToString:_str6])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"已升级"];
        self.but6.image=[UIImage imageNamed:@"已升级"];
        self.but7.image=[UIImage imageNamed:@"未升级"];
        self.but8.image=[UIImage imageNamed:@"未升级"];
        self.but9.image=[UIImage imageNamed:@"未升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(242, 115, 154)];
        [_liulabel setTextColor:RGB(242, 115, 154)];
        [_qilabel setTextColor:RGB(157, 150, 152)];
        [_balabel setTextColor:RGB(157, 150, 152)];
        [_jiulabel setTextColor:RGB(157, 150, 152)];
        [_shilabel setTextColor:RGB(157, 150, 152)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but6.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but6.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but6.transform=CGAffineTransformIdentity;
            [self.view addSubview:_jianglijiemian];
        }];
        


    }
    
    if ([str13 isEqualToString:_str7])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"已升级"];
        self.but6.image=[UIImage imageNamed:@"已升级"];
        self.but7.image=[UIImage imageNamed:@"已升级"];
        self.but8.image=[UIImage imageNamed:@"未升级"];
        self.but9.image=[UIImage imageNamed:@"未升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(242, 115, 154)];
        [_liulabel setTextColor:RGB(242, 115, 154)];
        [_qilabel setTextColor:RGB(242, 115, 154)];
        [_balabel setTextColor:RGB(157, 150, 152)];
        [_jiulabel setTextColor:RGB(157, 150, 152)];
        [_shilabel setTextColor:RGB(157, 150, 152)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but7.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but7.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but7.transform=CGAffineTransformIdentity;
            [self.view addSubview:_jianglijiemian];
        }];
        


        
    }
    
    if ([str13 isEqualToString:_str8])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"已升级"];
        self.but6.image=[UIImage imageNamed:@"已升级"];
        self.but7.image=[UIImage imageNamed:@"已升级"];
        self.but8.image=[UIImage imageNamed:@"已升级"];
        self.but9.image=[UIImage imageNamed:@"未升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(242, 115, 154)];
        [_liulabel setTextColor:RGB(242, 115, 154)];
        [_qilabel setTextColor:RGB(242, 115, 154)];
        [_balabel setTextColor:RGB(242, 115, 154)];
        [_jiulabel setTextColor:RGB(157, 150, 152)];
        [_shilabel setTextColor:RGB(157, 150, 152)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but8.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but8.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but8.transform=CGAffineTransformIdentity;
            [self.view addSubview:_jianglijiemian];
        }];
        
    }
    
    if ([str13 isEqualToString:_str9])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"已升级"];
        self.but6.image=[UIImage imageNamed:@"已升级"];
        self.but7.image=[UIImage imageNamed:@"已升级"];
        self.but8.image=[UIImage imageNamed:@"已升级"];
        self.but9.image=[UIImage imageNamed:@"已升级"];
        self.but10.image=[UIImage imageNamed:@"未升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(242, 115, 154)];
        [_liulabel setTextColor:RGB(242, 115, 154)];
        [_qilabel setTextColor:RGB(242, 115, 154)];
        [_balabel setTextColor:RGB(242, 115, 154)];
        [_jiulabel setTextColor:RGB(242, 115, 154)];
        [_shilabel setTextColor:RGB(157, 150, 152)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but9.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but9.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but9.transform=CGAffineTransformIdentity;
            [self.view addSubview:_jianglijiemian];
        }];
        
    }
    
    
    
    if ([str13 isEqualToString:_str10])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"已升级"];
        self.but6.image=[UIImage imageNamed:@"已升级"];
        self.but7.image=[UIImage imageNamed:@"已升级"];
        self.but8.image=[UIImage imageNamed:@"已升级"];
        self.but9.image=[UIImage imageNamed:@"已升级"];
        self.but10.image=[UIImage imageNamed:@"已升级"];
        self.but11.image=[UIImage imageNamed:@"未升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(242, 115, 154)];
        [_liulabel setTextColor:RGB(242, 115, 154)];
        [_qilabel setTextColor:RGB(242, 115, 154)];
        [_balabel setTextColor:RGB(242, 115, 154)];
        [_jiulabel setTextColor:RGB(242, 115, 154)];
        [_shilabel setTextColor:RGB(242, 115, 154)];
        [_shiyilabel setTextColor:RGB(157, 150, 152)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but10.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but10.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but10.transform=CGAffineTransformIdentity;
            [self.view addSubview:_jianglijiemian];
        }];
        
        
    }
    
    
    
    
    if ([str13 isEqualToString:_str11])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"已升级"];
        self.but6.image=[UIImage imageNamed:@"已升级"];
        self.but7.image=[UIImage imageNamed:@"已升级"];
        self.but8.image=[UIImage imageNamed:@"已升级"];
        self.but9.image=[UIImage imageNamed:@"已升级"];
        self.but10.image=[UIImage imageNamed:@"已升级"];
        self.but11.image=[UIImage imageNamed:@"已升级"];
        self.but12.image=[UIImage imageNamed:@"未升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(242, 115, 154)];
        [_liulabel setTextColor:RGB(242, 115, 154)];
        [_qilabel setTextColor:RGB(242, 115, 154)];
        [_balabel setTextColor:RGB(242, 115, 154)];
        [_jiulabel setTextColor:RGB(242, 115, 154)];
        [_shilabel setTextColor:RGB(242, 115, 154)];
        [_shiyilabel setTextColor:RGB(242, 115, 154)];
        [_shierlabel setTextColor:RGB(157, 150, 152)];
        
        _but1.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but11.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but11.transform=CGAffineTransformIdentity;
            [self.view addSubview:_jianglijiemian];
        }];

    }
    
    
    
    
    if ([str13 isEqualToString:_str12])
    {
        self.but1.image=[UIImage imageNamed:@"已升级"];
        self.but2.image=[UIImage imageNamed:@"已升级"];
        self.but3.image=[UIImage imageNamed:@"已升级"];
        self.but4.image=[UIImage imageNamed:@"已升级"];
        self.but5.image=[UIImage imageNamed:@"已升级"];
        self.but6.image=[UIImage imageNamed:@"已升级"];
        self.but7.image=[UIImage imageNamed:@"已升级"];
        self.but8.image=[UIImage imageNamed:@"已升级"];
        self.but9.image=[UIImage imageNamed:@"已升级"];
        self.but10.image=[UIImage imageNamed:@"已升级"];
        self.but11.image=[UIImage imageNamed:@"已升级"];
        self.but12.image=[UIImage imageNamed:@"已升级"];
        
        [_yilabel setTextColor:RGB(242, 115, 154)];
        [_erlabel setTextColor:RGB(242, 115, 154)];
        [_sanlabel setTextColor:RGB(242, 115, 154)];
        [_silabel setTextColor:RGB(242, 115, 154)];
        [_wulabel setTextColor:RGB(242, 115, 154)];
        [_liulabel setTextColor:RGB(242, 115, 154)];
        [_qilabel setTextColor:RGB(242, 115, 154)];
        [_balabel setTextColor:RGB(242, 115, 154)];
        [_jiulabel setTextColor:RGB(242, 115, 154)];
        [_shilabel setTextColor:RGB(242, 115, 154)];
        [_shiyilabel setTextColor:RGB(242, 115, 154)];
        [_shierlabel setTextColor:RGB(242, 115, 154)];
        
        _but12.layer.anchorPoint=CGPointMake(0.5, 0.5);
        [UIView animateWithDuration:5 animations:^{
            _but12.transform=CGAffineTransformMakeRotation(rew(-50));
        } completion:^(BOOL gf){
            _but12.transform=CGAffineTransformIdentity;
            [self.view addSubview:_jianglijiemian];
        }];
        
        
    }
   /*
   else
    {
        [UIView animateWithDuration:15 animations:^{
        } completion:^(BOOL gf){
            [self.view addSubview:_jianglijiemian];
        }];

    }
    */
    
   
    
   
}

#pragma mark  等级动画
-(void)maodiandonghua
{
    /*
    _but1.layer.anchorPoint=CGPointMake(0.5, 0.5);
    [self.view addSubview:_but1];
    [UIView animateWithDuration:5 animations:^{
        _but1.transform=CGAffineTransformMakeRotation(rew(-50));
    } completion:^(BOOL gf){
        _but1.transform=CGAffineTransformIdentity;
        
        [self.view addSubview:_jianglijiemian];
    }];

*/



}
#pragma mark   等级解析
-(void)jiexidangqianyonghudengji
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign
                                        ,@"src_type":@"2"};
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_user_info.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     if ([data count])
                     {
                         
                         NSDictionary *game = [data objectForKey:@"game"];
                         
                      if ([game count])
                    {
                        NSString *love_level=[game objectForKey:@"love_level"];
                             
                       self.dangqiandengjistr=[NSString stringWithFormat:@"%@",love_level];
                          
// 判断等级调用的位置
                            [self panduandengjishidijige];
                    }
                        
                   }
                }
             } error:^(NSError *error){}];
            
            
        }
    }
}

#pragma mark 返回主界面
-(void)jianglifanhui:(UIButton *)but
{
    
    [self.navigationController pushViewController:[[ZMMainViewController alloc]init] animated:YES];
    

}


@end
