//
//  ZMDIYCartoonnSecondDIYYViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/9/27.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMDIYCartoonnSecondDIYYViewController.h"

#import "ZRRImageTool.h"
#import "FaceGrindingImage.h"
#import "ZMCartoonDIYYModel.h"
#import "ZMCarotonnDIYTableViewCell.h"
#import "ZMImageLibbViewController.h"
#import "ZMImageLibbViewController2.h"
#import "ZMCartoonDIYYModel2.h"
#import "ZMCarotonnDIYGlasssTableViewCell.h"

#import "ZRRImageTool.h"
#import "ZMCartoonFaceeTableViewCell.h"




////////测试
#import "ZMHeaderPoartColorSetModel.h"

#import "ZMCarotonnDIYGlasssTableViewCell22.h"

#import "ZMCarrtomDIYYViewController.h"

#import "ZMDiyChooseePhooteViewController.h"

//#define SKINColor RGB(251, 228, 207)

#define SKINColor RGB(242, 208, 180)

@interface ZMDIYCartoonnSecondDIYYViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIGestureRecognizerDelegate>
{
    
    BOOL _chooseGirl;
    
    BOOL _faceTap;
    
    
    BOOL _photoChoose;//点击头像选择照片
    
    
    
    
    UIImageView * _inputImgView;
    
    UIImage     * _inputImg;
    
    
    
    CGFloat _leftEyex;
    
    CGFloat _leftEyey;
    
    
    CGFloat _rightEyex;
    
    CGFloat _rightEyey;
    
    
    CGFloat _moux;
    
    CGFloat _mouy;
    
    
    CGFloat _2eyesLength;///两眼之间的距离
    

    
    
}


@property (nonatomic, strong) UIImage *cutImmmg;//





@property (nonatomic, strong) UIImageView *maskImmmg;//头像背景处理
@property (nonatomic, strong) UIImageView *maskkBgImgVv;//头像背景
@property (nonatomic, strong) UIImageView *maskkBgImgVv2;//头像背景

////////////////////////////第二套
@property (nonatomic, strong) UIImageView *sec_maskImmmg;//头像背景处理
@property (nonatomic, strong) UIImageView *sec_maskkBgImgVv;//头像背景
@property (nonatomic, strong) UIImageView *sec_maskkBgImgVv2;//头像背景

////////////////////////////
@property (nonatomic, strong) UIImageView *bgImgV;//场景
@property (nonatomic, strong) UIImageView *cartoonPImgV;//卡通人物

@property (nonatomic, strong) UIImageView *roleImgV;//身体图片视图
@property (nonatomic, strong) UIImageView *roleImgV2;//身体图片视图2






@property (nonatomic, strong) UIImageView *nodiy_boyImgV;//用户没有设置头像
@property (nonatomic, strong) UIImageView *nodiy_girlImgV;//用户没有设置头像





/////////////////////////////////头像 1
@property (nonatomic, strong) UIImage *headCortImg;//剪切头像
@property (nonatomic, strong) UIImageView *roleBgImgV;//头像背景
@property (nonatomic, strong) UIImageView *roleHeadImgV;//头像
@property (nonatomic, strong) UIImageView *roleHeadCoverImgV;//头像遮罩
@property (nonatomic, strong) UIImageView *roleHeadCoverImgV2;//男脸

@property (nonatomic, strong) UIImageView *sec_roleHeadCoverImgV2;//男脸

@property (nonatomic, strong) UIImageView *roleHeadHairImgV;//头发


@property (nonatomic, strong) UIImageView *sec_boy_roleHeadHairImgV;//头发



@property (nonatomic, strong) UIImageView *roleHeadGlassImgV;//眼镜

@property (nonatomic, strong) UIImageView *sec_boy_glassImgV;//眼镜
@property (nonatomic, strong) UIImageView *sec_girl_glassImgV;//眼镜


///////////////////////////
@property (nonatomic, strong) UIImageView *sec_boy_roleBgImgV;//头像背景
@property (nonatomic, strong) UIImageView *sec_boy_roleHeadImgV;//头像
@property (nonatomic, strong) UIImageView *sec_boy_roleHeadCoverImgV;//头像遮罩


//////////////////////////

/////////////////////////////////头像 2
@property (nonatomic, strong) UIImage *headCortImg2;//剪切头像
@property (nonatomic, strong) UIImageView *roleBgImgV2;//头像背景
@property (nonatomic, strong) UIImageView *roleHeadImgV2;//头像
@property (nonatomic, strong) UIImageView *roleHeadCoverImgV3;//头像遮罩
@property (nonatomic, strong) UIImageView *roleHeadCoverImgV4;//头像遮罩2


////////////////////////////////
@property (nonatomic, strong) UIImageView *sec_girl_roleBgImgV2;//头像背景
@property (nonatomic, strong) UIImageView *sec_girl_roleHeadImgV2;//头像


///////////////////////////////

@property (nonatomic, strong) UIImageView *roleHeadHairImgV2;//角色头发


@property (nonatomic, strong) UIImageView *sec_girl_roleHairImgV;//角色头发




@property (nonatomic, strong) UIImageView *sec_girl_roleHeadHairImgV2;//角色头发


@property (nonatomic, strong) UIImageView *roleHeadGlassImgV2;//角色眼镜




@property (nonatomic, strong) UIButton *boyBtn;//男
@property (nonatomic, strong) UIButton *girlBtn;//女
@property (nonatomic, strong) UIImageView *boygirlBGV;//背景


//@property (nonatomic, strong) UIView *tablebgV;//tableview 背景
@property (nonatomic, strong) UIImageView *tableViewBgImggV;//
@property (nonatomic, strong) UIImageView *boygirlChooseBgV;
//@property (nonatomic, strong) UIImageView *xxtableViewBgImggV;



@property (nonatomic, strong) UIButton *xxBtn;//底部形象按钮
@property (nonatomic, strong) UIButton *glassBtn;//
@property (nonatomic, strong) UIButton *faceBtn;//

@property (nonatomic, strong) UIImageView *tablebgV;//tableview 背景

@property (nonatomic, strong) UIImageView *xxtableViewBgImggV;



@property (nonatomic, strong) UITableView *xxTableV;//底部形象
@property (nonatomic, strong) UITableView *glassTableV;//眼镜
@property (nonatomic, strong) UITableView *faceTableV;//脸型


//@property (nonatomic, strong) UIImageView *botomImgV;//形象 TableView 图片
@property (nonatomic, strong) UIButton *selectBtn;//tableview cell  选择




/// 从相册选择  拍照 view
@property (nonatomic, strong) UIView *photoChosebgV;
@property (nonatomic, strong) UIImageView *faceFV;
@property (nonatomic, strong) UIImageView *photoImgV;
@property (nonatomic, strong) UIImageView *cameraImgV;


//数据源
@property (nonatomic, strong) NSMutableArray *xxMuArray;
@property (nonatomic, strong) NSMutableArray *glassMuArray;
@property (nonatomic, strong) NSMutableArray *faceMuArray;
@property (nonatomic, strong) NSMutableArray *faceMuArray22;

@property (nonatomic, strong) ZMCartoonDIYYModel *xxModel;
@property (nonatomic, strong) ZMCartoonDIYYModel *glassModel;
@property (nonatomic, strong) ZMCartoonDIYYModel *faceModel;

//身体
@property (nonatomic, strong) NSMutableArray *bodyMuArray;

//girl
@property (nonatomic, strong) NSMutableArray *girl_xxMuArray;
@property (nonatomic, strong) NSMutableArray *girl_glassMuArray;
@property (nonatomic, strong) NSMutableArray *girl_faceMuArray;

@property (nonatomic, strong) NSMutableArray *girl_faceMuArray2;



@property (nonatomic, strong) ZMCartoonDIYYModel2 *girl_xxModel;
@property (nonatomic, strong) ZMCartoonDIYYModel2 *girl_glassModel;
@property (nonatomic, strong) ZMCartoonDIYYModel2 *girl_faceModel;




//顶部
@property (nonatomic, strong) UIImageView *topImgVV;
@property (nonatomic, strong) UIButton *fanhuiBtn;
@property (nonatomic, strong) UIButton *saveeBtn;
@property (nonatomic, strong) UIButton *completeeBtn;
@property (nonatomic, strong) UIButton *closeeBtn;



///////背景剪切 头像1
@property (nonatomic, strong) CALayer *maskLayerbgg;
@property (nonatomic, strong) UIImage *maskImgebg;

///////////////////第二套
@property (nonatomic, strong) CALayer *sec_maskLayerbgg;
@property (nonatomic, strong) UIImage *sec_maskImgebg;


///////////////////

///////背景剪切 头像 2
@property (nonatomic, strong) CALayer *maskLayerbgg2;
@property (nonatomic, strong) UIImage *maskImgebg2;


////////////////////
@property (nonatomic, strong) CALayer *sec_maskLayerbgg2;
@property (nonatomic, strong) UIImage *sec_maskImgebg2;


////////////////////////
///脸部 DIY 按钮
@property (nonatomic, strong) UIImageView *faceDiyImgV;


///换脸
@property (nonatomic, strong) UIButton *changediyFaceBtn;
///搭配
@property (nonatomic, strong) UIButton *dapeidiyBtn;




////////////////////测试
@property (nonatomic, strong) NSMutableArray *filetersArray;





@property (nonatomic, strong) UIImage *testtt;
@property (nonatomic, strong) UIImage *girl_testtt;





@property (nonatomic, strong) NSMutableArray *filterNameArray;//滤镜名称





@end

@implementation ZMDIYCartoonnSecondDIYYViewController



+ (ZMDIYCartoonnSecondDIYYViewController *)sharedZMDIYCartoonnSecondDIYYViewController
{
    static ZMDIYCartoonnSecondDIYYViewController *defautVC = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        defautVC = [[self alloc] init];
    });
    
    return defautVC;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    
    
    //_faceTap = YES;///刚进来点击脸部 有选择框
    
    
    _photoChoose = NO;

    
    
    //隐藏状态栏
    //[[UIApplication sharedApplication] setStatusBarHidden:YES];
    

    
    
    
    //滤镜名称数据
    self.filterNameArray = [[NSMutableArray alloc] initWithObjects:
                            @"CIPhotoEffectInstant",//0
                            @"CIPhotoEffectChrome",
                            @"CIPhotoEffectMono",//黑白  2
                            @"CILinearToSRGBToneCurve",//丽日 3
                            @"CIPhotoEffectInstant",//流年  4
                            @"CIPhotoEffectChrome",//淡雅  5
                            @"CIPhotoEffectFade",nil];
    
    
    
    
    
    
    
    
    
    
    
#pragma mark -------------------------------------身体
    
    self.bodyMuArray = [NSMutableArray array];
    
    [self.bodyMuArray addObject:@"动物城-角色-3.5头身"];
    [self.bodyMuArray addObject:@"身体sec"];
    
    
    
    
#pragma mark -------------------------------------男性数据源
    ///数据源
    self.xxMuArray = [NSMutableArray array];
    
    ZMCartoonDIYYModel *diyModel1 = [[ZMCartoonDIYYModel alloc] init];
    diyModel1.xxImgName = @"疯狂动物城-男头发";
    //[self.xxMuArray addObject:diyModel1];
    
    ///测试
    ZMCartoonDIYYModel *diyModel122 = [[ZMCartoonDIYYModel alloc] init];
    diyModel122.xxImgName = @"动物城-场景xiu.jpg";//古装情侣-场景diy
    [self.xxMuArray addObject:diyModel122];
    
    
    ZMCartoonDIYYModel *diyModel2 = [[ZMCartoonDIYYModel alloc] init];
    diyModel2.xxImgName = @"背景sec";
    [self.xxMuArray addObject:diyModel2];
    
    
    
      
    
    //////眼镜
    
    self.glassMuArray = [NSMutableArray array];
    
    
    
    ZMCartoonDIYYModel *diyGlassModel1 = [[ZMCartoonDIYYModel alloc] init];
    diyGlassModel1.glassImgName = @"无眼镜2";
    [self.glassMuArray addObject:diyGlassModel1];
    
    ZMCartoonDIYYModel *diyGlassModel2 = [[ZMCartoonDIYYModel alloc] init];
    diyGlassModel2.glassImgName = @"眼镜-1glas";
    [self.glassMuArray addObject:diyGlassModel2];
    
    ZMCartoonDIYYModel *diyGlassModel3 = [[ZMCartoonDIYYModel alloc] init];
    diyGlassModel3.glassImgName = @"眼镜-2glas";
    [self.glassMuArray addObject:diyGlassModel3];
    
    ZMCartoonDIYYModel *diyGlassModel4 = [[ZMCartoonDIYYModel alloc] init];
    diyGlassModel4.glassImgName = @"眼镜-3glas";
    [self.glassMuArray addObject:diyGlassModel4];
    
    
    
    //////脸型
    
    self.faceMuArray = [NSMutableArray array];
    
    ZMCartoonDIYYModel *diyFaceModel1 = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel1.faceImgName = @"鹿晗脸";
    [self.faceMuArray addObject:diyFaceModel1];
    
    ZMCartoonDIYYModel *diyFaceModel2 = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel2.faceImgName = @"新脸型1";
    [self.faceMuArray addObject:diyFaceModel2];
    
    ZMCartoonDIYYModel *diyFaceModel3 = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel3.faceImgName = @"新脸型2";
    [self.faceMuArray addObject:diyFaceModel3];
    
    
    ZMCartoonDIYYModel *diyFaceModel4 = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel4.faceImgName = @"新脸型3";
    [self.faceMuArray addObject:diyFaceModel4];
    
    
    ZMCartoonDIYYModel *diyFaceModel5 = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel5.faceImgName = @"新脸型4a";
    [self.faceMuArray addObject:diyFaceModel5];
    
    
    
    self.faceMuArray22 = [NSMutableArray array];
    
    ZMCartoonDIYYModel *diyFaceModel1b = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel1b.faceImgName = @"鹿晗脸b";
    [self.faceMuArray22 addObject:diyFaceModel1b];
    
    ZMCartoonDIYYModel *diyFaceModel2b = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel2b.faceImgName = @"新脸型1b";
    [self.faceMuArray22 addObject:diyFaceModel2b];
    
    ZMCartoonDIYYModel *diyFaceModel3b = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel3b.faceImgName = @"新脸型2b";
    [self.faceMuArray22 addObject:diyFaceModel3b];
    
    
    ZMCartoonDIYYModel *diyFaceModel4b = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel4b.faceImgName = @"新脸型3b";
    [self.faceMuArray22 addObject:diyFaceModel4b];
    
    
    ZMCartoonDIYYModel *diyFaceModel5b = [[ZMCartoonDIYYModel alloc] init];
    diyFaceModel5b.faceImgName = @"新脸型4b";
    [self.faceMuArray22 addObject:diyFaceModel5b];
    
    
    
    
    
    
    
#pragma mark ------------------------------------girl 数据源
    ////
    
    self.girl_xxMuArray = [NSMutableArray array];
    
    ZMCartoonDIYYModel2 *diyModel11 = [[ZMCartoonDIYYModel2 alloc] init];
    diyModel11.girl_xxImgName = @"动物城-场景xiu.jpg";
    [self.girl_xxMuArray addObject:diyModel11];
    
    ZMCartoonDIYYModel2 *diyModel22 = [[ZMCartoonDIYYModel2 alloc] init];
    diyModel22.girl_xxImgName = @"背景sec";
    [self.girl_xxMuArray addObject:diyModel22];
    
    
    
    
    
    
    self.girl_glassMuArray = [NSMutableArray array];
    
    
    
    ZMCartoonDIYYModel2 *diyglassModel11 = [[ZMCartoonDIYYModel2 alloc] init];
    diyglassModel11.girl_glassImgName = @"无眼镜2";
    [self.girl_glassMuArray addObject:diyglassModel11];
    
    ZMCartoonDIYYModel2 *diyglassModel22 = [[ZMCartoonDIYYModel2 alloc] init];
    diyglassModel22.girl_glassImgName = @"眼镜-1glas";
    [self.girl_glassMuArray addObject:diyglassModel22];
    
    ZMCartoonDIYYModel2 *diyglassModel33 = [[ZMCartoonDIYYModel2 alloc] init];
    diyglassModel33.girl_glassImgName = @"眼镜-2glas";
    [self.girl_glassMuArray addObject:diyglassModel33];
    
    ZMCartoonDIYYModel2 *diyglassModel44 = [[ZMCartoonDIYYModel2 alloc] init];
    diyglassModel44.girl_glassImgName = @"眼镜-3glas";
    [self.girl_glassMuArray addObject:diyglassModel44];
    
    
    
    
    /////女生脸型
    self.girl_faceMuArray = [NSMutableArray array];
    
    
    ZMCartoonDIYYModel2 *diyfaceModel11 = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel11.girl_faceImgName = @"新女脸型1";
    [self.girl_faceMuArray addObject:diyfaceModel11];
    
    ZMCartoonDIYYModel2 *diyfaceModel22 = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel22.girl_faceImgName = @"新女脸型2";
    [self.girl_faceMuArray addObject:diyfaceModel22];
    
    ZMCartoonDIYYModel2 *diyfaceModel33 = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel33.girl_faceImgName = @"新女脸型3";
    [self.girl_faceMuArray addObject:diyfaceModel33];
    
    ZMCartoonDIYYModel2 *diyfaceModel44 = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel44.girl_faceImgName = @"新女脸型4";
    [self.girl_faceMuArray addObject:diyfaceModel44];
    
    ZMCartoonDIYYModel2 *diyfaceModel55 = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel55.girl_faceImgName = @"新女脸型5";
    [self.girl_faceMuArray addObject:diyfaceModel55];
    
    
    
    
    self.girl_faceMuArray2 = [NSMutableArray array];
    
    
    ZMCartoonDIYYModel2 *diyfaceModel11b = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel11b.girl_faceImgName = @"新女脸型1b";
    [self.girl_faceMuArray2 addObject:diyfaceModel11b];
    
    ZMCartoonDIYYModel2 *diyfaceModel22b = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel22b.girl_faceImgName = @"新女脸型2b";
    [self.girl_faceMuArray2 addObject:diyfaceModel22b];
    
    ZMCartoonDIYYModel2 *diyfaceModel33b = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel33b.girl_faceImgName = @"新女脸型3b";
    [self.girl_faceMuArray2 addObject:diyfaceModel33b];
    
    ZMCartoonDIYYModel2 *diyfaceModel44b = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel44b.girl_faceImgName = @"新女脸型4b";
    [self.girl_faceMuArray2 addObject:diyfaceModel44b];
    
    ZMCartoonDIYYModel2 *diyfaceModel55b = [[ZMCartoonDIYYModel2 alloc] init];
    diyfaceModel55b.girl_faceImgName = @"新女脸型5b";
    [self.girl_faceMuArray2 addObject:diyfaceModel55b];
    
    

    
    
    
    
    
    
    
    //UI
    [self setupBottomButton];
    [self setupCartoonGirlAndBoy];
    [self setupChoosePhotoOrCamera];//弹出从相册选择 拍照视图
    
    [self setupUpsomeOpera];//顶部编辑区
    
    [self girlBtnClicked];//点击女性按钮
    
    
    
    ///脸部 DIY 按钮
    self.faceDiyImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 50 , 50 )];
    self.faceDiyImgV.image = IMAGE(@"脸部DIY");
    self.faceDiyImgV.userInteractionEnabled = YES;
    //[self.view addSubview:self.faceDiyImgV];
    UITapGestureRecognizer *diytap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(faceDiyImgVvTaped)];
    [self.faceDiyImgV addGestureRecognizer:diytap];
    
    self.faceDiyImgV.hidden = YES;
    
    
    
#pragma mark -------------------------------------换脸按钮
    /// 换脸
    self.changediyFaceBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 80, 60, 80 , 80 )];
    self.changediyFaceBtn.backgroundColor = [UIColor clearColor];
    [self.changediyFaceBtn setBackgroundImage:IMAGE(@"换脸图标") forState:UIControlStateNormal];
    
    [self.changediyFaceBtn addTarget:self action:@selector(changediyFaceBtnCliickked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.changediyFaceBtn];
    
    
    
    
#pragma mark ------------------------------------搭配按钮
    ///
    self.dapeidiyBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 80, 160, 80 , 80 )];
    self.dapeidiyBtn.backgroundColor = [UIColor clearColor];
    [self.dapeidiyBtn setBackgroundImage:IMAGE(@"搭配图标") forState:UIControlStateNormal];
    
    [self.dapeidiyBtn addTarget:self action:@selector(dapeidiyBtnCliickked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.dapeidiyBtn];
    
    
    
    self.xxBtn.hidden = YES;
    self.faceBtn.hidden = YES;
    self.glassBtn.hidden = YES;
    
    
#pragma mark -----------------------------------搭配按钮判断
    
    NSString *diy_Dapei = [NSUserDefaults standardUserDefaults].diy_DapeiBtnClicked;
    
    if (diy_Dapei == nil || diy_Dapei == NULL || [diy_Dapei isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        if ([diy_Dapei isEqualToString:@"dapei0"]) {
            
            [self dapeidiyBtnCliickked];

        }
        

        
    }
    
    
    
}



#pragma mark ---------------------------------- UI

- (void)setupBottomButton
{
    
    //场景
    self.bgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width , kScreen_Height )];
    self.bgImgV.image = IMAGE(@"背景sec");
    self.bgImgV.userInteractionEnabled = YES;
    [self.view addSubview:self.bgImgV];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(secondbgImgVTaped)];
    [self.bgImgV addGestureRecognizer:tap];
    
    
    
    
    
    
    //底部性别选择
    self.boygirlBGV = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 100, kScreen_Width, 50)];
    self.boygirlBGV.backgroundColor = [UIColor clearColor];
    self.boygirlBGV.image = IMAGE(@"40X40遮罩zz");
    self.boygirlBGV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.boygirlBGV];
    
    
    self.boygirlBGV.hidden = YES;
    
    
    
    //性别选择
    self.boyBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/3 - 20 , 10, 30, 30)];
    self.boyBtn.backgroundColor = [UIColor clearColor];
    [self.boyBtn setBackgroundImage:IMAGE(@"男性di") forState: UIControlStateNormal] ;
    
    
    //[self.boyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //self.boyBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.boyBtn addTarget:self action:@selector(boyBtnClickedchooseBgHidden) forControlEvents:UIControlEventTouchUpInside];
    
    [self.boygirlBGV addSubview:self.boyBtn];
    
    self.girlBtn = [[UIButton alloc] initWithFrame:CGRectMake(2 * kScreen_Width/3 - 40 + 22, 10, 23, 32)];
    self.girlBtn.backgroundColor = [UIColor clearColor];
    [self.boyBtn setBackgroundImage:IMAGE(@"女性di") forState: UIControlStateNormal] ;
    
    
    
    //[self.girlBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //self.girlBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.girlBtn addTarget:self action:@selector(girlBtnClickedchooseBgHidden) forControlEvents:UIControlEventTouchUpInside];
    
    [self.boygirlBGV addSubview:self.girlBtn];
    
    
    
    
    //底部 DIY
    self.xxBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, kScreen_Height - 50, kScreen_Width/3 - 0.3, 50)];
    self.xxBtn.backgroundColor = [UIColor whiteColor];
    [self.xxBtn setTitle:@"形象" forState:UIControlStateNormal] ;
    [self.xxBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    self.xxBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.xxBtn addTarget:self action:@selector(xxBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.xxBtn];
    
    self.glassBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/3 , kScreen_Height - 50, kScreen_Width/3 - 0, 50)];
    self.glassBtn.backgroundColor = [UIColor whiteColor];
    [self.glassBtn setTitle:@"眼镜" forState:UIControlStateNormal] ;
    [self.glassBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    self.glassBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.glassBtn addTarget:self action:@selector(glassBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.glassBtn];
    
    self.faceBtn = [[UIButton alloc] initWithFrame:CGRectMake((2 * kScreen_Width/3) + 0.5, kScreen_Height - 50, kScreen_Width/3 - 0.5, 50)];
    self.faceBtn.backgroundColor = [UIColor whiteColor];
    [self.faceBtn setTitle:@"脸型" forState:UIControlStateNormal] ;
    [self.faceBtn setTitleColor:RGB(228, 84, 129)  forState:UIControlStateNormal];
    self.faceBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.faceBtn addTarget:self action:@selector(faceBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.faceBtn];
    
    
#pragma mark ---------------------------tableview 背景
    //底部 tableview 背景
//    self.tablebgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 100 , kScreen_Width, 100 )];
//    self.tablebgV.backgroundColor = [UIColor whiteColor];
//    self.tablebgV.image = IMAGE(@"40X40遮罩zz");
//    self.tablebgV.userInteractionEnabled = YES;
    
    //[self.view addSubview:self.tablebgV];
    //self.tablebgV.hidden = YES;
    
    
#pragma mark -------------------------------形象tableview 背景
    
    self.xxtableViewBgImggV = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 105, kScreen_Width, 105)];
    self.xxtableViewBgImggV.image = IMAGE(@"底框3");
    self.xxtableViewBgImggV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.xxtableViewBgImggV];
    
    
    
    
    self.xxTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, kScreen_Width)];
    self.xxTableV.dataSource = self;
    self.xxTableV.delegate = self;
    self.xxTableV.transform = CGAffineTransformMakeRotation(-M_PI /2);//逆时针旋转90
    self.xxTableV.center = CGPointMake(kScreen_Width/2, 50 + 10);//必须设置 center
    self.xxTableV.showsVerticalScrollIndicator = NO;
    
    //
    self.xxTableV.backgroundColor = [UIColor clearColor];
    
    [self.xxtableViewBgImggV addSubview:self.xxTableV];
    
    
    
    //
    //眼镜
    self.glassTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, kScreen_Width)];
    self.glassTableV.dataSource = self;
    self.glassTableV.delegate = self;
    self.glassTableV.transform = CGAffineTransformMakeRotation(-M_PI /2);//逆时针旋转90
    self.glassTableV.center = CGPointMake(kScreen_Width/2, 50);//必须设置 center
    self.glassTableV.showsVerticalScrollIndicator = NO;
    
    //
    self.glassTableV.backgroundColor = [UIColor whiteColor];
    
    

    
    
#pragma mark -------------------------------脸型 TableView
    ///脸型
    
    self.faceTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, kScreen_Width)];
    self.faceTableV.dataSource = self;
    self.faceTableV.delegate = self;
    self.faceTableV.transform = CGAffineTransformMakeRotation(-M_PI /2);//逆时针旋转90
    
    self.faceTableV.center = CGPointMake(kScreen_Width/2, 50  + 65);//必须设置 center  更改坐标用
    
    self.faceTableV.showsVerticalScrollIndicator = NO;
    
    self.faceTableV.backgroundColor = [UIColor clearColor];
    
    //[self.tableViewBgImggV addSubview:self.faceTableV];
    
    
    
    
    
    /////设置 最底下3个按钮
    
    //    self.xxBtn.userInteractionEnabled = NO;
    //    self.glassBtn.userInteractionEnabled = NO;
    //    self.faceBtn.userInteractionEnabled = NO;
    
    
    self.xxBtn.hidden = YES;
    self.glassBtn.hidden = YES;
    self.faceBtn.hidden = YES;
    
    
    
    
    
    
    
    
#pragma mark -------------------------------脸型 TableView 背景
    
    self.tableViewBgImggV = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 165, kScreen_Width, 165)];
    self.tableViewBgImggV.image = IMAGE(@"底框3");
    self.tableViewBgImggV.userInteractionEnabled = YES;
    
    [self.view addSubview:self.tableViewBgImggV];
    
    
    //装饰条
    self.boygirlChooseBgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, kScreen_Width, 50)];
    self.boygirlChooseBgV.image = IMAGE(@"装饰条");
    self.boygirlChooseBgV.userInteractionEnabled = YES;
    
    [self.tableViewBgImggV addSubview:self.boygirlChooseBgV];
    
    
#pragma mark -------------------------------男女 性别选择
    //性别选择
    self.boyBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width/4 - 15 , 10, 30, 30)];
    self.boyBtn.backgroundColor = [UIColor clearColor];
    [self.boyBtn setBackgroundImage:IMAGE(@"男-未选中yboy") forState: UIControlStateNormal] ;
    
    [self.boyBtn addTarget:self action:@selector(boyBtnClickedchooseBgHidden) forControlEvents:UIControlEventTouchUpInside];
    
    [self.boygirlChooseBgV addSubview:self.boyBtn];
    
    self.girlBtn = [[UIButton alloc] initWithFrame:CGRectMake(3 * kScreen_Width/4 - 15, 10, 26, 32)];
    self.girlBtn.backgroundColor = [UIColor clearColor];
    [self.boyBtn setBackgroundImage:IMAGE(@"女-未选中bgil") forState: UIControlStateNormal] ;
    
    
    [self.girlBtn addTarget:self action:@selector(girlBtnClickedchooseBgHidden) forControlEvents:UIControlEventTouchUpInside];
    
    [self.boygirlChooseBgV addSubview:self.girlBtn];
    
    
    
    
#pragma mark -------------------------------脸型 TableView
    ///脸型
    
    self.faceTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, kScreen_Width)];
    self.faceTableV.dataSource = self;
    self.faceTableV.delegate = self;
    self.faceTableV.transform = CGAffineTransformMakeRotation(-M_PI /2);//逆时针旋转90
    
    self.faceTableV.center = CGPointMake(kScreen_Width/2, 50  + 65);//必须设置 center  更改坐标用
    
    self.faceTableV.showsVerticalScrollIndicator = NO;
    
    self.faceTableV.backgroundColor = [UIColor clearColor];
    
    [self.tableViewBgImggV addSubview:self.faceTableV];
    
    
    
    
    self.tableViewBgImggV.hidden = YES;

    
    
    
    
}




#pragma mark - 手势响应事件

- (void)backGroundViewPinchAction:(UIPinchGestureRecognizer *)gesture{
    
    UIView *view = self.roleBgImgV;
    
    
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        
        view.transform = CGAffineTransformScale(view.transform, gesture.scale, gesture.scale);
        
        
        gesture.scale = 1;
    }
    
}
- (void)backGroundViewPanAction:(UIPanGestureRecognizer *)gesture{
    
    if (gesture.numberOfTouches == 1) {
        if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
            CGPoint transLation = [gesture translationInView:self.maskkBgImgVv];
            self.roleBgImgV.center = CGPointMake(self.roleBgImgV.center.x + transLation.x, self.roleBgImgV.center.y + transLation.y);
            [gesture setTranslation:CGPointZero inView:self.maskkBgImgVv];
            
            
            
            
        }
    }
}

- (void)backGroundViewRotationAction:(UIRotationGestureRecognizer *)gesture{
    
    self.roleBgImgV.transform = CGAffineTransformRotate(self.roleBgImgV.transform, gesture.rotation);
    
    
    gesture.rotation = 0;
    
}




- (void)backGroundViewPinchAction22:(UIPinchGestureRecognizer *)gesture{
    
    
//    UIView *view2 = self.bgImgV;//roleBgImgV2
//    
//    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
//        
//        view2.transform = CGAffineTransformScale(view2.transform, gesture.scale, gesture.scale);
//        
//        
//        gesture.scale = 1;
//    }
    
    
}

//////////test
- (void)backGroundViewPinchAction2222:(UIPinchGestureRecognizer *)gesture{
    
    
    UIView *view22 = self.roleImgV;
    
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        
        
        view22.transform = CGAffineTransformScale(view22.transform, gesture.scale, gesture.scale);
        
        
        gesture.scale = 1;
    }
    
}






- (void)backGroundViewPanAction22:(UIPanGestureRecognizer *)gesture{
    
    if (gesture.numberOfTouches == 1) {
        if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
            
            
            CGPoint transLation2 = [gesture translationInView:self.maskkBgImgVv2];
            self.roleBgImgV2.center = CGPointMake(self.roleBgImgV2.center.x + transLation2.x, self.roleBgImgV2.center.y + transLation2.y);
            [gesture setTranslation:CGPointZero inView:self.maskkBgImgVv2];
            
            
        }
    }
}

- (void)backGroundViewRotationAction22:(UIRotationGestureRecognizer *)gesture{
    
    
    self.roleBgImgV2.transform = CGAffineTransformRotate(self.roleBgImgV2.transform, gesture.rotation);
    
    gesture.rotation = 0;
    
}





////允许多事件同时发生
#pragma mark - gesture delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]]) {
        return YES;
    }else if ([gestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]]){
        return YES;
    }else{
        return NO;
    }
    
}




#pragma mark -----------------------------------DIY 头像区
- (void)setupCartoonGirlAndBoy
{
    
#pragma mark -------------------------------------卡通身体
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.roleImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width - 0, kScreen_Height - 0)];
        
    } else {
        self.roleImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, kScreen_Width - 20, kScreen_Height - 0)];
        
    }
    
    self.roleImgV.image = IMAGE(@"身体sec");
    
    [self.bgImgV addSubview:self.roleImgV];
    
    
    //[self.bgImgV addSubview:self.roleImgV];
    

    
    
    
    self.maskLayerbgg = [CALayer layer];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.maskLayerbgg.frame = CGRectMake(0, 0, 115, 130);
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.maskLayerbgg.frame = CGRectMake(0, 0, 115, 130);
        
    } else {
        self.maskLayerbgg.frame = CGRectMake(0, 0, 130, 140);
    }
    
    self.maskImgebg = IMAGE(@"男头b");
        
    //self.maskImgebg = IMAGE(@"男脸线稿大-1bxiu");//头像背景剪切模板     男脸线稿大-1bxiu
    
    self.maskLayerbgg.contents = (__bridge id)self.maskImgebg.CGImage;//根据图片形状裁剪图片
    
    
#pragma mark -------------------------------调整 1-男--脸型剪切
    if ([ZMSystemTool iPhone5Device]) {
        
        self.maskkBgImgVv = [[UIImageView alloc] initWithFrame:CGRectMake(100 - 53, 187 - 47,  115, 130)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.maskkBgImgVv = [[UIImageView alloc] initWithFrame:CGRectMake(100 - 27 - 6, 188 ,  115, 130)];
        
    } else {
        
        self.maskkBgImgVv = [[UIImageView alloc] initWithFrame:CGRectMake(90 - 17, 187 + 23,  130, 140)];
        
    }
        
    
    
    
    self.maskkBgImgVv.backgroundColor = SKINColor;
    
    //self.maskkBgImgVv.backgroundColor = [UIColor orangeColor];
    
    
    self.maskkBgImgVv.userInteractionEnabled = YES;
    
   
    [self.bgImgV addSubview:self.maskkBgImgVv];
    
    self.maskkBgImgVv.layer.mask = self.maskLayerbgg;
    
    
    
    UITapGestureRecognizer *mask = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskkBgImgVrTaped)];
    [self.maskkBgImgVv addGestureRecognizer:mask];
    
    
    
    
    
    ///添加手势
    
    UIRotationGestureRecognizer *rotationGes = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewRotationAction:)];
    rotationGes.delegate = self;
    [self.maskkBgImgVv addGestureRecognizer:rotationGes];
    
    UIPinchGestureRecognizer *pinchGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewPinchAction:)];
    pinchGes.delegate =self;
    [self.maskkBgImgVv addGestureRecognizer:pinchGes];
    
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewPanAction:)];
    [panGes setMinimumNumberOfTouches:1];
    [panGes setMaximumNumberOfTouches:1];
    panGes.delegate = self;
    [self.maskkBgImgVv addGestureRecognizer:panGes];
    
    
    
    
    
    
    
#pragma mark -----------------------------------识别头像背景 1
    ///识别头像背景 1
    if ([ZMSystemTool iPhone5Device]) {
        
         self.roleBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(-2, 7,  125, 135)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        self.roleBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(- 6, 10,  130, 135)];
        
    } else {
        
         //self.roleBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(-50 + 18, -50 + 15,  100, 120)];
        
        self.roleBgImgV = [[UIImageView alloc] initWithFrame:CGRectMake( 0 + 7,  12 + 3,  130, 140)];
        
        
    }

    
    self.roleBgImgV.backgroundColor = SKINColor;
    //self.roleBgImgV.backgroundColor = [UIColor orangeColor];
    self.roleBgImgV.image = IMAGE(@"game_view_head_bg22");
    
    
    self.roleBgImgV.userInteractionEnabled = YES;
    
    //[self.bgImgV addSubview:self.roleBgImgV];///666
    [self.maskkBgImgVv addSubview:self.roleBgImgV];
    
    
    
 
    
    
#pragma mark ----------------------------------人脸识别的图片
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.roleHeadImgV = [[UIImageView alloc] initWithFrame:CGRectMake(28, 32, 75, 75)];
        
    } else {
        
        //self.roleHeadImgV = [[UIImageView alloc] initWithFrame:CGRectMake(54, 80, 80, 80)];
        
        self.roleHeadImgV = [[UIImageView alloc] initWithFrame:CGRectMake(23, 27, 80, 87)];
        
    }

    //self.roleHeadImgV = [[UIImageView alloc] initWithFrame:CGRectMake(54, 80, 80, 80)];
    
    
    self.roleHeadImgV.userInteractionEnabled = YES;
    self.roleHeadImgV.backgroundColor = [UIColor clearColor];
    self.roleHeadImgV.alpha = 0.7;
    
    self.roleHeadImgV.layer.cornerRadius = 5;
    self.roleHeadImgV.layer.masksToBounds = YES;
    
    [self.roleBgImgV addSubview:self.roleHeadImgV];
    
    
#pragma mark ---------------------------------男-盖脸遮罩
    
    if ([ZMSystemTool iPhone5Device]) {
        
        UIImageView *rolll = [[UIImageView alloc] initWithFrame:CGRectMake( -5, 5,  135, 146 - 20)];
        
        rolll.image = IMAGE(@"diyyzhezaoo");//遮罩  game_view_head_bg2zhong//game_view_head_bggf
        
        rolll.userInteractionEnabled = YES;
        
        [self.roleBgImgV addSubview:rolll];
        
        
    } else {
        
        //UIImageView *rolll = [[UIImageView alloc] initWithFrame:CGRectMake(11, 50,  200 - 35, 146 - 15)];
        
        UIImageView *rolll = [[UIImageView alloc] initWithFrame:CGRectMake(- 10 , 5,  150, 146 - 15)];
        
        
        
        //self.roleBgImgV.backgroundColor = SKINColor;
        
        
        rolll.image = IMAGE(@"diyyzhezaoo");//遮罩  game_view_head_bg2zhong//game_view_head_bggf
        
        rolll.userInteractionEnabled = YES;
        
        [self.roleBgImgV addSubview:rolll];
        
    }
    
    
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(10, 10, 200, 220);
    
    UIImage *maskimge = IMAGE(@"男脸线稿大-1b2zhong");//剪切盖脸周围的遮罩
    
    maskLayer.contents = (__bridge id)maskimge.CGImage;//根据图片形状裁剪图片
    
    
    //self.roleBgImgV.layer.mask = maskLayer;
    
    
    
    
    
    //字符串转图片
    
    NSString *faceStr = [NSUserDefaults standardUserDefaults].faceDetectorImageStr;
    
    if (faceStr == nil || faceStr == NULL || [faceStr isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:faceStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *faceImg = [UIImage imageWithData:decodeImgData];
        
        
        
        // 磨皮算法处理的图片
        //UIImage *faceGrindingImg = [FaceGrindingImage imageByBilateralFilterImage:self.headCortImg distance:10.0];
        //        UIImage *transParentImg = [self imageToTransparent:faceGrindingImg];
        //
        //        UIImage *lasttImg1 = [self imageBlackToTransparent:transParentImg];
        
        //        UIImage *transParentImg = [ZRRImageTool imageToTransparent222:faceGrindingImg];
        //
        //        UIImage *lasttImg1 = [ZRRImageTool imageBlackToTransparent222:transParentImg];
        
        
        
        //self.roleHeadImgV.image = lasttImg1;
        //self.roleHeadImgV.image = faceImg;
        
        //        //图片转字符串
        //        NSData *data111 = UIImageJPEGRepresentation(lasttImg1, .2f);
        //        NSString *encodeImgStr111 = [data111 base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        //        [NSUserDefaults standardUserDefaults].lasttImgStr1 = encodeImgStr111;
        
#pragma mark -----------------------------------diy 头像调试
        
//        GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:faceImg];
//        
//        GPUImageBeautifyFilter *beautifyFilter = [[GPUImageBeautifyFilter alloc] init];
//        
//        [beautifyFilter forceProcessingAtSize:faceImg.size];
//        
//        [pic addTarget:beautifyFilter];
//        
//        [pic processImage];
//        
//        [beautifyFilter useNextFrameForImageCapture];
//        
//        UIImage *lsttImgg = [beautifyFilter imageFromCurrentFramebuffer];
//        
        
        //CIImage * inputImage = [[CIImage alloc] initWithImage:lsttImgg];
        //CIContext * context = [CIContext contextWithOptions:nil];
        
        //ZRSketchFilter * filter = [ZRSketchFilter new];
        //filter.inputImage = inputImage;
        
        //CGImageRef cgImage = [context createCGImage:filter.outputImage fromRect:[inputImage extent]];
        
        //UIImage *outImgr = [UIImage imageWithCGImage:cgImage];
        
        
        //UIImage *testtt = [ImageUtil imageWithImage:outImgr withColorMatrix:colormatrix_testt];
        
        //self.testtt = [ImageUtil imageWithImage:outImgr withColorMatrix:colormatrix_testt];
        
        self.testtt = [ZRRImageTool imageTranslateToSuMiao:faceImg];
        
        self.roleHeadImgV.image = self.testtt;
        
        
    }
    
    
    
    
    ///////////////////////////////////////////////////////
    
    
    //////
    self.maskLayerbgg2 = [CALayer layer];
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.maskLayerbgg2.frame = CGRectMake(0, 0, 105, 121);
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.maskLayerbgg2.frame = CGRectMake(0, 0, 105, 121);
        
    }else {
        
        self.maskLayerbgg2.frame = CGRectMake(0, 0, 115, 131);
    }
        
        
    self.maskImgebg2 = IMAGE(@"女头b");//头像背景剪切模板     男脸线稿大-1bxiu
        
        
    
    self.maskLayerbgg2.contents = (__bridge id)self.maskImgebg2.CGImage;//根据图片形状裁剪图片
    
#pragma mark -------------------------------调整 3-女--脸型剪切

    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.maskkBgImgVv2 = [[UIImageView alloc] initWithFrame:CGRectMake(215 - 71 , 157 + 5,  105, 121)];
        
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.maskkBgImgVv2 = [[UIImageView alloc] initWithFrame:CGRectMake(205 - 35, 220 - 2,  105, 121)];
        
        
    } else {
        
        self.maskkBgImgVv2 = [[UIImageView alloc] initWithFrame:CGRectMake(191 , 250 - 10,  115, 131)];
        
    }
    
    
    
    self.maskkBgImgVv2.backgroundColor = SKINColor;
    
    //self.maskkBgImgVv2.backgroundColor = [UIColor orangeColor];
    
    
    self.maskkBgImgVv2.userInteractionEnabled = YES;
    
    [self.bgImgV addSubview:self.maskkBgImgVv2];
    
    self.maskkBgImgVv2.layer.mask = self.maskLayerbgg2;
    
    UITapGestureRecognizer *masktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskkBgImgVv2Taped)];
    [self.maskkBgImgVv2 addGestureRecognizer:masktap];
    
    
    
    
    
    ///////////添加手势
    UIRotationGestureRecognizer *rotationGes2 = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewRotationAction22:)];
    rotationGes2.delegate = self;
    [self.maskkBgImgVv2 addGestureRecognizer:rotationGes2];
    
    UIPinchGestureRecognizer *pinchGes2 = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewPinchAction22:)];
    pinchGes2.delegate =self;
    [self.maskkBgImgVv2 addGestureRecognizer:pinchGes2];
    
    ////////test
    UIPinchGestureRecognizer *pinchGes22 = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewPinchAction2222:)];
    pinchGes22.delegate =self;
    //[self.maskkBgImgVv2 addGestureRecognizer:pinchGes22];
    
    /////////
    
    
    
    UIPanGestureRecognizer *panGes2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(backGroundViewPanAction22:)];
    [panGes2 setMinimumNumberOfTouches:1];
    [panGes2 setMaximumNumberOfTouches:1];
    panGes2.delegate = self;
    [self.maskkBgImgVv2 addGestureRecognizer:panGes2];
    
    
#pragma mark -------------------------------------女-头像背景
    
    ///头像 2
    ///头像背景 2
    if ([ZMSystemTool iPhone5Device]) {
        
        self.roleBgImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(- 1, 28,  110, 100)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
            
        self.roleBgImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(- 5 + 1, 25,  117, 105)];
            

        
    } else {
        
        //self.roleBgImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(8, 24,  110, 120)];
       self.roleBgImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake( - 5, 26,  120, 110)];
        
    }
    //self.roleBgImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20,  100, 120)];
    
    self.roleBgImgV2.backgroundColor = SKINColor;
    //self.roleBgImgV2.backgroundColor = [UIColor redColor];
    
    self.roleBgImgV2.image = IMAGE(@"game_view_head_bg22");
    
    self.roleBgImgV2.userInteractionEnabled = YES;
    
    [self.maskkBgImgVv2 addSubview:self.roleBgImgV2];//
    
    
    //人脸识别的图片 2
    if ([ZMSystemTool iPhone5Device]) {
        
        self.roleHeadImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(22, 18, 58, 62)];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        
        self.roleHeadImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25 - 5, 60, 65)];
        
    } else {
        
        //self.roleHeadImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 70, 70)];
        self.roleHeadImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(28, 20, 67, 72)];
        
    }
    
    //self.roleHeadImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 70, 70)];
    self.roleHeadImgV2.userInteractionEnabled = YES;
    self.roleHeadImgV2.backgroundColor = [UIColor clearColor];
    self.roleHeadImgV2.layer.cornerRadius = 5;
    self.roleHeadImgV2.layer.masksToBounds = YES;
    
    self.roleHeadImgV2.alpha = 0.7;
    
    
    [self.roleBgImgV2 addSubview:self.roleHeadImgV2];///女脸头像图片
    
    
    // 缩放手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchViewtttee:)];
    
    [self.roleHeadImgV2 addGestureRecognizer:pinchGestureRecognizer];
    [self.roleBgImgV2 addGestureRecognizer:pinchGestureRecognizer];
    
    
    
    

#pragma mark ---------------------------------女--盖脸遮罩
 
    if ([ZMSystemTool iPhone5Device]) {
        
        UIImageView *rolll22 = [[UIImageView alloc] initWithFrame:CGRectMake(- 5, -2,  112 , 105)];
        rolll22.image = IMAGE(@"diyyzhezaoo");//遮罩
        
        rolll22.userInteractionEnabled = YES;
        
        [self.roleBgImgV2 addSubview:rolll22];
        
    } else if ([ZMSystemTool iPhone6Device]) {
        
        UIImageView *rolll22 = [[UIImageView alloc] initWithFrame:CGRectMake(2, 0 - 5 ,  110 - 2,  115)];
        rolll22.image = IMAGE(@"diyyzhezaoo");//遮罩
        rolll22.userInteractionEnabled = YES;
        
        [self.roleBgImgV2 addSubview:rolll22];
        
    } else {
        
        //UIImageView *rolll22 = [[UIImageView alloc] initWithFrame:CGRectMake(- 28 + 2, -5,  145 , 180 - 60)];
        UIImageView *rolll22 = [[UIImageView alloc] initWithFrame:CGRectMake( 2, 0 - 2,  125 - 2, 115)];
        
        rolll22.image = IMAGE(@"diyyzhezaoo");//遮罩  game_view_head_bg2zhong//game_view_head_bggf//game_view_head_bggf
        
        rolll22.userInteractionEnabled = YES;
        
        [self.roleBgImgV2 addSubview:rolll22];

    }
    
    
    
    CALayer *maskLayer22 = [CALayer layer];
    maskLayer22.frame = CGRectMake(-20, -50, 200, 220);
    
    UIImage *maskimge22 = IMAGE(@"男脸线稿大-1b2zhong");//剪切盖脸周围的遮罩
    
    maskLayer22.contents = (__bridge id)maskimge22.CGImage;//根据图片形状裁剪图片
    
    
    self.roleBgImgV2.layer.mask = maskLayer22;
    
    
    
    
    
    
    
    
    
    
    
    
    //字符串转图片
    
    NSString *faceStr2 = [NSUserDefaults standardUserDefaults].faceDetectorImageStr2;
    
    if (faceStr2 == nil || faceStr2 == NULL || [faceStr2 isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        NSData *decodeImgData2 = [[NSData alloc] initWithBase64EncodedString:faceStr2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *faceImg2 = [UIImage imageWithData:decodeImgData2];
        
        
        
        
#pragma mark -----------------------------------diy 头像调试
        
//        GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:faceImg2];
//        
//        GPUImageBeautifyFilter *beautifyFilter = [[GPUImageBeautifyFilter alloc] init];
//        
//        [beautifyFilter forceProcessingAtSize:faceImg2.size];
//        
//        [pic addTarget:beautifyFilter];
//        
//        [pic processImage];
//        
//        [beautifyFilter useNextFrameForImageCapture];
//        
//        UIImage *lsttImgg = [beautifyFilter imageFromCurrentFramebuffer];
//        
//        
//        CIImage * inputImage = [[CIImage alloc] initWithImage:lsttImgg];
//        CIContext * context = [CIContext contextWithOptions:nil];
//        
        //ZRSketchFilter * filter = [ZRSketchFilter new];
        //filter.inputImage = inputImage;
        
        //CGImageRef cgImage = [context createCGImage:filter.outputImage fromRect:[inputImage extent]];
        
        //UIImage *outImgr = [UIImage imageWithCGImage:cgImage];
        
        
        //UIImage *testtt = [ImageUtil imageWithImage:outImgr withColorMatrix:colormatrix_testt];
        
        
        
        //self.girl_testtt = [ZRRImageTool imageTranslateToSuMiao:faceImg2];
        
        
        UIImage *transParentImg = [ZRRImageTool imageToTransparent222:faceImg2];
        //
        UIImage *lasttImg1 = [ZRRImageTool imageBlackToTransparent222:transParentImg];
        
        //self.roleHeadImgV2.image = self.girl_testtt;
        
        self.roleHeadImgV2.image = lasttImg1;
        
        
        
    }
    
    
    
    
    
    
#pragma mark --------------------------------调整 2---男脸位置
    //头像遮罩 1  2
    ////////////////男脸
    
        
    if ([ZMSystemTool iPhone5Device]) {
        
        self.roleHeadCoverImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,  115, 130)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.roleHeadCoverImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,  115, 130)];
        
    } else {
        
        self.roleHeadCoverImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 130, 140)];
        
    }
    
    self.roleHeadCoverImgV2.image = IMAGE(@"男头sec");
    
    self.roleHeadCoverImgV2.backgroundColor = [UIColor clearColor];
    [self.maskkBgImgVv addSubview:self.roleHeadCoverImgV2];
    
        
    
       
#pragma mark ---------------------------调整 4---女脸位置
    //头像遮罩 2  2
    ///////////////女脸
    
        
    if ([ZMSystemTool iPhone5Device]) {
        
        self.roleHeadCoverImgV4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,  105, 121)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.roleHeadCoverImgV4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,  105, 121)];
        
    } else {
        
        self.roleHeadCoverImgV4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 115, 132)];
    }

    
    self.roleHeadCoverImgV4.backgroundColor = [UIColor clearColor];
    self.roleHeadCoverImgV4.image = IMAGE(@"女头sec");
    
    [self.maskkBgImgVv2 addSubview:self.roleHeadCoverImgV4];
    
    
       
    
    
#pragma mark --------------------------------调整 5----男 头发
    //头发 1
    
    if ([ZMSystemTool iPhone5Device]) {
        
       
        self.roleHeadHairImgV = [[UIImageView alloc] initWithFrame:CGRectMake(63 - 20, 152 - 47, 115, 93)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.roleHeadHairImgV = [[UIImageView alloc] initWithFrame:CGRectMake(63, 152, 117, 95)];
        
    } else {
        
        self.roleHeadHairImgV = [[UIImageView alloc] initWithFrame:CGRectMake(34 + 42 - 5 , 228 - 50, 127, 95)];
    }
    
    self.roleHeadHairImgV.backgroundColor = [UIColor clearColor];
    
    
    self.roleHeadHairImgV.image = IMAGE(@"男头发2di");
    
    
    
    [self.view addSubview:self.roleHeadHairImgV];
    
    
#pragma mark --------------------------------调整 6----女 头发
    //头发 2

        
    if ([ZMSystemTool iPhone5Device]) {
        
       
        self.roleHeadHairImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(142, 110, 145, 230)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.roleHeadHairImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(185 - 21, 170 , 165 - 10, 240 - 19)];
        
    } else {
        
        self.roleHeadHairImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(180 + 3, 180 + 5, 165 + 5, 240 )];
        
    }
    
        
    self.roleHeadHairImgV2.backgroundColor = [UIColor clearColor];
    self.roleHeadHairImgV2.image = IMAGE(@"女头发2di");
    
    [self.view addSubview:self.roleHeadHairImgV2];///666
    
    
    
    
#pragma mark ----------------------------------用户没有设置头像
    
    if ([ZMSystemTool iPhone5Device]) {
        
        
        self.nodiy_boyImgV = [[UIImageView alloc] initWithFrame:CGRectMake(60, 160, 100, 110)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.nodiy_boyImgV = [[UIImageView alloc] initWithFrame:CGRectMake(78, 210, 100, 110)];
        
    } else {
        
        self.nodiy_boyImgV = [[UIImageView alloc] initWithFrame:CGRectMake(93, 240, 100, 110)];
    }
    
    
    
    self.nodiy_boyImgV.userInteractionEnabled = YES;
    self.nodiy_boyImgV.backgroundColor = [UIColor clearColor];
    self.nodiy_boyImgV.image = IMAGE(@"3boyy");
    
    
    [self.view addSubview:self.nodiy_boyImgV];
    
    UITapGestureRecognizer *notap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskkBgImgVrTaped)];
    [self.nodiy_boyImgV addGestureRecognizer:notap];
    
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.nodiy_girlImgV = [[UIImageView alloc] initWithFrame:CGRectMake(162, 200, 75, 75)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.nodiy_girlImgV = [[UIImageView alloc] initWithFrame:CGRectMake(185, 255, 80, 80)];
        
    } else {
        
        self.nodiy_girlImgV = [[UIImageView alloc] initWithFrame:CGRectMake(210, 278, 80, 90)];
    }
    
    
    
    self.nodiy_girlImgV.userInteractionEnabled = YES;
    self.nodiy_girlImgV.backgroundColor = [UIColor clearColor];
    self.nodiy_girlImgV.image = IMAGE(@"2girl");
    
    [self.view addSubview:self.nodiy_girlImgV];
    
    UITapGestureRecognizer *notap22 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskkBgImgVv2Taped)];
    [self.nodiy_girlImgV addGestureRecognizer:notap22];
    
    
    
    self.nodiy_boyImgV.hidden = YES;
    self.nodiy_girlImgV.hidden = YES;
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#pragma mark --------------------------------调整 9----男-眼镜
    
    
    //眼镜 1
    
   
        //
    if ([ZMSystemTool iPhone5Device]) {
        
        self.roleHeadGlassImgV = [[UIImageView alloc] initWithFrame:CGRectMake(95 - 40, 184, 100, 35)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.roleHeadGlassImgV = [[UIImageView alloc] initWithFrame:CGRectMake(90 - 15, 230 , 100, 35)];
        
    } else {
        
        self.roleHeadGlassImgV = [[UIImageView alloc] initWithFrame:CGRectMake(90, 260, 100, 40)];
    }
    
    
    
    self.roleHeadGlassImgV.backgroundColor = [UIColor clearColor];
    self.roleHeadGlassImgV.image = IMAGE(@"眼镜-1glas");
    
    [self.view addSubview:self.roleHeadGlassImgV];
    
    self.roleHeadGlassImgV.hidden = YES;
    
        
        
#pragma mark --------------------------------调整 10----女-眼镜
    //眼镜 2
    
    
        
    if ([ZMSystemTool iPhone5Device]) {
        
        self.roleHeadGlassImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(200 - 47, 217, 90, 30)];
        
    }else if ([ZMSystemTool iPhone6Device]) {
        
        self.roleHeadGlassImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(200 - 20, 317 - 40 - 3, 90 - 5, 30)];
        
    } else {
        
        self.roleHeadGlassImgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(205 , 300 - 10, 90, 35)];
    }
    
    
    self.roleHeadGlassImgV2.backgroundColor = [UIColor clearColor];
    self.roleHeadGlassImgV2.image = IMAGE(@"眼镜-1glas");
    
    [self.view addSubview:self.roleHeadGlassImgV2];
    
    self.roleHeadGlassImgV2.hidden = YES;
    
        
        
        
    
}




#pragma mark -------------------------------------处理缩放手势
// 处理缩放手势
- (void)pinchViewtttee:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIView *view = pinchGestureRecognizer.view;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
}





- (void)setupChoosePhotoOrCamera
{
    self.photoChosebgV = [[UIView alloc] initWithFrame:CGRectMake(100, 185 - 64,  140, 150)];
    self.photoChosebgV.backgroundColor = [UIColor clearColor];
    
    //[self.view addSubview:self.photoChosebgV];
    
    self.faceFV = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10,  80, 80)];
    self.faceFV.backgroundColor = [UIColor clearColor];
    self.faceFV.image = IMAGE(@"选择区diy");
    //self.faceFV.alpha = 0.4;
    
    [self.photoChosebgV addSubview:self.faceFV];
    
    //从相册选择
    self.photoImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 40, 40)];
    self.photoImgV.userInteractionEnabled = YES;
    self.photoImgV.backgroundColor = [UIColor clearColor];
    self.photoImgV.image = IMAGE(@"图片diy");
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photooImgVTaped)];
    [self.photoImgV addGestureRecognizer:tap];
    
    [self.photoChosebgV addSubview:self.photoImgV];
    
    //拍照
    self.cameraImgV = [[UIImageView alloc] initWithFrame:CGRectMake(80, 100, 40, 40)];
    self.cameraImgV.userInteractionEnabled = YES;
    self.cameraImgV.backgroundColor = [UIColor clearColor];
    self.cameraImgV.image = IMAGE(@"相机diy");
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cameraImgVTaped)];
    [self.cameraImgV addGestureRecognizer:tap2];
    
    [self.photoChosebgV addSubview:self.cameraImgV];
    
    
    
    
    self.photoChosebgV.hidden = YES;
    
    
}

#pragma mark -----------------------------------顶部栏
- (void)setupUpsomeOpera
{
    self.topImgVV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 60)];
    self.topImgVV.userInteractionEnabled = YES;
    self.topImgVV.backgroundColor = [UIColor clearColor];
    self.topImgVV.image = IMAGE(@"40X40遮罩zz");
    
    //[self.view addSubview:self.topImgVV];
    
    
    self.fanhuiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5 - 2, 50, 50)];
    self.fanhuiBtn.backgroundColor = [UIColor clearColor];
    [self.fanhuiBtn setImage:IMAGE(@"返回按键") forState:UIControlStateNormal] ;
    //self.fanhuiBtn.imageEdgeInsets = UIEdgeInsetsMake(3, 5, 7, 13);
    
    [self.fanhuiBtn addTarget:self action:@selector(fanhuiBtnnnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.fanhuiBtn];
    
    
#pragma mark ------------------------------------关闭按钮
    
    self.closeeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5 - 2, 50, 50)];
    self.closeeBtn.backgroundColor = [UIColor clearColor];
    [self.closeeBtn setImage:IMAGE(@"关闭按键") forState:UIControlStateNormal] ;
    //self.fanhuiBtn.imageEdgeInsets = UIEdgeInsetsMake(3, 5, 7, 13);
    
    [self.closeeBtn addTarget:self action:@selector(completeeBtvnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.closeeBtn];
    
    self.closeeBtn.hidden = YES;

    
    
#pragma mark ---------------------------------保存按钮
    
    self.saveeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 80, 5, 80, 45)];
    self.saveeBtn.backgroundColor = [UIColor clearColor];
    [self.saveeBtn setBackgroundImage:IMAGE(@"保存按键") forState:UIControlStateNormal] ;
    //[self.saveeBtn setTitle:@"保存" forState:UIControlStateNormal];
    //[self.saveeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //self.saveeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [self.saveeBtn addTarget:self action:@selector(saveeBttnnnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.saveeBtn];
    
    
    
#pragma mark ---------------------------------完成按钮
    
    self.completeeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 80, 5, 80, 45)];
    self.completeeBtn.backgroundColor = [UIColor clearColor];
    [self.completeeBtn setBackgroundImage:IMAGE(@"完成按键dii") forState:UIControlStateNormal] ;
    //[self.completeeBtn setTitle:@"完成" forState:UIControlStateNormal];
    //[self.completeeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //self.completeeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [self.completeeBtn addTarget:self action:@selector(completeeBtvnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.completeeBtn];
    

    self.completeeBtn.hidden = YES;
    
    

    
    
    
    
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //还原按钮状态
    self.xxBtn.backgroundColor = [UIColor whiteColor];
    [self.xxBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    self.glassBtn.backgroundColor = [UIColor whiteColor];
    [self.glassBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    self.faceBtn.backgroundColor = [UIColor whiteColor];
    [self.faceBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    
    
}









#pragma mark ------------------------------ViewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.baseNavigation.hidden = YES;
    
    self.bgImgV.image = IMAGE(@"背景sec");
    
    
    
    
    
    [self completeeBtvnClicked];
    [self girlBtnClickedchooseBgHidden];
    
    
    
    
    
    
    
    
    //[self faceBtnClicked];
    
    //self.dapeidiyBtn.hidden = NO;
    //self.changediyFaceBtn.hidden = NO;
    
    //self.saveeBtn.hidden = NO;
    //self.completeeBtn.hidden = YES;

    
    
    NSString *first_second = [NSUserDefaults standardUserDefaults].diy_firstOrSecond;
    
    if (first_second == nil || first_second == NULL || [first_second isKindOfClass:[NSNull class]]) {
        
    
        
        
        //[self maskkBgImgVv2Taped];
        
        
        //形象栏
        //[self xxBtnClickedttt];
        
        
    }else {
        
        
        if ([first_second isEqualToString:@"1"]) {
            
           
            [self xxBtnClickedttt];
            
            

            
        }
        
        
        
        if ([first_second isEqualToString:@"2"]) {
            
            
            //self.photoChosebgV.hidden = NO;//脸部框
            
            //self.topImgVV.hidden = NO;
            
            
//            self.dapeidiyBtn.hidden = NO;
//            self.changediyFaceBtn.hidden = NO;
//            ////
//            self.tableViewBgImggV.hidden = NO;
//            //self.xxtableViewBgImggV.hidden = NO;
//            self.fanhuiBtn.hidden = NO;
//            self.saveeBtn.hidden = NO;
        
            
            
//            [self maskkBgImgVv2Taped];
            
            
           
        }
        
        
    }
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    //if (_chooseGirl == YES) {
        //
        
        NSString *faceStr2 = [NSUserDefaults standardUserDefaults].faceDetectorImageStr2;
        
        
        if (faceStr2 == nil || faceStr2 == NULL || [faceStr2 isKindOfClass:[NSNull class]]) {
            
            
            //self.roleHeadImgV2.image = IMAGE(@"2girl");
            
            
            self.nodiy_girlImgV.hidden = NO;
            
            
        }else {
            
            
            self.nodiy_girlImgV.hidden = YES;
            
            
            
            NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:faceStr2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *faceImg = [UIImage imageWithData:decodeImgData];
            
       
            
            
            UIImage *testtt = [ZRRImageTool imageTranslateToSuMiao:faceImg];
            
            
            
            self.roleHeadImgV2.image = testtt;
            
            
            
            //饱和度.亮度.对比度
            //UIImage *immm = [ZRRImageTool colorControlsWithOriginalImage:testtt saturation:1.0 brightness:0.5 contrast:2.0];
            

            //self.roleHeadImgV2.image = immm;
            
            
            //UIImage *imggg = [FaceGrindingImage imageByBilateralFilterImage:faceImg distance:10.0];
            
            //UIImage *transParentImg = [ZRRImageTool imageToTransparent222:imggg];
            //
            //UIImage *lasttImg1 = [ZRRImageTool imageBlackToTransparent222:transParentImg];
            
            //self.roleHeadImgV2.image = lasttImg1;
            
            
            
        }
        
        
        
    //}else {
        
        NSString *faceStr = [NSUserDefaults standardUserDefaults].faceDetectorImageStr;
        
        if (faceStr == nil || faceStr == NULL || [faceStr isKindOfClass:[NSNull class]]) {
            
                       
            self.nodiy_boyImgV.hidden = NO;
            
            
            
            
        }else {
            
            
            self.nodiy_boyImgV.hidden = YES;

            
            
            NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:faceStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *faceImg = [UIImage imageWithData:decodeImgData];
            
            
            
            UIImage *testtt = [ZRRImageTool imageTranslateToSuMiao:faceImg];
            
            //UIImage *colorrImg22 = [ZRRImageTool filerWithOriginalImage:testtt fileterName:[self.filterNameArray objectAtIndex:5]];
            
            
            self.roleHeadImgV.image = testtt;
            
            
            
        }
        
        
    //}
    
    
     //[self secondbgImgVTaped];//复原
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        _photoChoose = NO;
        
    });

    
    
    //[self setupCartoonGirlAndBoy];
    
    
    
}


#pragma mark - tableViewDelegate && dataSource -

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.xxTableV) {
        
        
        
        static  NSString *cellIdentifier = @"cartoon";
        ZMCarotonnDIYTableViewCell *cell= [self.xxTableV dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMCarotonnDIYTableViewCell" owner:self options:nil] lastObject];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        cell.backgroundColor = [UIColor clearColor];
        
        
        
        
        
        if (_chooseGirl == YES) {
            
            //[cell.diySelectedBtn addTarget:self action:@selector(girl_xxTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            cell.diySelectedBtn.tag = indexPath.row;
            
            
            //ZMCartoonDIYYModel2 *girl_diyModel = self.girl_xxMuArray[indexPath.row];
            
            
            if (indexPath.row == 0) {
                cell.xxImmgV.image = IMAGE(@"形象1bb");
            }
            
            if (indexPath.row == 1) {
                cell.xxImmgV.image = IMAGE(@"形象2bb");
            }
            
            
            //cell.diyImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_diyModel.girl_xxImgName]];
            
            cell.diyImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
            
            cell.xxImmgV.transform = CGAffineTransformMakeRotation(M_PI /2);
            
            
            cell.diySelectedBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
            
            //[cell setGirl_diyModel:girl_diyModel];
            
            
            if (indexPath.row == 1) {
                
                [cell.diySelectedBtn setBackgroundImage:[UIImage imageNamed:@"选中diyi"] forState:UIControlStateNormal];
            }
            

            
            
        }else {
            
            //[cell.diySelectedBtn addTarget:self action:@selector(xxTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            cell.diySelectedBtn.tag = indexPath.row;
            
            
            //ZMCartoonDIYYModel *diyModel = self.xxMuArray[indexPath.row];
            
            
            if (indexPath.row == 0) {
                cell.diyImgV.image = IMAGE(@"形象1bb");
            }
            
            if (indexPath.row == 1) {
                cell.diyImgV.image = IMAGE(@"形象2bb");
            }
            
            
            
            //cell.diyImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",diyModel.xxImgName]];
            
            
            cell.diyImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
            //cell.diySelectedBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
            
            
            //[cell setDiyModel:diyModel];
            cell.diySelectedBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
            
           
            
            
            if (indexPath.row == 1) {
                
                [cell.diySelectedBtn setBackgroundImage:[UIImage imageNamed:@"选中dii"] forState:UIControlStateNormal];
            }
            
            
        }
        
        
        return cell;
        
        
        
        
        
#pragma mark ---------------------------------眼镜 cell
        
    }else if (tableView == self.glassTableV){
        
        
        if (indexPath.row == 0) {
            
            
            
            static  NSString *cellIdentifier = @"glassdiy22";
            ZMCarotonnDIYGlasssTableViewCell22 *cell= [self.glassTableV dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if(!cell){
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMCarotonnDIYGlasssTableViewCell22" owner:self options:nil] lastObject];
                
                
                
                
            }
            
            cell.backgroundColor = [UIColor clearColor];
            
            
            if (_chooseGirl == YES) {
                
                //[cell.selectGlassBtn addTarget:self action:@selector(girl_glassTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                
                cell.selectGlassBtn.tag = indexPath.row;
                
                
                ZMCartoonDIYYModel2 *girl_diyModel = self.girl_glassMuArray[indexPath.row];
                
                cell.diyGlassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_diyModel.girl_glassImgName]];
                
                cell.diyGlassImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
                cell.selectGlassBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
                
                
                
                [cell setGirl_diyGlassModel:girl_diyModel];
                
                
            }else {
                
                //[cell.selectGlassBtn addTarget:self action:@selector(glassTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                
                cell.selectGlassBtn.tag = indexPath.row;
                
                
                ZMCartoonDIYYModel *diyModel = self.glassMuArray[indexPath.row];
                
                cell.diyGlassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",diyModel.glassImgName]];
                
                
                cell.diyGlassImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
                cell.selectGlassBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
                
                
                [cell setDiyGlassModel:diyModel];
                
                
                
            }
            
            
            return cell;
            
            
            
            
            
            
        }else {
            
            static  NSString *cellIdentifier = @"glassdiy";
            ZMCarotonnDIYGlasssTableViewCell *cell= [self.glassTableV dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if(!cell){
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMCarotonnDIYGlasssTableViewCell" owner:self options:nil] lastObject];
                
                cell.backgroundColor = [UIColor whiteColor];
                
                
            }
            
            
            
            if (_chooseGirl == YES) {
                
                //[cell.selectGlassBtn addTarget:self action:@selector(girl_glassTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                
                cell.selectGlassBtn.tag = indexPath.row;
                
                
                ZMCartoonDIYYModel2 *girl_diyModel = self.girl_glassMuArray[indexPath.row];
                
                cell.diyGlassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_diyModel.girl_glassImgName]];
                
                cell.diyGlassImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
                cell.selectGlassBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
                
                
                
                [cell setGirl_diyGlassModel:girl_diyModel];
                
                
            }else {
                
                //[cell.selectGlassBtn addTarget:self action:@selector(glassTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                
                cell.selectGlassBtn.tag = indexPath.row;
                
                
                ZMCartoonDIYYModel *diyModel = self.glassMuArray[indexPath.row];
                
                cell.diyGlassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",diyModel.glassImgName]];
                
                
                cell.diyGlassImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
                cell.selectGlassBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
                
                
                [cell setDiyGlassModel:diyModel];
                
                
                
            }
            
            
            return cell;
            
            
            
            
        }
        
        
        
#pragma mark ----------------------------------------脸型 cell
        
    }else if (tableView == self.faceTableV){
        
        
        static  NSString *cellIdentifier = @"facediyyy";
        ZMCartoonFaceeTableViewCell *cell= [self.faceTableV dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ZMCartoonFaceeTableViewCell" owner:self options:nil] lastObject];
            
        }
        
        cell.backgroundColor = [UIColor clearColor];
        
        
        if (_chooseGirl == YES) {
            
            //[cell.selectedFaceBtn addTarget:self action:@selector(girl_faceTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            cell.selectedFaceBtn.tag = indexPath.row;
            
            
            ZMCartoonDIYYModel2 *girl_diyModel = self.girl_faceMuArray[indexPath.row];
            
            ZMCartoonDIYYModel2 *girl_diyModelface = self.girl_faceMuArray2[indexPath.row];
            
            cell.faceeImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_diyModelface.girl_faceImgName]];
            
            
            cell.faceeImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
            cell.diyFaceImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
            cell.selectedFaceBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
            
            
            [cell setGirl_diyFaceModel:girl_diyModel];
            
            
        }else {
            
            //[cell.selectedFaceBtn addTarget:self action:@selector(faceTableVSelectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            cell.selectedFaceBtn.tag = indexPath.row;
            
            
            ZMCartoonDIYYModel *diyModel = self.faceMuArray[indexPath.row];
            
            ZMCartoonDIYYModel *diyModelface = self.faceMuArray22[indexPath.row];
            
            cell.faceeImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",diyModelface.faceImgName]];
            
            cell.faceeImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
            cell.diyFaceImgV.transform = CGAffineTransformMakeRotation(M_PI /2);
            cell.selectedFaceBtn.transform = CGAffineTransformMakeRotation(M_PI /2);
            
            
            [cell setDiyFaceModel:diyModel];
            
            
            
        }
        
        
        return cell;
        
        
        
        
        
    }else {
        
        return nil;
    }
    
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == self.xxTableV) {
        
        if (_chooseGirl == YES) {
            
            return self.girl_xxMuArray.count;
        }else {
            
            return self.xxMuArray.count;
        }
        
    }else if (tableView == self.glassTableV){
        
        if (_chooseGirl == YES) {
            return self.girl_glassMuArray.count;
        }else {
            
            return self.glassMuArray.count;
        }
        
    }else if (tableView == self.faceTableV){
        
        if (_chooseGirl == YES) {
            return self.girl_faceMuArray.count;
        }else {
            
            return self.faceMuArray.count;
        }
        
    }else {
        
        return 0;
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    //    if (tableView == self.xxTableV) {
    //        return 100;
    //    }else if (tableView == self.glassTableV){
    //
    //        return 100;
    //    }else {
    //
    //        return 0;
    //    }
    
    return 100;
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView == self.xxTableV) {
        
        
        
        
        
        
//        if (_chooseGirl == YES) {
//            
//            if (self.girl_xxModel) {
//                self.girl_xxModel.girl_isSelected = !self.girl_xxModel.girl_isSelected;
//            }
//        }else {
//            
//            if (self.xxModel) {
//                self.xxModel.isSelected = !self.xxModel.isSelected;
//            }
//            
//        }
        
        
        
        if (_chooseGirl == YES) {
            //
//            ZMCartoonDIYYModel2 *girl_model = self.girl_xxMuArray[indexPath.row];
//            
//            
//            if (!girl_model.girl_isSelected) {
//                girl_model.girl_isSelected = !girl_model.girl_isSelected;
//                self.girl_xxModel = girl_model;
//            }
//            
//            [self.xxTableV reloadData];
            
            
            
            if (indexPath.row == 0) {
                //
                
                //[self.navigationController popViewControllerAnimated:NO];
                
                
                NSString *first_second = [NSUserDefaults standardUserDefaults].diy_firstOrSecond;
                
                if (first_second == nil || first_second == NULL || [first_second isKindOfClass:[NSNull class]]) {
                    
                    [self.navigationController popViewControllerAnimated:NO];
                    
                    //[self.navigationController pushViewController:[ZMCarrtomDIYYViewController sharedZMCarrtomDIYYViewController] animated:NO];
                    
                    
                }else {
                    
                    if ([first_second isEqualToString:@"1"]) {
                        
                        //[self.navigationController pushViewController:[ZMCarrtomDIYYViewController sharedZMCarrtomDIYYViewController] animated:NO];
                        
                        [self.navigationController popViewControllerAnimated:NO];
                        
                    }

                    
                    
                    if ([first_second isEqualToString:@"2"]) {
                        
                        [self.navigationController pushViewController:[ZMCarrtomDIYYViewController sharedZMCarrtomDIYYViewController] animated:NO];
                    }
                    
                    
                }

                
                
                
                
                
            }else {
                
                
                
                
            }
            
            
            
        }else {
            
//            ZMCartoonDIYYModel *model = self.xxMuArray[indexPath.row];
//            
//            if (!model.isSelected) {
//                model.isSelected = !model.isSelected;
//                self.xxModel = model;
//            }
//            
//            [self.xxTableV reloadData];
            
            
            if (indexPath.row == 0) {
                //
                
                //[self.navigationController popViewControllerAnimated:NO];
                
                //[self.navigationController pushViewController:[ZMCarrtomDIYYViewController sharedZMCarrtomDIYYViewController] animated:NO];
                
                
                
            }else {
                
                
                
                
            }

            
            
        }
        
        
        
    }else  if (tableView == self.glassTableV) {
        
        
        if (_chooseGirl == YES) {
            
            if (self.girl_glassModel) {
                self.girl_glassModel.girl_isSelected = !self.girl_glassModel.girl_isSelected;
            }
        }else {
            
            if (self.glassModel) {
                self.glassModel.isSelected = !self.glassModel.isSelected;
            }
            
        }
        
        
        
        if (_chooseGirl == YES) {
            //
            
            self.roleHeadGlassImgV2.hidden = NO;
            
            
            ZMCartoonDIYYModel2 *girl_model = self.girl_glassMuArray[indexPath.row];
            
            if (!girl_model.girl_isSelected) {
                girl_model.girl_isSelected = !girl_model.girl_isSelected;
                self.girl_glassModel = girl_model;
            }
            
            [self.glassTableV reloadData];
            
            //ZMCartoonDIYYModel *model = self.xxMuArray[indexPath.row];
            
            
            if (indexPath.row == 0) {
                
                
                self.roleHeadGlassImgV2.image = [UIImage imageNamed:@""];
                
                
            }else {
                
                
                self.roleHeadGlassImgV2.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_model.girl_glassImgName]];
                
                
            }
            
            
            
            
        }else {
            
            self.roleHeadGlassImgV.hidden = NO;
            
            
            ZMCartoonDIYYModel *model = self.glassMuArray[indexPath.row];
            
            if (!model.isSelected) {
                model.isSelected = !model.isSelected;
                self.glassModel = model;
            }
            
            [self.glassTableV reloadData];
            
            //ZMCartoonDIYYModel *model = self.xxMuArray[indexPath.row];
            
            
            if (indexPath.row == 0) {
                
                    
                self.roleHeadGlassImgV.image = [UIImage imageNamed:@""];
                    
               
            }else {
                
               
                    
                self.roleHeadGlassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.glassImgName]];
                
                
            }
            
            
            
            
            
        }
        
#pragma mark -----------------------------------------换脸型
        
    }else  if (tableView == self.faceTableV) {
        
        
        if (_chooseGirl == YES) {
            
            if (self.girl_faceModel) {
                self.girl_faceModel.girl_isSelected = !self.girl_faceModel.girl_isSelected;
            }
        }else {
            
            if (self.faceModel) {
                self.faceModel.isSelected = !self.faceModel.isSelected;
            }
            
        }
        
        
        
        if (_chooseGirl == YES) {
            //
            
            //self.roleHeadGlassImgV2.hidden = NO;
            
            
            ZMCartoonDIYYModel2 *girl_model = self.girl_faceMuArray[indexPath.row];
            
            ZMCartoonDIYYModel2 *girl_model2 = self.girl_faceMuArray2[indexPath.row];
            
            
            if (!girl_model.girl_isSelected) {
                girl_model.girl_isSelected = !girl_model.girl_isSelected;
                self.girl_faceModel = girl_model;
            }
            
            [self.faceTableV reloadData];
            
            
            
            
            self.maskImgebg2 = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_model2.girl_faceImgName]];
            
            self.maskLayerbgg2.contents = (__bridge id)self.maskImgebg2.CGImage;//根据图片形状裁剪图片
            
            
            self.maskkBgImgVv2.layer.mask = self.maskLayerbgg2;
            
            
             self.roleHeadCoverImgV4.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_model.girl_faceImgName]];
            
#pragma mark --------------------------------女脸--换脸 调整坐标
            
            if (indexPath.row == 0) {
                //
                
                if ([ZMSystemTool iPhone5Device]) {
                    
                    self.maskkBgImgVv2.frame = CGRectMake(215 - 75 , 157 + 5,  105, 121);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 105, 121);
                    
                    //头发
                    self.roleHeadHairImgV2.frame = CGRectMake(142, 110, 145, 230);//CGRectMake(185 - 45, 150 - 40, 150, 210);
                    
                    
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    
                    self.maskkBgImgVv2.frame = CGRectMake(190 - 2, 250 - 14 + 6,  115, 131);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 115, 131);
                    
                    
                    
                }

//                self.roleHeadHairImgV2.image = IMAGE(@"女头发2di");
                
                
                
            }
            
            
            if (indexPath.row == 1) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    
                    self.maskkBgImgVv2.frame = CGRectMake(215 - 74 , 157 + 5,  105, 121);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 105, 121);
                    
                    //头发
                    self.roleHeadHairImgV2.frame = CGRectMake(142, 110, 145, 230);//(185 - 45, 150 - 40, 150, 210);
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    self.maskkBgImgVv2.frame = CGRectMake(190 - 1, 250 - 15 + 6,  115, 131);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 115, 131);
                    
                }


                
                
            }
            
            
            if (indexPath.row == 2) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    
                    
                    self.maskkBgImgVv2.frame = CGRectMake(215 - 73 , 157 + 5,  105, 121);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 105, 121);
                    
                    //头发
                    self.roleHeadHairImgV2.frame = CGRectMake(142, 110, 145, 230);//(185 - 45, 150 - 40, 150, 210);
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    self.maskkBgImgVv2.frame = CGRectMake(190 - 2, 250 - 15 + 6,  115, 131);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 115, 131);
                    
                }

                
                
                
            }
            
            if (indexPath.row == 3) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    
                    self.maskkBgImgVv2.frame = CGRectMake(215 - 73, 157 + 5,  105, 121);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 105, 121);
                    
                    //头发
                    self.roleHeadHairImgV2.frame = CGRectMake(142, 110, 145, 230);//(185 - 45, 150 - 40, 150, 210);
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    self.maskkBgImgVv2.frame = CGRectMake(190 - 2, 250 - 15 + 6,  115, 131);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 115, 131);
                    
                }

                
               
                
            }
            
            if (indexPath.row == 4) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    
                    self.maskkBgImgVv2.frame = CGRectMake(215 - 73 , 157 + 5,  105, 121);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 105, 121);
                    
                    //头发
                    self.roleHeadHairImgV2.frame = CGRectMake(142, 110, 145, 230);//(185 - 45, 150 - 40, 150, 210);
                    
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    
                    self.maskkBgImgVv2.frame = CGRectMake(190 - 2, 250 - 15 + 6,  115, 131);
                    
                    
                    self.roleHeadCoverImgV4.frame = CGRectMake(0, 0, 115, 131);
                    
                    
                }

                
                
                
            }
            
            
            
            
            
         
            
            
        }else {
            
            //self.roleHeadGlassImgV.hidden = NO;
            
            
            ZMCartoonDIYYModel *modelaa = self.faceMuArray22[indexPath.row];
            
            ZMCartoonDIYYModel *model = self.faceMuArray[indexPath.row];
            
            
            if (!model.isSelected) {
                model.isSelected = !model.isSelected;
                self.faceModel = model;
            }
            
            [self.faceTableV reloadData];
            
            
            
            //self.roleHeadGlassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.glassImgName]];
            
            
            
            
            //self.maskImgebg = IMAGE(@"角色2-脸(2)zhongg");//背景剪切模板
            self.maskImgebg = [UIImage imageNamed:[NSString stringWithFormat:@"%@",modelaa.faceImgName]];
            
            self.maskLayerbgg.contents = (__bridge id)self.maskImgebg.CGImage;//根据图片形状裁剪图片
            
            
            self.maskkBgImgVv.layer.mask = self.maskLayerbgg;
            
            self.roleHeadCoverImgV2.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.faceImgName]];
            
#pragma mark --------------------------------男脸--换脸 调整坐标
            
            if (indexPath.row == 0) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    
                    self.maskkBgImgVv.frame = CGRectMake(100 - 53, 187 - 47,  115, 130);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0, 0, 115, 130);
                    
                    //头发
                    
                    self.roleHeadHairImgV.frame = CGRectMake(63 - 20, 152 - 45, 115, 93);//CGRectMake(34 + 8, 128 - 22, 115, 95);
                        
                   
                    
                    
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    self.maskkBgImgVv.frame = CGRectMake(90 - 17, 187 + 23,  130, 140);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0 , 0, 130, 140);
                    
                    
                    
                }

                //self.roleHeadHairImgV.image = IMAGE(@"男头发2di");
                
                
            }
            
            if (indexPath.row == 1) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    
                    self.maskkBgImgVv.frame = CGRectMake(100 - 53, 187 - 47,  115, 130);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0, 0, 115, 130);
                    
                    //头发
                    
                    self.roleHeadHairImgV.frame = CGRectMake(34 + 10, 128 - 24, 110, 95);
                    
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    
                    self.maskkBgImgVv.frame = CGRectMake(90 - 17, 187 + 23,  130, 140);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0 , 0, 130, 140);
                    

                    
                    
                }

               
                
            }
            
            if (indexPath.row == 2) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    
                    self.maskkBgImgVv.frame = CGRectMake(100 - 53, 187 - 47,  115, 130);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0, 0, 115, 130);
                    
                    //头发
                    
                    self.roleHeadHairImgV.frame = CGRectMake(34 + 10, 128 - 26, 115, 98);
                    
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    
                    self.maskkBgImgVv.frame = CGRectMake(90 - 17, 187 + 23,  130, 140);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0 , 0, 130, 140);
                    

                    
                    
                }

                
                
                
            }
            
            if (indexPath.row == 3) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    self.maskkBgImgVv.frame = CGRectMake(100 - 53, 187 - 47,  115, 130);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0, 0, 115, 130);
                    
                    //头发
                    
                    self.roleHeadHairImgV.frame = CGRectMake(34 + 8, 128 - 24, 115, 98);
                    
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    self.maskkBgImgVv.frame = CGRectMake(90 - 17, 187 + 23,  130, 140);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0 , 0, 130, 140);
                    

                    
                    
                }

               
                
                
            }
            
            if (indexPath.row == 4) {
                //
                if ([ZMSystemTool iPhone5Device]) {
                    
                    
                    
                    self.maskkBgImgVv.frame = CGRectMake(100 - 53, 187 - 47,  115, 130);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0, 0, 115, 130);
                    
                    //头发
                    
                    self.roleHeadHairImgV.frame = CGRectMake(34 + 8, 128 - 26, 115, 96);
                    
                    
                }else if ([ZMSystemTool iPhone6Device]) {
                    
                    
                    
                } else {
                    
                    self.maskkBgImgVv.frame = CGRectMake(90 - 17, 187 + 23,  130, 140);
                    
                    
                    self.roleHeadCoverImgV2.frame = CGRectMake(0 , 0, 130, 140);
                    

                }

                
                
            }

            
            
            
            
            
        }
        
        
        
    }else {
        
        
    }
    
    
    
    
    
    
    
    
}


#pragma mark ------右侧按钮
//右侧按钮
- (void)navRightBtnAction:(UIButton*)sender
{
    
}



- (void)changediyFaceBtnCliickked
{
    ZMDiyChooseePhooteViewController *choose = [[ZMDiyChooseePhooteViewController alloc] init];
    
    [self.navigationController pushViewController:choose animated:YES];


}


#pragma mark -----------------------------顶部栏 完成按钮
- (void)completeeBtvnClicked
{
    
    self.fanhuiBtn.hidden = NO;
    self.closeeBtn.hidden = YES;
    
    ////
    self.saveeBtn.hidden = NO;
    self.completeeBtn.hidden = YES;
    
    self.dapeidiyBtn.hidden = NO;
    self.changediyFaceBtn.hidden = NO;
    
    
    ////
    self.tableViewBgImggV.hidden = NO;
    self.xxtableViewBgImggV.hidden = YES;

    
    
}




#pragma mark --------------------------------搭配按钮
- (void)dapeidiyBtnCliickked
{
    
    [self xxBtnClicked];
    
    self.dapeidiyBtn.hidden = YES;
    self.changediyFaceBtn.hidden = YES;
    
    self.saveeBtn.hidden = YES;
    self.completeeBtn.hidden = NO;
    self.closeeBtn.hidden = NO;
    
    
    
    self.tableViewBgImggV.hidden = YES;
    self.xxtableViewBgImggV.hidden = NO;
    
    
}



#pragma mark --------------------------人脸识别代码
/**
 *  人脸识别综合示例代码（包括人脸图片提取、人脸个数、人脸定位）
 */
- (void)recognitionFaces
{
    CIContext * context = [CIContext contextWithOptions:nil];
    
    UIImage * imageInput = [_inputImgView image];
    
    CIImage * image = [CIImage imageWithCGImage:imageInput.CGImage];
    
    
    NSDictionary * param = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    CIDetector * faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:context options:param];
    
    
    NSArray * detectResult = [faceDetector featuresInImage:image];
    
    
    //NSLog(@"detectResult__%@",detectResult);
    
    
    
    UIView * resultView = [[UIView alloc] initWithFrame:_inputImgView.frame];
    
    
    [self.view addSubview:resultView];
    
    
    
    for (CIFaceFeature * faceFeature in detectResult) {
        
        UIView *faceView = [[UIView alloc] initWithFrame:faceFeature.bounds];
        faceView.layer.borderColor = [UIColor redColor].CGColor;
        faceView.layer.borderWidth = 1;
        [resultView addSubview:faceView];
        
        
        if (faceFeature.hasLeftEyePosition) {
            
            UIView * leftEyeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
            [leftEyeView setCenter:faceFeature.leftEyePosition];
            leftEyeView.layer.borderWidth = 1;
            leftEyeView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:leftEyeView];
            
            
            
            NSLog(@"左眼中心点   x:: %.f  y:: %.f",faceFeature.leftEyePosition.x, _inputImg.size.height - faceFeature.leftEyePosition.y);
            
            _leftEyex = faceFeature.leftEyePosition.x;
            _leftEyey = _inputImg.size.height - faceFeature.leftEyePosition.y;
            
            
        }
        
        
        if (faceFeature.hasRightEyePosition) {
            
            UIView * rightEyeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
            [rightEyeView setCenter:faceFeature.rightEyePosition];
            rightEyeView.layer.borderWidth = 1;
            rightEyeView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:rightEyeView];
            
            
            NSLog(@"右眼中心点   x:: %.f  y:: %.f",faceFeature.rightEyePosition.x, _inputImg.size.height - faceFeature.rightEyePosition.y);
            
            
            _rightEyex = faceFeature.rightEyePosition.x;
            _rightEyey = _inputImg.size.height - faceFeature.rightEyePosition.y;
            
            
            
        }
        
        if (faceFeature.hasMouthPosition) {
            
            UIView * mouthView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
            [mouthView setCenter:faceFeature.mouthPosition];
            mouthView.layer.borderWidth = 1;
            mouthView.layer.borderColor = [UIColor redColor].CGColor;
            [resultView addSubview:mouthView];
            
            
            
            NSLog(@"嘴中心点   x:: %.f  y:: %.f",faceFeature.mouthPosition.x, _inputImg.size.height - faceFeature.mouthPosition.y);
            
            
            _moux = faceFeature.mouthPosition.x;
            _mouy = _inputImg.size.height - faceFeature.mouthPosition.y;
            
            
        }
        
        
    }
    
    [resultView setTransform:CGAffineTransformMakeScale(1, -1)];
    //
    
    
    NSLog(@"两眼 中心点之间的距离: %.f",_rightEyex - _leftEyex);
    
    
    _2eyesLength = _rightEyex - _leftEyex;
    
    

    
}




- (void)headporitImageClicked
{
    NSLog(@"两眼 中心点之间的距离: %.f",_2eyesLength);
    
    
    NSString *eyeslengthStr = [NSString stringWithFormat:@"%.f",_2eyesLength];
    
    
    if (_2eyesLength >= 300) {
        
        UIImage *cuttImg300 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 120 , _leftEyey - 160 , (_rightEyex - _leftEyex) + (2 * 120) , (_mouy - _leftEyey) + 160 + 150)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg300, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
        
        
    }
    
    
    if (_2eyesLength >= 210 && _2eyesLength < 300) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 , (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 130)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }
    
    
    if (_2eyesLength >= 100 && _2eyesLength < 210) {
        //
        UIImage *cuttImg100 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 70 , _leftEyey - 100 , (_rightEyex - _leftEyex) + (2 * 70) , (_mouy - _leftEyey) + 100 + 70)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg100, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
       [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
    }
    
    
    
    
    if (_2eyesLength < 100 || [eyeslengthStr isEqualToString:@"0"]) {
        //
        UIImage *cut_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImagecuttt:_inputImg];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cut_img, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
       [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = cuttStr;
        
        
    }
    
    

}





- (void)boyyHeadporitImageClicked
{
    NSLog(@"两眼 中心点之间的距离: %.f",_2eyesLength);
    
    
    NSString *eyeslengthStr = [NSString stringWithFormat:@"%.f",_2eyesLength];
    
    
    if (_2eyesLength >= 300) {
        
        UIImage *cuttImg300 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 120 , _leftEyey - 160 , (_rightEyex - _leftEyex) + (2 * 120) , (_mouy - _leftEyey) + 160 + 150)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg300, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
        
        
    }
    
    
    if (_2eyesLength >= 210 && _2eyesLength < 300) {
        //
        UIImage *cuttImg210 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 100 , _leftEyey - 140 , (_rightEyex - _leftEyex) + (2 * 100) , (_mouy - _leftEyey) + 140 + 130)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg210, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
    }
    
    
    if (_2eyesLength >= 100 && _2eyesLength < 210) {
        //
        UIImage *cuttImg100 = [_inputImg imageAtRect:CGRectMake(_leftEyex - 70 , _leftEyey - 100 , (_rightEyex - _leftEyex) + (2 * 70) , (_mouy - _leftEyey) + 100 + 70)];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cuttImg100, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
    }
    
    
    
    
    if (_2eyesLength < 100 || [eyeslengthStr isEqualToString:@"0"]) {
        //
        UIImage *cut_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImagecuttt:_inputImg];
        
        
        NSData *imgData = UIImageJPEGRepresentation(cut_img, .2f);
        NSString *cuttStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        
        [NSUserDefaults standardUserDefaults].faceDetectorImageStr = cuttStr;
        
        
    }
    
    
    
}








#pragma mark ------------------------------从相册选择 delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    if (_chooseGirl == YES) {
        //
        NSLog(@"_______choose____girl_______");
        
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            
            
            
            [AnyObjectActivityView showWithTitle:@"头像处理中..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            UIImage *tempImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
            
            //self.cutImmmg = tempImage;
            
            
            
            //[self recognitionFaces];
            
            
//            UIImage *girl_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:tempImage];
//            
//            
//            NSData *imgData = UIImageJPEGRepresentation(girl_img, .2f);
//            NSString *encodeImgStr2 = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//            
//            [NSUserDefaults standardUserDefaults].faceDetectorImageStr2 = encodeImgStr2;
            
            
            ///////刷新界面
            //[self viewWillAppear:NO];
            
            
            
            //跳到手动截取页面
            
            
            //UIImage *faceGrindingImg = [FaceGrindingImage imageByBilateralFilterImage:tempImage distance:10.0];
            
            
            //UIImage *iimmm = [ZRRImageTool filerWithOriginalImage:tempImage fileterName:self.filterNameArray[3]];
            
            UIImage *girl_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:tempImage];
            
            
            
            
            
            _inputImg = girl_img;
            
            
            _inputImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height, _inputImg.size.width,_inputImg.size.height)];
            
            
            [_inputImgView setImage:_inputImg];
            
            [self.view addSubview:_inputImgView];
            
            NSLog(@"原始图片大小   x: %.f  y: %.f",_inputImg.size.width,_inputImg.size.height);//
            
            
            
            
            [self recognitionFaces];
            
            
            [self headporitImageClicked];
            
            
            ///////刷新界面
            [self viewWillAppear:NO];
            
            
            
            
            
            
            
            
            
            
            
            //NSData *imgData = UIImageJPEGRepresentation(girl_img, .2f);
            
            //NSString *encodeImgStr2 = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
            
            //[APPTransmit shareInstance].imgStrr2 = encodeImgStr2;

            //[APPTransmit shareInstance].justStt = @"nv";

            //ZMImageLibbViewController2 *imgLibVC = [[ZMImageLibbViewController2 alloc] init];
            
            //[self.navigationController pushViewController:imgLibVC animated:YES];

            
            
            
            
            
            
            
            
        }];
        
        
        
    } else {
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            
            
            [AnyObjectActivityView showWithTitle:@"头像处理中..." wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
            
            
            
            UIImage *tempImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
            
            
            UIImage *boy_img = [[IFlyFaceHelper sharedFaceHelper] startFaceDetectorWithImage:tempImage];

            
            _inputImg = boy_img;
            
            
            _inputImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreen_Height, _inputImg.size.width,_inputImg.size.height)];
            
            
            [_inputImgView setImage:_inputImg];
            
            [self.view addSubview:_inputImgView];
            
            NSLog(@"原始图片大小   x: %.f  y: %.f",_inputImg.size.width,_inputImg.size.height);//
            
            
            
            
            [self recognitionFaces];
            
            
            [self boyyHeadporitImageClicked];

            
            
            ///////刷新界面
            [self viewWillAppear:NO];
            
            
            
            //            [APPTransmit shareInstance].imgStrr = encodeImgStr;
            //
            //            [APPTransmit shareInstance].justStt = @"nan";
            //
            //            ZMImageLibbViewController *imgLibVC = [[ZMImageLibbViewController alloc] init];
            //
            //
            //            [self.navigationController pushViewController:imgLibVC animated:YES];
            
        }];
        
        
    }
    
    
    
    
    
    
    
}





#pragma mark -------------------------------- Button Event

#pragma mark ---------------------------------- 从相册选择

//从相册选择
- (void)photooImgVTaped
{
    
    _photoChoose = YES;

    
    
    
    
    self.photoChosebgV.hidden = YES;
    ///底部三个按钮
    self.xxBtn.userInteractionEnabled = YES;
    self.glassBtn.userInteractionEnabled = YES;
    self.faceBtn.userInteractionEnabled = YES;
    
    
    
    //    if (_chooseGirl == YES) {
    //        //
    //
    //        NSLog(@"_______choose____girl_______");
    //
    //    }else {
    //
    //        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //
    //        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //        picker.delegate = self;
    //        //设置选择后的图片可被编辑
    //        picker.allowsEditing = NO;
    //        [self presentViewController:picker animated:YES completion:^{
    //
    //            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    //        }];
    //
    //
    //    }
    
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:^{
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }];
    
    
    
    
    
}

#pragma mark -------------------------------------- 拍照
//拍照
- (void)cameraImgVTaped
{
    
    _photoChoose = YES;

    
    
    
    
    
    self.photoChosebgV.hidden = YES;
    
    self.xxBtn.userInteractionEnabled = YES;
    self.glassBtn.userInteractionEnabled = YES;
    self.faceBtn.userInteractionEnabled = YES;
    
    
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = NO;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
    
    
    
    
    
}








//点击 下边 男性按钮
- (void)boyBtnClicked
{
    
    _chooseGirl = NO;
    
    [self.xxTableV reloadData];
    [self.glassTableV reloadData];
    [self.faceTableV reloadData];
    
    
    
    
    
    
    
    if (_chooseGirl == NO) {
        [self.boyBtn setBackgroundImage:IMAGE(@"男性-选中di") forState: UIControlStateNormal] ;
        
        [self.girlBtn setBackgroundImage:IMAGE(@"女性di") forState: UIControlStateNormal] ;
        
    }
    
    
    
    if (_faceTap) {
        self.photoChosebgV.hidden = NO;
    }else {
        
        self.photoChosebgV.hidden = YES;
    }
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.photoChosebgV.frame = CGRectMake(190 - 20, 310 - 40,  140, 150);
        
    }else if ([ZMSystemTool iPhone6Device]) {
        self.photoChosebgV.frame = CGRectMake(90 - 15, 205 - 25,  140, 150);
        
    } else {
        self.photoChosebgV.frame = CGRectMake(90, 205 ,  140, 150);
        
    }
    
    
    
    
    
    
}


- (void)girlBtnClicked
{
    _chooseGirl = YES;
    
    
    [self.boyBtn setBackgroundImage:IMAGE(@"男性di") forState: UIControlStateNormal] ;
    
    
    if (_chooseGirl == YES) {
        [self.girlBtn setBackgroundImage:IMAGE(@"女性-选中di") forState: UIControlStateNormal] ;
    }
    
    
    [self.xxTableV reloadData];
    [self.glassTableV reloadData];
    [self.faceTableV reloadData];
    
    
    
    
    
    
    
    if (_faceTap) {
        self.photoChosebgV.hidden = NO;
    }else {
        
        self.photoChosebgV.hidden = YES;
    }
    
    
    
    if ([ZMSystemTool iPhone5Device]) {
        
        self.photoChosebgV.frame = CGRectMake(190 - 20, 310 - 40,  140, 150);
        
    }else if ([ZMSystemTool iPhone6Device]) {
        self.photoChosebgV.frame = CGRectMake(190 - 20, 310 - 40,  140, 150);
        
        
    } else {
        self.photoChosebgV.frame = CGRectMake(190, 310,  140, 150);
        
    }
    
    
    
    
}



- (void)boyBtnClickedchooseBgHidden
{
    
    _chooseGirl = NO;
    
    //[self.xxTableV reloadData];
    //[self.glassTableV reloadData];
    [self.faceTableV reloadData];
    
    
    
    
    
    
    
    if (_chooseGirl == NO) {
        
        [self.boyBtn setBackgroundImage:IMAGE(@"男-选中gbo") forState: UIControlStateNormal] ;
        
        [self.girlBtn setBackgroundImage:IMAGE(@"女-未选中bgil") forState: UIControlStateNormal] ;
        
        
    }
    
    
    
    
    //self.photoChosebgV.hidden = YES;
    
    
    
    
}

- (void)girlBtnClickedchooseBgHidden
{
    _chooseGirl = YES;
    
    
    [self.boyBtn setBackgroundImage:IMAGE(@"男-未选中yboy") forState: UIControlStateNormal] ;
    
    
    if (_chooseGirl == YES) {
        [self.girlBtn setBackgroundImage:IMAGE(@"女-选中bgile") forState: UIControlStateNormal] ;
    }
    
    
    //[self.xxTableV reloadData];
    //[self.glassTableV reloadData];
    [self.faceTableV reloadData];
    
    
    
    
    
    
    
    
    //self.photoChosebgV.hidden = YES;
    
    
    
    
}


#pragma mark -------------------------------点击男生头像
- (void)maskkBgImgVrTaped
{
    
    
    //[self boyBtnClicked];
    
    _chooseGirl = NO;
    
    
    
    if (_faceTap) {
        self.photoChosebgV.hidden = NO;
    }else {
        
        self.photoChosebgV.hidden = YES;
    }
    
    
    
    
    
    NSString *first_second = [NSUserDefaults standardUserDefaults].diy_firstOrSecond;
    
    if (first_second == nil || first_second == NULL || [first_second isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        if ([first_second isEqualToString:@"2"]) {
            
            self.photoChosebgV.hidden = NO;
        }
        
    }

    
    
    
    
    
#pragma mark -------------------------------调整 7 男生  脸部选择框
    
        if ([ZMSystemTool iPhone5Device]) {
            
            self.photoChosebgV.frame = CGRectMake(35, 310 - 140,  140, 150);
            
        }else if ([ZMSystemTool iPhone6Device]) {
            self.photoChosebgV.frame = CGRectMake(90 - 35, 220,  140, 150);
            
        } else {
            self.photoChosebgV.frame = CGRectMake(70, 240 ,  140, 150);
            
        }
        
    
    
    
}


#pragma mark -------------------------------点击女生头像
- (void)maskkBgImgVv2Taped
{
    
    
    //[self girlBtnClicked];
    
    
    
    _chooseGirl = YES;
    
    
    
    if (_faceTap) {
        self.photoChosebgV.hidden = NO;
    }else {
        
        self.photoChosebgV.hidden = YES;
    }
    
    
    
    
    
    NSString *first_second = [NSUserDefaults standardUserDefaults].diy_firstOrSecond;
    
    if (first_second == nil || first_second == NULL || [first_second isKindOfClass:[NSNull class]]) {
        
        
    }else {
        
        
        if ([first_second isEqualToString:@"2"]) {
            
            self.photoChosebgV.hidden = NO;
        }
        
    }

    
    
    
    
    
    
#pragma mark -----------------------------调整 8 女生  脸部选择框
    
        if ([ZMSystemTool iPhone5Device]) {
            
            self.photoChosebgV.frame = CGRectMake(190 - 60, 310 - 120,  140, 150);
            
        }else if ([ZMSystemTool iPhone6Device]) {
            self.photoChosebgV.frame = CGRectMake(190 - 38, 310 - 60,  140, 150);
            
            
        } else {
            
            self.photoChosebgV.frame = CGRectMake(180, 265,  140, 150);
            
        }
    
    
    
    
}



#pragma mark ----------------------------------顶部 保存返回按钮
- (void)fanhuiBtnnnClicked
{
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    //[self.navigationController popToViewController:[[ZMMainViewController alloc] init] animated:NO];
    
    //[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2]
     //                                     animated:YES];
    
    
    
}


- (void)saveeBttnnnClicked
{
    
    [self bgImgVTaped];
    
    //self.photoChosebgV.hidden = YES;//脸部框
    
    self.faceDiyImgV.hidden = YES;
    self.topImgVV.hidden = YES;
    self.boygirlBGV.hidden = YES;
    self.xxBtn.hidden = YES;
    self.glassBtn.hidden = YES;
    self.faceBtn.hidden = YES;
    
    /////
    self.dapeidiyBtn.hidden = YES;
    self.changediyFaceBtn.hidden = YES;
    ////
    self.tableViewBgImggV.hidden = YES;
    self.xxtableViewBgImggV.hidden = YES;
    self.fanhuiBtn.hidden = YES;
    self.saveeBtn.hidden = YES;
    self.completeeBtn.hidden = YES;
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        //UIImage *saveImg = [ZRRImageTool shotWithView:self.view scope:CGRectMake(0, 20, kScreen_Width, kScreen_Height - 20)];
        
        UIImage *saveImg = [self captureImageFromViewLow:self.view];
        
        NSData *imgData = UIImageJPEGRepresentation(saveImg, .2f);
        NSString *saveStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        [NSUserDefaults standardUserDefaults].diy_saveImgStr = saveStr;
        
        
        
        [NSUserDefaults standardUserDefaults].diy_firstOrSecond = @"2";//保存标识
        
        
        
        
        
        
        ///////
        self.fanhuiBtn.hidden = NO;
        self.saveeBtn.hidden = NO;
        /////
        self.dapeidiyBtn.hidden = NO;
        self.changediyFaceBtn.hidden = NO;
        self.tableViewBgImggV.hidden = NO;
        
        
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    });
    
    
    
    
}


//截屏清晰的方法
- (UIImage *)captureImageFromViewLow:(UIView *)orgView {
    //获取指定View的图片
    UIGraphicsBeginImageContextWithOptions(orgView.bounds.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [orgView.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}











#pragma mark ----------------------------------- 点击场景

- (void)secondbgImgVTaped
{
    self.photoChosebgV.hidden = YES;
    
    
}




- (void)bgImgVTaped
{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.boygirlBGV.frame = CGRectMake(0, kScreen_Height - 100, kScreen_Width, 50);
        
        self.xxBtn.frame = CGRectMake(0, kScreen_Height - 50, kScreen_Width/3 - 0.3, 50);
        
        self.glassBtn.frame = CGRectMake(kScreen_Width/3 , kScreen_Height - 50, kScreen_Width/3 - 0, 50);
        
        self.faceBtn.frame = CGRectMake((2 * kScreen_Width/3) + 0.5, kScreen_Height - 50, kScreen_Width/3 - 0.5, 50);
        
        
    }];
    
    
    self.tablebgV.hidden = YES;
    
    self.xxTableV.hidden = YES;
    self.glassTableV.hidden = YES;
    
    
    self.photoChosebgV.hidden = YES;
    
}

#pragma mark -------------------------------点击形象按钮 tableView selectedBtn
- (void)xxTableVSelectedBtnClicked:(UIButton *)btn
{
    if (self.xxModel) {
        self.xxModel.isSelected = !self.xxModel.isSelected;
    }
    
    
    ZMCartoonDIYYModel *model = self.xxMuArray[btn.tag];
    
    if (!model.isSelected) {
        model.isSelected = !model.isSelected;
        self.xxModel = model;
    }
    
    
    ///
    
    //self.roleHeadHairImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.xxImgName]];
    
    self.bgImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.xxImgName]];
    
    
    
    
    
    [self.xxTableV reloadData];
    
    
    
}



///girl
- (void)girl_xxTableVSelectedBtnClicked:(UIButton *)btn
{
    if (self.girl_xxModel) {
        self.girl_xxModel.girl_isSelected = !self.girl_xxModel.girl_isSelected;
    }
    
    
    ZMCartoonDIYYModel2 *girl_model = self.girl_xxMuArray[btn.tag];
    
    if (!girl_model.girl_isSelected) {
        girl_model.girl_isSelected = !girl_model.girl_isSelected;
        self.girl_xxModel = girl_model;
    }
    
    
    ///
    
    //self.roleHeadHairImgV2.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_model.girl_xxImgName]];
    
    //self.bgImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_model.girl_xxImgName]];
    
    if (btn.tag == 0) {
        //
        self.bgImgV.image = IMAGE(@"动物城-场景xiu.jpg");
        //身体
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeMaskImgbg11t" object:nil];
        
    }else {
        
        self.bgImgV.image = IMAGE(@"背景sec");
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeMaskImgbg22t" object:nil];
        
        
        
        
    }
    
    
    [self.xxTableV reloadData];
    
    
    
}



#pragma mark -----------------------点击眼镜 cell 按钮

- (void)girl_glassTableVSelectedBtnClicked:(UIButton *)glassBtn
{
    
    self.roleHeadGlassImgV2.hidden = NO;
    
    if (self.girl_glassModel) {
        self.girl_glassModel.girl_isSelected = !self.girl_glassModel.girl_isSelected;
    }
    
    
    ZMCartoonDIYYModel2 *girl_model = self.girl_glassMuArray[glassBtn.tag];
    
    if (!girl_model.girl_isSelected) {
        girl_model.girl_isSelected = !girl_model.girl_isSelected;
        self.girl_glassModel = girl_model;
    }
    
    
    ///
    
    
    if (glassBtn.tag == 0) {
        
        //self.roleHeadGlassImgV2.image = [UIImage imageNamed:@""];
        
        
            //
            self.roleHeadGlassImgV2.hidden = YES;
            
            self.sec_girl_glassImgV.image = [UIImage imageNamed:@""];
            
        
        
        
    }else {
        
        //self.roleHeadGlassImgV2.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_model.girl_glassImgName]];
        
       
            //
            self.roleHeadGlassImgV2.hidden = YES;
            
            self.sec_girl_glassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",girl_model.girl_glassImgName]];
            
        
        
        
    }
    
    
    
    
    
    
    [self.glassTableV reloadData];
    
    
}

- (void)glassTableVSelectedBtnClicked:(UIButton *)btn
{
    self.roleHeadGlassImgV.hidden = NO;
    
    
    if (self.glassModel) {
        self.glassModel.isSelected = !self.glassModel.isSelected;
    }
    
    
    ZMCartoonDIYYModel *model = self.glassMuArray[btn.tag];
    
    if (!model.isSelected) {
        model.isSelected = !model.isSelected;
        self.glassModel = model;
    }
    
    
    ///
    if (btn.tag == 0) {
        
        //self.roleHeadGlassImgV.image = [UIImage imageNamed:@""];
        
        
            //
            self.roleHeadGlassImgV.hidden = YES;
            
            self.sec_boy_glassImgV.image = [UIImage imageNamed:@""];
            
        
        
        
        
        
    }else {
        
        //self.roleHeadGlassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.glassImgName]];
        
        
        
       
            //
            self.roleHeadGlassImgV.hidden = YES;
            
            self.sec_boy_glassImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.glassImgName]];
            
       
        
    }
    
    
    
    
    
    [self.glassTableV reloadData];
    
    
    
}



- (void)girl_faceTableVSelectedBtnClicked:(UIButton *)btn
{
    
    
    
    
    
}


- (void)faceTableVSelectedBtnClicked:(UIButton *)btn
{
    
    
    
    
}

#pragma mark --------------------------------- 脸部 DIY
- (void)faceDiyImgVvTaped
{
    //self.maskkBgImgVv.userInteractionEnabled = YES;
    //self.maskkBgImgVv2.userInteractionEnabled = YES;
    
    [self bgImgVTaped];
    self.photoChosebgV.hidden = YES;//隐藏选择区
    self.boygirlBGV.hidden = YES;
    self.faceDiyImgV.hidden = YES;
    
    
    _faceTap = YES;
    
    
    //[self girlBtnClicked];
    
    [self maskkBgImgVv2Taped];///点击脸部
    
    self.xxBtn.backgroundColor = [UIColor whiteColor];
    [self.xxBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    self.glassBtn.backgroundColor = [UIColor whiteColor];
    [self.glassBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    self.faceBtn.backgroundColor = [UIColor whiteColor];
    [self.faceBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
}


#pragma mark ------------------------------------ 形象按钮
- (void)xxBtnClicked
{
    [self girlBtnClicked];//点击女生按钮  修改 bug 暂时这样处理
    
    self.photoChosebgV.hidden = YES;//隐藏选择区
    self.boygirlBGV.hidden = YES;
    self.faceDiyImgV.hidden = NO;
    
    //self.maskkBgImgVv.userInteractionEnabled = NO;
    //self.maskkBgImgVv2.userInteractionEnabled = NO;
    
    
    _faceTap = NO;
    
    
    self.xxBtn.backgroundColor = RGB(228, 84, 129);
    [self.xxBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.glassBtn.backgroundColor = [UIColor whiteColor];
    [self.glassBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    self.faceBtn.backgroundColor = [UIColor whiteColor];
    [self.faceBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    
    //    ZMCarrtonnHeadImgViViewController *cortonHead = [ZMCarrtonnHeadImgViViewController sharedZMCarrtonnHeadImgViViewController];
    //
    //
    //    [self.navigationController pushViewController:cortonHead animated:YES];
    //
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"cortoonxxBtnClicked" object:nil];
    
    
    
    
    
    
    //[UIView animateWithDuration:0.3 animations:^{
        
//        self.boygirlBGV.frame = CGRectMake(0, kScreen_Height - 100 - 100, kScreen_Width, 50);
//        
//        self.xxBtn.frame = CGRectMake(0, kScreen_Height - 50 - 100, kScreen_Width/3 - 0.3, 50);
//        
//        self.glassBtn.frame = CGRectMake(kScreen_Width/3 , kScreen_Height - 50 - 100, kScreen_Width/3 - 0, 50);
//        
//        self.faceBtn.frame = CGRectMake((2 * kScreen_Width/3) + 0.5, kScreen_Height - 50 - 100, kScreen_Width/3 - 0.5, 50);
    
        
    //}];
    
    //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tablebgV.hidden = NO;
    //});
    
    
    [self.tablebgV addSubview:self.xxTableV];
    self.xxTableV.hidden = NO;
    
    
       
}





- (void)xxBtnClickedttt
{
    //[self girlBtnClicked];//点击女生按钮  修改 bug 暂时这样处理
    
    self.photoChosebgV.hidden = YES;//隐藏选择区
    self.boygirlBGV.hidden = YES;
    self.faceDiyImgV.hidden = NO;
    
    //self.maskkBgImgVv.userInteractionEnabled = NO;
    //self.maskkBgImgVv2.userInteractionEnabled = NO;
    
    
    _faceTap = NO;
    
    
    self.xxBtn.backgroundColor = RGB(228, 84, 129);
    [self.xxBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.glassBtn.backgroundColor = [UIColor whiteColor];
    [self.glassBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    self.faceBtn.backgroundColor = [UIColor whiteColor];
    [self.faceBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    
    //    ZMCarrtonnHeadImgViViewController *cortonHead = [ZMCarrtonnHeadImgViViewController sharedZMCarrtonnHeadImgViViewController];
    //
    //
    //    [self.navigationController pushViewController:cortonHead animated:YES];
    //
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"cortoonxxBtnClicked" object:nil];
    
    
    
    
    
    
    //[UIView animateWithDuration:0.3 animations:^{
    
    self.boygirlBGV.frame = CGRectMake(0, kScreen_Height - 100 - 100, kScreen_Width, 50);
    
    self.xxBtn.frame = CGRectMake(0, kScreen_Height - 50 - 100, kScreen_Width/3 - 0.3, 50);
    
    self.glassBtn.frame = CGRectMake(kScreen_Width/3 , kScreen_Height - 50 - 100, kScreen_Width/3 - 0, 50);
    
    self.faceBtn.frame = CGRectMake((2 * kScreen_Width/3) + 0.5, kScreen_Height - 50 - 100, kScreen_Width/3 - 0.5, 50);
    
    
    //}];
    
    //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    self.tablebgV.hidden = NO;
    //});
    
    
    [self.tablebgV addSubview:self.xxTableV];
    self.xxTableV.hidden = NO;
    
    
    
}







#pragma mark -------------------------------------眼镜按钮
- (void)glassBtnClicked
{
    self.photoChosebgV.hidden = YES;//隐藏选择区
    
    self.boygirlBGV.hidden = NO;
    self.faceDiyImgV.hidden = NO;
    //self.maskkBgImgVv.userInteractionEnabled = NO;
    //self.maskkBgImgVv2.userInteractionEnabled = NO;
    
    _faceTap = NO;
    
    
    
    self.glassBtn.backgroundColor = RGB(228, 84, 129);
    [self.glassBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.xxBtn.backgroundColor = [UIColor whiteColor];
    [self.xxBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    self.faceBtn.backgroundColor = [UIColor whiteColor];
    [self.faceBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    
    
    
    //    ZMCarrtonnHeadImgViViewController *cortonHead = [ZMCarrtonnHeadImgViViewController sharedZMCarrtonnHeadImgViViewController];
    //    
    //    [self.navigationController pushViewController:cortonHead animated:YES];
    //    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"cortoonGlassBtnClicked" object:nil];
    
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.boygirlBGV.frame = CGRectMake(0, kScreen_Height - 100 - 100, kScreen_Width, 50);
        
        self.xxBtn.frame = CGRectMake(0, kScreen_Height - 50 - 100, kScreen_Width/3 - 0.3, 50);
        
        self.glassBtn.frame = CGRectMake(kScreen_Width/3 , kScreen_Height - 50 - 100, kScreen_Width/3 - 0, 50);
        
        self.faceBtn.frame = CGRectMake((2 * kScreen_Width/3) + 0.5, kScreen_Height - 50 - 100, kScreen_Width/3 - 0.5, 50);
        
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tablebgV.hidden = NO;
    });
    
    self.xxTableV.hidden = YES;
    
    [self.tablebgV addSubview:self.glassTableV];
    self.glassTableV.hidden = NO;
    
    
}

#pragma mark ----------------------------------- 脸型按钮
- (void)faceBtnClicked
{
    self.photoChosebgV.hidden = YES;//隐藏选择区
    
    
    self.boygirlBGV.hidden = NO;
    self.faceDiyImgV.hidden = NO;
    //self.maskkBgImgVv.userInteractionEnabled = NO;
    //self.maskkBgImgVv2.userInteractionEnabled = NO;
    
    _faceTap = NO;
    
    
    
    
//    self.faceBtn.backgroundColor = RGB(228, 84, 129);
//    [self.faceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
//    self.xxBtn.backgroundColor = [UIColor whiteColor];
//    [self.xxBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
//    
//    self.glassBtn.backgroundColor = [UIColor whiteColor];
//    [self.glassBtn setTitleColor:RGB(228, 84, 129) forState:UIControlStateNormal];
    
    
    
    //    ZMCarrtonnHeadImgViViewController *cortonHead = [ZMCarrtonnHeadImgViViewController sharedZMCarrtonnHeadImgViViewController];
    //    
    //    [self.navigationController pushViewController:cortonHead animated:YES];
    //    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"cortoonFaceBtnClicked" object:nil];
    
    
    [UIView animateWithDuration:0.1 animations:^{
        
        //self.boygirlBGV.frame = CGRectMake(0, kScreen_Height - 100 - 100, kScreen_Width, 50);
        
        self.boygirlBGV.frame = CGRectMake(0, kScreen_Height - 100 - 50 , kScreen_Width, 50);
        
        
//        self.xxBtn.frame = CGRectMake(0, kScreen_Height - 50 - 100, kScreen_Width/3 - 0.3, 50);
//        
//        self.glassBtn.frame = CGRectMake(kScreen_Width/3 , kScreen_Height - 50 - 100, kScreen_Width/3 - 0, 50);
//        
//        self.faceBtn.frame = CGRectMake((2 * kScreen_Width/3) + 0.5, kScreen_Height - 50 - 100, kScreen_Width/3 - 0.5, 50);
        
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tablebgV.hidden = NO;
    });
    
    [self.tablebgV addSubview:self.faceTableV];
    
    self.xxTableV.hidden = YES;
    self.glassTableV.hidden = YES;
    
    
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
