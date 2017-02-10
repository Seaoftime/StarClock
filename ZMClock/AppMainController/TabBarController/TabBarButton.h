//
//  TabBarButton.h
//  ZMClock
//
//  Created by ZhongMeng on 16/3/1.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMButton.h"

@interface TabBarButton : ZMButton


#pragma mark - 初始化按钮，并设置正常和选中状态的图片
-(instancetype)initWithFrame:(CGRect)frame wittTitle:(NSString*)title withImage:(NSString*)imageName selectedImage:(NSString*)selectedImageName;


-(void)setTabBarButtonActionType:(int)type;

@end
