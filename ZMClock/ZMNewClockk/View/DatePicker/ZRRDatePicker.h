//
//  ZRRDatePicker.h
//  ZMClock
//
//  Created by ZhongMeng on 16/11/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZRRDatePickerDelegate <NSObject>

@optional
//当UIDatePicker值变化时所用到的代理
- (void)picker:(UIDatePicker *)picker ValueChanged:(NSDate *)date;

@end

@interface ZRRDatePicker : UIView


@property  (weak, nonatomic) id<ZRRDatePickerDelegate> delegate;

@property  (nonatomic ,strong) UIDatePicker *picker;

- (void)showInView:(UIView *)view withFrame:(CGRect)frame andDatePickerMode:(UIDatePickerMode)mode;

- (void)dismiss;

- (void)valueChanged:(UIDatePicker *)picker;




@end
