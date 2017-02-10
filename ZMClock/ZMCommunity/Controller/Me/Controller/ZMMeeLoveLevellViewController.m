//
//  ZMMeeLoveLevellViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/13.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMeeLoveLevellViewController.h"

#import "CWProgressView.h"


@interface ZMMeeLoveLevellViewController ()<UITableViewDataSource,UITableViewDelegate>
{


     CWProgressView *_lineProgressView;//进度条


}

@property (nonatomic, strong) UITableView *loveLevelTableView;

@property (nonatomic, strong) UIImageView *userHeaderImgV;//
@property (nonatomic, strong) UILabel *qinmiLelLb;//亲密度等级
@property (nonatomic, strong) UILabel *qinmiValueLb;//亲密值


@property (nonatomic, strong) UIView *bgggV;
@property (nonatomic, strong) UILabel *lbb1;
@property (nonatomic, strong) UILabel *lbb2;
@property (nonatomic, strong) UILabel *lbb3;

@property (nonatomic, strong) UIImageView *imggV11;
@property (nonatomic, strong) UIImageView *imggV22;




@end

@implementation ZMMeeLoveLevellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    //self.title = @"我的亲密度等级";
    //self.baseNavigation.titleLabel.text = @"我的亲密度等级";
    //self.baseNavigation.titleLabel.textColor = [UIColor blackColor];
    self.view.backgroundColor = RGB(239, 239, 239);
    [self.view addSubview:self.loveLevelTableView];
    
    [self addCustomUI];
    
    [self getSetttingggGetInfoDataa];
    
    
    
}

#pragma mark --------------------------数据请求
- (void)getSetttingggGetInfoDataa
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"interactive/get_info.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"interactive/get_info ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    ///////////////////////////////
                    //亲密度信息
                    NSDictionary *loveDicc = [data objectForKey:@"cur_love_info"];
                    
                    NSString *love_valueStr = [NSString stringWithFormat:@"%@",[loveDicc objectForKey:@"love_value"]];
                    NSString *upgrade_needStr = [NSString stringWithFormat:@"%@",[loveDicc objectForKey:@"upgrade_need"]];//升级所需
                    
                    
                    _lineProgressView.progress = [love_valueStr floatValue]/[upgrade_needStr floatValue];
                    
                    
                    self.qinmiValueLb.text = [NSString stringWithFormat:@"亲密值:%@/%@ (距离升级还差%d个亲密值)",love_valueStr,upgrade_needStr,((int)[upgrade_needStr integerValue] - (int)[love_valueStr integerValue])];
                    
                }
                
                
              
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];
            
        }else {
            //游客
            
        }
        
        
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
    
    
}

#pragma mark -------------------------------------UI

- (UITableView *)loveLevelTableView
{
    if (_loveLevelTableView == nil) {
        
        if ([ZMSystemTool iPhone5Device]) {
            
            _loveLevelTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width,2 * kScreen_Height - 550 )];
            
        }else if ([ZMSystemTool iPhone6Device]) {
            
            _loveLevelTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width,2 * kScreen_Height - 350 - 200)];
            
        } else {
            
            _loveLevelTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width,2 * kScreen_Height - 350)];
            
        }
        
        
        _loveLevelTableView.dataSource = self;
        _loveLevelTableView.delegate = self;
        
        _loveLevelTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _loveLevelTableView.backgroundColor = RGB(239, 239, 239);
        
        
       
    }
    return _loveLevelTableView;
}



- (void)addCustomUI
{
    //用户头像
    self.userHeaderImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 35, 20, 70, 70)];
    self.userHeaderImgV.backgroundColor = [UIColor whiteColor];
    self.userHeaderImgV.layer.cornerRadius = 10;
    self.userHeaderImgV.layer.masksToBounds = YES;
//    self.userHeaderImgV.layer.borderWidth = 1.5f;
//    self.userHeaderImgV.layer.borderColor = [UIColor whiteColor].CGColor;
    
    NSString *headerStr = [NSUserDefaults standardUserDefaults].mainUserHeadPortaitStr;

    if (headerStr == nil || headerStr == NULL || [headerStr isKindOfClass:[NSNull class]]) {
    }else {
        [self.userHeaderImgV sd_setImageWithURL:[NSURL URLWithString:headerStr]];
    }
    
    self.userHeaderImgV.userInteractionEnabled = YES;
    
    [self.loveLevelTableView addSubview:self.userHeaderImgV];

    //用户等级
    self.qinmiLelLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 140 - 55, kScreen_Width, 40)];
    NSString *loveLevelStr = [NSUserDefaults standardUserDefaults].mainUserLoveLevelStr;
    
    if (loveLevelStr == nil || loveLevelStr == NULL || [loveLevelStr isKindOfClass:[NSNull class]]) {
    }else {
        self.qinmiLelLb.text = [NSString stringWithFormat:@"Lv%@",loveLevelStr];
    }
    
    self.qinmiLelLb.font = [UIFont systemFontOfSize:16];
    self.qinmiLelLb.textColor = RGB(235, 84, 129);
    self.qinmiLelLb.textAlignment = NSTextAlignmentCenter;
    self.qinmiLelLb.userInteractionEnabled = YES;

    [self.loveLevelTableView addSubview:self.qinmiLelLb];
    
    //进度条
    if ([ZMSystemTool iPhone5Device]) {
        _lineProgressView = [[CWProgressView alloc] initWithFrame:CGRectMake(15, 170 - 55, kScreen_Width - 30, 5)];
    }else {
        _lineProgressView = [[CWProgressView alloc] initWithFrame:CGRectMake(15, 170 - 55, kScreen_Width - 30, 5)];
    }
    
    _lineProgressView.type = NZProgressTypeDefault;
    _lineProgressView.textColor = [UIColor redColor];
    _lineProgressView.progress = 0.5;
    _lineProgressView.progressColor = RGB(235, 84, 129);
    _lineProgressView.alpha = 0.8;
    
    [self.loveLevelTableView addSubview:_lineProgressView];
    

    //亲密值
    self.qinmiValueLb = [[UILabel alloc] initWithFrame:CGRectMake(15, 170, kScreen_Width - 30, 40)];
   
    if ([ZMSystemTool iPhone5Device]) {
        
        self.qinmiValueLb.font = [UIFont systemFontOfSize:13];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.qinmiValueLb.font = [UIFont systemFontOfSize:16];
        
    } else {
        self.qinmiValueLb.font = [UIFont systemFontOfSize:16];
        
    }
    
    self.qinmiValueLb.textColor = [UIColor lightGrayColor];
    self.qinmiValueLb.textAlignment = NSTextAlignmentLeft;
    self.qinmiValueLb.userInteractionEnabled = YES;
    
    [self.loveLevelTableView addSubview:self.qinmiValueLb];
    
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.bgggV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200 - 55, kScreen_Width, 2 * kScreen_Height - 200 + 1200)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.bgggV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200 - 55, kScreen_Width, 2 * kScreen_Height - 200 + 1200)];
        
    } else {
        
       self.bgggV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200 - 55, kScreen_Width, 2 * kScreen_Height - 200 )];
    }

    
    
    self.bgggV.backgroundColor = [UIColor whiteColor];
    [self.loveLevelTableView addSubview:self.bgggV];
    
    self.lbb1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kScreen_Width - 30, 40)];
    
    self.lbb1.font = [UIFont systemFontOfSize:18];
    self.lbb1.textColor = [UIColor lightGrayColor];
    self.lbb1.textAlignment = NSTextAlignmentLeft;
    self.lbb1.text = @"如何升级?";
   
    [self.bgggV addSubview:self.lbb1];
    
    self.lbb2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, kScreen_Width - 30, 80)];
    
    self.lbb2.font = [UIFont systemFontOfSize:16];
    self.lbb2.textColor = [UIColor lightGrayColor];
    self.lbb2.textAlignment = NSTextAlignmentLeft;
    self.lbb2.numberOfLines = 0;
    self.lbb2.text = @"1.级别是您尊贵身份的象征,可以享受不同的等级特权,升级主要靠亲密值的积累,而亲密值的提升则主要依靠与形象互动来进行.";
    
    [self.bgggV addSubview:self.lbb2];
    
    
    
    
    //加载网络图片
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.imggV11 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 120, kScreen_Width - 30, 160)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.imggV11 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 120, kScreen_Width - 30, 160)];
        
    } else {
        
        self.imggV11 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 120, kScreen_Width - 30, 180)];
    }
    
    
    self.imggV11.backgroundColor = [UIColor whiteColor];
    //self.imggV11.layer.cornerRadius = 10;
    //self.imggV11.layer.masksToBounds = YES;
    //[self.imggV11 sd_setImageWithURL:[NSURL URLWithString:@"http://192.168.1.222/serverpro/uploadimg/achive_love_value.png"]];
    self.imggV11.image = IMAGE(@"我的亲密度1");
    self.imggV11.userInteractionEnabled = YES;
    
    [self.bgggV addSubview:self.imggV11];
    

    
    self.lbb3 = [[UILabel alloc] initWithFrame:CGRectMake(15, 310, kScreen_Width - 30, 40)];
    
    self.lbb3.font = [UIFont systemFontOfSize:16];
    self.lbb3.textColor = [UIColor lightGrayColor];
    self.lbb3.textAlignment = NSTextAlignmentLeft;
    self.lbb3.numberOfLines = 0;
    self.lbb3.text = @"2.通过升级来获得金币";
    
    [self.bgggV addSubview:self.lbb3];

    
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.imggV22 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 350, kScreen_Width - 24, 1000)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.imggV22 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 350, kScreen_Width - 24, 1200)];
        
    } else {
        
        self.imggV22 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 350, kScreen_Width - 24, 500)];
    }
    
    
    self.imggV22.backgroundColor = [UIColor whiteColor];
    
    [self.imggV22 sd_setImageWithURL:[NSURL URLWithString:@"http://192.168.1.222/serverpro/uploadimg/love_level_upgrade.png"]];
    
    self.imggV22.userInteractionEnabled = YES;
    
    [self.bgggV addSubview:self.imggV22];
    

    
    

}







#pragma mark - tableViewDelegate && dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellidd = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidd];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidd];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 3 * kScreen_Height;
    
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
