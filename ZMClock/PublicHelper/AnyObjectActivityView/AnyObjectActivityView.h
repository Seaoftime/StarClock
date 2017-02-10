//
//  TaskStudyActivityView.h
//  Taskstudy
//
//  Created by yaolizhi on 15/11/5.
//  Copyright © 2015年 yaolizhi. All rights reserved.
//

#define Fontsize 14.0
#define IndicatorWidth 60.0
#define ImageViewWidth 40.0
#define SubmitSucceedVerify @"SubmitSucceedVerify.png"


#define NetWorkFail @"网络连接异常，请稍后再试"
#define LoginOverdue @"登录过期，请重新登录"
#define UserIdOrSign @"没有为空"
#define EmptyTip   @"EmptyTip.png"
#define Loading   @"正在加载"
#define LoadingFail @"加载失败"
#define SubmitFail @"提交失败"
#define SubmitSucceed @"提交成功"
#define SubmitIng @"正在提交"
#define SwitchWifi @"仅在Wifi下播放"
#define DefaultImage @"Default.png"
#define TextFiledAndTextViewHight 30.0


#define PwdNoNull @"密码不能为空"
#define PwdNoMatch @"密码6到16位数字或字符"
#define UserNameNoNull @"用户名不能为空"
#define UserNameNoMatch @"格式不正确，用户名必须为11为数字组成"

//color
#define ActivityRGB(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define ActivityRGBAlpha(r, g, b, a)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

//设备屏幕尺寸
#define ActivitykScreen_Height   ([UIScreen mainScreen].bounds.size.height)
#define ActivitykScreen_Width    ([UIScreen mainScreen].bounds.size.width)


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, ActivityMode)
{
    /*等待指示器*/
    ActivityModeIndicator,
    /*普通文本提示*/
    ActivityModeText,
    /*等待指示器和文本提示*/
    ActivityModeIndicatorAndText,
    /*自定义图片,图片在中间*/
    ActivityCententImageView,
    /*自定义图片,图片在左方方*/
    ActivityTopImageView,
};


typedef NS_ENUM(NSInteger, ActivityAfterDelayTime)
{
    /*等待指示器*/
    ActivityAfterDelayTime1 = 1,
    /*普通文本提示*/
    ActivityAfterDelayTime2 = 2,
    /*等待指示器和文本提示*/
    ActivityAfterDelayTime3 = 3,
    /*自定义图片,图片在中间*/
    ActivityAfterDelayTime4 = 4,
    /*自定义图片,图片在左方方*/
    ActivityAfterDelayTime5 = 5,
};


typedef NS_ENUM(NSInteger, ActivityMargin)
{
    /*等待指示器*/
    ActivityMargin10 = 10,
    /*普通文本提示*/
    AfterDelayTime20 = 20,
    /*等待指示器和文本提示*/
    ActivityMargin30 = 30,
    /*自定义图片,图片在中间*/
    ActivityMargin40 = 40,
    /*自定义图片,图片在左方方*/
    ActivityMargin50 = 50,
};



@interface AnyObjectActivityView : UIView


/**
 实例初始化气泡，隐藏时需要调用 hidden：方法
 title:提示内容
 imageName:图片名字
 view:添加的视图
 margin:标题间隔
 delay:显示时间,默认10秒消失
 */
-(instancetype)initWithTitle:(NSString*)title withActivityMode:(ActivityMode)mode wittImageName:(NSString*)imageName withAddedSuperView:(UIWindow*)view withMargin:(ActivityMargin)margin;



/**
 重新设置内容
 */
-(void)initResetWithTitle:(NSString*)title withActivityMode:(ActivityMode)mode wittImageName:(NSString*)imageName withAddedSuperView:(UIView*)view withMargin:(ActivityMargin)margin withafterDelay:(ActivityAfterDelayTime)delay;

/**
 类初始化气泡，指定消失时间后会自动消失
 title:提示内容
 imageName:图片名字
 view:添加的视图
 margin:标题间隔
 delay:显示时间
 */
+(void)showWithTitle:(NSString*)title wittImageName:(NSString*)imageName withActivityMode:(ActivityMode)mode withAddedSuperView:(UIWindow*)view withMargin:(ActivityMargin)margin withafterDelay:(ActivityAfterDelayTime)delay;


/**
 隐藏时方法
 */
-(void)hidden;

@end