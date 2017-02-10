//
//  SpectrumView.h
//  GYSpectrum
//
//  Created by 张锐 on 16/8/19.
//  Copyright © 2016年 张锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpectrumView : UIView

@property (nonatomic, copy) void (^itemLevelCallback)();

//

@property (nonatomic) NSUInteger numberOfItems;

@property (nonatomic) UIColor * itemColor;

@property (nonatomic) CGFloat level;

@property (nonatomic) UILabel *timeLabel;

@property (nonatomic) NSString *text;


@end
