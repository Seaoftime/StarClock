//
//  ZMInteractionBuyView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMInteractionBuyView.h"

@implementation ZMInteractionBuyView



- (instancetype)initWithInteractionFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        
        [self addSubview:self.bgV];
        [self.bgV addSubview:self.titleLb];
        [self.bgV addSubview:self.closeBtn];
        [self.bgV addSubview:self.mineLb];
        [self.bgV addSubview:self.goldLb];
        
        [self.goldLb addSubview:self.goldImgV];

        [self.bgV addSubview:self.flowerImgV];
        [self.bgV addSubview:self.needGoldLb];
        [self.bgV addSubview:self.subBtn];
        [self.bgV addSubview:self.addBtn];
        
        [self.bgV addSubview:self.heLb];
        [self.bgV addSubview:self.allGoldLb];
        [self.bgV addSubview:self.goldImgVV];
        
        [self.bgV addSubview:self.sorryNoBuyLb];
        
        
        [self.bgV addSubview:self.sorryNoBuyLianjieLb];
        
        
        [self.bgV addSubview:self.buyyBtn];
        
        self.sorryNoBuyLb.hidden = YES;
        
    }


    
    return self;
}



- (UIView *)bgV
{
    if (_bgV == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _bgV = [[UIView alloc] initWithFrame:CGRectMake(10, 0, kScreen_Width - 24 - 24 - 20, kScreen_Height - 240 + 40 )];
            
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 24 - 24, kScreen_Height - 240 )];
            
        } else {
            
            _bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 24 - 24, kScreen_Height - 240)];
            
            
        }
        
        _bgV.backgroundColor = [UIColor whiteColor];
        _bgV.userInteractionEnabled = YES;
        
        
    }
    
    return _bgV;
}





- (UILabel *)titleLb
{
    if (_titleLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bgV.frame.size.width , 50)];
            
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bgV.frame.size.width , 40)];
            _titleLb.font = [UIFont systemFontOfSize:18];
            
        } else {
            
            _titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bgV.frame.size.width , 50)];
            _titleLb.font = [UIFont systemFontOfSize:20];
        }
        
        _titleLb.userInteractionEnabled = YES;
        
        _titleLb.backgroundColor = RGB(111, 221, 253);
        
        _titleLb.text = @"红玫瑰购买";
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _titleLb;
}



- (UIButton *)closeBtn
{
    if (_closeBtn == nil) {
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width - 30  - 3 + 8, -5, 30, 30)];
            _closeBtn.layer.cornerRadius = 15;
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width - 30  - 3 + 8, -5, 30, 30)];
            _closeBtn.layer.cornerRadius = 15;
            
        } else {
            
            _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width - 30  - 3, -5, 40, 40)];
            _closeBtn.layer.cornerRadius = 20;
        }
        
        
        _closeBtn.layer.masksToBounds = YES;
        [_closeBtn setBackgroundImage:IMAGE(@"关闭-按键qian") forState: UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(buyyCloceBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _closeBtn;
}



- (UILabel *)mineLb
{
    if (_mineLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _mineLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.bgV.frame.size.width/2, 40)];
            
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _mineLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, self.bgV.frame.size.width/2, 40)];
            
        } else {
            
            _mineLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.bgV.frame.size.width/2, 60)];
        }
        
        _mineLb.backgroundColor = RGB(238, 238, 238);
        _mineLb.font = [UIFont systemFontOfSize:16];
        _mineLb.text = @"我的金币";
        _mineLb.textColor = [UIColor blackColor];
        _mineLb.textAlignment = NSTextAlignmentCenter;
    }
    
    return _mineLb;
}


- (UILabel *)goldLb
{
    if (_goldLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _goldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2, 50, self.bgV.frame.size.width/2, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _goldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2, 40, self.bgV.frame.size.width/2, 40)];
            
        } else {
            
            _goldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2, 50, self.bgV.frame.size.width/2, 60)];
        }
        
        _goldLb.backgroundColor = RGB(238, 238, 238);
        _goldLb.font = [UIFont systemFontOfSize:16];
        _goldLb.text = @"90000";
        _goldLb.textColor = [UIColor blackColor];
        _goldLb.textAlignment = NSTextAlignmentLeft;
    }
    
    return _goldLb;
    
}


- (UIImageView *)goldImgV
{
    if (_goldImgV == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _goldImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/4 - 20, 5, 30, 30)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _goldImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/4 - 20, 5, 30, 30)];
            
        } else {
            _goldImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/4 - 20, 15, 30, 30)];
        }
        
        _goldImgV.backgroundColor = [UIColor clearColor];
        _goldImgV.image = IMAGE(@"金币-图标");
        
        
    }
    
    return _goldImgV;
}




- (UIImageView *)flowerImgV
{
    if (_flowerImgV == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            
            _flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 110 - 10, self.bgV.frame.size.width - 100, 100)];
            
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(80, 90, self.bgV.frame.size.width - 100 - 60, 150)];
            
        } else {
            
            _flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 110, self.bgV.frame.size.width - 100, 200)];
        }
        _flowerImgV.backgroundColor = [UIColor whiteColor];
        //_flowerImgV.image = IMAGE(@"金币-图标");
        
        
        
    }
    
    return _flowerImgV;
    
}


- (UIButton *)subBtn
{
    
    if (_subBtn == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _subBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25 - 40 - 10, 310 - 100 - 10, 40, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _subBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25 - 40 - 10, 250, 40, 40)];
            
        } else {
            _subBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25 - 40 - 10, 310 , 40, 40)];
        }
        
        
        //_subBtn.layer.cornerRadius = 20;
        //_subBtn.layer.masksToBounds = YES;
        [_subBtn setBackgroundImage:IMAGE(@"-jian2") forState: UIControlStateNormal];
        [_subBtn addTarget:self action:@selector(subBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _subBtn;
}


- (UIButton *)addBtn
{
    
    if (_addBtn == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _addBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 310 - 100 - 10, 40, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _addBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 250, 40, 40)];
            
        } else {
            _addBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 310, 40, 40)];
        }
        
        
        //_subBtn.layer.cornerRadius = 20;
        //_subBtn.layer.masksToBounds = YES;
        [_addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
        
        [_addBtn addTarget:self action:@selector(addBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _addBtn;
}



- (UILabel *)needGoldLb
{
    
    if (_needGoldLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _needGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 310 - 100 - 10, 50, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _needGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 250, 50, 40)];
            
        } else {
            _needGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 310, 50, 40)];
        }
        
        _needGoldLb.backgroundColor = [UIColor clearColor];
        _needGoldLb.font = [UIFont systemFontOfSize:15];
        _needGoldLb.text = @"1";
        _needGoldLb.textColor = [UIColor blackColor];
        _needGoldLb.textAlignment = NSTextAlignmentCenter;
    }
    
    return _needGoldLb;
    
    
}





- (UILabel *)heLb
{
    if (_heLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _heLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25 - 40 - 10, 310 + 40 - 100 - 10, 50, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _heLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25 - 40 - 10, 300, 50, 40)];
            
        } else {
            _heLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25 - 40 - 10, 310 + 40, 50, 40)];
        }
        
        _heLb.backgroundColor = [UIColor clearColor];
        _heLb.font = [UIFont systemFontOfSize:16];
        _heLb.text = @"合计: ";
        _heLb.textColor = [UIColor blackColor];
        _heLb.textAlignment = NSTextAlignmentCenter;
    }
    
    return _heLb;
    
}

- (UILabel *)allGoldLb
{
    if (_allGoldLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _allGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 310 + 40 - 100 - 10, 50, 40)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _allGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 300, 50, 40)];
            
        } else {
            _allGoldLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 25, 310 + 40, 50, 40)];
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
            _goldImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 310 + 40 + 5 - 100 - 10, 30, 30)];
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _goldImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 300 + 5, 30, 30)];
            
        } else {
            _goldImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 + 25 + 10, 310 + 40 + 5, 30, 30)];
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
            _buyyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 60, 310, 120, 40)];
            
        } else if ([ZMSystemTool iPhone6Device]) {
            
            _buyyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 60, 370, 110, 40)];
            
        } else {
            _buyyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width/2 - 60, 360 + 40 + 20 + 10, 120, 50)];
            
        }
        
        _buyyBtn.backgroundColor = RGB(228, 84, 129);
        _buyyBtn.layer.cornerRadius = 10;
        _buyyBtn.layer.masksToBounds = YES;
        
        [_buyyBtn setTitle:@"购  买" forState:UIControlStateNormal];
        [_buyyBtn addTarget:self action:@selector(buyyBtntnClickedft) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _buyyBtn;
}


- (UILabel *)sorryNoBuyLb
{
    
    if (_sorryNoBuyLb == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            _sorryNoBuyLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 360 + 20  - 100 - 10, self.bgV.frame.size.width, 40)];
            
            _sorryNoBuyLb.font = [UIFont systemFontOfSize:12];
            _sorryNoBuyLb.numberOfLines = 0;
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _sorryNoBuyLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 330, self.bgV.frame.size.width, 40)];
            _sorryNoBuyLb.font = [UIFont systemFontOfSize:12];
            
        } else {
            _sorryNoBuyLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 360 + 20 , self.bgV.frame.size.width, 40)];
            _sorryNoBuyLb.font = [UIFont systemFontOfSize:14];
        }
        
        _sorryNoBuyLb.backgroundColor = [UIColor clearColor];
        
        
        _sorryNoBuyLb.text = @"您的金币不够来支付,点击查看金币获取方法。";
        _sorryNoBuyLb.userInteractionEnabled = YES;
        _sorryNoBuyLb.textColor = [UIColor lightGrayColor];
        _sorryNoBuyLb.textAlignment = NSTextAlignmentCenter;
        
        
        
        
        
        NSRange range = [_sorryNoBuyLb.text rangeOfString:@"金币获取方法"];
        [self setTextColor:_sorryNoBuyLb FontNumber:[UIFont systemFontOfSize:14] AndRange:range AndColor:RGB(111, 221, 253)];
       
        
        
        
        
        
        
        
    }
    
    return _sorryNoBuyLb;
}




//设置不同字体颜色
- (void)setTextColor:(UILabel *)label FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    
    label.attributedText = str;
}


////////点击进入我的金币页面
- (UILabel *)sorryNoBuyLianjieLb
{
    if (_sorryNoBuyLianjieLb == nil) {
        
        
        
        if ([ZMSystemTool iPhone5Device]) {
            
            
            _sorryNoBuyLianjieLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width - 100, 270 , 100, 40)];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _sorryNoBuyLianjieLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width - 150, 330  , 180, 40)];
            
        } else {
            
            _sorryNoBuyLianjieLb = [[UILabel alloc] initWithFrame:CGRectMake(self.bgV.frame.size.width - 150, 360 + 20 , 180, 40)];
            
        }
        
        _sorryNoBuyLianjieLb.backgroundColor = [UIColor clearColor];
        
        _sorryNoBuyLianjieLb.userInteractionEnabled = YES;
        
        
        
        UITapGestureRecognizer *notap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sorryNoBuyLianjieLbTapped)];
        [_sorryNoBuyLianjieLb addGestureRecognizer:notap];
        

        

    }


    return _sorryNoBuyLianjieLb;
}



- (void)sorryNoBuyLianjieLbTapped
{

 
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sorryNoBuyLianjieLbTapped" object:nil];

}




- (void)buyyCloceBtnClicked:(UIButton *)closeBtn
{

//    if ([self.closeBtnDelegate respondsToSelector:@selector(closeButtonClicked)]) {
//        [self.closeBtnDelegate closeButtonClicked];
//    }
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"interactionCloseButtonClicked" object:nil];


}



- (void)subBtnClicked:(UIButton *)subBtn
{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"interactionSubBtn" object:nil];
    

}

- (void)addBtnClicked:(UIButton *)addBtn
{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"interactionAddBtnadd" object:nil];

}


- (void)buyyBtntnClickedft
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"buyyBtntnClickedtt" object:nil];


}









/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
