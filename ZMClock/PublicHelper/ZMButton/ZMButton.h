//
//  ZMButton.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherRecordModel.h"
#import "StartModel.h"
#import "ZMImageView.h"
#import "ZMLabel.h"

@interface ZMButton : UIButton

@property (nonatomic,strong) ZMImageView *navImageView;
@property (nonatomic,strong) ZMLabel *navTitileLabel;
@property (nonatomic,strong) ZMLabel *otherTitileLabel;
@property (nonatomic,strong) WeatherRecordModel *recordModel;
@property (nonatomic,strong) StartModel *startModel;
@property (nonatomic) NSInteger isMark;
@property (nonatomic,strong) NSArray *programArray;
@property (nonatomic,retain) NSString *datePickerDate; //!< 时间选择器选择的时间

#pragma mark - 导航条上使用
#pragma mark   有图标和标题导航栏按钮
/**
 初始化带有图标和标题导航栏左侧按钮,最小Frame为30x30
 */
-(instancetype)initWithNavLeftBtnItemTitleAndImageViewFrame:(CGRect)frame withTitle:(NSString*)title withImageNamed:(NSString*)imageNamed;

/**
 初始化带有图标和标题导航栏右侧按钮,最小Frame为30x30
 */
-(instancetype)initWithNavRightBtnItemTitleAndImageViewFrame:(CGRect)frame withTitle:(NSString*)title withImageNamed:(NSString*)imageNamed;


#pragma mark   有标题导航栏按钮
/**
 初始化只有标题导航栏左侧按钮
 */
-(instancetype)initWithNavLeftBtnItemTitleFrame:(CGRect)frame withTitle:(NSString*)title;
/**
 初始化只有标题导航栏右侧按钮
 */
-(instancetype)initWithNavRightBtnItemTitleFrame:(CGRect)frame withTitle:(NSString*)title;

#pragma mark   只有图标导航栏按钮
/**
 初始化只有图标导航栏左侧按钮,最小Frame为30x30
 */
-(instancetype)initWithNavLeftBtnItemImageViewFrame:(CGRect)frame withImageNamed:(NSString*)imageNamed;
/**
 初始化只有图标导航栏右侧按钮,最小Frame为30x30
 */
-(instancetype)initWithNavRightBtnItemImageViewFrame:(CGRect)frame withImageNamed:(NSString*)imageNamed;


#pragma mark - TabBar上的按钮
-(instancetype)initWithFrame:(CGRect)frame wittTitle:(NSString*)title withImage:(NSString*)imageName selectedImage:(NSString*)selectedImageName;


#pragma mark - 设置中使用
/**
 在按钮中添加一个图片视图，用于展示图片
 */
-(instancetype)initWithImageViewFrame:(CGRect)frame withImageNamed:(NSString*)imageNamed;

/**
 在按钮中添加一个图片视图，用于展示图片，两个标签，一上一下现在不同内容
 */
-(instancetype)initWithImageViewFrame:(CGRect)frame withImageNamed:(NSString*)imageNamed withOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle;



/**
 在按钮中添加一个图片视图，两个标签，一上一下现在不同内容
 */
-(instancetype)initWithImageViewFrame:(CGRect)frame withOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle;




#pragma mark 主页闹钟界面按钮使用
/**
 在按钮中添加一个图片视图，用于展示图片，两个标签，一上一下现在不同内容
 */
-(instancetype)initWithImageViewFrame:(CGRect)frame withTipImageNamed:(NSString*)imageNamed withOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle;




/**
 具有蒙版效果的按钮
 */
-(instancetype)initWithBackViewFrame:(CGRect)frame;


-(void)setBackViewEnabled:(BOOL)enabled;


-(instancetype)initWithMarkFrame;

#pragma mark - 行程使用
-(instancetype)initWithProgramFrame:(CGRect)frame;



#pragma mark - 上面是图片下面是标题
-(instancetype)initWithTopImageAndTitleBottom;

-(void)resetWithTopImageAndTitleBottomFrame:(CGRect)frame;



@end
