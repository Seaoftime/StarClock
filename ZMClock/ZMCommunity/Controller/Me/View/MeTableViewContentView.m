//
//  MeTableViewContentView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "MeTableViewContentView.h"

@interface MeTableViewContentView ()

@property (nonatomic,strong) UIView *horizontalLineView; //!< 水平分割线
@property (nonatomic,strong) UIView *verticalLineView; //!< 垂直分割线


@end

@implementation MeTableViewContentView



#pragma mark  初始化昵称类型视图
-(instancetype)initWithNickName
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.imageView];
        [self addSubview:self.nickNameLabel];
        [self addSubview:self.concernLabel];
        [self addSubview:self.fansLabel];
        [self addSubview:self.horizontalLineView];
        
        [self resetBackgroundColor:YES];
    }
    return self;
}




-(void)resetBackgroundColor:(BOOL )backgroundColor
{
    if (!backgroundColor)
    {
        [self.imageView setBackgroundColor:[UIColor orangeColor]];
        [self.nickNameLabel setBackgroundColor:[UIColor purpleColor]];
        [self.concernLabel setBackgroundColor:[UIColor redColor]];
        [self.fansLabel setBackgroundColor:[UIColor greenColor]];
        [self.pointsLabel setBackgroundColor:[UIColor yellowColor]];
        [self.levelLabel setBackgroundColor:[UIColor orangeColor]];
        [self.titleLabel setBackgroundColor:[UIColor darkGrayColor]];
        [self.describeLabel setBackgroundColor:[UIColor brownColor]];
    }
}






-(void)resetNickNameFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    
    [self.imageView setFrame:CGRectMake(20, 5, 60, 60)];
    [self.imageView.layer setCornerRadius:30.0];
    [self.imageView.layer setMasksToBounds:YES];
    
    [self.nickNameLabel setFrame:CGRectMake(90, 5, frame.size.width-100, 20)];
    [self.concernLabel setFrame:CGRectMake(frame.size.width/2-100, 35, 100, 15)];
    [self.fansLabel setFrame:CGRectMake(frame.size.width/2, 35, 100, 15)];
    [self.horizontalLineView setFrame:CGRectMake(0,frame.size.height-4.0, kScreen_Width, 4.0)];
}





#pragma mark 初始化粉丝和关注类型视图
-(instancetype)initWithFansAndConcern
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.concernLabel];
        [self addSubview:self.concernNumberLabel];
        [self addSubview:self.fansLabel];
        [self addSubview:self.fansNumberLabel];
        [self addSubview:self.horizontalLineView];
        [self addSubview:self.verticalLineView];
        
        [self resetBackgroundColor:YES];
    }
    return self;
}


-(void)resetFansAndConcernFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.concernNumberLabel setFrame:CGRectMake(0, 10, frame.size.width/2.0, 15)];
    [self.concernLabel setFrame:CGRectMake(0, 30, frame.size.width/2.0, 15)];
    
    [self.fansNumberLabel setFrame:CGRectMake(frame.size.width/2.0, 10, frame.size.width/2.0, 15)];
    [self.fansLabel setFrame:CGRectMake(frame.size.width/2.0, 30, frame.size.width/2.0, 15)];
    
    [self.horizontalLineView setFrame:CGRectMake(0,frame.size.height-4.0, kScreen_Width, 4.0)];
    
    [self.verticalLineView setFrame:CGRectMake(frame.size.width/2.0-1.0, 0, 2, frame.size.height)];
}


#pragma mark 初始化社区头衔类型视图
-(instancetype)initWithHonour
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.describeLabel];
        [self addSubview:self.horizontalLineView];
        
        
        [self resetBackgroundColor:YES];
    }
    return self;
}

-(void)resetHonourFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    
    [self.titleLabel setFrame:CGRectMake(10, 0,frame.size.width/2-10, frame.size.height)];
    [self.describeLabel setFrame:CGRectMake(frame.size.width/2, 0, frame.size.width/2-30, frame.size.height)];
    
    [self.horizontalLineView setFrame:CGRectMake(0,frame.size.height-4.0, kScreen_Width, 4.0)];
}



#pragma mark 初始化消息类型视图
-(instancetype)initWithMessage
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.horizontalLineView];
        
        
        [self resetBackgroundColor:YES];
    }
    return self;
}


-(void)resetMessageFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.titleLabel setFrame:CGRectMake(10, 0,frame.size.width/2-10, 60)];
    [self.horizontalLineView setFrame:CGRectMake(0,frame.size.height-4.0, kScreen_Width, 4.0)];
    
}



#pragma mark 初始化明星类型视图
-(instancetype)initWithStar
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self addSubview:self.horizontalLineView];
        
        
        [self resetBackgroundColor:YES];
    }
    return self;
}



-(void)resetStarFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.titleLabel setFrame:CGRectMake(10, 0,frame.size.width/2-10, 60)];
    [self.horizontalLineView setFrame:CGRectMake(0,frame.size.height-4.0, kScreen_Width, 4.0)];
    
    
}


#pragma mark - 我的头衔视图信息
#pragma mark 头衔视图
/**
 头衔视图
 */
-(instancetype)initWithHonourHonourFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.nickNameLabel];
        [self addSubview:self.concernLabel];
        [self addSubview:self.fansLabel];
        [self addSubview:self.levelLabel];
        
        
        [self addSubview:self.horizontalLineView];
        [self addSubview:self.verticalLineView];
        [self addSubview:self.oneView];
        [self addSubview:self.twoView];
        [self addSubview:self.threeView];
        [self addSubview:self.fourView];
        
       
    }
    return self;
}


-(void)resetHonourHonourFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.nickNameLabel setFrame:CGRectMake(frame.size.width/2-80/2, 10, 80, 80)];
    [self.nickNameLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self.nickNameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.nickNameLabel setNumberOfLines:0];
    [self.nickNameLabel.layer setCornerRadius:40.0];
    [self.nickNameLabel.layer setBorderWidth:4.0];
    [self.nickNameLabel.layer setBorderColor:[MainColor CGColor]];
    
    
    [self.concernLabel setFrame:CGRectMake(0, 95, frame.size.width, 15.0)];
    [self.concernLabel setTextColor:MainColor];
    
    [self.fansLabel setFrame:CGRectMake(0, 110, frame.size.width, 15.0)];
    [self.fansLabel setTextColor:RGB(114.0, 110.0, 110.0)];
    
    [self.levelLabel setFrame:CGRectMake(frame.size.width/2-180/2, 130, 180, 30)];
    [self.levelLabel.layer setCornerRadius:15.0];
    [self.levelLabel.layer setBorderColor:[MainColor CGColor]];
    [self.levelLabel.layer setBorderWidth:4.0];
    
    
    
    //计算间隔的宽度
    CGFloat spaceWidth = (frame.size.width-320)/5.0;

    [self.oneView resetHonourWithFrame:CGRectMake(spaceWidth*1+80*0, 175, 80, 65)];
    [self.oneView.startImageView setImage:[UIImage imageNamed:@"stargray"]];
    [self.oneView.levelLanel setText:@"实习编辑"];
    
    
    
    [self.twoView resetHonourWithFrame:CGRectMake(spaceWidth*2+80*1, 175, 80, 65)];
    [self.twoView.startImageView setImage:[UIImage imageNamed:@"stargray"]];
    [self.twoView.levelLanel setText:@"初级编辑"];
    
    
    [self.threeView resetHonourWithFrame:CGRectMake(spaceWidth*3+80*2, 175, 80, 65)];
    [self.threeView.startImageView setImage:[UIImage imageNamed:@"stargray"]];
    [self.threeView.levelLanel setText:@"中级编辑"];
    
    
    [self.fourView resetHonourWithFrame:CGRectMake(spaceWidth*4+80*3, 175, 80, 65)];
    [self.fourView.startImageView setImage:[UIImage imageNamed:@"stargray"]];
    [self.fourView.levelLanel setText:@"高级编辑"];
    
    [self.horizontalLineView setFrame:CGRectMake(spaceWidth*1+80/2.0, 195, frame.size.width-(spaceWidth*2+80), 4.0)];
    [self.verticalLineView setFrame:CGRectMake(spaceWidth*1+80/2.0, 205, frame.size.width-(spaceWidth*2+80), 4.0)];
    
}


#pragma mark 头衔中经验视图
/**
 头衔中经验视图
 */
-(instancetype)initWithHonourExperienceFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
    }
    return self;
}


-(void)resetHonourExperienceFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    
    [self.titleLabel setFrame:CGRectMake(10, 0, frame.size.width-20, frame.size.height)];
    
}





#pragma mark 头衔中操作视图
/**
 头衔中操作视图
 */
-(instancetype)initWithHonourActionFrame
{
    self = [super init];
    if (self)
    {
        [self addSubview:self.titleLabel];
        [self.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        [self.titleLabel setNumberOfLines:0];
        
        [self addSubview:self.describeLabel];
        [self.describeLabel setTextColor:MainColor];
        [self.describeLabel setFont:[UIFont systemFontOfSize:13.0]];
        [self.describeLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self addSubview:self.nickNameLabel];
        [self.nickNameLabel setTextColor:MainColor];
        [self.nickNameLabel setFont:[UIFont systemFontOfSize:13.0]];
        [self.nickNameLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self addSubview:self.horizontalLineView];
    }
    return self;
}

-(void)resetHonourActionFrame:(CGRect)frame
{
    [self setFrame:frame];
    
    [self.titleLabel setFrame:CGRectMake(10,0, frame.size.width/2.0-10, frame.size.height)];
    [self.describeLabel setFrame:CGRectMake(frame.size.width/2.0, 0,frame.size.width/4.0, frame.size.height)];
    [self.nickNameLabel setFrame:CGRectMake(frame.size.width/2.0+frame.size.width/4.0, 0, frame.size.width/4.0, frame.size.height)];
    [self.horizontalLineView setFrame:CGRectMake(0, frame.size.height-4, frame.size.width, 4.0)];
}




















#pragma mark Getter / Setter
-(UIImageView *)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}



-(UILabel *)nickNameLabel
{
    if (_nickNameLabel == nil)
    {
        _nickNameLabel = [[UILabel alloc]init];
        [_nickNameLabel setFont:[UIFont systemFontOfSize:15.0]];
    }
    return _nickNameLabel;
}

-(UILabel*)concernLabel
{
    if (_concernLabel == nil)
    {
        _concernLabel = [[UILabel alloc]init];
        [_concernLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_concernLabel setTextAlignment:NSTextAlignmentCenter];
        [_concernLabel setNumberOfLines:0];
        [_concernLabel setText:@"关注"];
        [_concernLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _concernLabel;
}

-(UILabel*)concernNumberLabel
{
    if (_concernNumberLabel == nil)
    {
        _concernNumberLabel = [[UILabel alloc]init];
        [_concernNumberLabel setTextAlignment:NSTextAlignmentCenter];
        [_concernNumberLabel setNumberOfLines:0];
        [_concernNumberLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_concernNumberLabel setTextColor:MainColor];
        [_concernNumberLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _concernNumberLabel;
}


-(UILabel *)levelLabel
{
    if (_levelLabel == nil)
    {
        _levelLabel = [[UILabel alloc]init];
        [_levelLabel setTextAlignment:NSTextAlignmentCenter];
        [_levelLabel setNumberOfLines:0];
        [_levelLabel setTextColor:MainColor];
        [_levelLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _levelLabel;
}

-(UILabel *)fansLabel
{
    if (_fansLabel == nil)
    {
        _fansLabel = [[UILabel alloc]init];
        [_fansLabel setTextAlignment:NSTextAlignmentCenter];
        [_fansLabel setNumberOfLines:0];
        [_fansLabel setText:@"粉丝"];
        [_fansLabel setTextColor:RGB(114.0, 110.0, 110.0)];
        [_fansLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _fansLabel;
}

-(UILabel *)fansNumberLabel
{
    if (_fansNumberLabel == nil)
    {
        _fansNumberLabel = [[UILabel alloc]init];
        [_fansNumberLabel setTextAlignment:NSTextAlignmentCenter];
        [_fansNumberLabel setNumberOfLines:0];
        [_fansNumberLabel setTextColor:MainColor];
        [_fansNumberLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return _fansNumberLabel;
}




-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}


-(UILabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[UILabel alloc]init];
        [_describeLabel setTextAlignment:NSTextAlignmentRight];
    }
    return _describeLabel;
}


-(UIView *)horizontalLineView
{
    if (_horizontalLineView == nil)
    {
        _horizontalLineView = [[UIView alloc]init];
        [_horizontalLineView setBackgroundColor:LineViewColor];
    }
    return _horizontalLineView;
}
-(UIView *)verticalLineView
{
    if (_verticalLineView == nil)
    {
        _verticalLineView = [[UIView alloc]init];
        [_verticalLineView setBackgroundColor:LineViewColor];
    }
    return _verticalLineView;
}



-(ZMView *)oneView
{
    if (_oneView == nil)
    {
        _oneView = [[ZMView alloc]initHonourWithFrame];
    }
    return _oneView;
}


-(ZMView *)twoView
{
    if (_twoView == nil)
    {
        _twoView = [[ZMView alloc]initHonourWithFrame];
    }
    return _twoView;
}


-(ZMView *)threeView
{
    if (_threeView == nil)
    {
        _threeView = [[ZMView alloc]initHonourWithFrame];
    }
    return _threeView;
}


-(ZMView *)fourView
{
    if (_fourView == nil)
    {
        _fourView = [[ZMView alloc]initHonourWithFrame];
    }
    return _fourView;
}




@end
