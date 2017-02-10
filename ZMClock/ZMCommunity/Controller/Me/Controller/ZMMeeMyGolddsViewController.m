//
//  ZMMeeMyGolddsViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/14.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMeeMyGolddsViewController.h"


#import "ZMMeMyGolddBallTableViewCell.h"


@interface ZMMeeMyGolddsViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) UITableView *goldTableView;

@property (nonatomic, strong) UITableView *goldBollTableView;//等级球


@property (nonatomic, strong) UIImageView *userHeaderImgV;//
@property (nonatomic, strong) UIImageView *goldImgV;
@property (nonatomic, strong) UILabel *golddLb;//


@property (nonatomic, strong) UIView *bgggV;
@property (nonatomic, strong) UILabel *lbb1;
@property (nonatomic, strong) UILabel *lbb2;
@property (nonatomic, strong) UILabel *lbb3;

@property (nonatomic, strong) UIImageView *imggV11;
@property (nonatomic, strong) UIImageView *imggV22;

@property (nonatomic, strong) NSMutableArray *levelMuAry;
@property (nonatomic, strong) NSMutableArray *goldMuAry;



@end

@implementation ZMMeeMyGolddsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    //self.baseNavigation.titleLabel.text = @"我的金币";
    //self.baseNavigation.titleLabel.textColor = [UIColor blackColor];
    self.view.backgroundColor = RGB(239, 239, 239);
    [self.view addSubview:self.goldTableView];
    
    self.levelMuAry = [NSMutableArray arrayWithObjects:@"Lv2",@"Lv3",@"Lv4",@"Lv5",@"Lv6",@"Lv7",@"Lv8",@"Lv9",@"Lv10",@"Lv11",@"Lv12",@"Lv13",@"Lv14",@"Lv15",@"Lv16",@"Lv17",@"Lv18",@"Lv19",@"Lv20",@"Lv21",@"Lv22",@"Lv23",@"Lv24",@"Lv25",@"Lv26",@"Lv27",@"Lv28",@"Lv29",@"Lv30", nil];
    
    self.goldMuAry = [NSMutableArray arrayWithObjects:@"+1000",@"+1200",@"+1400",@"+1600",@"+1800",@"+2000",@"+2200",@"+2400",@"+2600",@"+2800",@"+3000",@"+3200",@"+3400",@"+3600",@"+3800",@"+4000",@"+4200",@"+4400",@"+4600",@"+4800",@"+5000",@"+5200",@"+5400",@"+5600",@"+5800",@"+6000",@"+6200",@"+6400",@"+6600", nil];
    
    
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
                NSLog(@"我的金币 ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    NSInteger gold = [[data objectForKey:@"cur_gold"] integerValue];
                    NSString *goldStr = [NSString stringWithFormat:@"%ld",(long)gold];
                    self.golddLb.text = goldStr;
                    
                    
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

- (UITableView *)goldTableView
{
    if (_goldTableView == nil) {
        _goldTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width,2 * kScreen_Height - 250 - 64)];
        _goldTableView.dataSource = self;
        _goldTableView.delegate = self;
        
        _goldTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _goldTableView.backgroundColor = RGB(239, 239, 239);
        
        
        
    }
    return _goldTableView;
}

- (UITableView *)goldBollTableView
{
    if (_goldBollTableView == nil) {
        _goldBollTableView = [[UITableView alloc] initWithFrame:CGRectMake(420, 0, 100, kScreen_Width)];
        _goldBollTableView.dataSource = self;
        _goldBollTableView.delegate = self;
        _goldBollTableView.transform = CGAffineTransformMakeRotation(-M_PI /2);//逆时针旋转90
        _goldBollTableView.center = CGPointMake(kScreen_Width/2, 420 + 50);//必须设置 center
        _goldBollTableView.showsVerticalScrollIndicator = NO;
        
        //
        _goldBollTableView.backgroundColor = [UIColor whiteColor];
        
        _goldBollTableView.separatorColor = [UIColor clearColor];

        
        
        
    }
    return _goldBollTableView;
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
    
    [self.goldTableView addSubview:self.userHeaderImgV];
    
    
    self.goldImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 30 - 10, 100, 30, 30)];
    self.goldImgV.backgroundColor = [UIColor clearColor];

    self.goldImgV.image = IMAGE(@"金币-图标");

    [self.goldTableView addSubview:self.goldImgV];
    
    
    
    //
    self.golddLb = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width/2 + 10, 145 - 50, kScreen_Width/2 - 10, 40)];
    
    self.golddLb.font = [UIFont systemFontOfSize:16];
    self.golddLb.textColor = RGB(235, 84, 129);
    self.golddLb.textAlignment = NSTextAlignmentLeft;
    
    
    [self.goldTableView addSubview:self.golddLb];
    
        
    
    
    
    
    
    self.bgggV = [[UIView alloc] initWithFrame:CGRectMake(0, 140, kScreen_Width, 2 * kScreen_Height - 190)];
    
    self.bgggV.backgroundColor = [UIColor whiteColor];
    [self.goldTableView addSubview:self.bgggV];
    
    self.lbb1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kScreen_Width - 30, 40)];
    
    self.lbb1.font = [UIFont systemFontOfSize:18];
    self.lbb1.textColor = [UIColor lightGrayColor];
    self.lbb1.textAlignment = NSTextAlignmentLeft;
    self.lbb1.text = @"如何获取金币?";
    
    [self.bgggV addSubview:self.lbb1];
    
    self.lbb2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, kScreen_Width - 30, 80)];
    
    self.lbb2.font = [UIFont systemFontOfSize:16];
    self.lbb2.textColor = [UIColor lightGrayColor];
    self.lbb2.textAlignment = NSTextAlignmentLeft;
    self.lbb2.numberOfLines = 0;
    self.lbb2.text = @"1.每天完成相应的任务可持续性的获得金币,注册成功或者完善您的个人资料,均可获得丰厚的金币奖励.";
    
    [self.bgggV addSubview:self.lbb2];
    
    
    
    
    //加载网络图片
    self.imggV11 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 120, kScreen_Width - 30, 250)];
    self.imggV11.backgroundColor = [UIColor whiteColor];
    //self.imggV11.layer.cornerRadius = 10;
    //self.imggV11.layer.masksToBounds = YES;
    [self.imggV11 sd_setImageWithURL:[NSURL URLWithString:@"http://192.168.1.222/serverpro/uploadimg/gold_achive.png"]];
    //self.imggV11.image = IMAGE(@"我的亲密度1");
    self.imggV11.userInteractionEnabled = YES;
    
    [self.bgggV addSubview:self.imggV11];
    
    
    
    self.lbb3 = [[UILabel alloc] initWithFrame:CGRectMake(15, 310 + 70, kScreen_Width - 30, 40)];
    
    self.lbb3.font = [UIFont systemFontOfSize:16];
    self.lbb3.textColor = [UIColor lightGrayColor];
    self.lbb3.textAlignment = NSTextAlignmentLeft;
    self.lbb3.numberOfLines = 0;
    self.lbb3.text = @"2.通过升级来获得金币";
    
    [self.bgggV addSubview:self.lbb3];
    
    
    [self.bgggV addSubview:self.goldBollTableView];
    
    
    
    
    
}







#pragma mark - tableViewDelegate && dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.goldBollTableView) {
        
        
        static NSString *cellidd = @"goldBall";
        
        ZMMeMyGolddBallTableViewCell *cell= [self.goldBollTableView dequeueReusableCellWithIdentifier:cellidd];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMMeMyGolddBallTableViewCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;  
            
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.levelLb.text = self.levelMuAry[indexPath.row];
        cell.goldLbb.text = self.goldMuAry[indexPath.row];

        
        return cell;
        
        
        
    }else {
        
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

    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.goldBollTableView) {
        return self.levelMuAry.count;
    }else {
    
        return 1;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (tableView == self.goldBollTableView) {
        return 100;
        
    }else {
        
        return 2 * kScreen_Height;
    }
    
    
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
