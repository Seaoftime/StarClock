//
//  ZMProtocolViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/5/9.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMProtocolViewController.h"

@interface ZMProtocolViewController ()

@property (nonatomic,strong) UIWebView *protocolWebView; //!< 用户协议WebView

@end

@implementation ZMProtocolViewController





-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"用户协议"];
    [self setNavRightBtnHidden:YES];
    [self.view addSubview:self.protocolWebView];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}











-(UIWebView*)protocolWebView
{
    if (_protocolWebView == nil)
    {
        _protocolWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0,50, kScreen_Width, kScreen_Height-50)];
        [_protocolWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@user/user-agreement.html",BaseUrl]]]];
    }
    return _protocolWebView;
}

@end
