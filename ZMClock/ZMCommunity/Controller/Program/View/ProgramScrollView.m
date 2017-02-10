//
//  ProgramScrollView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/3.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ProgramScrollView.h"
#import "ZMButton.h"

#define ProgramButtonWidth kScreen_Width/4.0
#define ProgramButtonHight 40

@interface ProgramScrollView ()


@end

@implementation ProgramScrollView


-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id<ProgramScrollViewDeletage>)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setProgramDeletage:deletage];
        [self setShowsVerticalScrollIndicator:NO];
        [self setShowsHorizontalScrollIndicator:NO];
    }
    return self;
}


#pragma mark - 填充数据
/**
 填充数据
 */
-(void)setprogramArray:(NSArray *)programArray
{
    /**
     先获取数组个数
     */
    NSInteger number = [programArray count];
    
    if (number)
    {
        for (int i = 0; i < number; i++)
        {
            NSDictionary *item = [programArray objectAtIndex:i];
            NSString *title = [item objectForKey:@"key"];
            NSArray *itemArray = [item objectForKey:@"value"];
            
            ZMButton *button = [[ZMButton alloc]initWithFrame:CGRectMake(i*ProgramButtonWidth, 0, ProgramButtonWidth, ProgramButtonHight)];
            [button.layer setBorderWidth:1.0];
            [button.layer setBorderColor:[LineViewColor CGColor]];
            [button.layer setMasksToBounds:YES];
            [button setTitle:title forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setProgramArray:itemArray];
            [button setTag:i];
            [button addTarget:self action:@selector(programButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        
        [self setContentSize:CGSizeMake(ProgramButtonWidth*number, ProgramButtonHight)];
    }
}



-(void)programButtonAction:(ZMButton*)sender
{
    if ([self.programDeletage respondsToSelector:@selector(programScrollViewButtonAction:)])
    {
        [self.programDeletage programScrollViewButtonAction:sender];
    }
}

@end
