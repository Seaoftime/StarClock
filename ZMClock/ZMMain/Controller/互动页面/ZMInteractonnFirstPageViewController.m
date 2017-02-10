//
//  ZMInteractonnFirstPageViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/2.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


/////互动首页
//张锐
#import "ZMInteractonnFirstPageViewController.h"


#import "ZMInteractionFirstPageCollectionViewCell.h"
#import "ZMInteractionBuyView.h"
#import "ZMInterationItemInfoModel.h"
#import "ZMInterationItemInfoModel2.h"
#import "CWProgressView.h"
#import "ZMInterationBuyView2.h"
#import "ZMInterationBuyView3.h"

#import "ZMMeeMyGolddsViewController.h"



@interface ZMInteractonnFirstPageViewController ()
{

     CWProgressView *_lineProgressView;//进度条
    
    
    BOOL _lianjie;//点击查看金币获取方法链接
    
    
    NSInteger _goldCountW;
    
    NSInteger _goldCountW11;//点击弹窗上的 + 号按钮 第一个视图

    NSInteger _goldCountW1;//点击弹窗上的 - 号按钮 第一个视图
    
    
    NSInteger _goldCountWW;
    NSInteger _goldCountW22;
    NSInteger _goldCountW2;
    
    NSInteger _goldCountWWW;
    NSInteger _goldCountW33;
    NSInteger _goldCountW3;
    
    NSInteger _goldCountWWWW;
    NSInteger _goldCountW44;
    NSInteger _goldCountW4;
    
    NSInteger _goldCountW_sec;
    NSInteger _goldCountW11_sec;
    NSInteger _goldCountW1_sec;
    
    NSInteger _goldCountWW_sec;
    NSInteger _goldCountW22_sec;
    NSInteger _goldCountW2_sec;
    
    NSInteger _goldCountWWW_sec;
    NSInteger _goldCountW33_sec;
    NSInteger _goldCountW3_sec;
    
    NSInteger _goldCountWWWW_sec;
    NSInteger _goldCountW44_sec;
    NSInteger _goldCountW4_sec;
    
    NSInteger _goldCountW_third;
    NSInteger _goldCountW11_third;
    NSInteger _goldCountW1_third;
    
    NSInteger _goldCountWW_third;
    NSInteger _goldCountW22_third;
    NSInteger _goldCountW2_third;
    
    NSInteger _goldCountWWW_third;
    NSInteger _goldCountW33_third;
    NSInteger _goldCountW3_third;
    
    NSInteger _goldCountWWWW_third;
    NSInteger _goldCountW44_third;
    NSInteger _goldCountW4_third;

    
    
}

@property (nonatomic, strong) UIImageView *zheBgV;//购买弹窗背景
@property (nonatomic, strong) UIImageView *rewordZheBgV;//升级弹窗背景
@property (nonatomic, strong) UIImageView *rewordZheBgV22;//奖励弹窗背景

@property (nonatomic, strong) ZMInteractionBuyView *buyV;
@property (nonatomic, strong) ZMInterationBuyView2 *buyV2;
@property (nonatomic, strong) ZMInterationBuyView3 *buyV3;


@property (nonatomic, strong) UICollectionView *interactionCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *interactionFlowLayout;
@property (nonatomic, strong) UIImageView *topImgVV;
@property (nonatomic, strong) UIButton *fanhuiBtn;
@property (nonatomic, strong) UILabel *titleeLb;


@property (nonatomic, strong) UIView *bottomBgv;
@property (nonatomic, strong) UIButton *bottBtn1;
@property (nonatomic, strong) UIButton *bottBtn2;
@property (nonatomic, strong) UIButton *bottBtn3;

@property (nonatomic, strong) UIView *cellBorderV;
@property(nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) NSInteger flowerCount;//购买的鲜花个数

////////数据源
//@property (nonatomic, strong) NSMutableArray *flowerMuArray;//送花
//@property (nonatomic, strong) NSMutableArray *gitMuArray;//送礼物
//@property (nonatomic, strong) NSMutableArray *yueMuArray;//约会

//@property (nonatomic, strong) NSArray *item_detail_by_type;//道具类型

@property (nonatomic, copy)   NSString *cur_gold;//我的金币数量

@property (nonatomic, strong) NSMutableArray *itemMuArray;//
@property (nonatomic, strong) NSMutableArray *itemMuArray22;//
@property (nonatomic, copy)   NSString *item_cfg_unit_price111;//红玫瑰单价
@property (nonatomic, copy)   NSString *item_cfg_unit_price211;//幸运星单价
@property (nonatomic, copy)   NSString *item_cfg_unit_price311;//公园门票单价

@property (nonatomic, copy)   NSString *buyAddStr111;//个数
@property (nonatomic, copy)   NSString *buyAddStr211;
@property (nonatomic, copy)   NSString *buyAddStr311;
@property (nonatomic, copy)   NSString *buyAddStr121;
@property (nonatomic, copy)   NSString *buyAddStr221;
@property (nonatomic, copy)   NSString *buyAddStr321;
@property (nonatomic, copy)   NSString *buyAddStr122;
@property (nonatomic, copy)   NSString *buyAddStr222;
@property (nonatomic, copy)   NSString *buyAddStr322;
@property (nonatomic, copy)   NSString *buyAddStr131;
@property (nonatomic, copy)   NSString *buyAddStr231;
@property (nonatomic, copy)   NSString *buyAddStr331;



@property (nonatomic, copy)   NSString *item_cfg_add_love_val111;//赠送红玫瑰增加的亲密值
@property (nonatomic, copy)   NSString *item_cfg_add_love_val211;//赠送幸运星
@property (nonatomic, copy)   NSString *item_cfg_add_love_val311;


@property (nonatomic, copy)   NSString *can_handsel_count111;//今天可以赠送的数量
@property (nonatomic, copy)   NSString *item_id111;
@property (nonatomic, copy)   NSString *item_id211;
@property (nonatomic, copy)   NSString *item_id311;

@property (nonatomic, copy)   NSString *item_cfg_unit_price121;//玫瑰花语单价
@property (nonatomic, copy)   NSString *item_cfg_unit_price221;//
@property (nonatomic, copy)   NSString *item_cfg_unit_price321;//

@property (nonatomic, copy)   NSString *item_cfg_add_love_val121;//赠送玫瑰花语增加的亲密值
@property (nonatomic, copy)   NSString *item_cfg_add_love_val221;//
@property (nonatomic, copy)   NSString *item_cfg_add_love_val321;


@property (nonatomic, copy)   NSString *item_id121;
@property (nonatomic, copy)   NSString *item_id221;
@property (nonatomic, copy)   NSString *item_id321;

@property (nonatomic, copy)   NSString *item_cfg_unit_price122;//幸福环绕
@property (nonatomic, copy)   NSString *item_cfg_unit_price222;//
@property (nonatomic, copy)   NSString *item_cfg_unit_price322;//

@property (nonatomic, copy)   NSString *item_cfg_add_love_val122;//亲密值
@property (nonatomic, copy)   NSString *item_cfg_add_love_val222;//
@property (nonatomic, copy)   NSString *item_cfg_add_love_val322;

@property (nonatomic, copy)   NSString *item_id122;
@property (nonatomic, copy)   NSString *item_id222;
@property (nonatomic, copy)   NSString *item_id322;

@property (nonatomic, copy)   NSString *item_cfg_unit_price131;//一生一世
@property (nonatomic, copy)   NSString *item_cfg_unit_price231;//
@property (nonatomic, copy)   NSString *item_cfg_unit_price331;//

@property (nonatomic, copy)   NSString *item_cfg_add_love_val131;//亲密值
@property (nonatomic, copy)   NSString *item_cfg_add_love_val231;//
@property (nonatomic, copy)   NSString *item_cfg_add_love_val331;


@property (nonatomic, copy)   NSString *item_id131;
@property (nonatomic, copy)   NSString *item_id231;
@property (nonatomic, copy)   NSString *item_id331;


/////////////
@property (nonatomic, strong) UIView *bigBgV;
@property (nonatomic, strong) UIImageView *flowerImgV;
@property (nonatomic, strong) UIView *botZheV;
@property (nonatomic, strong) UILabel *flowerNameLb;

@property (nonatomic, strong) UIView *bigBgV22;
@property (nonatomic, strong) UIImageView *flowerImgV22;
@property (nonatomic, strong) UIView *botZheV22;
@property (nonatomic, strong) UILabel *flowerNameLb22;

@property (nonatomic, strong) UIView *bigBgV33;
@property (nonatomic, strong) UIImageView *flowerImgV33;
@property (nonatomic, strong) UIView *botZheV33;
@property (nonatomic, strong) UILabel *flowerNameLb33;


@property (nonatomic, strong) UIView *bigBgV44;
@property (nonatomic, strong) UIImageView *flowerImgV44;
@property (nonatomic, strong) UIView *botZheV44;
@property (nonatomic, strong) UILabel *flowerNameLb44;

@property (nonatomic, strong) UIButton *buyAddBtn;//➕
@property (nonatomic, strong) UIButton *buyAddBtn2;
@property (nonatomic, strong) UIButton *buyAddBtn3;
@property (nonatomic, strong) UIButton *buyAddBtn4;

@property (nonatomic, strong) UIButton *giveeBtn;
@property (nonatomic, strong) UIButton *buyyyBtn;
@property (nonatomic, strong) UILabel *lineLbb;

@property (nonatomic, strong) UILabel *lbbb11;
@property (nonatomic, strong) UILabel *lbbb22;
@property (nonatomic, strong) UILabel *lbbb33;

//////可以赠送的次数
@property (nonatomic, copy)   NSString *send_CountStt;
@property (nonatomic, copy)   NSString *send_CountStt2;
@property (nonatomic, copy)   NSString *send_CountStt3;



//亲密度等级
@property (nonatomic, strong) UILabel *loveLevelLbb;
@property (nonatomic, strong) UILabel *loveValueLbb;
@property (nonatomic, copy)   NSString *love_levelStr;
@property (nonatomic, copy)   NSString *love_valueStr;
@property (nonatomic, copy)   NSString *upgrade_needStr;
@property (nonatomic, copy)   NSString *loveAllValueStr;//总的亲密值


@end

@implementation ZMInteractonnFirstPageViewController


- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    self.baseNavigation.hidden = YES;
    
    
//默认是选中第一种鲜花
    
    if (_lianjie == NO) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self bigBgVTaped];
        });

    }else {
    
        
    
    }
    
    
    
    
    self.zheBgV.hidden = YES;//金币获取方法  返回时关闭购买页面
    
    
    

}

- (void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    //self.title = @"互动";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.flowerCount = 1;
    
    
    _lianjie = NO;
    
    
    
    //self.flowerMuArray = [NSMutableArray arrayWithObjects:@"红玫瑰", @"玫瑰花语", @"幸福环绕", @"一生一世", nil];
    
    //self.isSelected = NO;
    
    //[self.view addSubview:self.interactionCollectionView];
    [self addFourBigImggV];
    
    [self addBuyyAddBtnn];
    [self addShowwLbbb];
    [self addTopOperationBgV];
    [self addBottommOperationBgV];
    [self addLovelyLevelView];//进度条   亲密度等级
    
    
    [self addZheView];//购买弹窗
    [self addRewordZheView];//升级弹窗
    [self addRewordZheView22];//奖励弹窗
    
    
    [self getInteractiveGetInfoDataa];//获取交互页面的用户信息
    
    ////购买页面
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(interactionCloseButtonClicked) name:@"interactionCloseButtonClicked" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(interactionSubBtnnnClicked) name:@"interactionSubBtn" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(interactionAddBtnCliccked) name:@"interactionAddBtnadd" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buyyBtntnClickedtt) name:@"buyyBtntnClickedtt" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sorryNoBuyLianjieLbTappedddddd) name:@"sorryNoBuyLianjieLbTapped" object:nil];
    
    
    
    
    //////奖励页面
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(okBtnClickedd) name:@"okBtnClickedd" object:nil];
    
    
    
    
    
   
    
}


#pragma mark --------------------------------数据请求
//获取用户互动页面信息

- (void)getInteractiveGetInfoDataa
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"interactive/get_info.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"**互动信息** ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    ///////////////////////////////
                    //亲密度信息
                    NSDictionary *loveDicc = [data objectForKey:@"cur_love_info"];
                    
                    self.love_levelStr = [NSString stringWithFormat:@"%@",[loveDicc objectForKey:@"love_level"]];
                    self.love_valueStr = [NSString stringWithFormat:@"%@",[loveDicc objectForKey:@"love_value"]];
                    self.upgrade_needStr = [NSString stringWithFormat:@"%@",[loveDicc objectForKey:@"upgrade_need"]];//升级所需
                    
                    self.loveLevelLbb.text = [NSString stringWithFormat:@"我的等级%@",self.love_levelStr];
                    //NSInteger loveAllValue = [self.love_valueStr integerValue] + [self.upgrade_needStr integerValue];
                    //self.loveAllValueStr = [NSString stringWithFormat:@"%ld",(long)loveAllValue];
                    
                    self.loveValueLbb.text = [NSString stringWithFormat:@"亲密值:%@/%@",self.love_valueStr,self.upgrade_needStr];
                    
                    _lineProgressView.progress = [self.love_valueStr floatValue]/[self.upgrade_needStr floatValue];
                    
                    
                    
                    //////////////////////////////////
                    self.cur_gold = [NSString stringWithFormat:@"%@",[data objectForKey:@"cur_gold"]];
                    NSLog(@"金币:%@",self.cur_gold);
                    
                    self.buyV.goldLb.text = self.cur_gold;
                    
                    
                    //////////////////////////////
                    self.itemMuArray = [ZMInterationItemInfoModel parseRespondsInterationItemInfoData:object];
                    
                    self.itemMuArray22 = [ZMInterationItemInfoModel2 parseRespondsInterationItemInfo22Data:object];
                    
                    
                    NSLog(@"解析:%@", self.itemMuArray);
                    
                    
                    //////鲜花
                    ZMInterationItemInfoModel *itemInfoModel1 = [[ZMInterationItemInfoModel alloc] init];
                    
                    itemInfoModel1 = self.itemMuArray[0];
                    
                    self.send_CountStt = [NSString stringWithFormat:@"%@",itemInfoModel1.can_handsel_count];
                    
                    NSLog(@"可以赠送的次数:%@",self.send_CountStt);
                    
                    self.lbbb33.text = [NSString stringWithFormat:@"今天还能送%@次",self.send_CountStt];
                    
                    
                    ///////礼物
                    ZMInterationItemInfoModel *itemInfoModel2 = [[ZMInterationItemInfoModel alloc] init];
                    
                    itemInfoModel2 = self.itemMuArray[1];
                    
                    //self.send_CountStt2 = itemInfoModel2.can_handsel_count;
                    self.send_CountStt2 = [NSString stringWithFormat:@"%@",itemInfoModel2.can_handsel_count];
                    
                    NSLog(@"可以赠送的次数:%@",self.send_CountStt2);
                    
                    
                    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
                        self.lbbb33.text = [NSString stringWithFormat:@"今天还能送%@次",self.send_CountStt2];
                    }
                    
                    
                    
                    //////约会
                    ZMInterationItemInfoModel *itemInfoModel3 = [[ZMInterationItemInfoModel alloc] init];
                    
                    itemInfoModel3 = self.itemMuArray[2];
                    
                    self.send_CountStt3 = [NSString stringWithFormat:@"%@",itemInfoModel3.can_handsel_count];
                    
                    NSLog(@"可以赠送的次数:%@",self.send_CountStt3);

                    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
                        self.lbbb33.text = [NSString stringWithFormat:@"今天还能送%@次",self.send_CountStt3];
                    }
                    
                    
                    
                    
                    
                    
                    ///////////////红玫瑰
                    ZMInterationItemInfoModel2 *itemInfoModel111 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel111 = self.itemMuArray22[0];
                    ////0 - 3 送花  4 - 7 送礼物
                    
                    
                    //NSLog(@"按钮标题:%@",  itemInfoModel111.item_count);
                    
                    self.buyAddStr111 = [NSString stringWithFormat:@"%@",itemInfoModel111.item_count];
                    NSLog(@"红玫瑰个数__%@",self.buyAddStr111);
                    
                    self.item_cfg_unit_price111 = itemInfoModel111.item_cfg_unit_price;
                    self.item_cfg_add_love_val111 = itemInfoModel111.item_cfg_add_love_val;
                    self.item_id111 = itemInfoModel111.item_id;
                    
                    
                    self.buyV.allGoldLb.text = self.item_cfg_unit_price111;
                    //self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val111];
                    
                    
                    
                    if ([self.buyAddStr111 isEqualToString:@"0"]) {
                        
                        [self.buyAddBtn setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                        
                        [self.buyAddBtn setTitle:@"" forState:UIControlStateNormal];
                        
                        //暂时加上 为了调整赠送按钮状态  可以去掉
                        ///赠送按钮状态
                        self.giveeBtn.enabled = NO;
                        [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];

                        
                        
                    }else {
                    
                        [self.buyAddBtn setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                        
                        [self.buyAddBtn setTitle:self.buyAddStr111 forState:UIControlStateNormal];
                        
                        //暂时加上 为了调整赠送按钮状态  可以去掉
                        ///赠送按钮状态
                        self.giveeBtn.enabled = YES;
                        [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                        
                        
                        
                    }
                    
                    
                    
                    
                    ///////////////幸运星
                    ZMInterationItemInfoModel2 *itemInfoModel211 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel211 = self.itemMuArray22[4];
                    
                    self.buyAddStr211 = [NSString stringWithFormat:@"%@",itemInfoModel211.item_count];
                    
                    NSLog(@"幸运星个数:%@",self.buyAddStr211);
                    
                    self.item_cfg_add_love_val211 = itemInfoModel211.item_cfg_add_love_val;
                    self.item_cfg_unit_price211 = itemInfoModel211.item_cfg_unit_price;
                    self.item_id211 = itemInfoModel211.item_id;
                    
                    
                    if ([self.lbbb11.text isEqualToString:@"幸运星"] && [self.buyV.titleLb.text isEqualToString:@"幸运星购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price211;
                        
                    }
                    
                    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
                        
                        
                        if ([self.buyAddStr211 isEqualToString:@"0"]) {
                            
                            [self.buyAddBtn setTitle:@"" forState:UIControlStateNormal];
                            
                            [self.buyAddBtn setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = NO;
                            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                            
                            
                        }else {
                            
                            [self.buyAddBtn setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                            
                            [self.buyAddBtn setTitle:self.buyAddStr211 forState:UIControlStateNormal];
                            
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = YES;
                            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                            
                        }
                        
                        
                    }

                    ////////////////公园
                    
                    ZMInterationItemInfoModel2 *itemInfoModel311 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel311 = self.itemMuArray22[8];
                    
                    self.buyAddStr311 = [NSString stringWithFormat:@"%@",itemInfoModel311.item_count];
                    
                    NSLog(@"公园门票个数:%@",self.buyAddStr311);
                    
                    self.item_cfg_add_love_val311 = itemInfoModel311.item_cfg_add_love_val;
                    self.item_cfg_unit_price311 = itemInfoModel311.item_cfg_unit_price;
                    self.item_id311 = itemInfoModel311.item_id;
                    
                    if ([self.lbbb11.text isEqualToString:@"公园"] && [self.buyV.titleLb.text isEqualToString:@"公园门票购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price311;
                        
                    }
                    
                    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
                        
                        
                        if ([self.buyAddStr311 isEqualToString:@"0"]) {
                            
                            [self.buyAddBtn setTitle:@"" forState:UIControlStateNormal];
                            
                            [self.buyAddBtn setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = NO;
                            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                            
                            
                            
                        }else {
                            
                            [self.buyAddBtn setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                            
                            [self.buyAddBtn setTitle:self.buyAddStr311 forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = YES;
                            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                            
                        }
                        
                        
                    }

                    
                    
                    ///////////////玫瑰花语
                    ZMInterationItemInfoModel2 *itemInfoModel121 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel121 = self.itemMuArray22[1];
                    
                    self.buyAddStr121 = [NSString stringWithFormat:@"%@",itemInfoModel121.item_count];
                    
                    self.item_cfg_unit_price121 = itemInfoModel121.item_cfg_unit_price;
                    self.item_cfg_add_love_val121 = itemInfoModel121.item_cfg_add_love_val;
                    
                    self.item_id121 = itemInfoModel121.item_id;
                    
                    if ([self.lbbb11.text isEqualToString:@"玫瑰花语"] && [self.buyV.titleLb.text isEqualToString:@"玫瑰花语购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price121;
                    }
                    
                    
                    
                    
                    
                    if ([self.buyAddStr121 isEqualToString:@"0"]) {
                        
                        [self.buyAddBtn2 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                        
                        [self.buyAddBtn2 setTitle:@"" forState:UIControlStateNormal];
                        
                        ///赠送按钮状态
                        self.giveeBtn.enabled = NO;
                        [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                        
                        
                        
                    }else {
                        
                        [self.buyAddBtn2 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                        
                        [self.buyAddBtn2 setTitle:self.buyAddStr121 forState:UIControlStateNormal];
                        
                        ///赠送按钮状态
                        self.giveeBtn.enabled = YES;
                        [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                        
                    }

                    
                    
                    ///蛋糕
                    ZMInterationItemInfoModel2 *itemInfoModel221 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel221 = self.itemMuArray22[5];
                    
                    self.buyAddStr221 = [NSString stringWithFormat:@"%@",itemInfoModel221.item_count];
                    self.item_cfg_add_love_val221 = itemInfoModel221.item_cfg_add_love_val;
                    self.item_cfg_unit_price221 = itemInfoModel221.item_cfg_unit_price;
                    self.item_id221 = itemInfoModel221.item_id;
                    
                    
                    if ([self.lbbb11.text isEqualToString:@"蛋糕"] && [self.buyV.titleLb.text isEqualToString:@"蛋糕购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price221;

                    }
                    
                    
                    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
                        if ([self.buyAddStr221 isEqualToString:@"0"]) {
                            
                            [self.buyAddBtn2 setTitle:@"" forState:UIControlStateNormal];
                            
                            [self.buyAddBtn2 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = NO;
                            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                            
                            
                        }else {
                            
                            [self.buyAddBtn2 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                            
                            [self.buyAddBtn2 setTitle:self.buyAddStr221 forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = YES;
                            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                            
                        }
                        
                        
                    }

                    
                    
                    ////////////////电影院
                    
                    ZMInterationItemInfoModel2 *itemInfoModel321 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel321 = self.itemMuArray22[9];
                    
                    self.buyAddStr321 = [NSString stringWithFormat:@"%@",itemInfoModel321.item_count];
                    
                    NSLog(@"电影院门票个数:%@",self.buyAddStr321);
                    
                    self.item_cfg_add_love_val321 = itemInfoModel321.item_cfg_add_love_val;
                    self.item_cfg_unit_price321 = itemInfoModel321.item_cfg_unit_price;
                    self.item_id321 = itemInfoModel321.item_id;
                    
                    if ([self.lbbb11.text isEqualToString:@"电影院"] && [self.buyV.titleLb.text isEqualToString:@"电影院门票购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price321;
                        
                    }
                    
                    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
                        
                        
                        if ([self.buyAddStr321 isEqualToString:@"0"]) {
                            
                            [self.buyAddBtn2 setTitle:@"" forState:UIControlStateNormal];
                            
                            [self.buyAddBtn2 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                            
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = NO;
                            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                            
                            
                            
                            
                        }else {
                            
                            [self.buyAddBtn2 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                            
                            [self.buyAddBtn2 setTitle:self.buyAddStr321 forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = YES;
                            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                            
                        }
                        
                        
                    }
                    

                    
                    
                    ///////////////幸福环绕
                    ZMInterationItemInfoModel2 *itemInfoModel122 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel122 = self.itemMuArray22[2];
                    
                    self.buyAddStr122 = [NSString stringWithFormat:@"%@",itemInfoModel122.item_count];
                    
                    self.item_cfg_unit_price122 = itemInfoModel122.item_cfg_unit_price;
                    self.item_cfg_add_love_val122 = itemInfoModel122.item_cfg_add_love_val;
                    self.item_id122 = itemInfoModel122.item_id;
                    
                    //
                    if ([self.lbbb11.text isEqualToString:@"幸福环绕"] && [self.buyV.titleLb.text isEqualToString:@"幸福环绕购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price122;
                    }
                    
                    

                    
                    
                    if ([self.buyAddStr122 isEqualToString:@"0"]) {
                        
                        [self.buyAddBtn3 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                        
                        [self.buyAddBtn3 setTitle:@"" forState:UIControlStateNormal];
                        
                        ///赠送按钮状态
                        self.giveeBtn.enabled = NO;
                        [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                        
                        
                        
                    }else {
                        
                        [self.buyAddBtn3 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                        
                        [self.buyAddBtn3 setTitle:self.buyAddStr122 forState:UIControlStateNormal];
                        
                        ///赠送按钮状态
                        self.giveeBtn.enabled = YES;
                        [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                        
                    }

                    
                    
                    ///巧克力
                    ZMInterationItemInfoModel2 *itemInfoModel222 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel222 = self.itemMuArray22[6];
                    
                    self.buyAddStr222 = [NSString stringWithFormat:@"%@",itemInfoModel222.item_count];
                    self.item_cfg_add_love_val222 = itemInfoModel222.item_cfg_add_love_val;
                    self.item_cfg_unit_price222 = itemInfoModel222.item_cfg_unit_price;
                    self.item_id222 = itemInfoModel222.item_id;
                    
                    
                    
                    if ([self.lbbb11.text isEqualToString:@"巧克力"] && [self.buyV.titleLb.text isEqualToString:@"巧克力购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price222;
                    }
                    
                    
                    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
                        if ([self.buyAddStr222 isEqualToString:@"0"]) {
                            
                            [self.buyAddBtn3 setTitle:@"" forState:UIControlStateNormal];
                            
                            [self.buyAddBtn3 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = NO;
                            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                            
                            
                            
                        }else {
                            
                            [self.buyAddBtn3 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                            
                            [self.buyAddBtn3 setTitle:self.buyAddStr222 forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = YES;
                            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                            
                        }
                        
                        
                    }

                    
                    ////////////////游乐场
                    
                    ZMInterationItemInfoModel2 *itemInfoModel322 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel322 = self.itemMuArray22[10];
                    
                    self.buyAddStr322 = [NSString stringWithFormat:@"%@",itemInfoModel322.item_count];
                    
                    NSLog(@"游乐场门票个数:%@",self.buyAddStr322);
                    
                    self.item_cfg_add_love_val322 = itemInfoModel322.item_cfg_add_love_val;
                    self.item_cfg_unit_price322 = itemInfoModel322.item_cfg_unit_price;
                    self.item_id322 = itemInfoModel322.item_id;
                    
                    if ([self.lbbb11.text isEqualToString:@"游乐场"] && [self.buyV.titleLb.text isEqualToString:@"游乐场门票购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price322;
                        
                    }
                    
                    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
                        
                        
                        if ([self.buyAddStr322 isEqualToString:@"0"]) {
                            
                            [self.buyAddBtn3 setTitle:@"" forState:UIControlStateNormal];
                            
                            [self.buyAddBtn3 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = NO;
                            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                            
                            
                            
                        }else {
                            
                            [self.buyAddBtn3 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                            
                            [self.buyAddBtn3 setTitle:self.buyAddStr322 forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = YES;
                            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                            
                        }
                        
                        
                    }
                    

                    
                    
                    ///////////////一生一世
                    ZMInterationItemInfoModel2 *itemInfoModel131 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel131 = self.itemMuArray22[3];
                    
                    self.buyAddStr131 = [NSString stringWithFormat:@"%@",itemInfoModel131.item_count];
                    
                    self.item_cfg_unit_price131 = itemInfoModel131.item_cfg_unit_price;
                    self.item_cfg_add_love_val131 = itemInfoModel131.item_cfg_add_love_val;
                    
                    self.item_id131 = itemInfoModel131.item_id;
                    
                    if ([self.lbbb11.text isEqualToString:@"一生一世"] && [self.buyV.titleLb.text isEqualToString:@"一生一世购买"]) {
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price131;
                    }
                    
                    
                    if ([self.buyAddStr131 isEqualToString:@"0"]) {
                        
                        [self.buyAddBtn4 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                        [self.buyAddBtn4 setTitle:@"" forState:UIControlStateNormal];
                        
                        
                        ///赠送按钮状态
                        self.giveeBtn.enabled = NO;
                        [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                        
                        
                    }else {
                        
                        [self.buyAddBtn4 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                        
                        [self.buyAddBtn4 setTitle:self.buyAddStr131 forState:UIControlStateNormal];
                        
                        ///赠送按钮状态
                        self.giveeBtn.enabled = YES;
                        [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                        
                    }

                    
                    
                    ///钻戒
                    ZMInterationItemInfoModel2 *itemInfoModel231 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel231 = self.itemMuArray22[7];
                    
                    self.buyAddStr231 = [NSString stringWithFormat:@"%@",itemInfoModel231.item_count];
                    self.item_cfg_add_love_val231 = itemInfoModel231.item_cfg_add_love_val;
                    self.item_cfg_unit_price231 = itemInfoModel231.item_cfg_unit_price;
                    self.item_id231 = itemInfoModel231.item_id;
                    
                    
                    if ([self.lbbb11.text isEqualToString:@"钻戒"] && [self.buyV.titleLb.text isEqualToString:@"钻戒购买"]) {

                        self.buyV.allGoldLb.text = self.item_cfg_unit_price231;
                    }
                    
                    
                    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
                        if ([self.buyAddStr231 isEqualToString:@"0"]) {
                            
                            [self.buyAddBtn4 setTitle:@"" forState:UIControlStateNormal];
                            
                            [self.buyAddBtn4 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = NO;
                            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                            
                            
                            
                        }else {
                            
                            [self.buyAddBtn4 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                            
                            [self.buyAddBtn4 setTitle:self.buyAddStr231 forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = YES;
                            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                            
                        }
                        
                        
                    }

                    
                    
                    ////////////////欧洲游
                    
                    ZMInterationItemInfoModel2 *itemInfoModel331 = [[ZMInterationItemInfoModel2 alloc] init];
                    
                    itemInfoModel331 = self.itemMuArray22[11];
                    
                    self.buyAddStr331 = [NSString stringWithFormat:@"%@",itemInfoModel331.item_count];
                    
                    NSLog(@"欧洲游门票个数:%@",self.buyAddStr331);
                    
                    self.item_cfg_add_love_val331 = itemInfoModel331.item_cfg_add_love_val;
                    self.item_cfg_unit_price331 = itemInfoModel331.item_cfg_unit_price;
                    self.item_id331 = itemInfoModel331.item_id;
                    
                    if ([self.lbbb11.text isEqualToString:@"欧洲游"] && [self.buyV.titleLb.text isEqualToString:@"欧洲游门票购买"]) {
                        
                        self.buyV.allGoldLb.text = self.item_cfg_unit_price331;
                        
                    }
                    
                    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
                        
                        
                        if ([self.buyAddStr331 isEqualToString:@"0"]) {
                            
                            [self.buyAddBtn4 setTitle:@"" forState:UIControlStateNormal];
                            
                            [self.buyAddBtn4 setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = NO;
                            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
                            
                            
                            
                        }else {
                            
                            [self.buyAddBtn4 setBackgroundImage:IMAGE(@"") forState:UIControlStateNormal];
                            
                            [self.buyAddBtn4 setTitle:self.buyAddStr331 forState:UIControlStateNormal];
                            
                            ///赠送按钮状态
                            self.giveeBtn.enabled = YES;
                            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
                            
                        }
                        
                        
                    }

                    
                    
                    
                    
                    
                    
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


//////////////购买道具

- (void)getInteractiveGetSomeeItemId:(NSString *)itemId AndItemCount:(NSString *)itemCount
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign ,@"item_id":itemId, @"count":itemCount};
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"interactive/buy_items.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"interactive/buy_items ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    NSString *cur_gold = [data objectForKey:@"cur_gold"];
                    NSLog(@"金币:%@",cur_gold);
                    
                    
                    
                    
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

#pragma mark ----------------------------------------赠送接口
////////赠送道具
- (void)getInteractiveGiveItemsWithItemId:(NSString *)itemId
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign ,@"item_id":itemId };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"interactive/hand_sel_items.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"赠送花 ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    
                    NSString *is_love_level_upgradeStt = [NSString stringWithFormat:@"%@",[data objectForKey:@"is_love_level_upgrade"]];//亲密度是否升级 0  1
                    
                    NSString *add_gold_interactive_3Str = [NSString stringWithFormat:@"%@",[data objectForKey:@"add_gold_interactive_3"]];//所有类型的互动在当天达到3次获得的金币奖励
                    
                    NSString *add_gold_upgradeStr = [NSString stringWithFormat:@"%@",[data objectForKey:@"add_gold_upgrade"]];//升级获得的金币奖励
                    
                    
                    
                    
                    NSString *love_levelStt = [NSString stringWithFormat:@"%@",[data objectForKey:@"love_level"]];//亲密度等级
                    //NSString *love_valueStt = [NSString stringWithFormat:@"%@",[data objectForKey:@"love_value"]];//亲密值
                    //NSString *upgrade_need_love_valueStt =  [NSString stringWithFormat:@"%@",[data objectForKey:@"upgrade_need_love_value"]];//升级所需亲密度数值
                    

                    
                    NSDictionary *add_items = [data objectForKey:@"add_items"];//升级获得的随机道具
                    
                    NSString *item_id =  [NSString stringWithFormat:@"%@",[add_items objectForKey:@"item_id"]];//道具 id
                    
                    NSString *add_count =  [NSString stringWithFormat:@"%@",[add_items objectForKey:@"add_count"]];//道具 数量
                    
                    
                    NSLog(@"id %@ count %@",item_id,add_count);
                    

//                    for (NSDictionary *addItemDic in add_itemsArray) {
//                        NSString *add_countStt = [addItemDic objectForKey:@"add_count"];//升级获得道具的道具数量
//                        NSString *item_idStt = [addItemDic objectForKey:@"item_id"];//升级获得道具的道具编号
//                        
//                        
//                    }
                    
                    
                    
                    if ([is_love_level_upgradeStt isEqualToString:@"1"]) {
                        //升级弹窗
                        
                        self.buyV2.mineLb.text = [NSString stringWithFormat:@"升级到%@级了,以下奖励归您啦!",love_levelStt];
                        self.buyV2.goldLb.text = [NSString stringWithFormat:@"+%@",add_gold_upgradeStr];
                        
                        
                        //self.buyV2.flowerImgV //图片
                        //self.buyV2.needGoldLb //电影票一份
                        self.rewordZheBgV.hidden = NO;
                        
                        
                        //刷新界面
                        [self getInteractiveGetInfoDataa];
                        
                    }
                    
                    
                    
                    
                    if ([add_gold_interactive_3Str isEqualToString:@"0"]) {
                        //
                    }else {//金币奖励
                        
                        self.buyV3.goldLb.text = [NSString stringWithFormat:@"+%@",add_gold_interactive_3Str];
                        
                        
                        
                        self.rewordZheBgV22.hidden = NO;
                    
                    
                    
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                   
                    
                    
                    
                    
                    
                    
                    
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





#pragma mark -----------------------------------------UI

- (void)addLovelyLevelView
{
    
    if ([ZMSystemTool iPhone5Device]) {
        self.loveLevelLbb = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 60 - 60, kScreen_Width - 40, 40)];
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.loveLevelLbb = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 50 - 10, kScreen_Width - 40, 40)];
        
    } else {
    
        self.loveLevelLbb = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 50, kScreen_Width - 40, 40)];
    }
    
    self.loveLevelLbb.backgroundColor = [UIColor clearColor];
    self.loveLevelLbb.font = [UIFont systemFontOfSize:18];
    self.loveLevelLbb.text = @"我的等级";
    self.loveLevelLbb.textColor = [UIColor blackColor];
    self.loveLevelLbb.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.loveLevelLbb];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        _lineProgressView = [[CWProgressView alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 100 - 60, kScreen_Width - 30, 5)];
    } else if ([ZMSystemTool iPhone6Device]) {
        
        _lineProgressView = [[CWProgressView alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 90 - 10, kScreen_Width - 30, 5)];
        
    } else {
        _lineProgressView = [[CWProgressView alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 90, kScreen_Width - 30, 5)];
    }
    
    _lineProgressView.type = NZProgressTypeDefault;
    _lineProgressView.textColor = [UIColor redColor];
    _lineProgressView.progress = 0.5;
    _lineProgressView.progressColor = RGB(235, 84, 129);
    _lineProgressView.alpha = 0.8;
    
    [self.view addSubview:_lineProgressView];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        self.loveValueLbb = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 50 + 50 - 60, kScreen_Width - 40, 40)];
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.loveValueLbb = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 50 + 40 - 10, kScreen_Width - 40, 40)];
        
    } else {
        self.loveValueLbb = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 + 50 + 40, kScreen_Width - 40, 40)];
    }
    
    self.loveValueLbb.backgroundColor = [UIColor clearColor];
    self.loveValueLbb.font = [UIFont systemFontOfSize:15];
    self.loveValueLbb.text = @"亲密值:666/6666";
    self.loveValueLbb.textColor = [UIColor lightGrayColor];
    self.loveValueLbb.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.loveValueLbb];





}

- (void)addShowwLbbb
{
    if ([ZMSystemTool iPhone5Device]) {
        self.lbbb11 = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 - 30, kScreen_Width - 40, 40)];
    }else {
    
        self.lbbb11 = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24, kScreen_Width - 40, 40)];
    }
    
    self.lbbb11.backgroundColor = [UIColor clearColor];
    self.lbbb11.font = [UIFont systemFontOfSize:18];
    self.lbbb11.text = @"红玫瑰";
    self.lbbb11.textColor = [UIColor blackColor];
    self.lbbb11.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.lbbb11];
    
    if ([ZMSystemTool iPhone5Device]) {
        self.lbbb22 = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 30 - 30, kScreen_Width - 50, 40)];
    }else {
        self.lbbb22 = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 30, kScreen_Width - 50, 40)];
    }
    
    self.lbbb22.backgroundColor = [UIColor clearColor];
    self.lbbb22.font = [UIFont systemFontOfSize:14];
    self.lbbb22.text = @"增加亲密值: 5";
    self.lbbb22.textColor = [UIColor lightGrayColor];
    self.lbbb22.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.lbbb22];
    
    if ([ZMSystemTool iPhone5Device]) {
        self.lbbb33 = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50 - 30, kScreen_Width - 50, 40)];
    }else {
        self.lbbb33 = [[UILabel alloc] initWithFrame:CGRectMake(15, 64 + 12 + 2 * kScreen_Height/4 + 24 + 50, kScreen_Width - 50, 40)];
    }
    
    self.lbbb33.backgroundColor = [UIColor clearColor];
    self.lbbb33.font = [UIFont systemFontOfSize:14];
    self.lbbb33.text = @"今天还能送5次";
    self.lbbb33.textColor = [UIColor lightGrayColor];
    self.lbbb33.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.lbbb33];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        self.buyyyBtn = [[UIButton alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24, 64 + 12 + 2 * kScreen_Height/4 + 24 + 40 - 30, 40, 30)];
    }else {
        self.buyyyBtn = [[UIButton alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24, 64 + 12 + 2 * kScreen_Height/4 + 24 + 40 , 40, 30)];
    }
    
    self.buyyyBtn.backgroundColor = [UIColor clearColor];
    [self.buyyyBtn setTitle:@"购买" forState:UIControlStateNormal] ;
    [self.buyyyBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
    
    [self.buyyyBtn addTarget:self action:@selector(buyyyBtnrClickeeed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buyyyBtn];
    
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.lineLbb = [[UILabel alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24 + 40 + 35 - 20, 64 + 12 + 2 * kScreen_Height/4 + 24 + 10 , 1, 30)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.lineLbb = [[UILabel alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24 + 40 + 35 - 10, 64 + 12 + 2 * kScreen_Height/4 + 24 + 40 , 1, 30)];
        
    } else {
        
        self.lineLbb = [[UILabel alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24 + 40 + 35, 64 + 12 + 2 * kScreen_Height/4 + 24 + 40 , 1, 30)];
    }

    //self.lineLbb = [[UILabel alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24 + 40 + 35, 64 + 12 + 2 * kScreen_Height/4 + 24 + 40 , 1, 30)];
    self.lineLbb.backgroundColor = RGB(238, 238, 238);
    [self.view addSubview:self.lineLbb];
    
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        self.giveeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 24 - 50, 64 + 12 + 2 * kScreen_Height/4 + 24 + 40 - 30, 40, 30)];
    }else {
        self.giveeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 24 - 60, 64 + 12 + 2 * kScreen_Height/4 + 24 + 40, 40, 30)];
    }
    
    self.giveeBtn.backgroundColor = [UIColor clearColor];
    [self.giveeBtn setTitle:@"赠送" forState:UIControlStateNormal];
    [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
    
    [self.giveeBtn addTarget:self action:@selector(giveeBtnvClickeeed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.giveeBtn];
    
    

    
    

}



- (void)addBuyyAddBtnn
{

    //➕
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.buyAddBtn = [[UIButton alloc] initWithFrame:CGRectMake(24 + self.bigBgV.frame.size.width - 25, 64 + 12 -5, 28, 28)];
        
        self.buyAddBtn.layer.cornerRadius = 14;
        
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.buyAddBtn = [[UIButton alloc] initWithFrame:CGRectMake(24 + self.bigBgV.frame.size.width - 30 + 5, 64 + 12 -5, 28, 28)];
        self.buyAddBtn.layer.cornerRadius = 14;
        
    } else {
        self.buyAddBtn = [[UIButton alloc] initWithFrame:CGRectMake(24 + self.bigBgV.frame.size.width - 30, 64 + 12 -5, 36, 36)];
        self.buyAddBtn.layer.cornerRadius = 18;
        
    }
    
    self.buyAddBtn.backgroundColor = RGB(229, 84, 129);
    
    self.buyAddBtn.layer.masksToBounds = YES;
    [self.buyAddBtn setBackgroundImage:IMAGE(@"加号inter") forState:UIControlStateNormal];
    [self.buyAddBtn addTarget:self action:@selector(buyAddBtnClickkedd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buyAddBtn];
    
    self.buyAddBtn.hidden = YES;
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.buyAddBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 24 - 36 + 12, 64 + 12 -5, 28, 28)];
        self.buyAddBtn2.layer.cornerRadius = 14;
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.buyAddBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 24 - 36 + 10, 64 + 12 -5, 28, 28)];
        self.buyAddBtn2.layer.cornerRadius = 14;
        
    } else {
        self.buyAddBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 24 - 36 + 5, 64 + 12 -5, 36, 36)];
        self.buyAddBtn2.layer.cornerRadius = 18;
        
    }
    
    self.buyAddBtn2.backgroundColor = RGB(229, 84, 129);
    //self.buyAddBtn2.layer.cornerRadius = 18;
    self.buyAddBtn2.layer.masksToBounds = YES;
    [self.buyAddBtn2 addTarget:self action:@selector(buyAddBtn2bClickkedd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buyAddBtn2];
    
    self.buyAddBtn2.hidden = YES;
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.buyAddBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(24 + self.bigBgV.frame.size.width - 30 + 5, 64 + 12 + kScreen_Height/4 + 12 - 15, 28, 28)];
        self.buyAddBtn3.layer.cornerRadius = 14;
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.buyAddBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(24 + self.bigBgV.frame.size.width - 30 + 5, 64 + 12 + kScreen_Height/4 + 12 - 5, 28, 28)];
        self.buyAddBtn3.layer.cornerRadius = 14;
        
    } else {
        self.buyAddBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(24 + self.bigBgV.frame.size.width - 30, 64 + 12 + kScreen_Height/4 + 12 - 5, 36, 36)];
        self.buyAddBtn3.layer.cornerRadius = 18;
        
    }
    self.buyAddBtn3.backgroundColor = RGB(229, 84, 129);
    //self.buyAddBtn3.layer.cornerRadius = 18;
    self.buyAddBtn3.layer.masksToBounds = YES;
    [self.buyAddBtn3 addTarget:self action:@selector(buyAddBtn3bClickkedd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buyAddBtn3];
    
    self.buyAddBtn3.hidden = YES;
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.buyAddBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 24 - 36 + 10, 64 + 12 + kScreen_Height/4 + 12 - 15, 28, 28)];
        self.buyAddBtn4.layer.cornerRadius = 14;
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.buyAddBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 24 - 36 + 10, 64 + 12 + kScreen_Height/4 + 12 -5, 28, 28)];
        self.buyAddBtn4.layer.cornerRadius = 14;
        
    } else {
        self.buyAddBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 24 - 36 + 5, 64 + 12 + kScreen_Height/4 + 12 -5, 36, 36)];
        self.buyAddBtn4.layer.cornerRadius = 18;
        
    }
    
    self.buyAddBtn4.backgroundColor = RGB(229, 84, 129);
    //self.buyAddBtn4.layer.cornerRadius = 18;
    self.buyAddBtn4.layer.masksToBounds = YES;
    [self.buyAddBtn4 addTarget:self action:@selector(buyAddBtn4bClickkedd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buyAddBtn4];
    
    self.buyAddBtn4.hidden = YES;
    
    




}



- (void)addFourBigImggV
{
    
    if ([ZMSystemTool iPhone5Device]) {
        self.bigBgV = [[UIView alloc] initWithFrame:CGRectMake(24, 64 + 12, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4 - 10)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        self.bigBgV = [[UIView alloc] initWithFrame:CGRectMake(24, 64 + 12, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4)];
        
        
    } else {
        
        self.bigBgV = [[UIView alloc] initWithFrame:CGRectMake(24, 64 + 12, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4)];
        
    }
    
    self.bigBgV.backgroundColor = RGB(167, 235, 253);
    self.bigBgV.layer.cornerRadius = 5;
    self.bigBgV.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *big1Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigBgVTaped)];
    [self.bigBgV  addGestureRecognizer:big1Tap];
    
    [self.view addSubview:self.bigBgV];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, self.bigBgV.frame.size.width - 40, kScreen_Height/4 - 40 - 20)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, self.bigBgV.frame.size.width - 40, kScreen_Height/4 - 40 - 20)];
        
        
        
    } else {
        
        self.flowerImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.bigBgV.frame.size.width - 20, kScreen_Height/4 - 40 - 10)];
    }
    
    self.flowerImgV.userInteractionEnabled = YES;
    self.flowerImgV.backgroundColor = [UIColor clearColor];
    
    self.flowerImgV.image = IMAGE(@"红玫瑰");
    
    [self.bigBgV addSubview:self.flowerImgV];
    
    self.botZheV = [[UIView alloc] initWithFrame:CGRectMake(0, self.bigBgV.frame.size.height - 40, (kScreen_Width - 24 * 2 - 12 * 2)/2, 40)];
    self.botZheV.backgroundColor = RGB(139, 193, 225);
    //self.botZheV.alpha = 0.4;
    
    [self.bigBgV addSubview:self.botZheV];
    
    self.flowerNameLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.botZheV.frame.size.width, 40)];
    self.flowerNameLb.backgroundColor = [UIColor clearColor];
    self.flowerNameLb.font = [UIFont systemFontOfSize:18];
    self.flowerNameLb.text = @"红玫瑰";
    self.flowerNameLb.textColor = [UIColor whiteColor];
    self.flowerNameLb.textAlignment = NSTextAlignmentCenter;
    [self.botZheV addSubview:self.flowerNameLb];
    
    ////////////////
    
    if ([ZMSystemTool iPhone5Device]) {
        self.bigBgV22 = [[UIView alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24, 64 + 12, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4 - 10)];
    }else {
        self.bigBgV22 = [[UIView alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24, 64 + 12, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4)];
    }
    
    self.bigBgV22.backgroundColor = RGB(167, 235, 253);
    self.bigBgV22.layer.cornerRadius = 5;
    self.bigBgV22.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *big22Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigBgV22Taped)];
    [self.bigBgV22  addGestureRecognizer:big22Tap];
    
    
    [self.view addSubview:self.bigBgV22];
    
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV22 = [[UIImageView alloc] initWithFrame:CGRectMake( 30, 0, self.bigBgV22.frame.size.width - 60, kScreen_Height/4 )];
        
    }  else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV22 = [[UIImageView alloc] initWithFrame:CGRectMake( 30, 0, self.bigBgV22.frame.size.width - 60, kScreen_Height/4 )];
        
    } else {
        
        self.flowerImgV22 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, self.bigBgV22.frame.size.width, kScreen_Height/4 - 40)];
    }
    
    self.flowerImgV22.userInteractionEnabled = YES;
    self.flowerImgV22.backgroundColor = [UIColor clearColor];
    
    self.flowerImgV22.image = IMAGE(@"玫瑰物语2xi");
    
    [self.bigBgV22 addSubview:self.flowerImgV22];
    
    self.botZheV22 = [[UIView alloc] initWithFrame:CGRectMake(0, self.bigBgV22.frame.size.height - 40, (kScreen_Width - 24 * 2 - 12 * 2)/2, 40)];
    self.botZheV22.backgroundColor = RGB(139, 193, 225);
    //self.botZheV.alpha = 0.4;
    
    [self.bigBgV22 addSubview:self.botZheV22];
    
    self.flowerNameLb22 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.botZheV22.frame.size.width, 40)];
    self.flowerNameLb22.backgroundColor = [UIColor clearColor];
    self.flowerNameLb22.font = [UIFont systemFontOfSize:18];
    self.flowerNameLb22.text = @"玫瑰花语";
    self.flowerNameLb22.textColor = [UIColor whiteColor];
    self.flowerNameLb22.textAlignment = NSTextAlignmentCenter;
    [self.botZheV22 addSubview:self.flowerNameLb22];
    
    ////////
    
    if ([ZMSystemTool iPhone5Device]) {
        self.bigBgV33 = [[UIView alloc] initWithFrame:CGRectMake(24, 64 + 12 + kScreen_Height/4 + 12 - 10, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4 - 10)];
    }else {
        self.bigBgV33 = [[UIView alloc] initWithFrame:CGRectMake(24, 64 + 12 + kScreen_Height/4 + 12, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4)];
    }
    
    
    self.bigBgV33.backgroundColor = RGB(167, 235, 253);
    self.bigBgV33.layer.cornerRadius = 5;
    self.bigBgV33.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *big33Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigBgV33Taped)];
    [self.bigBgV33  addGestureRecognizer:big33Tap];
    
    
    [self.view addSubview:self.bigBgV33];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV33 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, self.bigBgV33.frame.size.width - 30, kScreen_Height/4 - 40 - 20)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV33 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, self.bigBgV33.frame.size.width - 30, kScreen_Height/4 - 40 - 20)];
        
    } else {
        
        self.flowerImgV33 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.bigBgV33.frame.size.width - 20, kScreen_Height/4 - 40 - 20)];
    }
    
    
    self.flowerImgV33.userInteractionEnabled = YES;
    self.flowerImgV33.backgroundColor = [UIColor clearColor];
    
    self.flowerImgV33.image = IMAGE(@"幸福环绕");
    
    [self.bigBgV33 addSubview:self.flowerImgV33];
    
    self.botZheV33 = [[UIView alloc] initWithFrame:CGRectMake(0, self.bigBgV33.frame.size.height - 40, (kScreen_Width - 24 * 2 - 12 * 2)/2, 40)];
    self.botZheV33.backgroundColor = RGB(139, 193, 225);
    //self.botZheV.alpha = 0.4;
    
    [self.bigBgV33 addSubview:self.botZheV33];
    
    self.flowerNameLb33 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.botZheV33.frame.size.width, 40)];
    self.flowerNameLb33.backgroundColor = [UIColor clearColor];
    self.flowerNameLb33.font = [UIFont systemFontOfSize:18];
    self.flowerNameLb33.text = @"幸福环绕";
    self.flowerNameLb33.textColor = [UIColor whiteColor];
    self.flowerNameLb33.textAlignment = NSTextAlignmentCenter;
    [self.botZheV33 addSubview:self.flowerNameLb33];
    ////////////////
    
    if ([ZMSystemTool iPhone5Device]) {
        self.bigBgV44 = [[UIView alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24, 64 + 12 + kScreen_Height/4 + 12 - 10, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4 - 10)];
    }else {
        self.bigBgV44 = [[UIView alloc] initWithFrame:CGRectMake(24 + (kScreen_Width - 24 * 2 - 12 * 2)/2 + 24, 64 + 12 + kScreen_Height/4 + 12, (kScreen_Width - 24 * 2 - 12 * 2)/2, kScreen_Height/4)];
    }
    
    
    self.bigBgV44.backgroundColor = RGB(167, 235, 253);
    self.bigBgV44.layer.cornerRadius = 5;
    self.bigBgV44.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *big44Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigBgV44Taped)];
    [self.bigBgV44  addGestureRecognizer:big44Tap];
    
    
    [self.view addSubview:self.bigBgV44];
    
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV44 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.bigBgV44.frame.size.width - 20, kScreen_Height/4 - 40 - 20)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV44 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.bigBgV44.frame.size.width - 20, kScreen_Height/4 - 40 - 20)];
        
    } else {
        
        self.flowerImgV44 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.bigBgV44.frame.size.width - 20, kScreen_Height/4 - 40 - 20)];
    }
    
    
    self.flowerImgV44.userInteractionEnabled = YES;
    self.flowerImgV44.backgroundColor = [UIColor clearColor];
    
    self.flowerImgV44.image = IMAGE(@"一生一世");
    
    [self.bigBgV44 addSubview:self.flowerImgV44];
    
    self.botZheV44 = [[UIView alloc] initWithFrame:CGRectMake(0, self.bigBgV44.frame.size.height - 40, (kScreen_Width - 24 * 2 - 12 * 2)/2, 40)];
    self.botZheV44.backgroundColor = RGB(139, 193, 225);
    //self.botZheV.alpha = 0.4;
    
    [self.bigBgV44 addSubview:self.botZheV44];
    
    self.flowerNameLb44 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.botZheV.frame.size.width, 40)];
    self.flowerNameLb44.backgroundColor = [UIColor clearColor];
    self.flowerNameLb44.font = [UIFont systemFontOfSize:18];
    self.flowerNameLb44.text = @"一生一世";
    self.flowerNameLb44.textColor = [UIColor whiteColor];
    self.flowerNameLb44.textAlignment = NSTextAlignmentCenter;
    [self.botZheV44 addSubview:self.flowerNameLb44];
    ////////////////
    
    
    
   
    
    
    

}



- (void)addTopOperationBgV
{
    self.topImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 60)];
    self.topImgVV.userInteractionEnabled = YES;
    self.topImgVV.backgroundColor = MAIN_MAIN_APP_COLOR;
    //self.topImgVV.image = IMAGE(@"40X40遮罩zz");
    
    [self.view addSubview:self.topImgVV];
    
    
    self.fanhuiBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 25, 40, 30)];
    self.fanhuiBtn.backgroundColor = [UIColor clearColor];
    [self.fanhuiBtn setImage:IMAGE(@"关闭-图标diy") forState:UIControlStateNormal] ;
    self.fanhuiBtn.imageEdgeInsets = UIEdgeInsetsMake(3, 5, 7, 13);
    
    [self.fanhuiBtn addTarget:self action:@selector(fanhuiBtnnnClickeeed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.topImgVV addSubview:self.fanhuiBtn];
    

    self.titleeLb = [[UILabel alloc] initWithFrame:CGRectMake(self.topImgVV.frame.size.width/2 - 50, 20, 100, 40)];
    self.titleeLb.backgroundColor = [UIColor clearColor];
    self.titleeLb.font = [UIFont systemFontOfSize:20];
    self.titleeLb.text = @"送 花";
    self.titleeLb.textColor = [UIColor whiteColor];
    self.titleeLb.textAlignment = NSTextAlignmentCenter;


    [self.topImgVV addSubview:self.titleeLb];

}

- (void)addBottommOperationBgV
{
    self.bottomBgv = [[UIView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 60, kScreen_Width, 60)];
    self.bottomBgv.backgroundColor = RGB(238, 238, 238);
    [self.view addSubview:self.bottomBgv];
    
    self.bottBtn1 = [[UIButton alloc] initWithFrame:CGRectMake( self.bottomBgv.frame.size.width/6 - 20, 10, 40, 40)];
    [self.bottBtn1 setBackgroundImage:IMAGE(@"送花-选中") forState: UIControlStateNormal];
    
    [self.bottBtn1 addTarget:self action:@selector(bottBtn1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBgv addSubview:self.bottBtn1];
    
    self.bottBtn2 = [[UIButton alloc] initWithFrame:CGRectMake( self.bottomBgv.frame.size.width/2 - 20, 10, 40, 40)];
    [self.bottBtn2 setBackgroundImage:IMAGE(@"礼物-未选中") forState: UIControlStateNormal];
    
    [self.bottBtn2 addTarget:self action:@selector(bottBtn2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBgv addSubview:self.bottBtn2];
    
    self.bottBtn3 = [[UIButton alloc] initWithFrame:CGRectMake( self.bottomBgv.frame.size.width - (self.bottomBgv.frame.size.width/6 - 20) - 40, 10, 40, 40)];
    [self.bottBtn3 setBackgroundImage:IMAGE(@"约会-未选中") forState: UIControlStateNormal];
    
    [self.bottBtn3 addTarget:self action:@selector(bottBtn3Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBgv addSubview:self.bottBtn3];
    





}


#pragma mark --------------------------------------弹窗


- (void)addZheView
{
    self.zheBgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    self.zheBgV.image = IMAGE(@"40X40遮罩zz");
    self.zheBgV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.zheBgV];
    
    if ([ZMSystemTool iPhone5Device]) {
        self.buyV = [[ZMInteractionBuyView alloc] initWithInteractionFrame:CGRectMake(24, 100, kScreen_Width - 24 - 24, kScreen_Height - 240)];
        
        //self.buyV2 = [[ZMInterationBuyView2 alloc] initWithInteractionFrame2:CGRectMake(24, 100, kScreen_Width - 24 - 24, kScreen_Height - 240)];
        //self.buyV2.userInteractionEnabled = YES;
    }else {
    
        self.buyV = [[ZMInteractionBuyView alloc] initWithInteractionFrame:CGRectMake(24, 120, kScreen_Width - 24 - 24, kScreen_Height - 240)];
    }
    
    self.buyV.userInteractionEnabled = YES;
    
    [self.zheBgV addSubview:self.buyV];
    //[self.zheBgV addSubview:self.buyV2];


    self.zheBgV.hidden = YES;
   
}




- (void)addRewordZheView///升级
{
    self.rewordZheBgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    self.rewordZheBgV.image = IMAGE(@"40X40遮罩zz");
    self.rewordZheBgV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.rewordZheBgV];
    
    if ([ZMSystemTool iPhone5Device]) {
        self.buyV2 = [[ZMInterationBuyView2 alloc] initWithInteractionFrame2:CGRectMake(24, 100, kScreen_Width - 24 - 24, kScreen_Height - 240)];
        
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.buyV2 = [[ZMInterationBuyView2 alloc] initWithInteractionFrame2:CGRectMake(24, 120, kScreen_Width - 24 - 24, kScreen_Height - 240)];
        
    } else {
        
        self.buyV2 = [[ZMInterationBuyView2 alloc] initWithInteractionFrame2:CGRectMake(24, 120 + 30, kScreen_Width - 24 - 24, kScreen_Height - 240 - 60)];
        
    }
    
    self.buyV2.userInteractionEnabled = YES;
    
    [self.rewordZheBgV addSubview:self.buyV2];
    
    
    self.rewordZheBgV.hidden = YES;
    
}


- (void)addRewordZheView22//奖励
{
    self.rewordZheBgV22 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    self.rewordZheBgV22.image = IMAGE(@"40X40遮罩zz");
    self.rewordZheBgV22.userInteractionEnabled = YES;
    
    [self.view addSubview:self.rewordZheBgV22];
    
    if ([ZMSystemTool iPhone5Device]) {
        self.buyV3 = [[ZMInterationBuyView3 alloc] initWithInteractionFrame3:CGRectMake(24, 130, kScreen_Width - 24 - 24, kScreen_Height - 240)];
        
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.buyV3 = [[ZMInterationBuyView3 alloc] initWithInteractionFrame3:CGRectMake(24, 120 + 60, kScreen_Width - 24 - 24, kScreen_Height - 240)];
        
    } else {
        
        self.buyV3 = [[ZMInterationBuyView3 alloc] initWithInteractionFrame3:CGRectMake(24, 120 + 60, kScreen_Width - 24 - 24, kScreen_Height - 240 - 60)];
        
    }
    
    self.buyV3.userInteractionEnabled = YES;
    
    [self.rewordZheBgV22 addSubview:self.buyV3];
    
    
    self.rewordZheBgV22.hidden = YES;
    
}






#pragma mark ---------------------------------关闭弹窗
- (void)okBtnClickedd
{
    
    self.rewordZheBgV.hidden = YES;
    self.rewordZheBgV22.hidden = YES;
    
    
}





- (void)interactionCloseButtonClicked
{
    self.zheBgV.hidden = YES;


}


#pragma mark ---------------------------------加➖购买数量
- (void)interactionSubBtnnnClicked
{
    //self.flowerCount = 1;
    
    if (self.flowerCount > 1) {
        
        self.flowerCount --;

        
        ///改变➖号状态
        if (self.flowerCount == 1) {
            [self.buyV.subBtn setBackgroundImage:IMAGE(@"-jian") forState: UIControlStateNormal];
            self.buyV.subBtn.enabled = NO;

        }
        
        
        
        
        
        
        self.buyV.needGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount];
        
        
        if ([self.lbbb11.text isEqualToString:@"红玫瑰"] && [self.buyV.titleLb.text isEqualToString:@"红玫瑰购买"]) {
            self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price111 integerValue]];
            
            //NSInteger goldCount = [self.cur_gold integerValue];
            NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price111 integerValue];
            
            
            if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
                
                NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
                
                
                _goldCountW1 = [goldCountStt integerValue] * 10000;
                
                
            } else {
                
                _goldCountW1 = [self.cur_gold integerValue];
                
            }
            

            
            
            if (_goldCountW1 > allGold || _goldCountW1 == allGold) {
                
                self.buyV.sorryNoBuyLb.hidden = YES;
                
                self.buyV.buyyBtn.enabled = YES;
                self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
                [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
                ///改变➕号状态
                
                [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
                self.buyV.addBtn.enabled = YES;
                
                
            }

            
        }

        
        if ([self.lbbb11.text isEqualToString:@"玫瑰花语"] && [self.buyV.titleLb.text isEqualToString:@"玫瑰花语购买"]) {
            self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price121 integerValue]];
            
            
            //NSInteger goldCount = [self.cur_gold integerValue];
            
            
            if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
                
                NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
                
                
                _goldCountW2 = [goldCountStt integerValue] * 10000;
                
                
                
            } else {
                
                _goldCountW2 = [self.cur_gold integerValue];
                
            }

            
            NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price121 integerValue];
            
            if (_goldCountW2 > allGold || _goldCountW2 == allGold ) {
                
                self.buyV.sorryNoBuyLb.hidden = YES;
                
                self.buyV.buyyBtn.enabled = YES;
                self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
                [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
                
                ///改变➕号状态
                
                [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
                self.buyV.addBtn.enabled = YES;
                
                
                
            }

            
            
        }
        
        if ([self.lbbb11.text isEqualToString:@"幸福环绕"] && [self.buyV.titleLb.text isEqualToString:@"幸福环绕购买"]) {
            self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price122 integerValue]];
            
            
            //NSInteger goldCount = [self.cur_gold integerValue];
            if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
                
                NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
                
                
                _goldCountW3 = [goldCountStt integerValue] * 10000;
                
                
                
            } else {
                
                _goldCountW3 = [self.cur_gold integerValue];
                
            }

            NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price122 integerValue];
            
            if (_goldCountW3 > allGold || _goldCountW3 == allGold ) {
                
                self.buyV.sorryNoBuyLb.hidden = YES;
                
                self.buyV.buyyBtn.enabled = YES;
                self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
                [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
                ///改变➕号状态
                
                [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
                self.buyV.addBtn.enabled = YES;
                
                
            }

            
        }
        
        
        if ([self.lbbb11.text isEqualToString:@"一生一世"] && [self.buyV.titleLb.text isEqualToString:@"一生一世购买"]) {
            self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price131 integerValue]];
            
            
            //NSInteger goldCount = [self.cur_gold integerValue];
            if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
                
                NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
                
                
                _goldCountW4 = [goldCountStt integerValue] * 10000;
                
                
                
            } else {
                
                _goldCountW4 = [self.cur_gold integerValue];
                
            }

            NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price131 integerValue];
            
            if (_goldCountW4 > allGold || _goldCountW4 == allGold ) {
                
                self.buyV.sorryNoBuyLb.hidden = YES;
                
                self.buyV.buyyBtn.enabled = YES;
                self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
                [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                
                ///改变➕号状态
                
                [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
                self.buyV.addBtn.enabled = YES;
                
                
            }

            
        }

        
    }
    
    
    
    
//////////////////////////////////////送礼物
    if ([self.lbbb11.text isEqualToString:@"幸运星"] && [self.buyV.titleLb.text isEqualToString:@"幸运星购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price211 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW1_sec = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW1_sec = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price211 integerValue];
        
        if (_goldCountW1_sec > allGold || _goldCountW1_sec == allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = YES;
            
            self.buyV.buyyBtn.enabled = YES;
            self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            ///改变➕号状态
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = YES;
            
            
        }
        
        
    }

    if ([self.lbbb11.text isEqualToString:@"蛋糕"] && [self.buyV.titleLb.text isEqualToString:@"蛋糕购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price221 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW2_sec = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW2_sec = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price221 integerValue];
        
        if (_goldCountW2_sec > allGold || _goldCountW2_sec == allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = YES;
            
            self.buyV.buyyBtn.enabled = YES;
            self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            ///改变➕号状态
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = YES;
            
            
        }
        
        
    }
    

    if ([self.lbbb11.text isEqualToString:@"巧克力"] && [self.buyV.titleLb.text isEqualToString:@"巧克力购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price222 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW3_sec = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW3_sec = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price222 integerValue];
        
        if (_goldCountW3_sec > allGold || _goldCountW3_sec == allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = YES;
            
            self.buyV.buyyBtn.enabled = YES;
            self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            ///改变➕号状态
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = YES;
            
            
        }
        
        
    }
    

    if ([self.lbbb11.text isEqualToString:@"钻戒"] && [self.buyV.titleLb.text isEqualToString:@"钻戒购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price231 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW4_sec = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW4_sec = [self.cur_gold integerValue];
            
        }

        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price231 integerValue];
        
        if (_goldCountW4_sec > allGold || _goldCountW4_sec == allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = YES;
            
            self.buyV.buyyBtn.enabled = YES;
            self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            ///改变➕号状态
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = YES;
            
            
        }
        
        
    }
    

    
    
    
//////////////////////////////////////约会
    if ([self.lbbb11.text isEqualToString:@"公园"] && [self.buyV.titleLb.text isEqualToString:@"公园门票购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price311 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW1_third = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW1_third = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price311 integerValue];
        
        if (_goldCountW1_third > allGold || _goldCountW1_third == allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = YES;
            
            self.buyV.buyyBtn.enabled = YES;
            self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            ///改变➕号状态
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = YES;
            
            
        }
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"电影院"] && [self.buyV.titleLb.text isEqualToString:@"电影院门票购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price321 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW2_third = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW2_third = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price321 integerValue];
        
        if (_goldCountW2_third > allGold || _goldCountW2_third == allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = YES;
            
            self.buyV.buyyBtn.enabled = YES;
            self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            ///改变➕号状态
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = YES;
            
            
        }
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"游乐场"] && [self.buyV.titleLb.text isEqualToString:@"游乐场门票购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price322 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW3_third = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW3_third = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price322 integerValue];
        
        if (_goldCountW3_third > allGold || _goldCountW3_third == allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = YES;
            
            self.buyV.buyyBtn.enabled = YES;
            self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            ///改变➕号状态
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = YES;
            
            
        }
        
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"欧洲游"] && [self.buyV.titleLb.text isEqualToString:@"欧洲游门票购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price331 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW4_third = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW4_third = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price331 integerValue];
        
        if (_goldCountW4_third > allGold || _goldCountW4_third == allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = YES;
            
            self.buyV.buyyBtn.enabled = YES;
            self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            ///改变➕号状态
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = YES;
            
            
        }
        
        
    }
    

    
    
    

}

- (void)interactionAddBtnCliccked
{
    //self.flowerCount = 2;
    self.flowerCount ++;
    
    ///➖状态
    if (self.flowerCount > 1) {
        [self.buyV.subBtn setBackgroundImage:IMAGE(@"-jian2") forState: UIControlStateNormal];
        self.buyV.subBtn.enabled = YES;
    }
    
    
    
    
    self.buyV.needGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount];
    
    if ([self.lbbb11.text isEqualToString:@"红玫瑰"] && [self.buyV.titleLb.text isEqualToString:@"红玫瑰购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price111 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW11 = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW11 = [self.cur_gold integerValue];
            
        }

        
        
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price111 integerValue];
        
        if (_goldCountW11 < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            
            //改变加号颜色 不可以点击
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"玫瑰花语"] && [self.buyV.titleLb.text isEqualToString:@"玫瑰花语购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price121 integerValue]];
        
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW22 = [goldCountStt integerValue] * 10000;
         
            
        } else {
            
            _goldCountW22 = [self.cur_gold integerValue];
            
        }

        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price121 integerValue];
        
        if (_goldCountW22 < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }

    if ([self.lbbb11.text isEqualToString:@"幸福环绕"] && [self.buyV.titleLb.text isEqualToString:@"幸福环绕购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price122 integerValue]];
        
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW33 = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW33 = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price122 integerValue];
        
        if (_goldCountW33 < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"一生一世"] && [self.buyV.titleLb.text isEqualToString:@"一生一世购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price131 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW44 = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW44 = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price131 integerValue];
        
        if (_goldCountW44 < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }
    
    

    
    
    
    
//////////////////////////////////////送礼物
    if ([self.lbbb11.text isEqualToString:@"幸运星"] && [self.buyV.titleLb.text isEqualToString:@"幸运星购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price211 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW11_sec = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW11_sec = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price211 integerValue];
        
        if (_goldCountW11_sec < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }

        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"蛋糕"] && [self.buyV.titleLb.text isEqualToString:@"蛋糕购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price221 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW22_sec = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW22_sec = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price221 integerValue];
        
        if (_goldCountW22_sec < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"巧克力"] && [self.buyV.titleLb.text isEqualToString:@"巧克力购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price222 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW33_sec = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW33_sec = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price222 integerValue];
        
        if (_goldCountW33_sec < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"钻戒"] && [self.buyV.titleLb.text isEqualToString:@"钻戒购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price231 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW44_sec = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW44_sec = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price231 integerValue];
        
        if (_goldCountW44_sec < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }

    
    
    
    
//////////////////////////////////////约会
    if ([self.lbbb11.text isEqualToString:@"公园"] && [self.buyV.titleLb.text isEqualToString:@"公园门票购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price311 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW11_third = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW11_third = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price311 integerValue];
        
        if (_goldCountW11_third < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"电影院"] && [self.buyV.titleLb.text isEqualToString:@"电影院门票购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price321 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW22_third = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW22_third = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price321 integerValue];
        
        if (_goldCountW22_third < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"游乐场"] && [self.buyV.titleLb.text isEqualToString:@"游乐场门票购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price322 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW33_third = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW33_third = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price322 integerValue];
        
        if (_goldCountW33_third < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"欧洲游"] && [self.buyV.titleLb.text isEqualToString:@"欧洲游门票购买"]) {
        self.buyV.allGoldLb.text = [NSString stringWithFormat:@"%ld",(long)self.flowerCount * [self.item_cfg_unit_price331 integerValue]];
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            
            _goldCountW44_third = [goldCountStt integerValue] * 10000;
            
        } else {
            
            _goldCountW44_third = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price331 integerValue];
        
        if (_goldCountW44_third < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia") forState: UIControlStateNormal];
            self.buyV.addBtn.enabled = NO;
            
            
        }
        
        
    }
    

    
}



#pragma mark -----------------------------------点击➕购买按钮

- (void)buyAddBtnClickkedd:(UIButton *)buyAddBtn
{
/////第一个按钮
    if ([self.titleeLb.text isEqualToString:@"送 花"]) {
        
        if ([self.buyAddStr111 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
        
        if ([self.buyAddStr211 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
        
        if ([self.buyAddStr311 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    



}

- (void)buyAddBtn2bClickkedd:(UIButton *)buyAddBtn
{
    /////第 2 个按钮
    if ([self.titleeLb.text isEqualToString:@"送 花"]) {
        
        if ([self.buyAddStr121 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
        
        if ([self.buyAddStr221 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
        
        if ([self.buyAddStr321 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    
    
    
}


- (void)buyAddBtn3bClickkedd:(UIButton *)buyAddBtn
{
    /////第 3 个按钮
    if ([self.titleeLb.text isEqualToString:@"送 花"]) {
        
        if ([self.buyAddStr122 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
        
        if ([self.buyAddStr222 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
        
        if ([self.buyAddStr322 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    
    
    
}


- (void)buyAddBtn4bClickkedd:(UIButton *)buyAddBtn
{
    /////第 4 个按钮
    if ([self.titleeLb.text isEqualToString:@"送 花"]) {
        
        if ([self.buyAddStr131 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
        
        if ([self.buyAddStr231 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
        
        if ([self.buyAddStr331 isEqualToString:@"0"]) {
            //
            [self buyyyBtnrClickeeed];
        }
    }
    
    
    
    
}





#pragma mark -----------------------------------购买按钮
//主界面上购买按钮
- (void)buyyyBtnrClickeeed
{

    [self getInteractiveGetInfoDataa];//刷新界面
    
    self.zheBgV.hidden = NO;
    
    //购买之前先判断一下金币数量够不够(点击主界面时判断)

    self.buyV.needGoldLb.text = @"1";//数量重置为1
    self.flowerCount = 1;//重置
    
    
    self.buyV.sorryNoBuyLb.hidden = YES;
    
    self.buyV.buyyBtn.enabled = YES;
    self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
    [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    
    
    if ([self.lbbb11.text isEqualToString:@"红玫瑰"] && [self.buyV.titleLb.text isEqualToString:@"红玫瑰购买"]) {
       
        
        
        
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountW = [goldCountStt integerValue] * 10000;
            

            
            
            
        } else {
        
            _goldCountW = [self.cur_gold integerValue];
        
        }
        
        
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price111 integerValue];
        
        if (_goldCountW < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"玫瑰花语"] && [self.buyV.titleLb.text isEqualToString:@"玫瑰花语购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        
        
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWW = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWW = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price121 integerValue];
        
        if (_goldCountWW < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"幸福环绕"] && [self.buyV.titleLb.text isEqualToString:@"幸福环绕购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWWW = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWWW = [self.cur_gold integerValue];
            
        }
        

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price122 integerValue];
        
        if (_goldCountWWW < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
        
    }
    

    
    
    
    if ([self.lbbb11.text isEqualToString:@"一生一世"] && [self.buyV.titleLb.text isEqualToString:@"一生一世购买"]) {
        
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWWWW = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWWWW = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price131 integerValue];
        
        if (_goldCountWWWW < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
        
    }
    
    /////减号状态
    
    if (self.flowerCount == 1) {
        [self.buyV.subBtn setBackgroundImage:IMAGE(@"-jian") forState: UIControlStateNormal];
        self.buyV.subBtn.enabled = NO;
        
    }


    
///////////////////////////////////////////送礼物
    if ([self.lbbb11.text isEqualToString:@"幸运星"] && [self.buyV.titleLb.text isEqualToString:@"幸运星购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountW_sec = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW_sec = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price211 integerValue];
        
        if (_goldCountW_sec < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
        
    }
    
    
    
    if ([self.lbbb11.text isEqualToString:@"蛋糕"] && [self.buyV.titleLb.text isEqualToString:@"蛋糕购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWW_sec = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWW_sec = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price221 integerValue];
        
        if (_goldCountWW_sec < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"巧克力"] && [self.buyV.titleLb.text isEqualToString:@"巧克力购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWWW_sec = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWWW_sec = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price222 integerValue];
        
        if (_goldCountWWW_sec < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"钻戒"] && [self.buyV.titleLb.text isEqualToString:@"钻戒购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWWWW_sec = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWWWW_sec = [self.cur_gold integerValue];
            
        }
        
        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price231 integerValue];
        
        if (_goldCountWWWW_sec < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    
///////////////////////////////////////////约会
    if ([self.lbbb11.text isEqualToString:@"公园"] && [self.buyV.titleLb.text isEqualToString:@"公园门票购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountW_third = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountW_third = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price311 integerValue];
        
        if (_goldCountW_third < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
        
    }
    
    
    
    if ([self.lbbb11.text isEqualToString:@"电影院"] && [self.buyV.titleLb.text isEqualToString:@"电影院门票购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWW_third = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWW_third = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price321 integerValue];
        
        if (_goldCountWW_third < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"游乐场"] && [self.buyV.titleLb.text isEqualToString:@"游乐场门票购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWWW_third = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWWW_third = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price322 integerValue];
        
        if (_goldCountWWW_third < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"欧洲游"] && [self.buyV.titleLb.text isEqualToString:@"欧洲游门票购买"]) {
        
        //NSInteger goldCount = [self.cur_gold integerValue];
        if([self.cur_gold rangeOfString:@"W"].location !=NSNotFound) {
            
            NSString *goldCountStt = [self.cur_gold substringToIndex:self.cur_gold.length - 1];
            
            NSLog(@"我的金币: %@",goldCountStt);
            
            _goldCountWWWW_third = [goldCountStt integerValue] * 10000;
            
            
        } else {
            
            _goldCountWWWW_third = [self.cur_gold integerValue];
            
        }

        NSInteger allGold = self.flowerCount * [self.item_cfg_unit_price331 integerValue];
        
        if (_goldCountWWWW_third < allGold) {
            
            self.buyV.sorryNoBuyLb.hidden = NO;
            
            self.buyV.buyyBtn.enabled = NO;
            self.buyV.buyyBtn.backgroundColor = RGB(156, 156, 156);
            [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    

    
    
    


}

- (void)refreshHHH
{
    [self getInteractiveGetInfoDataa];//刷新界面

}


- (void)sorryNoBuyLianjieLbTappedddddd///金币获取方法链接
{
    
    _lianjie = YES;
    
    
    
    ZMMeeMyGolddsViewController *gold = [[ZMMeeMyGolddsViewController alloc] init];
    
    //[self.navigationController pushViewController:gold animated:YES];

    [self presentViewController:gold animated:YES completion:nil];



}






///弹窗上的购买按钮
- (void)buyyBtntnClickedtt
{
    //购买成功以后 改变对应的亲密值
    
    if ([self.lbbb11.text isEqualToString:@"红玫瑰"] && [self.buyV.titleLb.text isEqualToString:@"红玫瑰购买"]) {
        
        NSLog(@"%@",self.item_id111);
        NSLog(@"%ld",(long)self.flowerCount);
        
        
        [self getInteractiveGetSomeeItemId:self.item_id111 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
    
        self.zheBgV.hidden = YES;
        
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgVTaped];
        });
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"玫瑰花语"] && [self.buyV.titleLb.text isEqualToString:@"玫瑰花语购买"]) {
        
        NSLog(@"%@",self.item_id121);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id121 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgV22Taped];
        });
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"幸福环绕"] && [self.buyV.titleLb.text isEqualToString:@"幸福环绕购买"]) {
        
        NSLog(@"%@",self.item_id122);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id122 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgV33Taped];
        });
        
        
    }
    
    if ([self.lbbb11.text isEqualToString:@"一生一世"] && [self.buyV.titleLb.text isEqualToString:@"一生一世购买"]) {
        
        NSLog(@"%@",self.item_id131);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id131 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgV44Taped];
        });
    }

    
///////////////////////////////////////////送礼物
    if ([self.lbbb11.text isEqualToString:@"幸运星"] && [self.buyV.titleLb.text isEqualToString:@"幸运星购买"]) {
        
        NSLog(@"%@",self.item_id211);
        NSLog(@"%ld",(long)self.flowerCount);

        [self getInteractiveGetSomeeItemId:self.item_id211 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgVTaped];
        });
        
    }
    
    
    
     if ([self.lbbb11.text isEqualToString:@"蛋糕"] && [self.buyV.titleLb.text isEqualToString:@"蛋糕购买"]) {
         
         NSLog(@"%@",self.item_id221);
         NSLog(@"%ld",(long)self.flowerCount);
         
         [self getInteractiveGetSomeeItemId:self.item_id221 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
         
         
         self.zheBgV.hidden = YES;
         
         [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
         
         
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [self refreshHHH];
         });
         

         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [self bigBgV22Taped];
         });
         
     }
    
    
    if ([self.lbbb11.text isEqualToString:@"巧克力"] && [self.buyV.titleLb.text isEqualToString:@"巧克力购买"]) {
        
        NSLog(@"%@",self.item_id222);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id222 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgV33Taped];
        });

    }
    
    
    if ([self.lbbb11.text isEqualToString:@"钻戒"] && [self.buyV.titleLb.text isEqualToString:@"钻戒购买"]) {
        
        NSLog(@"%@",self.item_id231);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id231 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgV44Taped];
        });
        
    }
    
    
    
///////////////////////////////////////////约会
    if ([self.lbbb11.text isEqualToString:@"公园"] && [self.buyV.titleLb.text isEqualToString:@"公园门票购买"]) {
        
        NSLog(@"%@",self.item_id311);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id311 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgVTaped];
        });
        
        
    }
    
    
    
    if ([self.lbbb11.text isEqualToString:@"电影院"] && [self.buyV.titleLb.text isEqualToString:@"电影院门票购买"]) {
        
        NSLog(@"%@",self.item_id321);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id321 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgV22Taped];
        });
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"游乐场"] && [self.buyV.titleLb.text isEqualToString:@"游乐场门票购买"]) {
        
        NSLog(@"%@",self.item_id322);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id322 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgV33Taped];
        });
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"欧洲游"] && [self.buyV.titleLb.text isEqualToString:@"欧洲游门票购买"]) {
        
        NSLog(@"%@",self.item_id331);
        NSLog(@"%ld",(long)self.flowerCount);
        
        [self getInteractiveGetSomeeItemId:self.item_id331 AndItemCount:[NSString stringWithFormat:@"%ld",(long)self.flowerCount]];
        
        
        self.zheBgV.hidden = YES;
        
        [AnyObjectActivityView showWithTitle:@"购买成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self bigBgV44Taped];
        });
        
    }
    
    
    
    
    
    
    

}



#pragma mark -----------------------------------赠送按钮
//赠送按钮点击之后  改变 今天还能赠送的次数
- (void)giveeBtnvClickeeed
{

    if ([self.lbbb11.text isEqualToString:@"红玫瑰"] && [self.buyV.titleLb.text isEqualToString:@"红玫瑰购买"]) {
        
        NSLog(@"%@",self.item_id111);
        NSLog(@"%ld",(long)self.flowerCount);
        
        
        
        [self getInteractiveGiveItemsWithItemId:self.item_id111];
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self refreshHHH];
            
            
            if ([self.send_CountStt isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }else {
            
            
                [AnyObjectActivityView showWithTitle:@"赠送成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
                
//////////////每次赠送成功以后都请求一下数据 判断一下是否升级
                ///赠送几次以后的奖励
                
                
            }
        });
        
        
        //暂时加上 为了调整赠送按钮状态 可以去掉
        
//        if (!self.giveeBtn.enabled) {
//            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//                [self bigBgVTaped];//重置界面
//            });
//
//        }
        
        
        
        
    }

    
    if ([self.lbbb11.text isEqualToString:@"玫瑰花语"] && [self.buyV.titleLb.text isEqualToString:@"玫瑰花语购买"]) {
        

        [self getInteractiveGiveItemsWithItemId:self.item_id121];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"赠送成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
            
           

            
        });

        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"幸福环绕"] && [self.buyV.titleLb.text isEqualToString:@"幸福环绕购买"]) {
     
        [self getInteractiveGiveItemsWithItemId:self.item_id122];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"赠送成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
          
            

            
        });
        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"一生一世"] && [self.buyV.titleLb.text isEqualToString:@"一生一世购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id131];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"赠送成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
            
            
            

        });

    }
    

    
    
    
//////////////////////////////////////////送礼物
    if ([self.lbbb11.text isEqualToString:@"幸运星"] && [self.buyV.titleLb.text isEqualToString:@"幸运星购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id211];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt2 isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"赠送成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }

            
        });

        
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"蛋糕"] && [self.buyV.titleLb.text isEqualToString:@"蛋糕购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id221];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt2 isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"赠送成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
        });

    }
    
    
    
    if ([self.lbbb11.text isEqualToString:@"巧克力"] && [self.buyV.titleLb.text isEqualToString:@"巧克力购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id222];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt2 isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"赠送成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
        });

    }
    
    if ([self.lbbb11.text isEqualToString:@"钻戒"] && [self.buyV.titleLb.text isEqualToString:@"钻戒购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id231];
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt2 isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"赠送成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
        });

    }
    
    
    
    
    
///////////////////////////////////////////约会
    if ([self.lbbb11.text isEqualToString:@"公园"] && [self.buyV.titleLb.text isEqualToString:@"公园门票购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id311];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt3 isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"约会成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
        });
    }
    
    
    
    if ([self.lbbb11.text isEqualToString:@"电影院"] && [self.buyV.titleLb.text isEqualToString:@"电影院门票购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id321];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt3 isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"约会成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
        });
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"游乐场"] && [self.buyV.titleLb.text isEqualToString:@"游乐场门票购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id322];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt3 isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"约会成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
        });
    }
    
    
    if ([self.lbbb11.text isEqualToString:@"欧洲游"] && [self.buyV.titleLb.text isEqualToString:@"欧洲游门票购买"]) {
        
        [self getInteractiveGiveItemsWithItemId:self.item_id331];
        
        
        
        //刷新界面
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refreshHHH];
            
            if ([self.send_CountStt3 isEqualToString:@"0"]) {
                [AnyObjectActivityView showWithTitle:@"对不起,今天赠送次数已用完" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            }else {
                
                
                [AnyObjectActivityView showWithTitle:@"约会成功" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                
            }
            
        });
    }
    
    
    
    
    
    
}



#pragma mark -----------------------------big视图点击
- (void)bigBgVTaped
{
    self.lbbb11.text = @"红玫瑰";
    
    self.buyV.titleLb.text = @"红玫瑰购买";
    self.buyV.flowerImgV.image = IMAGE(@"红玫瑰");
    
    
    self.buyAddBtn.hidden = NO;
    self.buyAddBtn2.hidden = YES;
    self.buyAddBtn3.hidden = YES;
    self.buyAddBtn4.hidden = YES;
    
    self.bigBgV.layer.borderWidth = 2;
    self.bigBgV.layer.borderColor = RGB(229, 84, 129).CGColor;
    
    self.bigBgV22.layer.borderWidth = 0;
    self.bigBgV33.layer.borderWidth = 0;
    self.bigBgV44.layer.borderWidth = 0;
    
    
    
    
    self.buyV.allGoldLb.text = self.item_cfg_unit_price111;
    
    self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val111];
    
    
    
    
    
    self.buyV.needGoldLb.text = @"1";//数量重置为1
    self.flowerCount = 1;//重置
    
    
    
    self.buyV.sorryNoBuyLb.hidden = YES;
    
    self.buyV.buyyBtn.enabled = YES;
    self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
    [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    

    //改变加号颜色 回复正常
    [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
    self.buyV.addBtn.enabled =  YES;
    
    
    //赠送按钮状态
    if ([self.buyAddStr111 isEqualToString:@"0"]) {
        
        self.giveeBtn.enabled = NO;
        [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
        
        
    }else {
        
        self.giveeBtn.enabled = YES;
        [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
        
    }

    
    
    
    
    
/////////////////送礼物
    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
        //
        self.lbbb11.text = @"幸运星";
        self.buyV.titleLb.text = @"幸运星购买";
        self.buyV.flowerImgV.image = IMAGE(@"幸运星");
        
        self.buyV.allGoldLb.text = self.item_cfg_unit_price211;
        
        self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val211];
        
        
        //赠送按钮状态
        if ([self.buyAddStr211 isEqualToString:@"0"]) {
            
            self.giveeBtn.enabled = NO;
            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
            
            
        }else {
            
            self.giveeBtn.enabled = YES;
            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
            
        }

        
        
        
    }
    
/////////////////约会
    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
        
        self.lbbb11.text = @"公园";
        self.buyV.titleLb.text = @"公园门票购买";
        self.buyV.flowerImgV.image = IMAGE(@"公园门票");
        
        self.buyV.allGoldLb.text = self.item_cfg_unit_price311;
        
        self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val311];
        
        //赠送按钮状态
        if ([self.buyAddStr311 isEqualToString:@"0"]) {
            
            self.giveeBtn.enabled = NO;
            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
            
            
        }else {
            
            self.giveeBtn.enabled = YES;
            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
            
        }

        
    }
    
    

}

- (void)bigBgV22Taped
{
    self.lbbb11.text = @"玫瑰花语";
    
    self.buyV.titleLb.text = @"玫瑰花语购买";
    self.buyV.flowerImgV.image = IMAGE(@"玫瑰物语2xi");
    
    self.buyAddBtn2.hidden = NO;
    self.buyAddBtn.hidden = YES;
    self.buyAddBtn3.hidden = YES;
    self.buyAddBtn4.hidden = YES;
    
    self.bigBgV22.layer.borderWidth = 2;
    self.bigBgV22.layer.borderColor = RGB(229, 84, 129).CGColor;
    
    self.bigBgV.layer.borderWidth = 0;
    self.bigBgV33.layer.borderWidth = 0;
    self.bigBgV44.layer.borderWidth = 0;
    
    
    
    self.buyV.allGoldLb.text = self.item_cfg_unit_price121;
    self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val121];
    

    self.buyV.needGoldLb.text = @"1";//数量重置为1
    self.flowerCount = 1;//重置

    
    
    self.buyV.sorryNoBuyLb.hidden = YES;
    
    self.buyV.buyyBtn.enabled = YES;
    self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
    [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //改变加号颜色 回复正常
    [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
    self.buyV.addBtn.enabled =  YES;
    
    //赠送按钮状态
    if ([self.buyAddStr121 isEqualToString:@"0"]) {
        
        self.giveeBtn.enabled = NO;
        [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
        
        
    }else {
        
        self.giveeBtn.enabled = YES;
        [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
        
    }

    
/////////////////送礼物
    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
        //
        self.lbbb11.text = @"蛋糕";
        self.buyV.titleLb.text = @"蛋糕购买";
        self.buyV.flowerImgV.image = IMAGE(@"蛋糕");
        
        self.buyV.allGoldLb.text = self.item_cfg_unit_price221;
        
        self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val221];
        
        
        //赠送按钮状态
        if ([self.buyAddStr221 isEqualToString:@"0"]) {
            
            self.giveeBtn.enabled = NO;
            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
            
            
        }else {
            
            self.giveeBtn.enabled = YES;
            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
            
        }

        
    }
    
    

/////////////////约会
    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
        
        self.lbbb11.text = @"电影院";
        self.buyV.titleLb.text = @"电影院门票购买";
        self.buyV.flowerImgV.image = IMAGE(@"电影院门票");
        
        self.buyV.allGoldLb.text = self.item_cfg_unit_price321;
        
        self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val321];
        
        //赠送按钮状态
        if ([self.buyAddStr321 isEqualToString:@"0"]) {
            
            self.giveeBtn.enabled = NO;
            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
            
            
        }else {
            
            self.giveeBtn.enabled = YES;
            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
            
        }

        
        
    }
    
    
}


- (void)bigBgV33Taped
{
    self.lbbb11.text = @"幸福环绕";
    
    self.buyV.titleLb.text = @"幸福环绕购买";
    self.buyV.flowerImgV.image = IMAGE(@"幸福环绕");
    
    self.buyAddBtn3.hidden = NO;
    self.buyAddBtn2.hidden = YES;
    self.buyAddBtn.hidden = YES;
    self.buyAddBtn4.hidden = YES;
    
    
    self.bigBgV33.layer.borderWidth = 2;
    self.bigBgV33.layer.borderColor = RGB(229, 84, 129).CGColor;
    
    self.bigBgV22.layer.borderWidth = 0;
    self.bigBgV.layer.borderWidth = 0;
    self.bigBgV44.layer.borderWidth = 0;

    
    self.buyV.allGoldLb.text = self.item_cfg_unit_price122;
    
    self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val122];
    
    self.buyV.needGoldLb.text = @"1";//数量重置为1
    self.flowerCount = 1;//重置
    
    
    
    self.buyV.sorryNoBuyLb.hidden = YES;
    
    self.buyV.buyyBtn.enabled = YES;
    self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
    [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    

    //改变加号颜色 回复正常
    [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
    self.buyV.addBtn.enabled =  YES;
    
    //赠送按钮状态
    if ([self.buyAddStr122 isEqualToString:@"0"]) {
        
        self.giveeBtn.enabled = NO;
        [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
        
        
    }else {
        
        self.giveeBtn.enabled = YES;
        [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
        
    }

    
    
/////////////////送礼物
    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
        //
        self.lbbb11.text = @"巧克力";
        self.buyV.titleLb.text = @"巧克力购买";
        self.buyV.flowerImgV.image = IMAGE(@"巧克力");
        
        self.buyV.allGoldLb.text = self.item_cfg_unit_price222;
        
        self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val222];
        
        //赠送按钮状态
        if ([self.buyAddStr222 isEqualToString:@"0"]) {
            
            self.giveeBtn.enabled = NO;
            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
            
            
        }else {
            
            self.giveeBtn.enabled = YES;
            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
            
        }

        
    }
    
    
    
/////////////////约会
    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
        
        self.lbbb11.text = @"游乐场";
        self.buyV.titleLb.text = @"游乐场门票购买";
        self.buyV.flowerImgV.image = IMAGE(@"游乐场门票");
        
        self.buyV.allGoldLb.text = self.item_cfg_unit_price322;
        
        self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val322];
        
        //赠送按钮状态
        if ([self.buyAddStr322 isEqualToString:@"0"]) {
            
            self.giveeBtn.enabled = NO;
            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
            
            
        }else {
            
            self.giveeBtn.enabled = YES;
            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
            
        }

        
    }
    
    
    
    
}

- (void)bigBgV44Taped
{
    self.lbbb11.text = @"一生一世";
    
    self.buyV.titleLb.text = @"一生一世购买";
    self.buyV.flowerImgV.image = IMAGE(@"一生一世");
    
    
    self.buyAddBtn4.hidden = NO;
    self.buyAddBtn2.hidden = YES;
    self.buyAddBtn3.hidden = YES;
    self.buyAddBtn.hidden = YES;
    
    
    self.bigBgV44.layer.borderWidth = 2;
    self.bigBgV44.layer.borderColor = RGB(229, 84, 129).CGColor;
    
    self.bigBgV22.layer.borderWidth = 0;
    self.bigBgV33.layer.borderWidth = 0;
    self.bigBgV.layer.borderWidth = 0;
    
    
    self.buyV.allGoldLb.text = self.item_cfg_unit_price131;
    self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val131];
    
    self.buyV.needGoldLb.text = @"1";//数量重置为1
    self.flowerCount = 1;//重置
    
    
    
    self.buyV.sorryNoBuyLb.hidden = YES;
    
    self.buyV.buyyBtn.enabled = YES;
    self.buyV.buyyBtn.backgroundColor = RGB(228, 84, 129);
    [self.buyV.buyyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    

    //改变加号颜色 回复正常
    [self.buyV.addBtn setBackgroundImage:IMAGE(@"+jia2") forState: UIControlStateNormal];
    self.buyV.addBtn.enabled =  YES;
    
    //赠送按钮状态
    if ([self.buyAddStr131 isEqualToString:@"0"]) {
        
        self.giveeBtn.enabled = NO;
        [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
        
        
    }else {
    
        self.giveeBtn.enabled = YES;
        [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
        
    }
    
/////////////////送礼物
    if ([self.titleeLb.text isEqualToString:@"送礼物"]) {
        //
        self.lbbb11.text = @"钻戒";
        self.buyV.titleLb.text = @"钻戒购买";
        self.buyV.flowerImgV.image = IMAGE(@"钻戒");
        
        self.buyV.allGoldLb.text = self.item_cfg_unit_price231;
        
        self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val231];
        
        //赠送按钮状态
        if ([self.buyAddStr231 isEqualToString:@"0"]) {
            
            self.giveeBtn.enabled = NO;
            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
            
            
        }else {
            
            self.giveeBtn.enabled = YES;
            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
            
        }

        
    }
    
    
/////////////////约会
    if ([self.titleeLb.text isEqualToString:@"约 会"]) {
        
        self.lbbb11.text = @"欧洲游";
        self.buyV.titleLb.text = @"欧洲游门票购买";
        self.buyV.flowerImgV.image = IMAGE(@"欧洲游门票");
        
        self.buyV.allGoldLb.text = self.item_cfg_unit_price331;
        
        self.lbbb22.text = [NSString stringWithFormat:@"增加亲密值:%@",self.item_cfg_add_love_val331];
        
        //赠送按钮状态
        if ([self.buyAddStr331 isEqualToString:@"0"]) {
            
            self.giveeBtn.enabled = NO;
            [self.giveeBtn setTitleColor:RGB(156, 156, 156) forState:UIControlStateNormal];
            
            
        }else {
            
            self.giveeBtn.enabled = YES;
            [self.giveeBtn setTitleColor:RGB(101, 196, 222) forState:UIControlStateNormal];
            
        }

        
    }
    
    
    
}



#pragma mark ------------------------------底部按钮
- (void)bottBtn1Clicked:(UIButton *)btn1
{

    [self.bottBtn1 setBackgroundImage:IMAGE(@"送花-选中") forState: UIControlStateNormal];

    [self.bottBtn2 setBackgroundImage:IMAGE(@"礼物-未选中") forState: UIControlStateNormal];
    [self.bottBtn3 setBackgroundImage:IMAGE(@"约会-未选中") forState: UIControlStateNormal];
    
    self.titleeLb.text = @"送 花";
    
    [self.giveeBtn setTitle:@"赠送" forState:UIControlStateNormal];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV.frame = CGRectMake(20, 10, self.bigBgV.frame.size.width - 40, kScreen_Height/4 - 40 - 20);
        
    } else if ([ZMSystemTool iPhone6Device]) {
        self.flowerImgV.frame = CGRectMake(20, 10, self.bigBgV.frame.size.width - 40, kScreen_Height/4 - 40 - 20);
        
        
        
    } else {
        
        self.flowerImgV.frame = CGRectMake(10, 10, self.bigBgV.frame.size.width - 20, kScreen_Height/4 - 40 - 10);
    }
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV22.frame = CGRectMake( 30, 0, self.bigBgV22.frame.size.width - 60, kScreen_Height/4 );
        
    }  else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV22.frame = CGRectMake( 30, 0, self.bigBgV22.frame.size.width - 60, kScreen_Height/4 );
        
    } else {
        
        self.flowerImgV22.frame = CGRectMake(0, 10, self.bigBgV22.frame.size.width, kScreen_Height/4 - 40);
    }
    
    
    if ([ZMSystemTool iPhone5Device]) {
        self.flowerImgV33.frame = CGRectMake(15, 10, self.bigBgV33.frame.size.width - 30, kScreen_Height/4 - 40 - 20);
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV33.frame = CGRectMake(15, 10, self.bigBgV33.frame.size.width - 30, kScreen_Height/4 - 40 - 20);
        
    } else {
        
        self.flowerImgV33.frame = CGRectMake(10, 10, self.bigBgV33.frame.size.width - 20, kScreen_Height/4 - 40 - 20);
    }
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV44.frame = CGRectMake(10, 10, self.bigBgV44.frame.size.width - 20, kScreen_Height/4 - 40 - 20);
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV44.frame = CGRectMake(10, 10, self.bigBgV44.frame.size.width - 20, kScreen_Height/4 - 40 - 20);
        
    } else {
        
        self.flowerImgV44.frame = CGRectMake(10, 10, self.bigBgV44.frame.size.width - 20, kScreen_Height/4 - 40 - 20);
    }
    

    
    
    self.botZheV.backgroundColor = RGB(139, 193, 225);
    self.botZheV22.backgroundColor = RGB(139, 193, 225);
    self.botZheV33.backgroundColor = RGB(139, 193, 225);
    self.botZheV44.backgroundColor = RGB(139, 193, 225);
    
    self.flowerImgV.image = IMAGE(@"红玫瑰");
    self.flowerImgV22.image = IMAGE(@"玫瑰物语2xi");
    self.flowerImgV33.image = IMAGE(@"幸福环绕");
    self.flowerImgV44.image = IMAGE(@"一生一世");
    
    self.flowerNameLb.text = @"红玫瑰";
    self.flowerNameLb22.text = @"玫瑰物语";
    self.flowerNameLb33.text = @"幸福环绕";
    self.flowerNameLb44.text = @"一生一世";
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getInteractiveGetInfoDataa];//请求数据
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self bigBgVTaped];//重置界面
    });
    
    
    
    
    

}


- (void)bottBtn2Clicked:(UIButton *)btn2
{
    [self.bottBtn2 setBackgroundImage:IMAGE(@"礼物-选中") forState: UIControlStateNormal];
    [self.bottBtn1 setBackgroundImage:IMAGE(@"送花-未选中") forState: UIControlStateNormal];
    [self.bottBtn3 setBackgroundImage:IMAGE(@"约会-未选中") forState: UIControlStateNormal];
    
///////////////////////////////送礼物
    self.titleeLb.text = @"送礼物";
    
    
    [self.giveeBtn setTitle:@"赠送" forState:UIControlStateNormal];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV.frame = CGRectMake(10, 0, self.bigBgV.frame.size.width - 20, kScreen_Height/4 - 20 );
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV.frame = CGRectMake(10, 10, self.bigBgV.frame.size.width - 20, kScreen_Height/4 - 20 );
        
        
        
    } else {
        
        self.flowerImgV.frame = CGRectMake(0, 0, self.bigBgV.frame.size.width, kScreen_Height/4 - 20);
    }
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV22.frame = CGRectMake( 10, 0, self.bigBgV22.frame.size.width - 20, kScreen_Height/4 - 20);
    }  else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV22.frame = CGRectMake( 10, 10, self.bigBgV22.frame.size.width - 20, kScreen_Height/4 - 20);
        
    } else {
        
        self.flowerImgV22.frame = CGRectMake(0, 0, self.bigBgV22.frame.size.width, kScreen_Height/4 - 20);
    }
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV33.frame = CGRectMake(15, 0, self.bigBgV33.frame.size.width - 30, kScreen_Height/4 - 40 );
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV33.frame = CGRectMake(15, 10, self.bigBgV33.frame.size.width - 30, kScreen_Height/4 - 40 );
        
    } else {
        
        self.flowerImgV33.frame = CGRectMake(0, 0, self.bigBgV33.frame.size.width, kScreen_Height/4 - 20);
    }
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.flowerImgV44.frame = CGRectMake(10, 10, self.bigBgV44.frame.size.width - 20, kScreen_Height/4 - 40 );
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.flowerImgV44.frame = CGRectMake(10, 10, self.bigBgV44.frame.size.width - 20, kScreen_Height/4 - 40 );
        
    } else {
        
        self.flowerImgV44.frame = CGRectMake(0, 0, self.bigBgV44.frame.size.width, kScreen_Height/4 - 20);
    }
    
    
    
    self.botZheV.backgroundColor = RGB(139, 193, 225);
    self.botZheV22.backgroundColor = RGB(139, 193, 225);
    self.botZheV33.backgroundColor = RGB(139, 193, 225);
    self.botZheV44.backgroundColor = RGB(139, 193, 225);
    
    
    
    
    self.flowerImgV.image = IMAGE(@"幸运星");
    self.flowerImgV22.image = IMAGE(@"蛋糕");
    self.flowerImgV33.image = IMAGE(@"巧克力");
    self.flowerImgV44.image = IMAGE(@"钻戒");
    
    self.flowerNameLb.text = @"幸运星";
    self.flowerNameLb22.text = @"蛋糕";
    self.flowerNameLb33.text = @"巧克力";
    self.flowerNameLb44.text = @"钻戒";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getInteractiveGetInfoDataa];//请求数据
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self bigBgVTaped];//重置界面
    });

    
    
    
    
}

- (void)bottBtn3Clicked:(UIButton *)btn3
{
    [self.bottBtn1 setBackgroundImage:IMAGE(@"送花-未选中") forState: UIControlStateNormal];
    [self.bottBtn2 setBackgroundImage:IMAGE(@"礼物-未选中") forState: UIControlStateNormal];
    [self.bottBtn3 setBackgroundImage:IMAGE(@"约会-选中") forState: UIControlStateNormal];
    
    
    
    
///////////////////////////////约会
    self.titleeLb.text = @"约 会";

    [self.giveeBtn setTitle:@"约会" forState:UIControlStateNormal];
    
    
    self.flowerImgV.frame = CGRectMake(0, 0, self.bigBgV.frame.size.width, kScreen_Height/4 );
    self.flowerImgV22.frame = CGRectMake(0, 0, self.bigBgV.frame.size.width, kScreen_Height/4 );
    self.flowerImgV33.frame = CGRectMake(0, 0, self.bigBgV.frame.size.width, kScreen_Height/4 );
    self.flowerImgV44.frame = CGRectMake(0, 0, self.bigBgV.frame.size.width, kScreen_Height/4 );
    
    self.botZheV.backgroundColor = [UIColor clearColor];
    self.botZheV22.backgroundColor = [UIColor clearColor];
    self.botZheV33.backgroundColor = [UIColor clearColor];
    self.botZheV44.backgroundColor = [UIColor clearColor];
    
    
    self.flowerImgV.image = IMAGE(@"公园2xiu");
    self.flowerImgV22.image = IMAGE(@"电影院");
    self.flowerImgV33.image = IMAGE(@"游乐场");
    self.flowerImgV44.image = IMAGE(@"欧洲游2");
    
    self.flowerNameLb.text = @"公园";
    self.flowerNameLb22.text = @"电影院";
    self.flowerNameLb33.text = @"游乐场";
    self.flowerNameLb44.text = @"欧洲游";

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getInteractiveGetInfoDataa];//请求数据
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self bigBgVTaped];//重置界面
    });


    
    
}








#pragma mark --------------------------------返回
- (void)fanhuiBtnnnClickeeed
{
    [self dismissViewControllerAnimated:YES completion:nil];

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
