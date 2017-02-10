//
//  ZRRCustomSearchBar.h
//  ZMClock
//
//  Created by ZhongMeng on 16/10/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 自定义搜索框
 */
//张锐

//点击搜索按钮，调用block，用于赋值、加载数据等操作
typedef void(^searchBarReturnBlock) (UITextField *textFieeld);

typedef void(^cancelBlock) (UIButton *cancelBtn);



@interface ZRRCustomSearchBar : UIView

@property (nonatomic, copy) searchBarReturnBlock searchBarBlack;

@property (nonatomic, copy) cancelBlock cancelBtnBlack;


@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UITextField *searchBarTextField;//输入框
@property (nonatomic, strong) UIImageView *clearnImageView;
@property (nonatomic, strong) UIButton *cancleButton;




- (void)getSearchBarTextFromSearchBarBlack:(searchBarReturnBlock) searchBarBlack;


- (void)cancelBtnClicked:(cancelBlock) cancelBtnBlack;






@end
