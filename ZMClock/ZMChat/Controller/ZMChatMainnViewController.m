//
//  ZMChatMainnViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/17.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//



///聊天首页 张锐
#import "ZMChatMainnViewController.h"

#import "ZMWorddCharttTableViewCell.h"
//#import "ZMChattTableViewCell.h"
//#import "ZMChatFrameeModel.h"
#import "ZMWorrdChatFrameeModel.h"


#import "iflyMSC/IFlyRecognizerView.h"
#import "iflyMSC/IFlySpeechConstant.h"
#import "iflyMSC/IFlySpeechUtility.h"
#import "iflyMSC/IFlyRecognizerView.h"
#import "iflyMSC/IFlyDataUploader.h"
#import "iflyMSC/IFlyContact.h"
#import "IATConfig.h"
#import "ISRDataHelper.h"
#import "iflyMSC/IFlySpeechError.h"
#import "iflyMSC/IFlyRecognizerViewDelegate.h"

#import "RFRecordButton.h"
#import "ZMChatManagerrViewController.h"

@interface ZMChatMainnViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,IFlyRecognizerViewDelegate>
{
    IFlyRecognizerView *_iflyRecognizerView;
    


}

@property (nonatomic, strong) NSMutableArray *chatDataArray;//聊天数据
@property (nonatomic, strong) UITableView *chatTableView;

///底部聊天输入框
@property (nonatomic, strong) UIView *bottomBgV;
@property (nonatomic, strong) UITextField *chatTF;
@property (readwrite)         BOOL voiceSelected;//
@property (nonatomic, strong) UIButton *voiceTextBtn;//语音 文字转换按钮
@property (nonatomic, strong) UIButton *recordBtn;
@property (nonatomic, copy)   NSString *textFildStrr;//要发送的
@property (nonatomic, copy)   NSString *resultStr;//语音识别结果

///
@property (nonatomic, strong) UIButton *sendMesgBtn;//发送按钮


////请求数据 数组
//@property (nonatomic, strong) NSMutableArray *userHeadPortraitArray;//机器人和当前用户的头像
//机器人
@property (nonatomic, copy)   NSString *robot_headPortaitStr;//头像
@property (nonatomic, copy)   NSString *robot_nicknameStr;
@property (nonatomic, copy)   NSString *robot_wantedNameStr;
//用户
@property (nonatomic, copy)   NSString *user_headPortaitStr;
@property (nonatomic, copy)   NSString *user_nicknameStr;

@property (nonatomic, copy)   NSString *robot_chatStrr;//机器人返回的聊天内容

@property (nonatomic, assign) BOOL finish;//判断

////语音提示
@property (nonatomic, strong) UIView *voiceBgV;
@property (nonatomic, strong) UILabel *upCancelLb;//上滑取消
@property (nonatomic, strong) UILabel *goawayCancelLb;//松开取消



//用户头像
//@property (nonatomic, strong) UIImageView *userHead_ProfitImgV;
//@property (nonatomic, strong) UIImage *userHead_Profit;


@end

@implementation ZMChatMainnViewController



#pragma mark -----------------------------------聊天接口信息

- (void)getRobitAndUsersNicknameAndPotirt
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
        
        [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"tuling/get_chat_user_info.php" theParmeters:parmeters sucess:^(id object) {
            //
            //NSLog(@"%@",object);
            NSString *status = (NSString *)[object objectForKey:@"status"];
            
            
            if ([status isEqualToString:@"0"] ) {
                //
            //解析数据
                NSDictionary *data = [object objectForKey:@"data"];
                //机器人
                NSDictionary *robot_avatar = [data objectForKey:@"robot_avatar"];
                self.robot_headPortaitStr = [robot_avatar objectForKey:@"path"];
                self.robot_nicknameStr = [data objectForKey:@"robot_nickname"];
                self.robot_wantedNameStr  = [data objectForKey:@"robot_wanted_name"];
                
                NSLog(@"robot_____________1%@______2%@________3%@",self.robot_headPortaitStr,self.robot_nicknameStr,self.robot_wantedNameStr);
                
                //用户
                NSDictionary *user_avatar = [data objectForKey:@"user_avatar"];
                self.user_headPortaitStr = [user_avatar objectForKey:@"path"];
                self.user_nicknameStr = [data objectForKey:@"user_nickname"];
                
                NSLog(@"user_________1%@________2%@",self.user_headPortaitStr,self.user_nicknameStr);
                
                [APPTransmit shareInstance].userHeadPortaitStr = self.user_headPortaitStr;
                
                
 //               [self.userHead_ProfitImgV sd_setImageWithURL:[NSURL URLWithString:self.user_headPortaitStr]];
                
                
//                UIImage *imgg = self.userHead_ProfitImgV.image;
//                
//                NSData *imgData = UIImageJPEGRepresentation(imgg, .2f);
//                NSString *encodeImgStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    
//                [NSUserDefaults standardUserDefaults].mainUserHeadPortaitStr = encodeImgStr;
                
                
                
                
            }
            
            
        } error:^(NSError *error) {
            //
            NSLog(@"%@",error);
        }];
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }

}



- (void)chatWithRobott
{
    NSLog(@"聊天:%@",self.textFildStrr);
    
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if (self.textFildStrr == nil || self.textFildStrr == NULL || [self.textFildStrr isKindOfClass:[NSNull class]]) {
            
            
        }else {
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign, @"word":self.textFildStrr , @"loc":@"河南省郑州市管城区"};
            //@"loc":@"河南省郑州市管城区"
            
            
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"tuling/chat_robot.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"%@",object);
                
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    self.robot_chatStrr = [data objectForKey:@"text"];
                    
                    NSLog(@"chat:%@",self.robot_chatStrr);
                    
                    
                    NSString *nickStrt = [NSUserDefaults standardUserDefaults].robot_Nickname;
                    
                    if ([self.robot_chatStrr isEqualToString:@"我是棒棒哒图灵机器人"] || [self.robot_chatStrr isEqualToString:@"我是图灵机器人呀，难道你不认识我了么？"] || [self.robot_chatStrr isEqualToString:@"我叫图灵机器人，活泼可爱的图灵机器人"] || [self.robot_chatStrr isEqualToString:@"听好了, 我叫图灵机器人"] || [self.robot_chatStrr isEqualToString:@"我是图灵机器人，棒棒哒图灵机器人"] || [self.robot_chatStrr isEqualToString:@"我可是人见人爱的图灵机器人呢，你竟然不认识我"]) {
                        
                        if (nickStrt == nil || nickStrt == NULL || [nickStrt isKindOfClass:[NSNull class]]) {
                            
                            [self robotSendMess:@"我是棒棒哒星伴聊天机器人"];
                        }else {
                        
                            [self robotSendMess:[NSString stringWithFormat:@"我是你的%@啊",nickStrt]];
                        }
                        
                    }else {
                    
                        
                        [self robotSendMess:self.robot_chatStrr];
                    }
                    
                    //我是图灵机器人呀,难道你不认识我了么?
                    
                    
                    
                }
                
                
            } error:^(NSError *error) {
                //
                NSLog(@"%@",error);
            }];

            
            
        }
        
        
        
        
        
    }else {
        
        [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }

}





#pragma mark ------------------------------------聊天数据

- (NSMutableArray *)chatDataArray{
    if (_chatDataArray == nil) {
        _chatDataArray = [NSMutableArray array];
    }
    return _chatDataArray;
}

-(void)getModelChatArray{
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"dataPlist" ofType:@"plist"];//得到Plist文件里面的数据
    NSArray *arrData=[NSArray arrayWithContentsOfFile:strPath];
    for (NSDictionary *dicData in arrData) {
        ZMChatModell *model=[[ZMChatModell alloc]initWithModel:dicData]; //将数据转为模型
        
        BOOL isEquel;
        if(self.chatDataArray){
            isEquel=[self timeIsEqual:model.time];//判断上一个模型数据里面的时间是否和现在的时间相等
        }
        //ZMWorrdChatFrameeModel *frameModel=[[ZMWorrdChatFrameeModel alloc]initWithFrameModel:model timeIsEqual:isEquel];//将模型里面的数据转为Frame,并且判断时间是否相等
        //[self.chatDataArray addObject:frameModel];//添加Frame的模型到数组里面
    }
}

#pragma mark 判断前后时间是否一致
- (BOOL)timeIsEqual:(NSString *)comStrTime{
    ZMWorrdChatFrameeModel *frame=[self.chatDataArray lastObject];
    NSString *strTime=frame.dataModel.time; //frame模型里面的NSString时间
    if ([strTime isEqualToString:comStrTime]) { //比较2个时间是否相等
        return YES;
    }
    return NO;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.title = @"聊天";
    
    [self setNavRightBtnImage:@""];
    //[self setNavRightBtnTitle:@"管理" setImageHidden: YES];
    [self.baseNavigation.rightButton setTitle:@"管理" forState:UIControlStateNormal];
    self.baseNavigation.rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [self getRobitAndUsersNicknameAndPotirt];//-获取机器人和当前用户的头像
    
    
    [self setuppSpeechRecognizerrr];//配置语音识别

    
    [self getModelChatArray];
    
    [self addChatTableView];
    
//底部聊天框
    [self addChatBottomView];
    
    
// 监听键盘出现的出现和消失
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    _finish = NO;
    
    [self voiceTellUsersDo];//提示
    
    
}

- (void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];

}


#pragma mark -----------------------------------------UI


- (void)voiceTellUsersDo
{
    self.voiceBgV = [[UIView alloc] initWithFrame:CGRectMake(kScreen_Width/2 - 75, kScreen_Height/2, 150, 80)];
    self.voiceBgV.backgroundColor = [UIColor blackColor];
    self.voiceBgV.alpha = 0.5;
    
    [self.view addSubview:self.voiceBgV];

    //self.upCancelLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 150, 40)];
    
    self.upCancelLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 150, 40)];
    
    self.upCancelLb.text = @"手指上滑,取消发送";
    self.upCancelLb.font = [UIFont systemFontOfSize:15];
    self.upCancelLb.textColor = [UIColor whiteColor];
    self.upCancelLb.textAlignment = NSTextAlignmentCenter;
    
    [self.voiceBgV addSubview:self.upCancelLb];
    
    self.voiceBgV.hidden = YES;



}


-(void)setNavRightBtnTitle:(NSString*)title setImageHidden:(BOOL)hidden
{
    [self.baseNavigation.rightButton.imageView setHidden:hidden];
    [self.baseNavigation.rightButton setTitle:title forState:UIControlStateNormal];
}


#pragma mark - 设置右侧按钮图标
-(void)setNavRightBtnImage:(NSString*)imageName
{
    [self.baseNavigation.rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}


#pragma mark - 右侧按钮触发的方法
- (void)navRightBtnAction:(UIButton*)sender
{
    ZMChatManagerrViewController *chatManager = [[ZMChatManagerrViewController alloc] init];
    [self.navigationController pushViewController:chatManager animated:YES];
    
}



#pragma mark ----------------------------------聊天 TableView
- (void)addChatTableView
{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64 - 44) style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    self.chatTableView = tableView;
    tableView.backgroundColor = RGB(240, 240, 240);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.chatTableView.tableFooterView = [UIView new];
    
    
    
    
    
    
    
//    self.chatTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
//    [bgView setBackgroundColor:[UIColor whiteColor]];
//    [self.chatTableView setBackgroundView:bgView];
//    [self.chatTableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    
    
    
    
    
}


#pragma mark ----------------------------------底部聊天框

- (void)addChatBottomView
{

    self.bottomBgV = [[UIView alloc] initWithFrame:CGRectMake(0, kScreen_Height - 44, kScreen_Width, 44)];
    self.bottomBgV.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.bottomBgV];

    self.chatTF = [[UITextField alloc] initWithFrame:CGRectMake(50, 6, kScreen_Width - 50 - 50, 32)];
    self.chatTF.textColor = [UIColor blackColor];
    self.chatTF.placeholder = @"点击输入...";
    self.chatTF.backgroundColor = [UIColor whiteColor];
    self.chatTF.font = [UIFont systemFontOfSize:15];
    self.chatTF.textAlignment = NSTextAlignmentLeft;
    self.chatTF.borderStyle = UITextBorderStyleRoundedRect;
    
    self.chatTF.delegate=self;
    self.chatTF.returnKeyType=UIReturnKeySend;//更改返回键的文字 (或者在sroryBoard中的,选中UITextField,对return key更改)
    self.chatTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.bottomBgV addSubview:self.chatTF];
    
    
////语音文字转换按钮
    self.voiceTextBtn = [[UIButton alloc] initWithFrame:CGRectMake(9, 6, 32, 32)];
    self.voiceTextBtn.backgroundColor = [UIColor clearColor];
    
    [self.voiceTextBtn setBackgroundImage:IMAGE(@"语音-图标chat") forState:UIControlStateNormal];
    
    //self.voiceTextBtn.layer.cornerRadius = 30;
    //self.voiceTextBtn.layer.masksToBounds = YES;
    [self.voiceTextBtn addTarget:self action:@selector(voiceTextBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBgV addSubview:self.voiceTextBtn];
    
////语音录音按钮
    self.recordBtn = [[UIButton alloc] initWithFrame:CGRectMake(1, 1, kScreen_Width - 50 - 50 -2 , 30)];
    self.recordBtn.backgroundColor = RGB(240, 240, 240);
    
    [self.recordBtn setTitle:@"按住 说话" forState:UIControlStateNormal];
    [self.recordBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.recordBtn.enabled = YES;
    
    
    [self.recordBtn addTarget:self action:@selector(recordBtnClickedd:) forControlEvents:UIControlEventTouchDown];//开始语音
    
    [self.recordBtn addTarget:self action:@selector(stopRecord:) forControlEvents:UIControlEventTouchUpInside];//停止
    
    
    [self.recordBtn addTarget:self action:@selector(cancelRecord:) forControlEvents:UIControlEventTouchUpOutside | UIControlEventTouchCancel];//取消发送
    
    [self.recordBtn addTarget:self action:@selector(remindDragExit:) forControlEvents:UIControlEventTouchDragExit];//移出手指
    
    //[self.recordBtn addTarget:self action:@selector(remindDragEnter:) forControlEvents:UIControlEventTouchDragEnter];//再返回
    
    
    
    [self.chatTF addSubview:self.recordBtn];
    
    self.recordBtn.hidden = YES;
    
    
    
    
////发送按钮
    self.sendMesgBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 50 + 3, 6, 40, 32)];
    self.sendMesgBtn.backgroundColor = [UIColor whiteColor];
    self.sendMesgBtn.layer.cornerRadius = 5;
    self.sendMesgBtn.layer.masksToBounds = YES;
    
    [self.sendMesgBtn setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendMesgBtn setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
    
    
    [self.sendMesgBtn addTarget:self action:@selector(sendMesgBtnnClickedd:) forControlEvents:UIControlEventTouchDown];
    
    [self.bottomBgV addSubview:self.sendMesgBtn];
    
    


}




#pragma mark ----------------- tableViewDelegate && dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *strId = @"cellId";
    ZMWorddCharttTableViewCell *customCell=[tableView dequeueReusableCellWithIdentifier:strId];
    if (customCell==nil) {
        customCell=[[ZMWorddCharttTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    [customCell setBackgroundColor:[UIColor clearColor]];
    customCell.selectionStyle=UITableViewCellSelectionStyleNone;
    customCell.frameModel = self.chatDataArray[indexPath.row];
    
    return customCell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    return self.chatDataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    ZMWorrdChatFrameeModel *frameModel = self.chatDataArray[indexPath.row];
    return frameModel.cellHeight;

}


#pragma mark --------------------------------------键盘管理
#pragma mark 键盘将要出现
-(void)keyboardWillShow:(NSNotification *)notifa{
    
    self.voiceBgV.hidden = YES;
    [self.voiceTextBtn setBackgroundImage:IMAGE(@"语音-图标chat") forState:UIControlStateNormal];
    self.recordBtn.enabled = NO;
    self.recordBtn.hidden = YES;
    
    
    [self dealKeyboardFrame:notifa];
}
#pragma mark 键盘消失完毕
-(void)keyboardWillHide:(NSNotification *)notifa{
    [self dealKeyboardFrame:notifa];
}
#pragma mark 处理键盘的位置
-(void)dealKeyboardFrame:(NSNotification *)changeMess{
    NSDictionary *dicMess=changeMess.userInfo;//键盘改变的所有信息
    //CGFloat changeTime=[dicMess[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];//通过userInfo 这个字典得到对得到相应的信息//0.25秒后消失键盘
    CGFloat keyboardMoveY=[dicMess[UIKeyboardFrameEndUserInfoKey]CGRectValue].origin.y-[UIScreen mainScreen].bounds.size.height;//键盘Y值的改变(字典里面的键UIKeyboardFrameEndUserInfoKey对应的值-屏幕自己的高度)
    [UIView animateWithDuration:0.3 animations:^{ //0.25秒之后改变tableView和bgView的Y轴
        
//        if (self.chatDataArray.count > 3) {
//            self.chatTableView.transform=CGAffineTransformMakeTranslation(0, keyboardMoveY);
//        }
        
        self.chatTableView.transform=CGAffineTransformMakeTranslation(0, keyboardMoveY);
        self.bottomBgV.transform=CGAffineTransformMakeTranslation(0, keyboardMoveY);
        
    }];
    NSIndexPath *path = [NSIndexPath indexPathForItem:self.chatDataArray.count-1 inSection:0];
    
    
    if (self.chatDataArray.count > 4) {
        
        [self.chatTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
    
    //[self.chatTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];//将tableView的行滚到最下面的一行
}


#pragma mark 滚动TableView去除键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.chatTF resignFirstResponder];
}


#pragma mark ----------------------------------------发送消息
/**
 *  发送信息
 */
#pragma mark TextField的Delegate send后的操作
- (BOOL)textFieldShouldReturn:(UITextField *)textField{  //
    
    
    self.textFildStrr = textField.text;
    
    if (textField == self.chatTF) {
        if ([textField.text isEqualToString:@""]) {
            //
            return NO;
            
        }else {
        
            [self sendMess:textField.text]; //发送信息
            
            [self chatWithRobott];//和机器人聊天
            
//            [self robotSendMess:self.robot_chatStrr];
            
            return YES;
        }
        
    }else {
    
        return NO;
    }
    
}

#pragma mark 发送消息,刷新数据

- (void)robotSendMess:(NSString *)messValues{
    
    
    /*
     *机器人(对方)
     **/
    
    
    
    //获取当前的时间
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *forMatter=[[NSDateFormatter alloc]init];
    forMatter.dateFormat=@"HH:mm"; //小时和分钟
    NSString *nowTime = [forMatter stringFromDate:nowdate];
    

    
    NSMutableDictionary *dicAuto = [NSMutableDictionary dictionary];
    dicAuto[@"imageName"] = @"boyyy.jpg";
    dicAuto[@"desc"] = messValues;
    
    dicAuto[@"time"] = nowTime;
    dicAuto[@"person"] = [NSNumber numberWithBool:0]; //转为Bool类型
    ZMChatModell *messAuto = [[ZMChatModell alloc]initWithModel:dicAuto];
    ZMWorrdChatFrameeModel *frameModelAuto = [ZMWorrdChatFrameeModel modelFrame:messAuto timeIsEqual:[self timeIsEqual:nowTime]];//判断前后时候是否一致
    [self.chatDataArray addObject:frameModelAuto];
    [self.chatTableView reloadData];
    

    NSIndexPath *path = [NSIndexPath indexPathForItem:self.chatDataArray.count-1 inSection:0];
    [self.chatTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
    
    
    
    
}




- (void)sendMess:(NSString *)messValues{
    //添加一个数据模型(并且刷新表)
    //获取当前的时间
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *forMatter=[[NSDateFormatter alloc]init];
    forMatter.dateFormat=@"HH:mm"; //小时和分钟
    NSString *nowTime = [forMatter stringFromDate:nowdate];
    
    
    
    /*
     *用户(我)
     **/
    
    
    NSMutableDictionary *dicValues = [NSMutableDictionary dictionary];
    
    
    
       
    
    
    dicValues[@"imageName"] = @"默认头像";
    
    dicValues[@"desc"] = messValues;
    dicValues[@"time"] = nowTime; //当前的时间
    dicValues[@"person"] = [NSNumber numberWithBool:1]; //转为Bool类型
    ZMChatModell *mess = [[ZMChatModell alloc] initWithModel:dicValues];
    ZMWorrdChatFrameeModel *frameModel = [ZMWorrdChatFrameeModel modelFrame:mess timeIsEqual:[self timeIsEqual:nowTime]]; //判断前后时候是否一致
    [self.chatDataArray addObject:frameModel];
    [self.chatTableView reloadData];
    
    self.chatTF.text = nil;
    
   
    
    /*
     *机器人(对方)
     **/
    
    
    //自动回复就是再次添加一个frame模型
//    NSArray *arrayAutoData=@[@"蒸桑拿蒸馒头不争名利，弹吉它弹棉花不谈感情",@"女人因为成熟而沧桑，男人因为沧桑而成熟",@"男人善于花言巧语，女人喜欢花前月下",@"笨男人要结婚，笨女人要减肥",@"爱与恨都是寂寞的空气,哭与笑表达同样的意义",@"男人的痛苦从结婚开始，女人的痛苦从认识男人开始",@"女人喜欢的男人越成熟越好，男人喜欢的女孩越单纯越好。",@"做男人无能会使女人寄希望于未来，做女人失败会使男人寄思念于过去",@"我很优秀的，一个优秀的男人，不需要华丽的外表，不需要有渊博的知识，不需要有沉重的钱袋",@"世间纷繁万般无奈，心头只求片刻安宁"];
//    //添加自动回复的
//    int num= arc4random() %(arrayAutoData.count); //获取数组中的随机数(数组的下标)
//    
//    
//    //    NSLog(@"得到的时间是:%@",nowdate);
//    NSMutableDictionary *dicAuto = [NSMutableDictionary dictionary];
//    dicAuto[@"imageName"] = @"girl.jpeg";
//    dicAuto[@"desc"] = [arrayAutoData objectAtIndex:num];
//    dicAuto[@"time"] = nowTime;
//    dicAuto[@"person"] = [NSNumber numberWithBool:0]; //转为Bool类型
//    ZMChatModell *messAuto = [[ZMChatModell alloc]initWithModel:dicAuto];
//    ZMChatFrameeModel *frameModelAuto = [ZMChatFrameeModel modelFrame:messAuto timeIsEqual:[self timeIsEqual:nowTime]];//判断前后时候是否一致
    //[self.chatDataArray addObject:frameModelAuto];
    //[self.chatTableView reloadData];
    
    
    
    
    
    NSIndexPath *path = [NSIndexPath indexPathForItem:self.chatDataArray.count-1 inSection:0];
    [self.chatTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
    
    
}


#pragma mark ---------------------------------语音文字转换按钮
- (void)voiceTextBtnClicked:(UIButton *)btn
{
    self.voiceSelected = self.voiceTextBtn.selected = !self.voiceTextBtn.selected;
    
    
    BOOL keyBoardChanged = YES;
    
    if (btn.selected)
    {
        if (!self.chatTF.isFirstResponder)
        {
            keyBoardChanged = NO;
        }
        
        //[self adjustTextViewContentSize];
        //self.voiceTextBtn.backgroundColor = [UIColor orangeColor];//按住说话 文字图片
        [self.voiceTextBtn setBackgroundImage:IMAGE(@"文本输入-图标") forState:UIControlStateNormal];
        
        [self.chatTF resignFirstResponder];
        
        self.chatTF.placeholder = @"";
        self.recordBtn.hidden = NO;
        
        [self.recordBtn setTitle:@"按住 说话" forState:UIControlStateNormal];
        [self.recordBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        self.recordBtn.enabled = YES;
        
        
    }
    else
    {
        //[self resumeTextViewContentSize];
        
        //self.voiceTextBtn.backgroundColor = [UIColor blackColor];//语音图片
        [self.voiceTextBtn setBackgroundImage:IMAGE(@"语音-图标chat") forState:UIControlStateNormal];
        
        
        [self.chatTF becomeFirstResponder];
        
        
        self.chatTF.placeholder = @"点击输入...";
        self.recordBtn.hidden = YES;
        
    }

    
    





}




#pragma mark -------------------------------------配置语音识别

#pragma mark --------------------------------配置语音识别
- (void)setuppSpeechRecognizerrr
{
    NSString *initString = [NSString stringWithFormat:@"%@=%@", [IFlySpeechConstant APPID], @"57aadd69"];
    
    [IFlySpeechUtility createUtility:initString];
    _iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.view.center];
    _iflyRecognizerView.alpha = 0;
    //_iflyRecognizerView.hidden = YES;
    
    _iflyRecognizerView.delegate = self;
    
    [_iflyRecognizerView setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
    [_iflyRecognizerView setParameter:@"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    [_iflyRecognizerView setParameter:@"plain" forKey:[IFlySpeechConstant RESULT_TYPE]];
    
    
}


- (void)startRecognizedListening
{
    [_iflyRecognizerView start];
    NSLog(@"start listenning...");
    
}



#pragma mark ----------------------IFlyRecognizerViewDelegate

- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:@"%@", key];
    }
    
    
    self.resultStr = [NSString stringWithFormat:@"%@%@", self.chatTF.text, result];
    
    
    NSLog(@"resultStr______%@",self.resultStr);
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        NSInteger ll = self.resultStr.length;
        
        if (ll > 1 && _finish == YES ) {
            
            NSString *res = [self.resultStr substringToIndex:ll - 0];
            
            self.textFildStrr = res;
            
            
            [self sendMess:res];////发送消息
            [self chatWithRobott];//和机器人聊天
            
        }else {
            
        }

        
    });
    
    
    
    
    
//    [self.recordBtn setTitle:@"按住 说话" forState:UIControlStateNormal];
//    [self.recordBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    
//    self.recordBtn.enabled = YES;
    
    
}


- (void)onError:(IFlySpeechError *)errorr
{
    NSLog(@"errorCode:%@", [errorr errorDesc]);
    //self.voiceRecoLb.text = [NSString stringWithFormat:@"%@", [errorr errorDesc]];
    
    
    
}

#pragma mark ----------------------------------开始语音识别
- (void)recordBtnClickedd:(UIButton *)recordBtn
{

    NSLog(@"____________开始语音");

    _finish = NO;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.voiceBgV.hidden = NO;
        
        self.upCancelLb.text = @"手指上滑,取消发送";
        self.upCancelLb.textColor = [UIColor whiteColor];
        
        
    });
    
    
    [self startRecognizedListening];//开始语音识别

    
    self.recordBtn.backgroundColor = RGB(230, 230, 230);
    [self.recordBtn setTitle:@"松开 结束" forState:UIControlStateNormal];
    [self.recordBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.recordBtn.enabled = NO;
    



}




- (void)stopRecord:(UIButton *)recordBtn
{

    NSLog(@"____________停止");
    
    _finish = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.voiceBgV.hidden = YES;
    });
    //self.voiceBgV.hidden = YES;

    [self.recordBtn setTitle:@"按住 说话" forState:UIControlStateNormal];
    [self.recordBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.recordBtn.enabled = YES;
    


}


- (void)remindDragExit:(UIButton *)recordBtn
{
    
    NSLog(@"exit____________移除点击区域");

    _finish = NO;
    
    self.recordBtn.enabled = YES;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.voiceBgV.hidden = NO;
        
        //self.upCancelLb.backgroundColor = [UIColor redColor];
        self.upCancelLb.text = @"松开手指,取消发送";
        self.upCancelLb.textColor = [UIColor redColor];
        
    });


}



- (void)cancelRecord:(UIButton *)recordBtn
{
    NSLog(@"____________取消发送");
    
    _finish = NO;

    
    self.recordBtn.enabled = YES;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.voiceBgV.hidden = YES;
        
    });
    

    [_iflyRecognizerView cancel];
    
    

}


#pragma mark ----------------------------------点击发送按钮
- (void)sendMesgBtnnClickedd:(UIButton *)btn
{

    self.textFildStrr = self.chatTF.text;
    
    if ([self.textFildStrr isEqualToString:@""]) {
        //
    }else {
    
        
        [self sendMess:self.chatTF.text]; //发送信息
        [self chatWithRobott];//和机器人聊天
        
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
