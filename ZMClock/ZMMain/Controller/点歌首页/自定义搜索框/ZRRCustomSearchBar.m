//
//  ZRRCustomSearchBar.m
//  ZMClock
//
//  Created by ZhongMeng on 16/10/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZRRCustomSearchBar.h"

#import "UIView+AttributeValue.h"

#define CancleButtonWidth 50 //取消按钮的宽度
#define SearchImageViewSize 22 //搜索图标的尺寸


@interface ZRRCustomSearchBar ()<UITextFieldDelegate>
{
    //UIView *_bgView;//背景视图
    //UITextField *_textField;//输入框
    UIImageView *_searchImageView;//放大镜图标
    //UIImageView *_clearnImageView;//叉号图标
    //UIButton *_cancleButton;//取消按钮
}

@end


@implementation ZRRCustomSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //背景视图
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        //设置圆角效果
        _bgView.layer.cornerRadius = 20;
        _bgView.layer.masksToBounds = YES;
        _bgView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.9];
        [self addSubview:_bgView];
        
        //取消按钮
        _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleButton.frame = CGRectMake(CGRectGetWidth(self.frame) - CancleButtonWidth, 0, CancleButtonWidth, CGRectGetHeight(self.frame));
        [_cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _cancleButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_cancleButton addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
        //textField未编辑状态，“取消”按纽不显示
        //_cancleButton.hidden = YES;
        [self addSubview:_cancleButton];
        
        //输入框
        _searchBarTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(_bgView.frame) - 20 - 15, CGRectGetHeight(_bgView.frame))];
        _searchBarTextField.font = [UIFont systemFontOfSize:16];
        [_searchBarTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
        _searchBarTextField.delegate = self;
        _searchBarTextField.returnKeyType = UIReturnKeySearch;
        //为textField设置属性占位符
        _searchBarTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入歌手名或歌曲名" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.335 alpha:1.000]}];
        
        _searchBarTextField.textAlignment = NSTextAlignmentCenter;
        
        
        [_bgView addSubview:_searchBarTextField];
        
        
        
        //放大镜图标imageView
        _searchImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 20, 20)];
        _searchImageView.image = [UIImage imageNamed:@"搜索searchbar"];
        
        
        _searchBarTextField.leftView = _searchImageView;
        _searchBarTextField.leftViewMode = UITextFieldViewModeAlways;
        
        
        //清除图标
        _clearnImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(_bgView.frame) - SearchImageViewSize - 10, _bgView.center.y - SearchImageViewSize / 2, SearchImageViewSize, SearchImageViewSize)];
        _clearnImageView.image = [UIImage imageNamed:@"关闭searchbar"];
        [_bgView addSubview:_clearnImageView];
        
        _clearnImageView.hidden = YES;
        
        _clearnImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *clearn = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clearnImageViewTaped)];
        [_clearnImageView addGestureRecognizer:clearn];
        
        
//////////////////////////////////////////////////
        [_bgView setSize:CGSizeMake(CGRectGetWidth(_bgView.frame) - CancleButtonWidth, CGRectGetHeight(_bgView.frame))];
        [_searchBarTextField setSize:CGSizeMake(CGRectGetWidth(_searchBarTextField.frame) - CancleButtonWidth, CGRectGetHeight(_searchBarTextField.frame))];
        [_clearnImageView setOrigin:CGPointMake(_clearnImageView.frame.origin.x - CancleButtonWidth, _clearnImageView.frame.origin.y)];
        

        
        
        
    }
    return self;
}


#pragma mark ---------------------- UITextFieldDelegate

//输入框开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    //显示“取消”按钮伴随的动画效果
    [UIView animateWithDuration:0.5 animations:^{
        
        
        //[_bgView setSize:CGSizeMake(CGRectGetWidth(_bgView.frame) - CancleButtonWidth, CGRectGetHeight(_bgView.frame))];
        //[_searchBarTextField setSize:CGSizeMake(CGRectGetWidth(_searchBarTextField.frame) - CancleButtonWidth, CGRectGetHeight(_searchBarTextField.frame))];
        //[_clearnImageView setOrigin:CGPointMake(_clearnImageView.frame.origin.x - CancleButtonWidth, _clearnImageView.frame.origin.y)];
        
        
        
        
        
        if (_searchBarTextField.text.length > 0) {
            //
            _clearnImageView.hidden = NO;
            
        }
        //_textField.text = @"";
        //_textField.textAlignment = NSTextAlignmentLeft;
        
        
        
        
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //_cancleButton.hidden = NO;
    });
    
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.searchBarBlack(textField);
    
    [self startSearch:_cancleButton];
    
    _clearnImageView.hidden = YES;
    
    _searchBarTextField.textAlignment = NSTextAlignmentCenter;
    
    return YES;
}



#pragma mark --------------------------- handle action

- (void)textFieldChanged:(UITextField *)textField
{
    //当输入框的字符数大于零时，隐藏放大镜图标
    _clearnImageView.hidden = textField.text.length > 0 ?  NO: YES;
}

//取消按钮触发事件
- (void)handleButton:(UIButton *)button
{
    [_searchBarTextField resignFirstResponder];
    //清除输入框中的字符串
    _searchBarTextField.text = @"";
    //_cancleButton.hidden = YES;
    _clearnImageView.hidden = YES;
    _searchBarTextField.textAlignment = NSTextAlignmentCenter;
    
    //隐藏“取消”按钮伴随的动画效果
    [UIView animateWithDuration:0.5 animations:^{
        
        //方法setSize:和setOrigin:是UIView分类UIView+ModifyAttributeValue中的方法
        //[_bgView setSize:CGSizeMake(CGRectGetWidth(_bgView.frame) + CancleButtonWidth, CGRectGetHeight(_bgView.frame))];
        //[_searchBarTextField setSize:CGSizeMake(CGRectGetWidth(_searchBarTextField.frame) + CancleButtonWidth, CGRectGetHeight(_searchBarTextField.frame))];
        //[_clearnImageView setOrigin:CGPointMake(_clearnImageView.frame.origin.x + CancleButtonWidth, _clearnImageView.frame.origin.y)];
        
        
    }];
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        self.cancelBtnBlack(button);
        
    });
    
    
}



//点击搜索退出编辑状态
- (void)startSearch:(UIButton *)button
{
    [_searchBarTextField resignFirstResponder];
    //清除输入框中的字符串
    //_textField.text = @"";
    //_cancleButton.hidden = YES;
    //_clearnImageView.hidden = NO;
    //隐藏“取消”按钮伴随的动画效果
    [UIView animateWithDuration:0.5 animations:^{
        //方法setSize:和setOrigin:是UIView分类UIView+ModifyAttributeValue中的方法
//        [_bgView setSize:CGSizeMake(CGRectGetWidth(_bgView.frame) + CancleButtonWidth, CGRectGetHeight(_bgView.frame))];
//        [_searchBarTextField setSize:CGSizeMake(CGRectGetWidth(_searchBarTextField.frame) + CancleButtonWidth, CGRectGetHeight(_searchBarTextField.frame))];
//        [_clearnImageView setOrigin:CGPointMake(_clearnImageView.frame.origin.x + CancleButtonWidth, _clearnImageView.frame.origin.y)];
        
        
    }];
    
}

///////点击叉号图标
- (void)_clearnImageViewTaped
{
    
    _searchBarTextField.text = @"";
    
}


//////控制器调用 block
- (void)getSearchBarTextFromSearchBarBlack:(searchBarReturnBlock) searchBarBlack
{

    self.searchBarBlack = searchBarBlack;
    
}



- (void)cancelBtnClicked:(cancelBlock)cancelBtnBlack
{
    self.cancelBtnBlack = cancelBtnBlack;

}






@end
