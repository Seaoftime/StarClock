//
//  GameBarView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/7.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "GameBarView.h"



#import "GameItemFunctionView.h"

#import "GameItemView.h"

#import "GameView.h"

#import "GameAlertButton.h"










@implementation GameBarView






-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat hight = frame.size.height-20;
       // CGFloat spaceWidth = (frame.size.width-3*hight)/4.0;
       
        
        
        self.topimage.frame=CGRectMake(0, 0, kScreen_Width-15, kScreen_Height);
        self.topimage.image=[UIImage imageNamed:@"底板"];
        [self addSubview:self.topimage];
        
        
        /**
         重置Frame //重置游戏页面点击下边的三个 Button弹出来的图片位置
         */
        
        //物品价格,饱食度
        [self.jiagebaoshiduimageview1 setFrame:CGRectMake(13, kScreen_Height/12, kScreen_Width/1.15, kScreen_Height/4)];
        [self addSubview:self.jiagebaoshiduimageview1];
        
        //物品价格,饱食度
        [self.jiagebaoshiduimageview2 setFrame:CGRectMake(13,kScreen_Height/12+kScreen_Height/4+10, kScreen_Width/1.15,kScreen_Height/4)];
        [self addSubview:self.jiagebaoshiduimageview2];
        
        //物品价格,饱食度
        [self.jiagebaoshiduimageview3 setFrame:CGRectMake(13, kScreen_Height/12+kScreen_Height/4*2+10*2, kScreen_Width/1.15, kScreen_Height/4)];
        [self addSubview:self.jiagebaoshiduimageview3];
        
        
        
        
        
        
        //点击 购买Button
        [self addSubview:self.goumaibutton1];
        [self addSubview:self.goumaibutton2];
        [self addSubview:self.goumaibutton3];
        
         [self.goumaibutton3 setTitle:@"购买" forState:0];
        
        
        [self.goumaibutton1 setFrame:CGRectMake(kScreen_Width/8,kScreen_Height/3.6,hight/6, hight/20)];
        
        [self.goumaibutton2 setFrame:CGRectMake(kScreen_Width/8, kScreen_Height/3.6+kScreen_Width/2.1, hight/6, hight/20)];
        
        [self.goumaibutton3 setFrame:CGRectMake(kScreen_Width/8, kScreen_Height/3.6+(kScreen_Width/2.1)*1.98, hight/6, hight/20)];
        
        //[self.goumaibutton1 setFrame:CGRectMake(self.jiagebaoshiduimageview1.frame.origin.x,self.jiagebaoshiduimageview1.frame.origin.y*2,hight/6,hight/20)];
        //[self.goumaibutton2 setFrame:CGRectMake(self.jiagebaoshiduimageview1.frame.origin.x,self.jiagebaoshiduimageview1.frame.origin.y*2,hight/6,hight/20)];
        
        //[self.goumaibutton3 setFrame:CGRectMake(self.jiagebaoshiduimageview1.frame.origin.x,self.jiagebaoshiduimageview1.frame.origin.y*2,hight/6,hight/20)];
        
       // [self.goumaibutton3 setFrame:CGRectMake(20,100,hight/6,hight/20)];
        
        //点击 使用Button
        
     
        [self.jiagebaoshiduimageview1  addSubview:self.shiyongbutton1];
        [self.jiagebaoshiduimageview2 addSubview:self.shiyongbutton2];
        [self.jiagebaoshiduimageview3 addSubview:self.shiyongbutton3];
        
       // [self.shiyongbutton1 setFrame:CGRectMake(hight*1.55+spaceWidth*2,160,hight/5, hight/20)];
       // [self.shiyongbutton2 setFrame:CGRectMake(hight*1.55+spaceWidth*2, 310, hight/5, hight/20)];
       // [self.shiyongbutton3 setFrame:CGRectMake(hight*1.55+spaceWidth*2, 460, hight/5, hight/20)];
        
         [self.shiyongbutton1 setFrame:CGRectMake(20,5,100, 100)];
        [self.shiyongbutton2 setFrame:CGRectMake(20,5,100, 100)];
        [self.shiyongbutton3 setFrame:CGRectMake(20,5,100, 100)];
        

        
   
        
        //点击 Button 有图片的
        
        [self addSubview:self.leftAlertButton];
        [self addSubview:self.middleAlertButton];
        [self addSubview:self.rightAlertButton];
        
        
        
        // [self.leftAlertButton resetFrame:CGRectMake(kScreen_Width/2,kScreen_Height/3.6,hight/6, hight/20)];
        
      //  [self.middleAlertButton resetFrame:CGRectMake(kScreen_Width/2, kScreen_Height/3.6+kScreen_Width/2.1, hight/6, hight/20)];
       
      //  [self.rightAlertButton resetFrame:CGRectMake(kScreen_Width/2, kScreen_Height/3.6+(kScreen_Width/2.1)*1.98, hight/6, hight/20)];
        
        
        //数值加对了
        [self.leftAlertButton resetFrame:CGRectMake(kScreen_Width/2, kScreen_Height/3.6+kScreen_Width/2.1, hight/6, hight/20)];
        
        [self.middleAlertButton resetFrame:CGRectMake(kScreen_Width/2, kScreen_Height/3.6+(kScreen_Width/2.1)*1.98, hight/6, hight/20)];
        [self.rightAlertButton resetFrame:CGRectMake(kScreen_Width/2,kScreen_Height/3.6,hight/6, hight/20)];
        

        
        
        
        
        
       // [self.leftAlertButton resetFrame:CGRectMake(200,130,100,30)];
       // [self.middleAlertButton resetFrame:CGRectMake(200,130,100,30)];
        //[self.rightAlertButton resetFrame:CGRectMake(hight*2+spaceWidth*3, 10, hight, hight)];
       // [self.rightAlertButton resetFrame:CGRectMake(200,130,100,30)];
        
        
      
        // [self.leftAlertButton resetFrame:CGRectMake(hight*1.25+spaceWidth*2,40,hight/5, hight/5)];
       
       //[self.middleAlertButton resetFrame:CGRectMake(hight*1.25+spaceWidth*2, 190, hight/5, hight/5)];
        //[self.rightAlertButton resetFrame:CGRectMake(hight*2+spaceWidth*3, 10, hight, hight)];
        //[self.rightAlertButton resetFrame:CGRectMake(hight*1.25+spaceWidth*2, 340, hight/5, hight/5)];
        
        
     
       // UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width-15, kScreen_Height-15)];
      //  image.image=[UIImage imageNamed:@"底板"];
        //头部 image
       // self.topimage.frame=CGRectMake(0, 0, kScreen_Width-15, 45);
        
      
        
        
        //上部 image
       // [self.shangimage setFrame:CGRectMake(150,10,160,115)];
        [self.shangimage setFrame:CGRectMake(150,10,hight/5,hight/6)];
        [self.jiagebaoshiduimageview1 addSubview:self.shangimage];
        
        
        self.jiagelabel1.frame=CGRectMake(0, 0, 100, 30);
        [self.shangimage addSubview:self.jiagelabel1];
        
        self.baosidulabel1.frame=CGRectMake(0, 40, 140, 30);
        [self.shangimage addSubview:self.baosidulabel1];
        
        

        
        //中部 image
         [self.zhongimage setFrame:CGRectMake(150,10,hight/5,hight/6)];
        [self.jiagebaoshiduimageview2 addSubview:self.zhongimage];
        
        self.jiagelabel2.frame=CGRectMake(0, 0, 100, 30);
        [self.zhongimage addSubview:self.jiagelabel2];
        
        self.baosidulabel2.frame=CGRectMake(0, 40, 140, 30);
        [self.zhongimage addSubview:self.baosidulabel2];
        

        
        //下部 image
        [self.xiaimage setFrame:CGRectMake(150,10,hight/5,hight/6)];
        [self.jiagebaoshiduimageview3 addSubview:self.xiaimage];
        
        self.jiagelabel.frame=CGRectMake(0, 0, 100, 30);
        [self.xiaimage addSubview:self.jiagelabel];

        
        self.baosidulabel.frame=CGRectMake(0, 40, 140, 30);
        [self.xiaimage addSubview:self.baosidulabel];
        
        
        

        
        

        
        //上部 image
        // [self.shangimage setFrame:CGRectMake(150,10,160,115)];
        [self.shangimage1 setFrame:CGRectMake(145,7,2,hight/4.5)];
        [self.jiagebaoshiduimageview1 addSubview:self.shangimage1];
        
        
        
        //中部 image
        [self.zhongimage2 setFrame:CGRectMake(145,7,2,hight/4.5)];
        [self.jiagebaoshiduimageview2 addSubview:self.zhongimage2];
        
        
        
        //下部 image
        [self.xiaimage3 setFrame:CGRectMake(145,7,2,hight/4.5)];
        [self.jiagebaoshiduimageview3 addSubview:self.xiaimage3];
        

        
               
        
        
        
        
    }
    return self;
}




#pragma mark 重置Frame
/**
 重置Frame
 */

#pragma mark   填充道具（食物，洁具，花朵）数据模型
-(void)resetWithleftImage:(NSString*)leftImage withmiddleImage:(NSString*)middleImagee withrightImage:(NSString*)rightImage withModel:(GameItemTypeModel*)model
{
    if ([model.itemArray count]>=3)
    {
        /**
         填充食物数据模型
         */
      
        GameItemsModel *leftModel = [model.itemArray objectAtIndex:0];

       // [self.leftAlertButton setImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
        
       
        
        [self.shiyongbutton1 setImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
        
        
        
        
        
        [self.leftAlertButton setModel:leftModel];
        
        
        /**
         填充清洁数据模型
         */
       
        
        GameItemsModel *middleModel = [model.itemArray objectAtIndex:1];
       // [self.middleAlertButton setImage:[UIImage imageNamed:middleImagee] forState:UIControlStateNormal];
        [self.middleAlertButton setModel:middleModel];
        
        [self.shiyongbutton2 setImage:[UIImage imageNamed:middleImagee] forState:UIControlStateNormal];
        
        
        /**
         填充送花数据模型
         */
        
        
        GameItemsModel *rightModel = [model.itemArray objectAtIndex:2];
       // [self.rightAlertButton setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
        [self.rightAlertButton setModel:rightModel];
        
        [self.shiyongbutton3 setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
    }
   
}


#pragma mark 游戏物品价格饱食度imageview1
-(UIImageView *)jiagebaoshiduimageview1
{
    if (_jiagebaoshiduimageview1 == nil)
    {
        _jiagebaoshiduimageview1 = [[UIImageView alloc]init];
        _jiagebaoshiduimageview1.image=[UIImage imageNamed:@"框子1"];
       // _jiagebaoshiduimageview1.backgroundColor=[UIColor redColor];
        
         [_jiagebaoshiduimageview1.layer setCornerRadius:15];
    }
    return _jiagebaoshiduimageview1;
    
}

#pragma mark 游戏物品价格饱食度imageview2
-(UIImageView *)jiagebaoshiduimageview2
{
    if (_jiagebaoshiduimageview2 == nil)
    {
        _jiagebaoshiduimageview2 = [[UIImageView alloc]init];
        _jiagebaoshiduimageview2.image=[UIImage imageNamed:@"框子2"];
       // _jiagebaoshiduimageview2.backgroundColor=[UIColor redColor];
        
         [_jiagebaoshiduimageview2.layer setCornerRadius:15];
    }
    return _jiagebaoshiduimageview2;
    
}


#pragma mark 游戏物品价格饱食度imageview3
-(UIImageView *)jiagebaoshiduimageview3
{
    if (_jiagebaoshiduimageview3 == nil)
    {
        _jiagebaoshiduimageview3 = [[UIImageView alloc]init];
        _jiagebaoshiduimageview3.image=[UIImage imageNamed:@"框子3"];
       // _jiagebaoshiduimageview3.backgroundColor=[UIColor redColor];
        
         [_jiagebaoshiduimageview3.layer setCornerRadius:15];
    }
    return _jiagebaoshiduimageview3;
    
}





#pragma mark - Getter / Setter
-(GameAlertButton*)leftAlertButton
{
    if (_leftAlertButton == nil)
    {
        
        
        _leftAlertButton = [[GameAlertButton alloc]init];
        
        [_leftAlertButton.layer setCornerRadius:8];
        _leftAlertButton.backgroundColor=RGB(252, 146, 82);
        
        [_leftAlertButton setTitle:@"使用" forState:0];
        // _leftAlertButton.backgroundColor=[UIColor orangeColor];
        
        
        [_leftAlertButton addTarget:self action:@selector(gameAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        //[_leftAlertButton setTag:1];
    }
    return _leftAlertButton;
}

-(GameAlertButton*)middleAlertButton
{
    if (_middleAlertButton == nil)
    {
        _middleAlertButton = [[GameAlertButton alloc]init];
        [_middleAlertButton.layer setCornerRadius:8];
      _middleAlertButton.backgroundColor=RGB(252, 146, 82);

        [ _middleAlertButton setTitle:@"使用" forState:0];
       // _middleAlertButton.backgroundColor=[UIColor orangeColor];

        
        [_middleAlertButton addTarget:self action:@selector(gameAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
       // [_middleAlertButton setTag:2];
    }
    return _middleAlertButton;
}


-(GameAlertButton*)rightAlertButton
{
    if (_rightAlertButton == nil)
    {
        _rightAlertButton = [[GameAlertButton alloc]init];
        
         [ _rightAlertButton.layer setCornerRadius:8];
        
          _rightAlertButton.backgroundColor=RGB(252, 146, 82);
        [ _rightAlertButton setTitle:@"使用" forState:0];
        // _rightAlertButton.backgroundColor=[UIColor orangeColor];

        [_rightAlertButton addTarget:self action:@selector(gameAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
       // [_rightAlertButton setTag:3];
    }
    return _rightAlertButton;
}





#pragma mark -GameAlertButton 使用按钮触发的方法
-(void)gameAlertButtonAction:(GameAlertButton*)sender
{
    //3
    
    
    if ([self.gameBarDeletage respondsToSelector:@selector(gameBarAlertButtonAction:)])
    {
        [self.gameBarDeletage gameBarAlertButtonAction:sender];
    }
}


#pragma mark 购买button
-(UIButton *)goumaibutton1
{
    if (_goumaibutton1 == nil)
    {
        _goumaibutton1 = [[UIButton  alloc]init];
         [_goumaibutton1.layer setCornerRadius:8];
        _goumaibutton1.backgroundColor=RGB(242, 115, 154);
       [_goumaibutton1 setTitle:@"购买" forState:0];
        //_goumaibutton1.backgroundColor=[UIColor blueColor];
        [_goumaibutton1 addTarget:self action:@selector(gameAlertButtonAction1:) forControlEvents:UIControlEventTouchUpInside];
        [_goumaibutton1 setTag:1];
        
    }
    return _goumaibutton1;
    
}




#pragma mark - 使用购买按钮触发的方法
-(void)gameAlertButtonAction1:(UIButton *)sender
{
    [self goumaibutton:sender Shongyongbutton:sender ];
    
}


-(void)goumaibutton:(UIButton *)sender1 Shongyongbutton
                   :(UIButton *)sender2
{
      
    
   NSString* asd=[NSString stringWithFormat:@"%d",(int)sender1.tag];
   // NSLog(@"---asd--------%@",asd);
    NSString* qwe=[NSString stringWithFormat:@"%d",(int)sender1.tag];
    // NSLog(@"---qwe--------%@",qwe);
        
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign,
                                        @"item_type":asd,
                                        @"item_id":qwe};
            
    [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"game/buy_item.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     NSDictionary *data = [object objectForKey:@"data"];
                     
                     
                     if ([data count])
                     {
                         /**
                          先清空数组
                          */
                         [self.gameItemArray removeAllObjects];
                         
                         NSArray *user_itemsArray = [data objectForKey:@"user_items"];
                         for (NSDictionary *data in user_itemsArray)
                         {
                             
                             NSArray *itemArray = [data objectForKey:@"item_data"];
                             for (NSDictionary *item in itemArray)
                             {
                                
                                
                                 NSString *count = [item objectForKey:@"count"];
                                 
                                 
                               
                                 GameAlertButton *gamealer=[[GameAlertButton alloc]init];
                                 gamealer.tipLabel.text=[NSString stringWithFormat:@"%@%@",@"数量 :",count];
                                 
                                 NSLog(@"----gamealer.tipLabel.text-----%@",gamealer.tipLabel.text);
                                 
                                 [self.gameItemArray addObject:count];
                                 
                                 NSLog(@"----self.gameItemArray-----%@",self.gameItemArray);
                                 
                                 
                                }
                             
                          
                             
                         }
                         
                         
                         
                         
                         NSArray *user_gold_info=[data objectForKey:@"user_gold_info"];
                         [self.gameItemArray addObject:user_gold_info];
                         
                         
                         
                     }
                 }
                 
             } error:^(NSError *error){}];
        }
    }
    [self removeFromSuperview];
    
    
   // _wupingitme1=[[GameItemsModel alloc]init];
    //GameAlertButton *gamealer=[[GameAlertButton alloc]init];
    //gamealer.tipLabel.text=[NSString stringWithFormat:@"%@%@",@"数量 :",_wupingitme1];

    
    
    
    
    
    
    if (self.gameItemArray!=nil) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"购买成功" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    else{
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"购买失败" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        
    }
    
  //  [self startActionWithItemType:sender1.tag withItemId:sender2.tag];
    






}






-(NSMutableArray*)gameItemArray
{
    if (_gameItemArray == nil)
    {
        _gameItemArray = [NSMutableArray array];
    }
    return _gameItemArray;
}
-(NSMutableArray*)gameItemArray1
{
    if (_gameItemArray1 == nil)
    {
        _gameItemArray1 = [NSMutableArray array];
    }
    return _gameItemArray1;
}

-(NSMutableArray*)gameItemArray2
{
    if (_gameItemArray2 == nil)
    {
        _gameItemArray2 = [NSMutableArray array];
    }
    return _gameItemArray2;
}




#pragma mark 购买button
-(UIButton *)goumaibutton2
{
    if (_goumaibutton2 == nil)
    {
        _goumaibutton2 = [[UIButton alloc]init];
        
         [_goumaibutton2.layer setCornerRadius:8];
     
       _goumaibutton2.backgroundColor=RGB(242, 115, 154);
        [_goumaibutton2 setTitle:@"购买" forState:0];
       // _goumaibutton2.backgroundColor=[UIColor blueColor];
        [_goumaibutton2 addTarget:self action:@selector(gameAlertButtonAction1:) forControlEvents:UIControlEventTouchUpInside];
        [_goumaibutton2 setTag:2];
        
    }
    return _goumaibutton2;
    
}



#pragma mark 购买button
-(UIButton *)goumaibutton3
{
    if (_goumaibutton3 == nil)
    {
        _goumaibutton3 = [[UIButton alloc]init];
         [_goumaibutton3.layer setCornerRadius:8];
       _goumaibutton3.backgroundColor=RGB(242, 115, 154);
      //  [_goumaibutton3 setImage:[UIImage imageNamed:@"购买按键"] forState:0];
        
          [_goumaibutton3 setTitle:@"购买" forState:0];
        //_goumaibutton3.backgroundColor=[UIColor blueColor];
        [_goumaibutton3 addTarget:self action:@selector(gameAlertButtonAction1:) forControlEvents:UIControlEventTouchUpInside];
        [_goumaibutton3 setTag:3];
        
    }
    return _goumaibutton3;
    
}

#pragma mark 使用button
-(GameAlertButton *)shiyongbutton1
{
    if (_shiyongbutton1 == nil)
    {
        _shiyongbutton1 = [[GameAlertButton alloc]init];
       
        
        
        // [_shiyongbutton1.layer setCornerRadius:8];
        //[_shiyongbutton1 setTitle:@"使用" forState:0];
        //[_goumaibutton setImage:@"1111" forState:0];
        //_shiyongbutton1.backgroundColor=[UIColor orangeColor];
        //[_shiyongbutton1 addTarget:self action:@selector(gameAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
       // [_shiyongbutton1 setTag:1];
        
    }
    return _shiyongbutton1;
    
}

#pragma mark 使用button
-(GameAlertButton *)shiyongbutton2
{
    if (_shiyongbutton2 == nil)
    {
        _shiyongbutton2 = [[GameAlertButton alloc]init];
        // [_shiyongbutton2.layer setCornerRadius:8];
       // [_shiyongbutton2 setTitle:@"使用" forState:0];
        //[_goumaibutton setImage:@"1111" forState:0];
        //_shiyongbutton2.backgroundColor=[UIColor orangeColor];
       // [_shiyongbutton2 addTarget:self action:@selector(gameAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
       // [_shiyongbutton2 setTag:2];
        
    }
    return _shiyongbutton2;
    
}

#pragma mark 使用button
-(GameAlertButton *)shiyongbutton3
{
    if (_shiyongbutton3 == nil)
    {
        _shiyongbutton3 = [[GameAlertButton alloc]init];
        // [_shiyongbutton3.layer setCornerRadius:8];
       // [_shiyongbutton3 setTitle:@"使用" forState:0];
        //[_goumaibutton setImage:@"1111" forState:0];
       // _shiyongbutton3.backgroundColor=[UIColor orangeColor];
        //[_shiyongbutton3 addTarget:self action:@selector(gameAlertButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        //[_shiyongbutton3 setTag:3];
        
    }
    return _shiyongbutton3;
    
}

#pragma mark头部 image
-(UIImageView *)topimage
{
    if (_topimage == nil)
    {
        _topimage = [[UIImageView alloc]init];
        [_topimage.layer setCornerRadius:8];
        
        //[_topimage setImage:@"1111" forState:0];
        _topimage.backgroundColor=[UIColor orangeColor];
        
    }
    return _topimage;
    
}


#pragma mark头部 image
-(UIImageView *)shangimage
{
    if (_shangimage == nil)
    {
        _shangimage = [[UIImageView alloc]init];
        [_topimage.layer setCornerRadius:8];
        
        //[shangimage setImage:@"1111" forState:0];
        _shangimage.backgroundColor=[UIColor orangeColor];
        
    }
    return _shangimage;
    
}

#pragma mark头部 image
-(UIImageView *)zhongimage
{
    if (_zhongimage == nil)
    {
        _zhongimage = [[UIImageView alloc]init];
        [_zhongimage.layer setCornerRadius:8];
        
        //[_topimage setImage:@"1111" forState:0];
        _zhongimage.backgroundColor=[UIColor orangeColor];
        
    }
    return _zhongimage;
    
}

#pragma mark头部 image
-(UIImageView *)xiaimage
{
    if (_xiaimage == nil)
    {
        _xiaimage = [[UIImageView alloc]init];
    [_xiaimage.layer setCornerRadius:8];
        
     _xiaimage.backgroundColor=[UIColor orangeColor];
        
    }
    return _xiaimage;
    
}



#pragma mark头部 image
-(UIImageView *)shangimage1
{
    if (_shangimage1 == nil)
    {
        _shangimage1 = [[UIImageView alloc]init];
        
        
        _shangimage1.backgroundColor=[UIColor grayColor];
        
    }
    return _shangimage1;
    
}

#pragma mark头部 image
-(UIImageView *)zhongimage2
{
    if (_zhongimage2 == nil)
    {
        _zhongimage2 = [[UIImageView alloc]init];
        _zhongimage2.backgroundColor=[UIColor grayColor];
    }
    return _zhongimage2;
    
}

#pragma mark头部 image
-(UIImageView *)xiaimage3
{
    if (_xiaimage3 == nil)
    {
        _xiaimage3 = [[UIImageView alloc]init];
           _xiaimage3.backgroundColor=[UIColor grayColor];
        
    }
    return _xiaimage3;
    
}

-(UILabel *)jiagelabel
{
    if (_jiagelabel==nil) {
        _jiagelabel=[[UILabel alloc]init];
        _jiagelabel.text=@"价格:    X 5";
        
    }

    return _jiagelabel;

}


-(UILabel *)baosidulabel
{
    if (_baosidulabel==nil) {
        _baosidulabel=[[UILabel alloc]init];
        _baosidulabel.text=@"饱食度:   +60";
        
        
    }
    
    
    return _baosidulabel;
    
    
}


-(UILabel *)jiagelabel1
{
    if (_jiagelabel1==nil) {
        _jiagelabel1=[[UILabel alloc]init];
        _jiagelabel1.text=@"价格:    X 5";
        
    }
    
    return _jiagelabel1;
    
}


-(UILabel *)baosidulabel1
{
    if (_baosidulabel1==nil) {
        _baosidulabel1=[[UILabel alloc]init];
        _baosidulabel1.text=@"饱食度:   +20";
        
        
    }
    
    
    return _baosidulabel1;
    
    
}


-(UILabel *)jiagelabel2
{
    if (_jiagelabel2==nil) {
        _jiagelabel2=[[UILabel alloc]init];
        _jiagelabel2.text=@"价格:    X 5";
        
    }
    
    return _jiagelabel2;
    
}


-(UILabel *)baosidulabel2
{
    if (_baosidulabel2==nil) {
        _baosidulabel2=[[UILabel alloc]init];
        _baosidulabel2.text=@"饱食度:   +40";
        
        
    }
    
    
    return _baosidulabel2;
    
    
}









@end
