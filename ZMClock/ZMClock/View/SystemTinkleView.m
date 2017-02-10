//
//  SystemTinkleView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/3/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SystemTinkleView.h"
#import "MsgPlaySound.h"
#import "TinkleTableViewCell.h"

@interface SystemTinkleView () <UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) NSMutableArray *tinkleArray;


@end

@implementation SystemTinkleView

-(instancetype)initWithFrame:(CGRect)frame withCellSeparatorStyle:(UITableViewCellSeparatorStyle)stype withArray:(NSMutableArray*)array withDeletage:(id)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setTinkleArray:array];
        [self addSubview:self.systemTinkleTableView];
        [self.systemTinkleTableView setBackgroundColor:[UIColor redColor]];
        [self.systemTinkleTableView setSeparatorStyle:stype];
    }
    return self;
}




#pragma mark  Getter/Setter Method
-(ZMTableView*)systemTinkleTableView
{
    if (_systemTinkleTableView == nil)
    {
        _systemTinkleTableView = [[ZMTableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width,kScreen_Height-94) style:UITableViewStylePlain];
        [_systemTinkleTableView setDataSource:self];
        [_systemTinkleTableView setDelegate:self];
    }
    return _systemTinkleTableView;
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
    
    for (int i = 0; i< [self.tinkleArray count]; i++)
    {
        TinkleModel *model = self.tinkleArray[i];
        if (indexPath.row == i)
        {
            [model setSelectType:select_type];
        }
        else
        {
            [model setSelectType:no_select_type];
        }
    }


    
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
    
    
    
    
    [self.systemTinkleTableView reloadData];
    
//    int a  = 1000+(int)indexPath.row;
//    [[[MsgPlaySound alloc]initSystemShake] playWithID:a];
}


@end
