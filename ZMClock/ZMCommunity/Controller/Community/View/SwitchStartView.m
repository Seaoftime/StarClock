//
//  SwitchStartView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/6.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "SwitchStartView.h"
#import "SwitchStartTableViewCell.h"

@interface SwitchStartView ()


@property (nonatomic,strong) NSMutableArray *startArray;



@end




@implementation SwitchStartView


-(instancetype)initSwitchStartViewWithDeletage:(id<SwitchStartViewDeletage>)deletage
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    if (self)
    {
        [self setSwitchStartdeletage:deletage];
        [self setBackgroundColor:RGBAlpha(0, 0, 0, 0.3)];
        [self addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}



#pragma mark - Getter / Setter
-(UITableView *)startTableView
{
    if (_startTableView == nil)
    {
        _startTableView = [[UITableView alloc]initWithFrame:CGRectMake(kScreen_Width-150, 70, 150, 200) style:UITableViewStylePlain];
        [_startTableView setDelegate:self];
        [_startTableView setDataSource:self];
        [self addSubview:_startTableView];
    }
    return _startTableView;
}


-(NSMutableArray *)startArray
{
    if (_startArray == nil)
    {
        _startArray = [NSMutableArray array];
    }
    return _startArray;
}





#pragma mark Deletage method
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.switchStartdeletage respondsToSelector:@selector(switchStartViewAction:)])
    {
        SwitchStartModel *model = self.startArray[indexPath.row];
        [self.switchStartdeletage switchStartViewAction:model];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}





#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.startArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SwitchStartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[SwitchStartTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setSwitchStartModel:self.startArray[indexPath.row]];
    return cell;
}






#pragma mark  Public Method
-(void)showWithStartArray:(NSMutableArray *)array
{
    
    if ([array count])
    {
        [self.startArray setArray:array];
        [self.startTableView reloadData];
    }
    
    [self.startTableView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    
    [UIView animateWithDuration:0.15 animations:^{
        
        [self.startTableView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
        [kWindow addSubview:self];
        
    } ];
}

-(void)dismiss
{
    [self.startTableView removeFromSuperview];
    [self setStartArray:nil];
    [self  setStartTableView:nil];
    [self removeFromSuperview];
    
}




@end
