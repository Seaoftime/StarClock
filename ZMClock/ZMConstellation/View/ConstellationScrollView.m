//
//  ConstellationScrollView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/26.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ConstellationScrollView.h"

@interface ConstellationScrollView ()

@property (nonatomic,strong) NSMutableArray *transferArray;

@end



@implementation ConstellationScrollView


-(instancetype)initWithFrame:(CGRect)frame setDeletage:(id)deletage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.icarousel];
        [self addSubview:self.middlePartView];
        [self addSubview:self.bottomPartView];
        [self setContentSize:CGSizeMake(kScreen_Width, 690)];
    }
    return self;
}


/**
 填充数据
 */
-(void)setConstellationModelArray:(NSMutableArray*)modelArray
{
    [self setTransferArray:modelArray];
}



-(NSMutableArray *)transferArray
{
    if (_transferArray == nil)
    {
        _transferArray = [NSMutableArray array];
    }
    return _transferArray;
}

#pragma mark - Getter / Setter
-(iCarousel*)icarousel
{
    if (_icarousel == nil)
    {
        _icarousel = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 180)];
        [_icarousel setType:iCarouselTypeCoverFlow];
        [_icarousel setDelegate:self];
        [_icarousel setDataSource:self];
    }
    return _icarousel;
}


-(ConstellationPartView*)middlePartView
{
    if (_middlePartView == nil)
    {
        _middlePartView = [[ConstellationPartView alloc]initWithFrame:CGRectMake(0, 200, kScreen_Width, 170) withConstellationPartType:middleType];
    }
    return _middlePartView;
}

-(ConstellationPartView*)bottomPartView
{
    if (_bottomPartView == nil)
    {
        _bottomPartView = [[ConstellationPartView alloc]initWithFrame:CGRectMake(0, 370, kScreen_Width, 300) withConstellationPartType:bottomType];
    }
    return _bottomPartView;
}

#pragma mark - Deletage 代理方法
#pragma mark iCarouselDelegate 旋转木马操作代理方法
- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
   // NSLog(@"旋转木马方法：%@ == %d",NSStringFromSelector(_cmd),(int)carousel.currentItemIndex);

    ConstellationModel *model = self.transferArray[carousel.currentItemIndex];
    [self.middlePartView setmodel:model withConstellationPartType:middleType];
    [self.bottomPartView setmodel:model withConstellationPartType:bottomType];
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
            break;
        default:
        {
            return value;
        }
            break;
    }
}


#pragma mark iCarouselDataSource 旋转木马数据源代理方法
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 12;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIImageView *)view
{
    /**
     根据用户选择的内容填充数据
     */
    ConstellationModel *model = self.transferArray[index];
    //create a numbered view
    view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
    [view setImage:[UIImage imageNamed:model.name]];
    [view setContentMode:UIViewContentModeScaleAspectFit];
    
    
    
    
    return view;
}








@end
