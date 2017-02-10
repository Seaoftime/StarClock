//
//  TaskStudyActivityView.m
//  Taskstudy
//
//  Created by yaolizhi on 15/11/5.
//  Copyright © 2015年 yaolizhi. All rights reserved.
//

#import "AnyObjectActivityView.h"


@interface AnyObjectActivityView ()

@property (nonatomic,strong) UILabel *titleLabel;   //标题标签
@property (nonatomic,strong) UIActivityIndicatorView  *activityView; //等待指示器
@property (nonatomic,strong) UIImageView *imageView;   //自定义图片

@end

@implementation AnyObjectActivityView

-(instancetype)initWithTitle:(NSString*)title withActivityMode:(ActivityMode)mode wittImageName:(NSString*)imageName withAddedSuperView:(UIWindow*)view withMargin:(ActivityMargin)margin
{
    self = [super initWithFrame:CGRectMake(0, 0, IndicatorWidth, IndicatorWidth)];
    [self setBackgroundColor:ActivityRGBAlpha(51.0, 51.0, 51.0, 0.7)];
    [self.layer setCornerRadius:10.0];
    [self.layer setMasksToBounds:YES];
    if (self)
    {
        switch (mode)
        {
            case ActivityModeIndicator:
            {
                [self addSubview:self.activityView];
                [self.activityView startAnimating];
                [self setCenter:view.center];
                [view addSubview:self];
                
            }
                break;
            case ActivityModeText:
            {
                if (title)
                {
                    if ([title isEqualToString:@""])
                    {
                        UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的是文本模式，文本不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [AlertView show];
                    }
                    else
                    {
                        margin = margin >= 10.0 ? margin : 10.0;
                        CGSize MarginSize = [self contentWidthAndHight:title withmargin:margin];
                        
                        [self.titleLabel setFrame:CGRectMake(margin, margin,MarginSize.width, MarginSize.height)];
                        [self.titleLabel setText:title];
                        
                        
                        [self setFrame:CGRectMake(0, 0, MarginSize.width+margin*2, MarginSize.height+margin*2)];
                        [self.titleLabel setCenter:self.center];
                        [self addSubview:self.titleLabel];
                        [self setCenter:view.center];
                        [view addSubview:self];
                    }
                }
                else
                {
                    UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的是文本模式，文本不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [AlertView show];
                }
                
            }
                break;
            case ActivityModeIndicatorAndText:
            {
                
                if (title)
                {
                    if ([title isEqualToString:@""])
                    {
                        
                        UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的是文本+等待指示器模式，文本不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [AlertView show];
                    }
                    else
                    {
                        margin = margin >= 10.0 ? margin : 10.0;
                        CGSize MarginSize = [self contentWidthAndHight:title withmargin:margin];
                        CGFloat ActivityIndicatorHight = margin*2 + MarginSize.height + 40 + 5;
                        CGFloat TitleLabelWidth = MarginSize.width >= ImageViewWidth ? MarginSize.width : ImageViewWidth;
                        CGFloat ActivityIndicatorWidth = TitleLabelWidth+margin*2;
                        
                        
                        
                        [self.activityView setFrame:CGRectMake(ActivityIndicatorWidth/2-ImageViewWidth/2, margin, ImageViewWidth, ImageViewWidth)];
                        [self.activityView startAnimating];
                        [self addSubview:self.activityView];
                        
                        [self.titleLabel setFrame:CGRectMake(margin, ActivityIndicatorHight-margin-MarginSize.height, MarginSize.width, MarginSize.height)];
                        [self.titleLabel setText:title];
                        [self addSubview:self.titleLabel];
                        
                        
                        [self setFrame:CGRectMake(0, 0, ActivityIndicatorWidth, ActivityIndicatorHight)];
                        [self setCenter:view.center];
                        [view addSubview:self];
                    }
                }
                else
                {
                    
                    UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的是文本+等待指示器模式，文本不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [AlertView show];
                }
            }
                break;
            case ActivityCententImageView:
            {
                if (imageName)
                {
                    if ([imageName isEqualToString:@""])
                    {
                        UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的图片模式，图片名字不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [AlertView show];
                    }
                    else
                    {
                        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(margin, margin, ImageViewWidth, ImageViewWidth)];
                        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
                        [self.imageView setImage:[UIImage imageNamed:imageName]];
                        [self.imageView setCenter:self.center];
                        [self addSubview:self.imageView];
                        [self setCenter:view.center];
                        [view addSubview:self];
                    }
                }
                else
                {
                    UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的图片模式，图片名字不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [AlertView show];
                    
                }
            }
                break;
            case ActivityTopImageView:
            {
                if (title && imageName)
                {
                    if ([title isEqualToString:@""] || [imageName isEqualToString:@""])
                    {
                        UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的图片+文本模式，任何一个参数都不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [AlertView show];
                    }
                    else
                    {
                        margin = margin >= 10.0 ? margin : 10.0;
                        CGSize MarginSize = [self contentWidthAndHight:title withmargin:margin];
                        CGFloat ActivityIndicatorHight = margin*2 + MarginSize.height + 40 + 5;
                        CGFloat TitleLabelWidth = MarginSize.width >= ImageViewWidth ? MarginSize.width : ImageViewWidth;
                        CGFloat ActivityIndicatorWidth = TitleLabelWidth+margin*2;
                        
                        //设置图片
                        [self.imageView setFrame:CGRectMake(ActivityIndicatorWidth/2-ImageViewWidth/2, margin, ImageViewWidth, ImageViewWidth)];
                        [self.imageView setImage:[UIImage imageNamed:imageName]];
                        [self addSubview:self.imageView];
                        
                        //设置标签
                        [self.titleLabel setFrame:CGRectMake(margin, ActivityIndicatorHight-margin-MarginSize.height, MarginSize.width, MarginSize.height)];
                        [self.titleLabel setText:title];
                        [self addSubview:self.titleLabel];
                        
                        
                        [self setFrame:CGRectMake(0, 0, ActivityIndicatorWidth, ActivityIndicatorHight)];
                        [self setCenter:view.center];
                        [view addSubview:self];
                    }
                }
                else
                {
                    UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的图片+文本模式，任何一个参数都不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [AlertView show];
                }
            }
                break;
        }
        
        
#pragma 调试使用的颜色
//        [self.imageView setBackgroundColor:[UIColor grayColor]];
//        [self.titleLabel setBackgroundColor:[UIColor redColor]];
        
    }
    
    [self performSelector:@selector(hidden) withObject:@"隐藏" afterDelay:10];
    return self;
}


-(void)initResetWithTitle:(NSString*)title withActivityMode:(ActivityMode)mode wittImageName:(NSString*)imageName withAddedSuperView:(UIView*)view withMargin:(ActivityMargin)margin withafterDelay:(ActivityAfterDelayTime)delay
{
    [self.titleLabel setHidden:YES];
    [self.imageView setHidden:YES];
    [self.activityView stopAnimating];
    switch (mode)
    {
        case ActivityModeIndicator:
        {
            [self addSubview:self.activityView];
            [self setCenter:view.center];
            [view addSubview:self];
            
        }
            break;
        case ActivityModeText:
        {
            if (title)
            {
                if ([title isEqualToString:@""])
                {
                    UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的是文本模式，文本不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [AlertView show];
                }
                else
                {
                    margin = margin >= 10.0 ? margin : 10.0;
                    CGSize MarginSize = [self contentWidthAndHight:title withmargin:margin];
                    
            
                    [self.titleLabel setFrame:CGRectMake(margin, margin,MarginSize.width, MarginSize.height)];
                    [self.titleLabel setText:title];
                    [self.titleLabel setHidden:NO];
                    
                    [self setFrame:CGRectMake(0, 0, MarginSize.width+margin*2, MarginSize.height+margin*2)];
                    [self.titleLabel setCenter:self.center];
                    [self addSubview:self.titleLabel];
                    [self setCenter:view.center];
                    [view addSubview:self];
                }
            }
            else
            {
                UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的是文本模式，文本不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [AlertView show];
            }
            
        }
            break;
        case ActivityModeIndicatorAndText:
        {
            if (title)
            {
                if ([title isEqualToString:@""])
                {
                    
                    UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的是文本+等待指示器模式，文本不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [AlertView show];
                }
                else
                {
                    margin = margin >= 10.0 ? margin : 10.0;
                    CGSize MarginSize = [self contentWidthAndHight:title withmargin:margin];
                    CGFloat ActivityIndicatorHight = margin*2 + MarginSize.height + 40 + 5;
                    CGFloat TitleLabelWidth = MarginSize.width >= ImageViewWidth ? MarginSize.width : ImageViewWidth;
                    CGFloat ActivityIndicatorWidth = TitleLabelWidth+margin*2;
                    
                    [self.activityView setFrame:CGRectMake(ActivityIndicatorWidth/2-ImageViewWidth/2, margin, ImageViewWidth, ImageViewWidth)];
                    [self.imageView startAnimating];
                    [self addSubview:self.activityView];
                    
                    //设置标签
                    [self.titleLabel setFrame:CGRectMake(margin, ActivityIndicatorHight-margin-MarginSize.height, MarginSize.width+margin*2, MarginSize.height+margin*2)];
                    [self.titleLabel setText:title];
                    [self.titleLabel setHidden:NO];
                    [self addSubview:self.titleLabel];
                    
                    
                    [self setFrame:CGRectMake(0, 0, ActivityIndicatorWidth, ActivityIndicatorHight)];
                    [self setCenter:view.center];
                    [view addSubview:self];
                }
            }
            else
            {
                UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的是文本+等待指示器模式，文本不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [AlertView show];
            }
        }
            break;
        case ActivityCententImageView:
        {
            if (imageName)
            {
                if ([imageName isEqualToString:@""])
                {
                    UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的图片模式，图片名字不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [AlertView show];
                }
                else
                {
                    [self.imageView setFrame:CGRectMake(margin, margin, ImageViewWidth, ImageViewWidth)];
                    [self.imageView setImage:[UIImage imageNamed:imageName]];
                    [self.imageView setCenter:self.center];
                    [self addSubview:self.imageView];
                    [self setCenter:view.center];
                    [self.imageView setHidden:NO];
                    [view addSubview:self];
                }
            }
            else
            {
                UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的图片模式，图片名字不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [AlertView show];
            }
        }
            break;
        case ActivityTopImageView:
        {
            if (title && imageName)
            {
                if ([title isEqualToString:@""] || [imageName isEqualToString:@""])
                {
                
                    UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的图片+文本模式，任何一个参数都不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [AlertView show];
                }
                else
                {
                    margin = margin >= 10.0 ? margin : 10.0;
                    CGSize MarginSize = [self contentWidthAndHight:title withmargin:margin];
                    CGFloat ActivityIndicatorHight = margin*2 + MarginSize.height + 40 + 5;
                    CGFloat TitleLabelWidth = MarginSize.width >= ImageViewWidth ? MarginSize.width : ImageViewWidth;
                    CGFloat ActivityIndicatorWidth = TitleLabelWidth+margin*2;
                    
                    //设置图片
                    [self.imageView setFrame:CGRectMake(ActivityIndicatorWidth/2-ImageViewWidth/2, margin, ImageViewWidth, ImageViewWidth)];
                    [self.imageView setImage:[UIImage imageNamed:imageName]];
                    [self.imageView setHidden:NO];
                    [self addSubview:self.imageView];
                    
                    
                    //设置标签
                    [self.titleLabel setFrame:CGRectMake(margin, ActivityIndicatorHight-margin-MarginSize.height, MarginSize.width, MarginSize.height)];
                    [self.titleLabel setText:title];
                    [self.titleLabel setHidden:NO];
                    [self addSubview:self.titleLabel];
                    
                    
                    [self setFrame:CGRectMake(0, 0, ActivityIndicatorWidth, ActivityIndicatorHight)];
                    [self setCenter:view.center];
                    [view addSubview:self];
                }
            }
            else
            {
                UIAlertView *AlertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你选择的图片+文本模式，任何一个参数都不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [AlertView show];
            }
        }
            break;
    }
    [self performSelector:@selector(hidden) withObject:@"隐藏" afterDelay:delay];
}





+(void)showWithTitle:(NSString*)title wittImageName:(NSString*)imageName withActivityMode:(ActivityMode)mode withAddedSuperView:(UIWindow*)view withMargin:(ActivityMargin)margin withafterDelay:(ActivityAfterDelayTime)delay
{
    AnyObjectActivityView *ativityView = [[AnyObjectActivityView alloc]initWithTitle:title withActivityMode:mode wittImageName:imageName withAddedSuperView:view withMargin:margin];
    [ativityView performSelector:@selector(hidden) withObject:@"隐藏" afterDelay:delay];
}




-(void)hidden
{
    [self setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
    [self setAlpha:1.0];
    [UIView animateWithDuration:0.15 animations:^{
        [self.activityView setHidden:YES];
        [self.activityView stopAnimating];
        [self setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
        [self setAlpha:0.0];
        [self removeFromSuperview];
        
    } ];
}



#pragma mark - Getter/Setter Method
-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:Fontsize]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setNumberOfLines:0];
    }
    return _titleLabel;
}


-(UIImageView*)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _imageView;
}



-(UIActivityIndicatorView*)activityView
{
    if (_activityView == nil)
    {
        _activityView = [[UIActivityIndicatorView alloc]
                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [_activityView setHidesWhenStopped:YES];
        [_activityView startAnimating];
        [_activityView setCenter:self.center];
    }
    return _activityView;
}

#pragma mark - 计算“内容”文本高度
-(CGSize)contentWidthAndHight:(NSString*)content withmargin:(CGFloat)margin
{
    //=========得到content的内容高度===========
    NSDictionary *AttriButes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:Fontsize]};
    CGSize ContentSize = [content boundingRectWithSize:CGSizeMake(ActivitykScreen_Width-margin*2-20*2/*两边间隙20*2*/, MAXFLOAT)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:AttriButes
                                               context:nil].size;
    //译文本高度
    return ContentSize;
}


@end
