//
//  ZMImageView.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMImageView : UIImageView




#pragma mark - 引导页重新绘制图片使用
@property (nonatomic,strong) UIImage *image; //要设置的图片
-(void)setDrawImageName:(NSString*)imageName;







#pragma mark 弹出框上使用标头图片视图

/**
 图标标头
 */
@property (nonatomic,strong) UILabel *tiptitleLable;
/**
 弹出框上使用标头图片视图
 */
-(instancetype)initWithAlertViewFrame:(CGRect)frame;



@end
