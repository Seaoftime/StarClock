//
//  GameView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


#define spaceWidth (kScreen_Width - 280)/2.0


#import "GameView.h"

#import "Shengjihoutanchuyemianview.h"

@implementation GameView





#pragma mark 添加下面板图控件
-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<GameViewDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
        
              
        
        ////////////////////////////
        
        
        //添加下面板图
        UIImageView *Belowimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"下面底板"]];
        Belowimage.frame=CGRectMake(0, -10, kScreen_Width, 130);
        
        [self addSubview:Belowimage];
        
        
        //[self setBackgroundColor:RGBAlpha(255.0, 255.0, 255.0, 0.4)];
        [self setGameDeletage:deletage];
        //[self addSubview:self.loveView];
        [self addSubview:self.foodView];
        [self addSubview:self.flowerView];
        [self addSubview:self.rinseView];
        
        
        //等级加载
        //[self addSubview:self.love_level];
       // [self.love_level setFrame:CGRectMake(kScreen_Width/2-kScreen_Width/2+10, 5,kScreen_Width/2 , 20)];
        
        //亲密度加载
       // [self addSubview:self.love_val];
    //[self.love_val setFrame:CGRectMake(kScreen_Width/2-kScreen_Width/2+10, 10, kScreen_Width/2, 20)];
      //  [self.love_val setFrame:CGRectMake(0, 6, kScreen_Width/2, 20)];
        
    }
    return self;
}


#pragma mark - 重新设置数据模型
-(void)resetDataArray:(NSMutableArray*)dataArray //!<重新设置model数据模型
{
    if ([dataArray count])
    {
        /**
         设置食物
         */
        GameItemTypeModel *foodModel = [dataArray objectAtIndex:0];
        CGFloat ration = foodModel.percent/100.0;
        CGFloat hight = 80*ration;
        [_foodView.itemFunctionView setFrame:CGRectMake(0,80-hight,80,hight)];
        [_foodView.rationLabel setText:[NSString stringWithFormat:@"%d%@",(int)foodModel.percent,@"%"]];
        
        if (hight<=30)
        {
            [_foodView.itemFunctionView setBackgroundColor:[UIColor redColor]];
        }
        else
        {
            [_foodView.itemFunctionView setBackgroundColor:RGB(115.0, 186.0, 93.0)];
        }
        
        
        /**
         设置清洁度
         */
        GameItemTypeModel *rinseModel = [dataArray objectAtIndex:1];
               ration = rinseModel.percent/100.0;
        hight = 80*ration;
        [_rinseView.itemFunctionView setFrame:CGRectMake(0,80-hight,80,hight)];
        
        [_rinseView.rationLabel setText:[NSString stringWithFormat:@"%d%@",(int)rinseModel.percent,@"%"]];
        
        if (hight<=30)
        {
            [_rinseView.itemFunctionView setBackgroundColor:[UIColor redColor]];
        }
        else
        {
            [_rinseView.itemFunctionView setBackgroundColor:RGB(26.0, 129.0, 234.0)];
        }
        
        /**
         设置鲜花
         */
        GameItemTypeModel *flowerModel = [dataArray objectAtIndex:2];
        ration = flowerModel.percent/100.0;
        hight = 80*ration;
        [_flowerView.itemFunctionView setFrame:CGRectMake(0,80-hight,80,hight)];
        [_flowerView setBackgroundColor:RGB(252.0, 146.0, 82.0)];
        
        
        /**
         设置恋爱值
         */
        GameItemTypeModel *loveModel = [dataArray objectAtIndex:3];
        ration = loveModel.percent/100.0;
        hight = (kScreen_Width-spaceWidth*2)*ration;
       
        
        
        /**
         设置恋爱值（进度条）
         */
        
        UIImageView *progressimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"进度条框"]];
        progressimage.frame=CGRectMake(0, 0, kScreen_Width, 0);
        
        

        
        [_loveView.itemFunctionView setFrame:CGRectMake(0,0,hight,20)];
        
        
       // [_loveView addSubview:progressimage];
        
        [_loveView.rationLabel setText:[NSString stringWithFormat:@"%d%@",(int)loveModel.percent,@"%"]];
        
        
        if (hight<=30)
        {
           // [_loveView.itemFunctionView setBackgroundColor:[UIColor redColor]];
             [_loveView.itemFunctionView setBackgroundColor:[UIColor redColor]];
        }
        else
        {
            [_loveView.itemFunctionView setBackgroundColor:RGB(233.0, 85.0, 134.0)];
            
            
        }
        
        
        /**
         设置等级
         */
       // GameItemTypeModel *love_levelModel = [dataArray objectAtIndex:3];
       // [_love_level setText:[NSString stringWithFormat:@"%@%@",@"Lv",love_levelModel.love_level]];
    
        
        
        
        //if ([_loveView.rationLabel.text isEqualToString:[NSString stringWithFormat:@"%@%@",@"Lv",love_levelModel.love_level]])
        if ([_loveView.rationLabel.text isEqual:@""] )
        {
            
           
           
        }

       
        /**
         设置亲密度
         */
        GameItemTypeModel *love_valModel = [dataArray objectAtIndex:3];
        [_love_val setText:[NSString stringWithFormat:@"%@%@",@"亲密度:",love_valModel.love_val]];
        
    }
    
}











#pragma mark - Getter / Setter
#pragma mark 恋爱值
-(GameItemView*)loveView
{
    if (_loveView == nil)
    {
        //能适配但是不符合要求
        //_loveView = [[GameItemView alloc]initWithFunctionFrame:CGRectMake(spaceWidth+80*0+20*0, 10, kScreen_Width-spaceWidth*2, 20)];
        //不能适配
       // _loveView = [[GameItemView alloc]initWithFunctionFrame:CGRectMake(spaceWidth*2+11, 6, kScreen_Width-spaceWidth*2-20, 20)];
        _loveView = [[GameItemView alloc]initWithFunctionFrame:CGRectMake(85, 6, kScreen_Width/1.5+20, 20)];
        [_loveView.layer setBorderWidth:2.0];
        [_loveView.layer setCornerRadius:10];
        [_loveView.layer setMasksToBounds:YES];
        [_loveView.itemFunctionView setBackgroundColor:RGB(115.0, 186.0, 93.0)];        [_loveView.itemFunctionView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [_loveView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [_loveView.itemFunctionView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [_loveView.itemFunctionView setTag:1];
        [_loveView setTag:1];
        [_loveView.rationLabel setFrame:CGRectMake(0, 0,kScreen_Width-spaceWidth*2 , 20)];
        [_loveView.rationLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
        
        
    }
    return _loveView;
}

#pragma mark 喂食
-(GameItemView*)foodView
{
    if (_foodView == nil)
    {
        
        UIImageView *foodimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"游戏喂食"]];
        foodimage.frame=CGRectMake(7.5, 8, 60, 40);
        
        _foodView = [[GameItemView alloc]initWithFunctionFrame:CGRectMake(spaceWidth+80*0+20*0, 45, 75, 75)];
        _foodView.tag=1;
        [_foodView addSubview:foodimage];
        //_foodView = [[GameItemView alloc]initWithFunctionFrame:CGRectMake(spaceWidth+80*0+20*0-30, 45, 75, 75)];
        [_foodView.itemFunctionView setBackgroundColor:RGB(115.0, 186.0, 93.0)];
        [_foodView.itemFunctionView setFrame:CGRectMake(0,80-45,80,45)];
       // [_foodView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        //[_foodView.itemFunctionView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [_foodView.itemFunctionView setTag:1];
        [_foodView setTag:1];
        [_foodView.rationLabel setText:@"喂食"];
    }
    return _foodView;
}


#pragma mark 送花
-(GameItemView*)flowerView
{
    if (_flowerView == nil)
    {
        UIImageView *floweimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"游戏送花"]];
        floweimage.frame=CGRectMake(7.5, 8, 60, 40);
        
       _flowerView  = [[GameItemView alloc]initWithFunctionFrame:CGRectMake(spaceWidth+80*1+20*1, 45, 75, 75)];
        [_flowerView addSubview:floweimage];
        
        _flowerView.tag=2;
        [_flowerView.itemFunctionView setBackgroundColor:[UIColor orangeColor]];
        [_flowerView.itemFunctionView setFrame:CGRectMake(0,80-55,80,55)];
        //[_flowerView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
       // [_flowerView.itemFunctionView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [_flowerView.itemFunctionView setTag:2];
        [_flowerView setTag:2];
        [_flowerView.rationLabel setText:@""];
    }
    return _flowerView;
}


#pragma mark 清洁
-(GameItemView*)rinseView
{
    if (_rinseView == nil)
    {
        UIImageView *rinseimage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"游戏清洁"]];
        rinseimage.frame=CGRectMake(7.5, 8, 60, 40);
        
         _rinseView = [[GameItemView alloc]initWithFunctionFrame:CGRectMake(spaceWidth+80*2+20*2, 45, 75, 75)];
        _rinseView.tag=3;
        [_rinseView addSubview:rinseimage];
        //_rinseView = [[GameItemView alloc]initWithFunctionFrame:CGRectMake(spaceWidth+80*2+20*2+30, 45, 75, 75)];
        [_rinseView.itemFunctionView setBackgroundColor:[UIColor purpleColor]];
        [_rinseView.itemFunctionView setFrame:CGRectMake(0,80-45,80,45)];
       // [_rinseView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
       // [_rinseView.itemFunctionView addTarget:self action:@selector(gameItemViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [_rinseView.itemFunctionView setTag:3];
        [_rinseView setTag:3];
        
        
        [_rinseView.rationLabel setText:@"清洁"];
        
        
    }
    return _rinseView;
}


#pragma mark Private Method
-(void)gameItemViewAction:(GameItemView*)sender
{
    if ([self.gameDeletage respondsToSelector:@selector(gameItemViewAction:)])
    {
        [self.gameDeletage gameItemViewAction:sender];
    }
}


#pragma mark 等级Label

-(UILabel *)love_level
{
    if (_love_level == nil)
    {
        _love_level = [[UILabel alloc]init];
        [_love_level setFont:[UIFont boldSystemFontOfSize:20.0]];
        [_love_level setTextAlignment:NSTextAlignmentLeft];
        [_love_level setTextColor:RGB(255, 102, 145)];
    }
    return _love_level;
}

#pragma mark 亲密度label

-(UILabel *)love_val
{
    if (_love_val == nil)
    {
        _love_val = [[UILabel alloc]init];
        [_love_val setFont:[UIFont boldSystemFontOfSize:15.0]];
        [_love_val setTextAlignment:NSTextAlignmentLeft];
        [_love_val setTextColor:RGB(255, 102, 145)];
        
    }
    return _love_val;
}








@end
