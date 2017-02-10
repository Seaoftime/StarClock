//
//  ZMTableView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMTableView.h"



@interface ZMTableView ()

@property (nonatomic,strong) TableTipView *tipView;

@end

@implementation ZMTableView


-(instancetype)initWithFrame:(CGRect)frame withCellSeparatorStyle:(UITableViewCellSeparatorStyle)stype withImageName:(NSString*)imageName withTiptitle:(NSString*)tipTitle setDeletage:(id<ZMTableViewDeletage>)deletage
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self)
    {
        [self setTipDeletage:deletage];
        [self setSeparatorStyle:stype];
        
        
        self.tipView = [[TableTipView alloc]initWithTaskStudyTableViewEmptyFrame:CGRectMake(frame.size.width/2-100/2, 50, 100, 100) withImageName:imageName withTiptitle:tipTitle];
        
        [self.tipView addTarget:self action:@selector(tipAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.tipView];
        
        
    }
    return self;
}


-(void)tableTipViewWithArray:(NSArray*)taskArray
{
    [taskArray count] > 0 ? [self.tipView setHidden:YES] :[self.tipView setHidden:NO];
}


-(void)tipAction:(TableTipView*)sender
{
    if ([self.tipDeletage respondsToSelector:@selector(tipAction:)])
    {
        [self.tipDeletage tipAction:sender];
    }
}

@end
