//
//  ZMMainViewController.h
//  ZMClock
//
//  Created by ZhongMeng on 16/2/23.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//
//  主页视图控制器
//
//

#import <UIKit/UIKit.h>
#import "ZMBaseViewController.h"
#import "TabBarView.h"

#import "HeadPortraitImageView.h"

///
#import "Shengjihoutanchuyemianview.h"


@interface ZMMainViewController : ZMBaseViewController

@property (nonatomic,strong)NSString *lianxuqiandaostr;//签到天数
@property (nonatomic,strong)NSString *qiandaohoujingbistr;//当前金币数
@property (nonatomic,strong)NSString *qiandaozengjiastr;//增加金币数

@property (nonatomic,strong)NSString * shengjistr;//判断是否升级

//喂食,送花,清洁新的界面

@property(nonatomic,strong)UIButton *weishibutton;
@property(nonatomic,strong)UIButton *songhuabutton;
@property(nonatomic,strong)UIButton *qingjiebutton;

@property(nonatomic,strong)UIView *weishiview;
@property(nonatomic,strong)UIView *songhuaview;
@property(nonatomic,strong)UIView *qingjieview;

@property(nonatomic,strong)UIButton *goumaibutton1;
@property(nonatomic,strong)UIButton *goumaibutton2;
@property(nonatomic,strong)UIButton *goumaibutton3;

@property(nonatomic,strong)UIButton *shiyongbutton1;
@property(nonatomic,strong)UIButton *shiyongbutton2;
@property(nonatomic,strong)UIButton *shiyongbutton3;

@property(nonatomic,strong)UIButton *shanchubutton;
@property(nonatomic,strong)UIButton *shanchubutton2;
@property(nonatomic,strong)UIButton *shanchubutton3;

@property(nonatomic,strong)UILabel *shiwulabel1;
@property(nonatomic,strong)UILabel *shiwulabel2;
@property(nonatomic,strong)UILabel *shiwulabel3;

@property(nonatomic,strong)UILabel *jingbigeshu1;


@property(nonatomic,strong)UIButton *huagoumaibutton1;
@property(nonatomic,strong)UIButton *huagoumaibutton2;
@property(nonatomic,strong)UIButton *huagoumaibutton3;

@property(nonatomic,strong)UIButton *huashiyongbutton1;
@property(nonatomic,strong)UIButton *huajieshiyongbutton2;
@property(nonatomic,strong)UIButton *huajieshiyongbutton3;




@property(nonatomic,strong)UILabel *huashiwulabel1;
@property(nonatomic,strong)UILabel *huashiwulabel2;
@property(nonatomic,strong)UILabel *huashiwulabel3;

@property(nonatomic,strong)UILabel *jingbigeshu2;


@property(nonatomic,strong)UIButton *qinggoumaibutton1;
@property(nonatomic,strong)UIButton *qinggoumaibutton2;
@property(nonatomic,strong)UIButton *qinggoumaibutton3;




@property(nonatomic,strong)UIButton *qingjieshiyongbutton1;
@property(nonatomic,strong)UIButton *qingjieshiyongbutton2;
@property(nonatomic,strong)UIButton *qingjieshiyongbutton3;

@property(nonatomic,strong)UILabel *qingshiwulabel1;
@property(nonatomic,strong)UILabel *qingshiwulabel2;
@property(nonatomic,strong)UILabel *qingshiwulabel3;

@property(nonatomic,strong)UILabel *jingbigeshu3;




@property(nonatomic,strong)UILabel *jingdutiaolabel;;



@property(nonatomic,strong)UIImageView *weishishangtu;
@property(nonatomic,strong)UIImageView *weishizhongtu;
@property(nonatomic,strong)UIImageView *weishixiatu;


@property(nonatomic,strong)UIImageView *shiwutupian1;
@property(nonatomic,strong)UIImageView *shiwutupian2;
@property(nonatomic,strong)UIImageView *shiwutupian3;

@property(nonatomic,strong)UIImageView *shiwufengexian1;
@property(nonatomic,strong)UIImageView *shiwufengexian2;
@property(nonatomic,strong)UIImageView *shiwufengexian3;

@property(nonatomic,strong)UILabel *shiwujiage1;
@property(nonatomic,strong)UILabel *shiwujiage2;
@property(nonatomic,strong)UILabel *shiwujiage3;

@property(nonatomic,strong)UILabel *shiwuqingmi1;
@property(nonatomic,strong)UILabel *shiwuqingmi2;
@property(nonatomic,strong)UILabel *shiwuqingmi3;


@property(nonatomic,strong)UILabel *shiwumingzi1;
@property(nonatomic,strong)UILabel *shiwumingzi2;
@property(nonatomic,strong)UILabel *shiwumingzi3;

@property(nonatomic,strong)UILabel *shiwumingziquancheng;






@property(nonatomic,strong)UIImageView *songhuashangtu;
@property(nonatomic,strong)UIImageView *songhuazhongtu;
@property(nonatomic,strong)UIImageView *songhuaxiatu;



@property(nonatomic,strong)UIImageView *songhuatupian1;
@property(nonatomic,strong)UIImageView *songhuatupian2;
@property(nonatomic,strong)UIImageView *songhuatupian3;

@property(nonatomic,strong)UIImageView *songhuafengexian1;
@property(nonatomic,strong)UIImageView *songhuafengexian2;
@property(nonatomic,strong)UIImageView *songhuafengexian3;

@property(nonatomic,strong)UILabel *songhuajiage1;
@property(nonatomic,strong)UILabel *songhuajiage2;
@property(nonatomic,strong)UILabel *songhuajiage3;

@property(nonatomic,strong)UILabel *songhuaqingmi1;
@property(nonatomic,strong)UILabel *songhuaqingmi2;
@property(nonatomic,strong)UILabel *songhuaqingmi3;


@property(nonatomic,strong)UILabel *songhuamingzi1;
@property(nonatomic,strong)UILabel *songhuamingzi2;
@property(nonatomic,strong)UILabel *songhuamingzi3;

@property(nonatomic,strong)UILabel *songhuamingziquancheng;




@property(nonatomic,strong)UIImageView *qingjieshangtu;
@property(nonatomic,strong)UIImageView *qingjiezhongtu;
@property(nonatomic,strong)UIImageView *qingjiexiatu;



@property(nonatomic,strong)UIImageView *qingjietupian1;
@property(nonatomic,strong)UIImageView *qingjietupian2;
@property(nonatomic,strong)UIImageView *qingjietupian3;

@property(nonatomic,strong)UIImageView *qingjiefengexian1;
@property(nonatomic,strong)UIImageView *qingjiefengexian2;
@property(nonatomic,strong)UIImageView *qingjiefengexian3;

@property(nonatomic,strong)UILabel *qingjiejiage1;
@property(nonatomic,strong)UILabel *qingjiejiage2;
@property(nonatomic,strong)UILabel *qingjiejiage3;

@property(nonatomic,strong)UILabel *qingjieqingmi1;
@property(nonatomic,strong)UILabel *qingjieqingmi2;
@property(nonatomic,strong)UILabel *qingjieqingmi3;


@property(nonatomic,strong)UILabel *qingjiemingzi1;
@property(nonatomic,strong)UILabel *qingjiemingzi2;
@property(nonatomic,strong)UILabel *qingjiemingzi3;

@property(nonatomic,strong)UILabel *qingjiemingziquancheng;


@property(nonatomic,strong)UIImageView *kuangzi1;
@property(nonatomic,strong)UIImageView *kuangzi2;
@property(nonatomic,strong)UIImageView *kuangzi3;

@property(nonatomic,strong)UIImageView *shiwuxiaojinbi1;
@property(nonatomic,strong)UIImageView *shiwuxiaojinbi2;
@property(nonatomic,strong)UIImageView *shiwuxiaojinbi3;

@property(nonatomic,strong)UIImageView *songhuaxiaojinbi1;
@property(nonatomic,strong)UIImageView *songhuaxiaojinbi2;
@property(nonatomic,strong)UIImageView *songhuaxiaojinbi3;

@property(nonatomic,strong)UIImageView *qingjiexiaojinbi1;
@property(nonatomic,strong)UIImageView *qingjiexiaojinbi2;
@property(nonatomic,strong)UIImageView *qingjiexiaojinbi3;











@property(nonatomic,strong) UILabel * love_val;//!< 亲密度


// 背景图像
@property (retain, nonatomic) UIImageView *trackView;
// 填充图像
@property (retain, nonatomic) UIImageView *progressView;

@property(nonatomic,assign)NSInteger jinddutiao;


//人脸识别图
@property(nonatomic,strong)UIImageView *baobaorenlianshibie;







#pragma mark 获取天气情况
-(void)getWeather:(BOOL)weather;




@end

