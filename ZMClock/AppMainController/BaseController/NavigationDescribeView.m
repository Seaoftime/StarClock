//
//  NavigationDescribeView.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/21.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "NavigationDescribeView.h"

@implementation NavigationDescribeView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width-40, 30)];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0]];
        [self.titleLabel setTextAlignment:NSTextAlignmentRight];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setShadowColor:RGB(35.0, 72.0, 83.0)];
        [self.titleLabel setShadowOffset:CGSizeMake(1, 1)];
        [self addSubview:self.titleLabel];
        
        
        
        self.describeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, frame.size.width, 20)];
        [self.describeLabel setTextAlignment:NSTextAlignmentCenter];
        [self.describeLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
        [self.describeLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:self.describeLabel];
        
        [self setDateAndTime:self.describeLabel];
        
        
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(85, 0, 25, 25)];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.imageView setImage:[UIImage imageNamed:@"定位.png"]];
        [self addSubview:self.imageView];
        
        
        
        
        [self hiddenBackgroundColor:NO];
    }
    return self;
}



-(void)hiddenBackgroundColor:( BOOL)backgroundColor
{
    if (backgroundColor)
    {
        [self setBackgroundColor:[UIColor redColor]];
        [self.titleLabel setBackgroundColor:[UIColor yellowColor]];
        [self.describeLabel setBackgroundColor:[UIColor purpleColor]];
    }
}


#pragma mark - 设置当前日期
-(void)setDateAndTime:(UILabel*)uilabel
{
    /**
    这种实现方式效率太低，所以使用下面的方式实现
    NSString *year = [[ZMHelper sharedHelp] localdDateAndTime_year];
    NSString *month = [[ZMHelper sharedHelp] localdDateAndTime_month];
    NSString *day = [[ZMHelper sharedHelp] localdDateAndTime_day];
    int month_to_int = [month intValue];
    int day_to_int = [day intValue];
    NSString *dateTim = [NSString stringWithFormat:@"%@年%d月%d日",year,month_to_int,day_to_int];
     */
    
    
    NSString *dateTim = [[ZMHelper sharedHelp] localdDateAndTime_year_month_day];
    /**
     双重保险
     */
    [uilabel setText:dateTim];
    [self.describeLabel setText:dateTim];
}


@end
