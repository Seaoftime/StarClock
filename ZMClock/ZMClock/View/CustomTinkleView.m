//
//  CustomTinkleView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "CustomTinkleView.h"
#import "MsgPlaySound.h"
#import "TinkleTableViewCell.h"

@interface CustomTinkleView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *tinkleArray;


@end

@implementation CustomTinkleView

-(instancetype)initWithFrame:(CGRect)frame withCellSeparatorStyle:(UITableViewCellSeparatorStyle)stype withArray:(NSMutableArray*)array withDeletage:(id)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setTinkleArray:array];
        [self addSubview:self.customTinkleTableView];
        [self.customTinkleTableView setBackgroundColor:[UIColor grayColor]];
        [self.customTinkleTableView setSeparatorStyle:stype];
    }
    return self;
}


#pragma mark  Getter/Setter Method
-(ZMTableView*)customTinkleTableView
{
    if (_customTinkleTableView == nil)
    {
        _customTinkleTableView = [[ZMTableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width,kScreen_Height-94) style:UITableViewStylePlain];
        [_customTinkleTableView setDataSource:self];
        [_customTinkleTableView setDelegate:self];
    }
    return _customTinkleTableView;
}




#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tinkleArray count];
}

- (TinkleTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TinkleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[TinkleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    switch (indexPath.row%2)
    {
        case 0:
        {
            [cell.TinkleBackGroundView setBackgroundColor:RGB(241.0, 252.0, 255.0)];
        }
            break;
        default:
        {
            [cell.TinkleBackGroundView setBackgroundColor:RGB(255.0, 225.0, 255.0)];
        }
            break;
    }
    [cell setModel:self.tinkleArray[indexPath.row]];
    return cell;
}

#pragma mark  UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.tinkleArray enumerateObjectsUsingBlock:^(TinkleModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         if (indexPath.row == idx)
         {
             [obj setSelectType:select_type];
         }
         else
         {
             [obj setSelectType:no_select_type];
         }
     }];
    [self.customTinkleTableView reloadData];
    
    
//    [[[MsgPlaySound alloc]initSystemShake] play];
    
}


@end
