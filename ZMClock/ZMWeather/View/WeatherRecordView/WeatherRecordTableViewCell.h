//
//  WeatherRecordTableViewCell.h
//  ZMClock
//
//  Created by ZhongMeng on 16/4/22.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//
//  天气预报录音自定义表单元格
//
//
//


#import <UIKit/UIKit.h>
#import "WeatherRecordViewTableViewContentView.h"

@interface WeatherRecordTableViewCell : UITableViewCell

@property (nonatomic,strong) WeatherRecordViewTableViewContentView *tableViewContentView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
