//
//  ZMGameExplainViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMGameExplainViewController.h"

@interface ZMGameExplainViewController ()


@property (nonatomic,strong) UIWebView *gameWebView; //!< 游戏说明webView


@end

@implementation ZMGameExplainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"游戏玩法说明"];
    [self setNavRightBtnHidden:YES];
    [self.view addSubview:self.gameWebView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




-(UIWebView*)gameWebView
{
    if (_gameWebView == nil)
    {
        _gameWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 40, kScreen_Width, kScreen_Height-40)];
        [_gameWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@game/game_rules.html",BaseUrl]]]];
    }
    return _gameWebView;
}

@end
