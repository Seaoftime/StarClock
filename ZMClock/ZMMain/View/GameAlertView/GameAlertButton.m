//
//  GameAlertButton.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "GameAlertButton.h"

@implementation GameAlertButton


#pragma mark 改变喂食,送花,清洁上的 Label 大小及位置
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        //[self.tipLabel setFrame:CGRectMake(0, 0, 20, 20)];
        [self.tipLabel setFrame:CGRectMake(-kScreen_Width/2.5, -30, 100, 20)];
        [self.tipLabel setTextColor:RGB(255, 102, 145)];
        //[self.tipLabel.layer setCornerRadius:11.0];
        //[self.tipLabel.layer setMasksToBounds:YES];
        [self addSubview:self.tipLabel];
        
        
       

        
        
        //物品价格
       // [self.jiagelabel setFrame:CGRectMake(0, 0, 100, 20)];
        //[self.jiagelabel setTextColor:[UIColor blackColor]];
       // [self addSubview:self.jiagelabel];
        
        
              
       
        
        
    }
    return self;
}


-(void)resetFrame:(CGRect)frame
{
    [self setFrame:frame];
}



#pragma mark 游戏物品数label
-(UILabel *)tipLabel
{
    if (_tipLabel == nil)
    {
        _tipLabel = [[UILabel alloc]init];
       // [_tipLabel setBackgroundColor:RGB(242, 242, 230)];
        [_tipLabel setTextAlignment:NSTextAlignmentCenter];
       
       // [_tipLabel setFont:[UIFont systemFontOfSize:15.0]];
        _tipLabel.text=@"点击使用";
        //[_tipLabel setBackgroundColor:[UIColor redColor]];
    }
    return _tipLabel;
    
}




#pragma mark 游戏物品数量 暂时没用到 注销了
-(void)setModel:(GameItemsModel *)model
{
    _model = model;
   
    
    [self.tipLabel setText:model.count];
    self.tipLabel.text=[NSString stringWithFormat:@"%@%@",@"数量 :",model.count];
    
        
       
}



/*

#pragma mark 游戏物品价格label
-(UILabel *)jiagelabel
{
    if (_jiagelabel == nil)
    {
        _jiagelabel = [[UILabel alloc]init];
        [_jiagelabel setTextAlignment:NSTextAlignmentCenter];
        [_jiagelabel setFont:[UIFont systemFontOfSize:20.0]];
        _jiagelabel.text=@"10";
        _jiagelabel.textColor=[UIColor blackColor];
        //[_tipLabel setBackgroundColor:[UIColor redColor]];
    }
    return _jiagelabel;
    
}

*/







@end
