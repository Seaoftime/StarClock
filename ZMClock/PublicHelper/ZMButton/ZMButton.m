//
//  ZMButton.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMButton.h"


@interface ZMButton ()



@property (nonatomic,strong) UIImage *normalImage;    //正常的图片
@property (nonatomic,strong) UIImage *selectedImage;  //选择后的图片

@property (nonatomic,strong) UIView *backView;

@end


@implementation ZMButton
@synthesize navTitileLabel;
@synthesize otherTitileLabel;
@synthesize navImageView;
@synthesize normalImage;
@synthesize selectedImage;


#pragma mark -  有图标和标题导航栏按钮
/**
 初始化导航栏左侧按钮
 */
-(instancetype)initWithNavLeftBtnItemTitleAndImageViewFrame:(CGRect)frame withTitle:(NSString*)title withImageNamed:(NSString*)imageNamed
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航图片视图
        navImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [navImageView setImage:[UIImage imageNamed:imageNamed]];
        [self addSubview:navImageView];
        
        //添加导航标题标签
        navTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(35, 0,frame.size.width-35, 30)];
        [navTitileLabel setTextColor:[UIColor whiteColor]];
        [navTitileLabel setFont:[UIFont systemFontOfSize:20.0]];
        [navTitileLabel setTextAlignment:NSTextAlignmentLeft];
        [navTitileLabel setText:title];
        [self addSubview:navTitileLabel];
    }
    return self;
}

/**
 初始化导航栏右侧按钮
 */
-(instancetype)initWithNavRightBtnItemTitleAndImageViewFrame:(CGRect)frame withTitle:(NSString*)title withImageNamed:(NSString*)imageNamed
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航图片视图
        navImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(frame.size.width-30, 0, 30, 30)];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [navImageView setImage:[UIImage imageNamed:imageNamed]];
        [self addSubview:navImageView];
        
        //添加导航标题标签
        navTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 0,frame.size.width-35, 30)];
        [navTitileLabel setTextColor:[UIColor whiteColor]];
        [navTitileLabel setFont:[UIFont systemFontOfSize:20.0]];
        [navTitileLabel setTextAlignment:NSTextAlignmentRight];
        [navTitileLabel setText:title];
        [self addSubview:navTitileLabel];
    }
    return self;
}


#pragma mark -  只有标题导航栏按钮
/**
 初始化只有标题导航栏左侧按钮
 */
-(instancetype)initWithNavLeftBtnItemTitleFrame:(CGRect)frame withTitle:(NSString*)title
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航标题标签
        navTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 0,frame.size.width, 30)];
        [navTitileLabel setTextColor:[UIColor whiteColor]];
        [navTitileLabel setFont:[UIFont systemFontOfSize:20.0]];
        [navTitileLabel setTextAlignment:NSTextAlignmentLeft];
        [navTitileLabel setText:title];
        [self addSubview:navTitileLabel];
    }
    return self;
}

/**
 初始化只有标题导航栏右侧按钮
 */
-(instancetype)initWithNavRightBtnItemTitleFrame:(CGRect)frame withTitle:(NSString*)title
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航标题标签
        navTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 0,frame.size.width, 30)];
        [navTitileLabel setTextColor:[UIColor whiteColor]];
        [navTitileLabel setFont:[UIFont systemFontOfSize:20.0]];
        [navTitileLabel setTextAlignment:NSTextAlignmentRight];
        [navTitileLabel setText:title];
        [self addSubview:navTitileLabel];
    }
    return self;
}

#pragma mark -  只有图标导航栏按钮
/**
 初始化只有图标导航栏左侧按钮,最小Frame为30x30
 */
-(instancetype)initWithNavLeftBtnItemImageViewFrame:(CGRect)frame withImageNamed:(NSString*)imageNamed
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航图片视图
        navImageView = [[ZMImageView alloc] initWithFrame:CGRectMake(10, frame.size.height/2-30/2, 30, 30)];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [navImageView setImage:[UIImage imageNamed:imageNamed]];
        [self addSubview:navImageView];
    }
    return self;
}

/**
 初始化只有图标导航栏右侧按钮,最小Frame为30x30
 */
-(instancetype)initWithNavRightBtnItemImageViewFrame:(CGRect)frame withImageNamed:(NSString*)imageNamed
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航图片视图
        navImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(frame.size.width-40, frame.size.height/2-30/2, 30, 30)];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [navImageView setImage:[UIImage imageNamed:imageNamed]];
        [self addSubview:navImageView];
    }
    return self;
}




#pragma mark - 初始化按钮，并设置正常和选中状态的图片
-(instancetype)initWithFrame:(CGRect)frame wittTitle:(NSString*)title withImage:(NSString*)imageName selectedImage:(NSString*)selectedImageName
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        normalImage = [UIImage imageNamed:imageName];
        selectedImage = [UIImage imageNamed:selectedImageName];
        navImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(frame.size.width/2-30/2, 0, 30, 30)];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:navImageView];
        
        
        navTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 32, frame.size.width, 15)];
        [navTitileLabel setFont:[UIFont systemFontOfSize:12.0 weight:12.0]];
        [navTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [navTitileLabel setTextColor:[UIColor whiteColor]];
        [navTitileLabel setText:title];
        [self addSubview:navTitileLabel];
        
        //调试控件的颜色
//        [imageView setBackgroundColor:[UIColor purpleColor]];
//        [TitleLabel setBackgroundColor:[UIColor purpleColor]];
    }
    return self;
}


#pragma mark - 设置中使用
-(instancetype)initWithImageViewFrame:(CGRect)frame withImageNamed:(NSString*)imageNamed
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航图片视图
        navImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [navImageView setImage:[UIImage imageNamed:imageNamed]];
        [self addSubview:navImageView];
    }
    return self;
}


/**
 在按钮中添加一个图片视图，用于展示图片，两个标签，一上一下现在不同内容
 */
-(instancetype)initWithImageViewFrame:(CGRect)frame withImageNamed:(NSString*)imageNamed withOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航图片视图
        navImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(kScreen_Width/2-30/2, 10, 30, 30)];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [navImageView setImage:[UIImage imageNamed:imageNamed]];
        [self addSubview:navImageView];
        [navImageView setBackgroundColor:[UIColor redColor]];
        
        navTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 45, frame.size.width, 15)];
        [navTitileLabel setFont:[UIFont systemFontOfSize:12.0]];
        [navTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [navTitileLabel setTextColor:[UIColor blackColor]];
        [navTitileLabel setText:oneTitle];
        [self addSubview:navTitileLabel];
        
        
        otherTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 62, frame.size.width, 15)];
        [otherTitileLabel setFont:[UIFont systemFontOfSize:10.0]];
        [otherTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [otherTitileLabel setTextColor:[UIColor grayColor]];
        [otherTitileLabel setText:twoTitle];
        [self addSubview:otherTitileLabel];
        
        
        [self setBackgroundColor:[UIColor whiteColor]];
//        [otherTitileLabel setBackgroundColor:[UIColor yellowColor]];
//        [navTitileLabel setBackgroundColor:[UIColor purpleColor]];
    }
    return self;
}



/**
 在按钮中添加一个图片视图，用于展示图片，两个标签，一上一下现在不同内容
 */
-(instancetype)initWithImageViewFrame:(CGRect)frame withOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle
{
    self = [super initWithFrame:frame];
    if (self)
    {
        navTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 5, frame.size.width, 15)];
        [navTitileLabel setFont:[UIFont systemFontOfSize:12.0]];
        [navTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [navTitileLabel setTextColor:[UIColor blackColor]];
        [navTitileLabel setText:oneTitle];
        [self addSubview:navTitileLabel];
        
        
        otherTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, 22, frame.size.width, 15)];
        [otherTitileLabel setFont:[UIFont systemFontOfSize:10.0]];
        [otherTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [otherTitileLabel setTextColor:[UIColor grayColor]];
        [otherTitileLabel setText:twoTitle];
        [self addSubview:otherTitileLabel];
        
        
        [self setBackgroundColor:[UIColor whiteColor]];
        //        [otherTitileLabel setBackgroundColor:[UIColor yellowColor]];
        //        [navTitileLabel setBackgroundColor:[UIColor purpleColor]];
    }
    return self;
}



/**
 在按钮中添加一个图片视图，用于展示图片，两个标签，一上一下现在不同内容
 */
-(instancetype)initWithImageViewFrame:(CGRect)frame withTipImageNamed:(NSString*)imageNamed withOneTitle:(NSString*)oneTitle withTwoTitle:(NSString*)twoTitle
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //添加导航图片视图
        navImageView = [[ZMImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [navImageView setImage:[UIImage imageNamed:imageNamed]];
        [self addSubview:navImageView];
        
        navTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, frame.size.height/2-25/2, frame.size.width, 25)];
        [navTitileLabel setFont:[UIFont fontWithName:@"DB LCD Temp" size:25.0f]];
        [navTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [navTitileLabel setTextColor:[UIColor blackColor]];
        [navTitileLabel setText:oneTitle];
        [self addSubview:navTitileLabel];
        
        
        otherTitileLabel = [[ZMLabel alloc]initWithFrame:CGRectMake(0, frame.size.height/2+20, frame.size.width, 15)];
        [otherTitileLabel setFont:[UIFont systemFontOfSize:10.0]];
        [otherTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [otherTitileLabel setTextColor:[UIColor grayColor]];
        [otherTitileLabel setText:twoTitle];
        [self addSubview:otherTitileLabel];
        
        
        [self setBackgroundColor:[UIColor whiteColor]];
//        [otherTitileLabel setBackgroundColor:[UIColor yellowColor]];
//        [navTitileLabel setBackgroundColor:[UIColor purpleColor]];
    }
    return self;
}


-(instancetype)initWithBackViewFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.backView];
        [self.backView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    }
    return self;
}
-(void)setBackViewEnabled:(BOOL)enabled
{
   [self.backView setHidden:enabled];
}



#pragma mark 蒙版
-(UIView *)backView
{
    if (_backView == nil)
    {
        _backView =[[UIView alloc]init];
        [_backView.layer setCornerRadius:8];
        [_backView setBackgroundColor:RGBAlpha(0, 0, 0, 0.5)];
    }
    return _backView;
}


-(instancetype)initWithMarkFrame
{
    self = [super init];
    if (self)
    {
        [self setIsMark:1];
        [self.layer setBorderColor:[LineViewColor CGColor]];
        [self.layer setBorderWidth:2.0];
    }
    return self;
}



#pragma mark 

-(void)setIsMark:(NSInteger)isMark
{
    _isMark = isMark;
    switch (isMark)
    {
        case 1:
        {
            [self setBackgroundColor:MainColor];
        }
            break;
        case 2:
        {
            [self setBackgroundColor:[UIColor whiteColor]];
        }
            break;
    }
}




#pragma mark - 行程使用
-(instancetype)initWithProgramFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}






#pragma mark - 上面是图片下面是标题
-(instancetype)initWithTopImageAndTitleBottom
{
    self = [super init];
    if (self)
    {
        navImageView = [[ZMImageView alloc]init];
        [navImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:navImageView];
//        [navImageView setBackgroundColor:[UIColor redColor]];
        
        navTitileLabel = [[ZMLabel alloc]init];
        [navTitileLabel setTextColor:RGB(231.0, 82.0, 128.0)];
        [navTitileLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
        [navTitileLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:navTitileLabel];
        
//        [navTitileLabel setBackgroundColor:[UIColor purpleColor]];
        
    }
    return self;
}

;

-(void)resetWithTopImageAndTitleBottomFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [navImageView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-30)];
    
    [navTitileLabel setFrame:CGRectMake(0,frame.size.height-35,frame.size.width, 25)];
}



@end
