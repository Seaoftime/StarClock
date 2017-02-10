//
//  PeopleStandingview.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "PeopleStandingview.h"

@implementation PeopleStandingview

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
        _PeopleStandimage = [[UIImageView alloc] init];
        //[_PeopleStandimage setContentMode:UIViewContentModeScaleAspectFit];
//    _PeopleStandimage.frame=CGRectMake(85, kScreen_Height/2-kScreen_Height/2.6, kScreen_Width-100, kScreen_Height-40);
        
        _PeopleStandimage.frame=CGRectMake(50, 100, kScreen_Width - 100, kScreen_Height - 100);

        
        //_PeopleStandimage.image=[UIImage imageNamed:@"角色3"];
        //_PeopleStandimage.image=[UIImage imageNamed:@"角色5"];疯狂动物城-身体
        _PeopleStandimage.image = [UIImage imageNamed:@"疯狂动物城-身体"];
        
        [self addSubview:_PeopleStandimage];
        
        
        
        
        /*
        _PeopleStandshadowimage = [[UIImageView alloc]init];
        [_PeopleStandshadowimage setContentMode:UIViewContentModeScaleAspectFit];
        _PeopleStandshadowimage.frame=CGRectMake(_PeopleStandimage.center.x-55, _PeopleStandimage.center.y+100, 100, 80);
        _PeopleStandshadowimage.image=[UIImage imageNamed:@"阴影"];
        [self addSubview:_PeopleStandshadowimage];
        */
        
           
        }
    return self;
}



@end
