//
//  ZMBaseeNavigationViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/30.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMBaseeNavigationViewController.h"

@interface ZMBaseeNavigationViewController ()

@property (nonatomic, strong) UIView *naviV;//navigation


//@property (nonatomic, strong) UIImageView *topHeadImggV;
@property (nonatomic, strong) UIButton *dismissBtn;
//@property (nonatomic, strong) UILabel *titleeLb;



@end

@implementation ZMBaseeNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 
    
    self.title = @"";
    [self setNavRightBtnImage:@""];
    [self setNavLeftBtnImage:@"返回-图标navigation"];
    self.baseNavigation.backGroundImageView.image = IMAGE(@"");
    self.baseNavigation.backgroundColor = NavigationBGColor;
    
    
    
    [self setupTopV];

    
    
}


- (void)dismissBtnnClicked
{
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)setupTopV
{
    self.baseNavigation.hidden = YES;
    
    ////
    self.topHeadImggV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 64)];
    
    self.topHeadImggV.backgroundColor = RGB(236, 128, 172);
    self.topHeadImggV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.topHeadImggV];
    
    ////
    self.dismissBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 50, 50)];
    self.dismissBtn.backgroundColor = [UIColor clearColor];
    [self.dismissBtn setImage:IMAGE(@"返回按键") forState:UIControlStateNormal] ;
    
    
    [self.dismissBtn addTarget:self action:@selector(dismissBtnnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.topHeadImggV addSubview:self.dismissBtn];
    
#pragma mark ---------------------------------标题
    self.titleeLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 15,  kScreen_Width , 40)];
    //self.titleeLb.text = @"爱豆昵称";
    self.titleeLb.font = [UIFont systemFontOfSize:20];
    self.titleeLb.textColor = [UIColor whiteColor];
    self.titleeLb.textAlignment = NSTextAlignmentCenter;
    
    [self.topHeadImggV addSubview:self.titleeLb];
    
    
    
    
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
