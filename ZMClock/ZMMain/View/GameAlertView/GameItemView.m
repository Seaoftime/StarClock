//
//  GameItemView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "GameItemView.h"

@implementation GameItemView


-(instancetype)initWithFunctionFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
            
        //添加功能视图
        [self addSubview:self.itemFunctionView];
        [self.itemFunctionView setBackgroundColor:[UIColor redColor]];
        [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [self.layer setBorderWidth:6.0];
        [self.layer setCornerRadius:5];
        [self.layer setMasksToBounds:YES];
        //[self setBackgroundColor:RGB(217.0, 219.0, 224.0)];
        
        
        //添加显示标签
       // [self addSubview:self.rationLabel];
        
        [self.rationLabel setFrame:CGRectMake(0, frame.size.height/2.0, frame.size.width, frame.size.height/2.0)];
        
        
        
        
       
        

        
                     
        
        
    }
    return self;
}




#pragma mark Getter / Setter
#pragma  mark 进度条
-(GameItemFunctionView*)itemFunctionView
{
    if (_itemFunctionView == nil)
    {
        _itemFunctionView = [[GameItemFunctionView alloc]init];
        ///_itemFunctionView.backgroundColor=[UIColor purpleColor];
    }
    return _itemFunctionView;
}

#define  mark 亲密度数值 Label
-(UILabel *)rationLabel
{
    if (_rationLabel == nil)
    {
        _rationLabel = [[UILabel alloc]init];
        [_rationLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
        [_rationLabel setTextAlignment:NSTextAlignmentCenter];
        [_rationLabel setTextColor:[UIColor whiteColor]];
    }
    return _rationLabel;
}





@end
