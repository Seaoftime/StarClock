//
//  ZMStartViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/4.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMStartViewController.h"
#import "SatrtCollectionViewCell.h"
#import "SatrtHeadView.h"
#import "StartFootView.h"


#define SupplementaryViewHeaderIdentify @"SupplementaryViewHeaderIdentify"
#define SupplementaryViewFooterIdentify @"SupplementaryViewFooterIdentify"

@interface ZMStartViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SatrtCollectionViewCellDeletage>

@property (nonatomic,strong) SatrtHeadView *satrtOneHeadView; //!< 明星头视图
@property (nonatomic,strong) SatrtHeadView *satrtTwoHeadView; //!< 明星头视图
@property (nonatomic,strong) StartFootView *startFootView; //!< 明星脚视图
@property (nonatomic,strong) UICollectionView *startCollectionView; //!< 存放明星信息的视图

@property (nonatomic,strong) NSMutableArray *startArray; //!< 明星信息数组

@end



@implementation ZMStartViewController

#pragma mark - DataRequest Method
#pragma mark 获取明星信息
-(void)getStartinfo:(BOOL)startinfo
{
    if (startinfo)
    {
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                            @"sign":[ZMUserInfo sharedUserInfo].sign,
                                            @"star_category":@"0",
                                            @"start_seq":@"0",
                                            @"end_seq":@"0",
                                            @"per_page":@"0",
                                            @"action_type":@"3"};
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"star/get_star_list.php" theParmeters:parmeters sucess:^(id object)
                 {
                     if ([[object objectForKey:@"status"]integerValue]==0)
                     {
                         
                         NSDictionary *dataDictionary = [object objectForKey:@"data"];
                         
                         /**
                          解析入住明星数据
                          */
                         NSArray *enter_starArray = [dataDictionary objectForKey:@"enter_star"];
                         if (enter_starArray)
                         {
                             NSMutableArray *enterArray = [NSMutableArray array]; //!< 存放入住明星数据内容
                             for (int i = 0; i < [enter_starArray count]; i++)
                             {
                                 StartModel *model = [[StartModel alloc]init];
                                 NSDictionary *items = [enter_starArray objectAtIndex:i];
                                 
                                 /**
                                  解析数据内容
                                  */
                                 NSString *count = [items objectForKey:@"count"];
                                 NSString *star_id = [items objectForKey:@"star_id"];
                                 NSString *star_name = [items objectForKey:@"star_name"];
                                 NSInteger status = [[items objectForKey:@"status"] integerValue];
                                 NSDictionary *image_urlDictionary = [items objectForKey:@"image_url"];
                                 NSString *star_url = [image_urlDictionary objectForKey:@"path"];
                                 
                                 
                                 /**
                                  填充数据模型
                                  */
                                 [model setStartId:star_id];
                                 [model setStartFans:count];
                                 [model setStartName:star_name];
                                 [model setStartUrl:star_url];
                                 [model setStatusModelType:status];
                                 [model setStartType:EnterStartType];
                                 
                                 [enterArray addObject:model];
                             }
                             [self.startArray addObject:enterArray];
                         }
                         
                         /**
                          解析申请明星数据
                          */
                         NSArray *support_starArray = [dataDictionary objectForKey:@"support_star"];
                         if (support_starArray)
                         {
                             NSMutableArray *supportArray = [NSMutableArray array]; //!< 存放申请明星数据内容
                             for (int i = 0; i < [support_starArray count]; i++)
                             {
                                 StartModel *model = [[StartModel alloc]init];
                                 NSDictionary *items = [support_starArray objectAtIndex:i];
                                 
                                 /**
                                  解析数据内容
                                  */
                                 NSString *count = [items objectForKey:@"count"];
                                 NSString *star_id = [items objectForKey:@"star_id"];
                                 NSString *star_name = [items objectForKey:@"star_name"];
                                 NSInteger status = [[items objectForKey:@"status"] integerValue];
                                 NSDictionary *image_urlDictionary = [items objectForKey:@"image_url"];
                                 NSString *star_url = [image_urlDictionary objectForKey:@"path"];
                                 
                                 
                                 /**
                                  填充数据模型
                                  */
                                 [model setStartId:star_id];
                                 [model setStartFans:count];
                                 [model setStartName:star_name];
                                 [model setStartUrl:star_url];
                                 [model setStatusModelType:status];
                                 [model setStartType:SupportStartType];
                                 
                                 [supportArray addObject:model];
                             }
                             
                             [self.startArray addObject:supportArray];
                         }
                     }
                     
                 } error:^(NSError *error) {
                     
                     
                     NSLog(@"%@",error);
                 }];
            }
        }
    }
}



#pragma mark  支持或者关注明星
-(void)submitWithStarid:(NSString *)starId withAction:(NSString*)action withSender:(ZMButton*)sender
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"star_id":starId,
                                       @"action":action};
            
                      
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"star/follow_support_star.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[object objectForKey:@"status"]integerValue]==0)
                 {
                     switch (sender.startModel.startType)
                     {
                         case EnterStartType:
                         {
                             switch (sender.startModel.statusModelType)
                             {
                                 case AlreadyAttentionType:
                                 {
                                     [sender.startModel setStatusModelType:NoAttentionType];
                                     [self.startCollectionView reloadData];
                                     [AnyObjectActivityView showWithTitle:@"取消关注" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                 }
                                     break;
                                 case NoAttentionType:
                                 {
                                     
                                     [[ZMUserInfo sharedUserInfo] setStar_cur:starId];
                                     
                                     
                                     
                                     [sender.startModel setStatusModelType:AlreadyAttentionType];
                                     [self.startCollectionView reloadData];
                                     [AnyObjectActivityView showWithTitle:@"关注成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                     
                                     
                                     
                                 }
                                     break;
                             }
                         }
                             break;
                         case SupportStartType:
                         {
                             switch (sender.startModel.statusModelType)
                             {
                                 case NoAttentionType:
                                 {
                                     [sender.startModel setStatusModelType:AlreadyAttentionType];
                                     [self.startCollectionView reloadData];
                                     [AnyObjectActivityView showWithTitle:@"申请成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                 }
                                     break;
                                 case AlreadyAttentionType:
                                     break;
                             }
                         }
                             break;
                     }
                     
                     
                     
                    
                 }
                 else
                 {
                     NSString *msg = [object objectForKey:@"msg"];
                     
                [AnyObjectActivityView showWithTitle:msg wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     
                 }
                 
             } error:^(NSError *error)
             {
                 [AnyObjectActivityView showWithTitle:@"关注失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
             }];
        }
    }
}

#pragma mark 申请创建某明星
-(void)applyWithStartName:(NSString *)startName
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"star_name":startName};
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"star/apply_star.php" theParmeters:parmeters sucess:^(id object)
            {
              
                if ([[object objectForKey:@"status"]integerValue]==0)
                {
                    [AnyObjectActivityView showWithTitle:@"申请成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                }
                else
                {
                    NSString *mes = [object objectForKey:@"msg"];
                    [AnyObjectActivityView showWithTitle:mes wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                    
                }
            } error:^(NSError *error)
            {
                 [AnyObjectActivityView showWithTitle:@"申请失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }];
        }
    }
}



#pragma mark - LifeStyle Method
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.startCollectionView];
    [self setTitle:@"明星"];
    [self getStartinfo:YES];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}




#pragma mark - Getter/Setter Method

-(UICollectionView*)startCollectionView
{
    if (_startCollectionView == nil)
    {
        _startCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 70, kScreen_Width, kScreen_Height-120) collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
        [_startCollectionView setDelegate:self];
        [_startCollectionView setDataSource:self];
        [_startCollectionView setBackgroundColor:RGB(237.0, 237.0, 237.0)];

        
        [_startCollectionView registerClass:[SatrtCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        
        [_startCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SupplementaryViewHeaderIdentify];
        
        [_startCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SupplementaryViewFooterIdentify];
    }
    return _startCollectionView;
}

-(SatrtHeadView*)satrtOneHeadView
{
    if (_satrtOneHeadView == nil)
    {
        _satrtOneHeadView = [[SatrtHeadView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
    }
    return _satrtOneHeadView;
}


-(SatrtHeadView*)satrtTwoHeadView
{
    if (_satrtTwoHeadView == nil)
    {
        _satrtTwoHeadView = [[SatrtHeadView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 30)];
    }
    return _satrtTwoHeadView;
}


-(StartFootView*)startFootView
{
    if (_startFootView == nil)
    {
        _startFootView = [[StartFootView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 100)];
        [_startFootView.subMitButton addTarget:self action:@selector(alreadySubmitButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startFootView;
}

-(NSMutableArray *)startArray
{
    if (_startArray == nil)
    {
        _startArray = [NSMutableArray array];
    }
    return _startArray;
}



#pragma mark - Delegate Method
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}



#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.startArray[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SatrtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setDeletage:self];
    [cell setModel:[[self.startArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    return cell;
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.startArray count];
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *HeaderView =  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:SupplementaryViewHeaderIdentify forIndexPath:indexPath];
        
        
        switch (indexPath.section)
        {
            case 0:
            {
                [self.satrtOneHeadView.headTitleLabel setText:@"关注明星"];
                [HeaderView addSubview:self.satrtOneHeadView];
                [self.satrtTwoHeadView setHidden:YES];
                [self.satrtOneHeadView setHidden:NO];
               
            }
                break;
            case 1:
            {
                [self.satrtTwoHeadView.headTitleLabel setText:@"申请入驻明星"];
                [HeaderView addSubview:self.satrtTwoHeadView];
                [self.satrtTwoHeadView setHidden:NO];
                [self.satrtOneHeadView setHidden:YES];
            }
                break;
        }
        return HeaderView;
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        
        UICollectionReusableView *FootView =  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:SupplementaryViewFooterIdentify forIndexPath:indexPath];
        [FootView addSubview:self.startFootView];
        return FootView;
    }
    else
    {
        return nil;
    }
}



#pragma mark  UICollectionViewDelegateFlowLayout 代理方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kScreen_Width/3.0-10,kScreen_Width/3.0-10);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(kScreen_Width, 30);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return CGSizeMake(0, 0);
        }
            break;
        case 1:
        {
            return CGSizeMake(kScreen_Width, 100);
        }
            break;
    }
    return CGSizeMake(0, 0);
}


#pragma mark SatrtCollectionViewCellDeletage  (关注、申请按钮触发的方法)
-(void)attentionButtonAction:(ZMButton*)sender
{
    switch (sender.startModel.startType)
    {
        case EnterStartType:
        {
            switch (sender.startModel.statusModelType)
            {
                case AlreadyAttentionType:
                {//取消按钮
                     [self submitWithStarid:sender.startModel.startId withAction:@"3" withSender:sender];
                }
                    break;
                case NoAttentionType:
                {
                    
                    
                    //关注按钮
                    [self submitWithStarid:sender.startModel.startId withAction:@"1" withSender:sender];
                    

                    
                   //判断星伴任务是否完成
                    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
                    {
                        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
                        {
                            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,@"sign":[ZMUserInfo sharedUserInfo].sign,@"star_id":sender.startModel.startId,@"action":@"1" };
                            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"star/follow_support_star.php" theParmeters:parmeters sucess:^(id object)
                             {
                                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                                 {
                                     NSDictionary *data = [object objectForKey:@"data"];
                                     if ([data count])
                                     {
                                         NSDictionary*task=[data objectForKey:@"task"];
                                         if ([task isEqual:@""])
                                         {
                                             
                                         }
                                         else
                                         {
                                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                                             if (task_id==7)
                                             {
                                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                                             }
                                         }
                                     }
                                 }
                             }
                        error:^(NSError *error) {}];
                        }
                    }
                    else
                    {
                        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                    }
                    
 
                    
                }
                    break;
            }
        }
            break;
        case SupportStartType:
        {
            switch (sender.startModel.statusModelType)
            {
                case NoAttentionType:
                {
                    [self submitWithStarid:sender.startModel.startId withAction:@"2" withSender:sender];
                }
                    break;
                case AlreadyAttentionType:
                    break;
            }
        }
            
            break;
    }
}



#pragma mark - Response Method
#pragma mark - Private Method
#pragma mark 提交创建明星申请
-(void)alreadySubmitButtonAction:(ZMButton *)sender
{
    if ([self.startFootView.inputTextField.text isEqualToString:@""])
    {
        [AnyObjectActivityView showWithTitle:@"不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
    }
    else
    {
        [self applyWithStartName:self.startFootView.inputTextField.text];
    }
    
}

@end
