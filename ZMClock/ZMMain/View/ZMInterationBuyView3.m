//
//  ZMInterationBuyView3.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/23.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMInterationBuyView3.h"

@implementation ZMInterationBuyView3




- (instancetype)initWithInteractionFrame3:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.bgV];
        [self.bgV addSubview:self.titleLb];
        //[self.bgV addSubview:self.closeBtn];
        [self.bgV addSubview:self.mineLb];
        [self.bgV addSubview:self.goldLb];
        
        [self.bgV addSubview:self.goldImgV];
        
        //[self.bgV addSubview:self.flowerImgV];
        //[self.bgV addSubview:self.needGoldLb];
        //[self.bgV addSubview:self.subBtn];
        //[self.bgV addSubview:self.addBtn];
        
        //[self.bgV addSubview:self.heLb];
        //[self.bgV addSubview:self.allGoldLb];
        //[self.bgV addSubview:self.goldImgVV];
        
        //[self.bgV addSubview:self.sorryNoBuyLb];
        
        [self.bgV addSubview:self.buyyBtn];
        
        self.sorryNoBuyLb.hidden = YES;
        
    }
    
    
    
    return self;
}



- (UIView *)bgV
{
    if (_bgV == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            
            _bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 24 - 24, 300 - 20)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 24 - 24, 300 )];
            
        } else {
            
            _bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 24 - 24, 300 )];
        }
        
        _bgV.userInteractionEnabled = YES;
        
        _bgV.backgroundColor = [UIColor whiteColor];
        
        
    }
    
    return _bgV;
}





- (UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bgV.frame.size.width , 50)];
        _titleLb.userInteractionEnabled = YES;
        
        _titleLb.backgroundColor = RGB(111, 221, 253);
        _titleLb.font = [UIFont systemFontOfSize:20];
        _titleLb.text = @"奖 励";
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _titleLb;
}





- (UILabel *)mineLb
{
    if (_mineLb == nil) {
        _mineLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.bgV.frame.size.width, 60)];
        _mineLb.backgroundColor = RGB(238, 238, 238);
        _mineLb.font = [UIFont systemFontOfSize:16];
        _mineLb.text = @"今天互动超过3次,以下奖励归您啦!";
        _mineLb.textColor = [UIColor blackColor];
        _mineLb.textAlignment = NSTextAlignmentCenter;
    }
    
    return _mineLb;
}


- (UILabel *)goldLb
{
    if (_goldLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            
            
            _goldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2, 50 + 60 + 20, self.bgV.frame.size.width/2, 60)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _goldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2, 50 + 60 + 30, self.bgV.frame.size.width/2, 60)];
            
        } else {
            _goldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2, 50 + 60 + 20, self.bgV.frame.size.width/2, 60)];
            
        }

        
        _goldLb.backgroundColor = [UIColor whiteColor];
        _goldLb.font = [UIFont systemFontOfSize:16];
        _goldLb.text = @"+90000";
        _goldLb.textColor = [UIColor blackColor];
        _goldLb.textAlignment = NSTextAlignmentLeft;
    }
    
    return _goldLb;
    
}


- (UIImageView *)goldImgV
{
    if (_goldImgV == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            
            _goldImgV = [[UIImageView alloc] initWithFrame:CGRectMake( self.bgV.frame.size.width/2 - 30 - 30, 50 + 60 + 15 + 20, 30, 30)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _goldImgV = [[UIImageView alloc] initWithFrame:CGRectMake( self.bgV.frame.size.width/2 - 30 - 30, 50 + 60 + 15 + 30, 30, 30)];
            
        } else {
            
            _goldImgV = [[UIImageView alloc] initWithFrame:CGRectMake( self.bgV.frame.size.width/2 - 30 - 30, 50 + 60 + 35, 30, 30)];
        }
        
        
        _goldImgV.backgroundColor = [UIColor whiteColor];
        _goldImgV.image = IMAGE(@"金币-图标");
        
        
    }
    
    return _goldImgV;
}




- (UIImageView *)flowerImgV
{
    if (_flowerImgV == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            
            
            _flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(50 + 30, 110 + 60, self.bgV.frame.size.width - 100 - 60, 100)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(50 + 30, 110 + 60, self.bgV.frame.size.width - 100 - 60, 100)];
            
        } else {
            
            _flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(50 + 30, 110 + 60, self.bgV.frame.size.width - 100 - 60, 100)];
        }
        
        
        _flowerImgV.backgroundColor = [UIColor whiteColor];
        _flowerImgV.image = IMAGE(@"电影院门票");
        
        
    }
    
    return _flowerImgV;
    
}










- (UILabel *)allGoldLb
{
    if (_allGoldLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            
            _allGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 310 + 40, 50, 40)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _allGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 310 + 40, 50, 40)];
            
        } else {
            _allGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 310 + 40 + 10, 50, 40)];
            
        }
        
        _allGoldLb.backgroundColor = [UIColor clearColor];
        _allGoldLb.font = [UIFont systemFontOfSize:16];
        _allGoldLb.text = @"90";
        _allGoldLb.textColor = [UIColor redColor];
        _allGoldLb.textAlignment = NSTextAlignmentCenter;
    }
    
    return _allGoldLb;
}


- (UIImageView *)goldImgVV
{
    
    if (_goldImgVV == nil) {
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            
            _goldImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 310 + 40 + 5, 30, 30)];
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _goldImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 310 + 40 + 5, 30, 30)];
            
        } else {
            _goldImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 310 + 40 + 5 + 10, 30, 30)];
            
        }

        
        _goldImgVV.backgroundColor = [UIColor clearColor];
        _goldImgVV.image = IMAGE(@"金币-图标");
        
        
    }
    
    return _goldImgVV;
}


- (UIButton *)buyyBtn
{
    if (_buyyBtn == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            
            
            _buyyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 60, 330 - 120, 120, 40)];
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _buyyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 60, 330 - 110, 120, 40)];
            
        } else {
            
            _buyyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 60, 330 - 110, 120, 40)];
        }

        
        
        _buyyBtn.backgroundColor = RGB(228, 84, 129);
        _buyyBtn.layer.cornerRadius = 10;
        _buyyBtn.layer.masksToBounds = YES;
        
        [_buyyBtn setTitle:@"确 定" forState:UIControlStateNormal];
        [_buyyBtn addTarget:self action:@selector(buyyBtntnClicked) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _buyyBtn;
}




- (void)buyyCloceBtnClicked:(UIButton *)closeBtn
{
    
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"interactionCloseButtonClicked" object:nil];
    
    
}



- (void)subBtnClicked:(UIButton *)subBtn
{
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"interactionSubBtn" object:nil];
    
    
}

- (void)addBtnClicked:(UIButton *)addBtn
{
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"interactionAddBtnadd" object:nil];
    
}


- (void)buyyBtntnClicked
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"okBtnClickedd" object:nil];
    
    
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
