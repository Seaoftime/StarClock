//
//  ZMMeInfoViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMMeInfoViewController.h"
#import "MeInfoModel.h"
#import "MeInfoTableViewCell.h"
#import "ZMEditNickNameViewController.h"
#import "ImagePickerHelper.h"
#import "EditMeInfoHelper.h"

//////////////////
#import "ZMMeViewController.h"



///张锐
#import "ZMMeEditUserrPhoneViewController.h"


@interface ZMMeInfoViewController () <UITableViewDelegate,UITableViewDataSource,TopicAlertViewDeletage,MeInfoTableViewCellDeletage,ImagePickerHelperDeletage,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UITableView *meInfoTableView; //!< 我的个人资料表视图图
@property (nonatomic,strong) NSMutableArray *meInfoArray; //!< 我的个人资料数据源数组
@property (nonatomic,strong) TopicAlertView *dateAlertView; //!< 时间选择器

@property (nonatomic, strong) UIImageView *bgImgV1;
@property (nonatomic, strong) UIImageView *lineeImgV;
@property (nonatomic, strong) UILabel *headLbb;
@property (nonatomic, strong) UIImageView *userImageView;

@property (nonatomic, strong) UIActionSheet *selectUserIconSheet;





@end




@implementation ZMMeInfoViewController

#pragma mark  DataRequest Method
#pragma mark 获取个人资料
-(void)getUserProfile:(BOOL)userProfile
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                        @"sign":[ZMUserInfo sharedUserInfo].sign};
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"/user/get_user_profile.php" theParmeters:parmeters sucess:^(id object)
            {
                if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                {
                    
                    
                    
                    NSLog(@"_____%@",object);
                    
                    NSDictionary *data = [object objectForKey:@"data"];
                    if ([data count])
                    {
                        NSDictionary *profile = [data objectForKey:@"profile"];
                        if ([profile count])
                        {
                            NSString *birth = [profile objectForKey:@"birth"];
                            NSString *nickname = [profile objectForKey:@"nickname"];
                            NSString *phone = [profile objectForKey:@"phone"];
                            NSString *sex = [profile objectForKey:@"sex"];
                            
                            NSDictionary *image_url = [profile objectForKey:@"image_url"];
                            if ([image_url count])
                            {
                                NSString *path = [image_url objectForKey:@"path"];
                                MeInfoModel *headPortraitModel = [[MeInfoModel alloc]init];
                                [headPortraitModel setHeadPortraitUrl:path];
                                [headPortraitModel setTitle:@"头像"];
                                [headPortraitModel setDescribe:phone];
                                [headPortraitModel setMeInfoType:headPortraitType];
                                [headPortraitModel setCellHight:80];
                                [self.meInfoArray addObject:headPortraitModel];
                                 
                            }
                            
                         
                            
        
                            MeInfoModel *nickNameModel = [[MeInfoModel alloc]init];
                            [nickNameModel setTitle:@"昵称"];
                            [nickNameModel setDescribe:nickname];
                            [nickNameModel setMeInfoType:normalType];
                            [nickNameModel setCellHight:50];
                            [self.meInfoArray addObject:nickNameModel];
                            
                            
                            NSString *xingg = [APPTransmit shareInstance].xingbanStr;
                            MeInfoModel *xingModel = [[MeInfoModel alloc]init];
                            [xingModel setTitle:@"星伴号"];
                            [xingModel setDescribe:xingg];
                            [xingModel setMeInfoType:normalType];
                            [xingModel setCellHight:50];
                            [self.meInfoArray addObject:xingModel];
                            
                            NSString * phonee = [profile objectForKey:@"phone"];
                            MeInfoModel *phoneModel = [[MeInfoModel alloc]init];
                            [phoneModel setTitle:@"手机号"];
                            [phoneModel setDescribe:phonee];
                            [phoneModel setMeInfoType:normalType];
                            [phoneModel setCellHight:50];
                            [self.meInfoArray addObject:phoneModel];
                            
                            
                            MeInfoModel *sexModel = [[MeInfoModel alloc]init];
                            [sexModel setTitle:@"性别"];
                            [sexModel setSex:sex];
                            [sexModel setMeInfoType:normalType];
                            [sexModel setCellHight:50];
                            [self.meInfoArray addObject:sexModel];
                            
                            MeInfoModel *model5 = [[MeInfoModel alloc]init];
                            [model5 setTitle:@"生日"];
                            [model5 setDescribe:birth];
                            [model5 setMeInfoType:normalType];
                            [model5 setCellHight:50];
                            [self.meInfoArray addObject:model5];
                            
                            
                            //数据组装好之后重新刷新表视图
                            [self.meInfoTableView reloadData];
                        }
                    }
                }
                
            } error:^(NSError *error){}];
            
        }
    }
}












#pragma mark  LifeStyle Method
-(void)viewDidLoad
{
    [super viewDidLoad];
    //[self setTitle:@"个人资料"];
    
    [self.view addSubview:self.meInfoTableView];
    [self getUserProfile:YES];
    
    //[self setNavRightBtnImage:@"社区导航完成"];
    
    [self getFirstPageUserInfomationtt];
    
    
}




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}






#pragma mark - Getter / Setter
-(UITableView *)meInfoTableView
{
    if (_meInfoTableView == nil)
    {
        _meInfoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, kScreen_Height-60) style:UITableViewStylePlain];
        [_meInfoTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_meInfoTableView setDelegate:self];
        [_meInfoTableView setDataSource:self];
    }
    return _meInfoTableView;
}




-(NSMutableArray *)meInfoArray
{
    if (_meInfoArray == nil)
    {
        _meInfoArray = [NSMutableArray array];
    }
    return _meInfoArray;
}

-(TopicAlertView*)dateAlertView
{
    if (_dateAlertView == nil)
    {
        _dateAlertView = [[TopicAlertView alloc]initWithDatePickerType:2 setDeletage:self];
        
    }
    return _dateAlertView;
}


// 显示操作表（修改性别）
-(void)showActionSheet:(BOOL)show
{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"性别" message:@"选择性别" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        [self editSex:@"1" withAlertController:actionSheet];
    }]];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        [self editSex:@"2" withAlertController:actionSheet];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){}]];
    [self presentViewController:actionSheet animated:YES completion:^{}];
}



// 显示操作表（修改性别）
-(void)showImagePickerActionSheet:(BOOL)show
{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        [[ImagePickerHelper sharedImagePickerHelper] initWithImagePickerHelperWithType:3 withEdit:YES withViewController:self setDeletate:self];   
    }]];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        
        [[ImagePickerHelper sharedImagePickerHelper] initWithImagePickerHelperWithType:2 withEdit:YES withViewController:self setDeletate:self];
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){}]];
    [self presentViewController:actionSheet animated:YES completion:^{}];
}



#pragma mark - Deletage
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.meInfoArray[indexPath.row] cellHight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            //[self showImagePickerActionSheet:YES];
            [self userImageViewTapedee];
            
        }
            break;
        case 1:
        {
            
            [self.meInfoArray enumerateObjectsUsingBlock:^(MeInfoModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
            {
                if (idx == 1)
                {
                    
                    ZMEditNickNameViewController *editNickNameViewController = [[ZMEditNickNameViewController alloc] init];
                    [editNickNameViewController setMeInfoModel:obj withTableview:self.meInfoTableView];
                    [self.navigationController pushViewController:editNickNameViewController animated:YES];
                    
                    *stop = YES;
                }
            }];
            
        }
            break;
            
        case 3:
        {
            
            [self.meInfoArray enumerateObjectsUsingBlock:^(MeInfoModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
             {
                 if (idx == 3)
                 {
                     ZMMeEditUserrPhoneViewController *editPhoneVC = [[ZMMeEditUserrPhoneViewController alloc] init];
                     
                     
                     [editPhoneVC setMeInfoPhoneModel:obj withTableview:self.meInfoTableView];
                     [self.navigationController pushViewController:editPhoneVC animated:YES];
                     
                     *stop = YES;
                 }
             }];
            
        }
            break;
            
        case 4:
        {
            [self showActionSheet:YES];
        }
            break;
        case 5:
        {
            [self.dateAlertView showDateActionSheetView];
        }
            break;
        case 6:
        {
            
        }
            break;
    }
}






#pragma mark ----------------------------获取用户首页相关信息(新加)
- (void)getFirstPageUserInfomationtt
{
    
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        
        if ([[ZMUserInfo sharedUserInfo] isUserInfo]){
            
            
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_user_profile.php" theParmeters:parmeters sucess:^(id object) {
                //
                NSLog(@"个人资料 ____________ %@",object);
                NSString *status = (NSString *)[object objectForKey:@"status"];
                
                
                if ([status isEqualToString:@"0"] ) {
                    //
                    //解析数据
                    NSDictionary *data = [object objectForKey:@"data"];
                    
                    NSDictionary *profile = [data objectForKey:@"profile"];
                    
                    NSDictionary *image_url = [profile objectForKey:@"image_url"];
                    
                    NSString *imgStr = [image_url objectForKey:@"path"];
                    
                    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:imgStr]];
                    
                    
                    
                    
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




- (UIImageView *)bgImgV1
{
    if (_bgImgV1 == nil) {
        _bgImgV1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 80)];
        _bgImgV1.backgroundColor = [UIColor whiteColor];
        //
        _bgImgV1.userInteractionEnabled = YES;
        
    }
    return _bgImgV1;
}

- (UIImageView *)lineeImgV
{

    if (_lineeImgV == nil) {
        _lineeImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 79, kScreen_Width, 1)];
        _lineeImgV.backgroundColor = RGB(205, 205, 205);
        
    }
    
    return _lineeImgV;


}


- (UIImageView *)userImageView
{
    if (_userImageView == nil) {
        _userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width - 60 - 30, 5, 70, 70)];
        _userImageView.backgroundColor = [UIColor whiteColor];
        _userImageView.layer.cornerRadius = 10;
        //
        _userImageView.layer.masksToBounds = YES;
        //
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userImageViewTapedee)];
        _userImageView.userInteractionEnabled = YES;
        [_userImageView addGestureRecognizer:tap];
        
        
        NSString *imgStr = [NSUserDefaults standardUserDefaults].me_userImageUrl;
        
        //NSString *mainHeadSr = [NSUserDefaults standardUserDefaults].userr_AvatarImgStr;
        
        
        if (imgStr == nil || imgStr == NULL || [imgStr isKindOfClass:[NSNull class]]) {
            
//            NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:mainHeadSr options:NSDataBase64DecodingIgnoreUnknownCharacters];
//            UIImage *userImg = [UIImage imageWithData:decodeImgData];
            
            //_userImageView.image = userImg;
            
            //[self getFirstPageUserInfomationtt];
            
            
        }else {
            
            
            NSString *loginJudge = [NSUserDefaults standardUserDefaults].notLoginOrLogin;
            
            if ([loginJudge isEqualToString:@"login"]) {
                
               
                [self getFirstPageUserInfomationtt];
                
            } else {
                

                NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:imgStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
                UIImage *userImg = [UIImage imageWithData:decodeImgData];
                
                _userImageView.image = userImg;
                
            }
           
            
        }
        
    }
    
    return _userImageView;
}


- (UILabel *)headLbb
{
    if (_headLbb == nil) {
        _headLbb = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 40)];
        _headLbb.backgroundColor = [UIColor whiteColor];
        _headLbb.text = @"头像";
        
        _headLbb.textAlignment = NSTextAlignmentLeft;
    
        _headLbb.font = [UIFont systemFontOfSize:16];
        
    }
    
    return _headLbb;
}



- (void)userImageViewTapedee
{
    self.selectUserIconSheet =[[UIActionSheet alloc]
                               initWithTitle:Nil
                               delegate:self
                               cancelButtonTitle:@"取消"
                               destructiveButtonTitle:Nil
                               otherButtonTitles:@"拍照",@"从相册选择",nil];
    
    [self.selectUserIconSheet showInView:self.view];
    
}


- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0://拍照
        {
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
            {
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.delegate = self;
                //设置拍照后的图片可被编辑
                picker.allowsEditing = YES;
                picker.sourceType = sourceType;
                [self presentViewController:picker animated:YES completion:^{
                    
                }];
            }else
            {
                NSLog(@"模拟其中无法打开照相机,请在真机中使用");
            }
        }
            break;
        case 1://相册
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.delegate = self;
            //设置选择后的图片可被编辑
            picker.allowsEditing = YES;
            [self presentViewController:picker animated:YES completion:^{
                
                [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
                
                
            }];
        }
            break;
        default:
            break;
    }
}
#pragma mark ------- UIImageViewControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    UIImage *tempImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
    
    //[SVProgressHUD showSuccessWithStatus:@"设置头像成功"];
    
    //图片转字符串
    NSData *data = UIImageJPEGRepresentation(tempImage, .2f);
    NSString *encodeImgStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [NSUserDefaults standardUserDefaults].me_userImageUrl = encodeImgStr;
    //
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"changeUserImageV" object:nil userInfo:@{@"key":encodeImgStr}];
    
    self.userImageView.image = tempImage;
    
    [[EditMeInfoHelper shareHelper] setImageData:[NSString dataFromImage:tempImage]];
    
    
    
    ///上传
    [self sexUploadddd];
    
    
    
}






#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.meInfoArray count] > 0 ? [self.meInfoArray count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MeInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[MeInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier setDeletage:self];
    }
    
    if (indexPath.row == 0) {
        ///
        [cell addSubview:self.bgImgV1];
        
        [self.bgImgV1 addSubview:self.headLbb];
        [self.bgImgV1 addSubview:self.userImageView];
        [self.bgImgV1 addSubview:self.lineeImgV];
        
    }
    
    if (indexPath.row == 2) {
        cell.normalView.jiantouImgV.hidden = YES;
        
    }
    
    [cell setModel:self.meInfoArray[indexPath.row]];
    
    
    
    return cell;
}


#pragma mark  TopicAlertViewDeletage 时间选择器代理方法
-(void)topicAlertDatePicker:(ZMButton*)sender
{
    [self.meInfoArray enumerateObjectsUsingBlock:^(MeInfoModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        if (idx == 5)
        {
            [[EditMeInfoHelper shareHelper] setBirthday:sender.datePickerDate];
            [obj setDescribe:sender.datePickerDate];
            [self.meInfoTableView reloadData];
            *stop = YES;
            
            
            ////上传
            [self sexUploadddd];
            
            
            
            
        }
    }];
}


#pragma mark MeInfoTableViewCellDeletage 点击头像代理方法
-(void)tapGestureRecognizer:(UITapGestureRecognizer *)sender
{
    [self showImagePickerActionSheet:YES];
}

#pragma mark ImagePickerHelperDeletage 点击相册代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image
{
    [[EditMeInfoHelper shareHelper] setImageData:[NSString dataFromImage:image]];
    
    
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"xiuHeadPoritImge" object:nil];
    
    [self.meInfoTableView reloadData];

    
    
}





#pragma mark Private Method
#pragma mark 修改性别触发的方法
-(void)editSex:(NSString*)sex withAlertController:(UIAlertController*)sender
{
    [self.meInfoArray enumerateObjectsUsingBlock:^(MeInfoModel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        if (idx == 4)
        {
            [obj setSex:sex];
            [[EditMeInfoHelper shareHelper] setSex:sex];
            [self.meInfoTableView reloadData];
            *stop = YES;
            
            
            
            ///上传
            [self sexUploadddd];
            
        }
        
    }];
 
}


- (void)sexUploadddd
{
    
    
    NSMutableDictionary *parmeters = [NSMutableDictionary dictionary];
    [parmeters setObject:@"0" forKey:@"game_nickname"];
    if ([EditMeInfoHelper shareHelper].nickName)
    {
        [parmeters setObject:[EditMeInfoHelper shareHelper].nickName forKey:@"nickname"];
    }
    
    else
    {
        [parmeters setObject:@"0" forKey:@"nickname"];
    }
    
    if ([EditMeInfoHelper shareHelper].sex)
    {
        [parmeters setObject:[EditMeInfoHelper shareHelper].sex forKey:@"sex"];
    }
    else
    {
        [parmeters setObject:@"0" forKey:@"sex"];
    }
    
    if ([EditMeInfoHelper shareHelper].birthday)
    {
        [parmeters setObject:[EditMeInfoHelper shareHelper].birthday forKey:@"birth"];
    }
    else
    {
        [parmeters setObject:@"0" forKey:@"birth"];
    }
    
    if ([EditMeInfoHelper shareHelper].phone)
    {
        [parmeters setObject:[EditMeInfoHelper shareHelper].phone forKey:@"phone"];
    }
    else
    {
        [parmeters setObject:@"0" forKey:@"phone"];
    }
    
    if ([EditMeInfoHelper shareHelper].robot_nickname)
    {
        [parmeters setObject:[EditMeInfoHelper shareHelper].robot_nickname forKey:@"robot_nickname"];
    }
    else
    {
        [parmeters setObject:@"0" forKey:@"robot_nickname"];
    }

    
    
    if ([EditMeInfoHelper shareHelper].imageData)
    {
        [AnyObjectActivityView showWithTitle:@"上传中..." wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        
        
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
                [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
                [[AFNetworkingHelper sharedNetworkingHelper] postFormDataObjectWithUrl:@"user/update_user_profile.php" theParmeters:parmeters constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
                 {
                     
                     [formData appendPartWithFileData:[EditMeInfoHelper shareHelper].imageData name:@"avatar" fileName:@"image.jpg" mimeType:@"image/jpeg"];
                 } sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         
                         NSLog(@"编辑个人资料__%@",object);
                         
                         
                         //判断修改个人资料是否完成
                         NSDictionary *data = [object objectForKey:@"data"];
                         NSLog(@"--data-------%@---",data);
//                         if ([data count])
//                         {
//                             NSDictionary*task=[data objectForKey:@"task"];
//                             
//                             
//                             NSLog(@"-----task-------%@--",task);
//                             if ([task isEqual:@""])
//                                 
//                             {
//                                 
//                             }
//                             
//                             else
//                             {
//                                 NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
//                                 NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
//                                 
//                                 NSLog(@"------add_gold---%ld",(long)add_gold);
//                                 NSLog(@"------task_id---%ld",(long)task_id);
//                                 if (task_id==1)
//                                 {
//                                     
//                                     [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                                 }
//                             }
//                         }
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         [AnyObjectActivityView showWithTitle:@"上传成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     }
                     
                 } error:^(NSError *error)
                 {
                     //[AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     
                 }];
            }
        }
    }
    else////////没有修改头像
    {
        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
        {
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
                [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
                
                
                //                NSString *str = [EditMeInfoHelper shareHelper].nickName;
                //
                //                NSLog(@"[EditMeInfoHelper shareHelper].nickName  _____%@",str);
                //
                //                [parmeters setObject:[EditMeInfoHelper shareHelper].nickName forKey:@"nickname"];
                //
                //                [parmeters setObject:[EditMeInfoHelper shareHelper].sex forKey:@"sex"];
                //
                //                [parmeters setObject:[EditMeInfoHelper shareHelper].birthday forKey:@"birth"];
                //
                //                [parmeters setObject:[EditMeInfoHelper shareHelper].phone forKey:@"phone"];
                //
                
                
                
                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/update_user_profile.php" theParmeters:parmeters sucess:^(id object)
                 {
                     
                     [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     
                     
                     
                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                     {
                         
                         //判断修改个人资料是否完成
                         //                                     NSDictionary *data = [object objectForKey:@"data"];
                         //                                     if ([data count])
                         //                                     {
                         //                                         NSDictionary*task=[data objectForKey:@"task"];
                         //                                         if ([task isEqual:@""])
                         //
                         //                                         {
                         //                                             [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                         //
                         //                                         }
                         //
                         //                                         else
                         //                                         {
                         //                                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
                         //                                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
                         //                                             if (task_id==1)
                         //                                             {
                         //
                         //                                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                         //                                             }
                         //                                         }
                         //                                     }
                         
                         
                     }
                     
                 } error:^(NSError *error)
                 {
                     //[AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                 }];
            }
        }
    }
    
    




}








#pragma mark 点击确定编辑按钮触发的方法
- (void)navRightBtnAction:(UIButton *)sender
{
//
//    //上传到服务器
//
//    NSMutableDictionary *parmeters = [NSMutableDictionary dictionary];
//    [parmeters setObject:@"0" forKey:@"game_nickname"];
//    if ([EditMeInfoHelper shareHelper].nickName)
//    {
//        [parmeters setObject:[EditMeInfoHelper shareHelper].nickName forKey:@"nickname"];
//    }
//
//    else
//    {
//        [parmeters setObject:@"0" forKey:@"nickname"];
//    }
//
//    if ([EditMeInfoHelper shareHelper].sex)
//    {
//        [parmeters setObject:[EditMeInfoHelper shareHelper].sex forKey:@"sex"];
//    }
//    else
//    {
//        [parmeters setObject:@"0" forKey:@"sex"];
//    }
//
//    if ([EditMeInfoHelper shareHelper].birthday)
//    {
//        [parmeters setObject:[EditMeInfoHelper shareHelper].birthday forKey:@"birth"];
//    }
//    else
//    {
//        [parmeters setObject:@"0" forKey:@"birth"];
//    }
//
//    if ([EditMeInfoHelper shareHelper].phone)
//    {
//        [parmeters setObject:[EditMeInfoHelper shareHelper].phone forKey:@"phone"];
//    }
//    else
//    {
//        [parmeters setObject:@"0" forKey:@"phone"];
//    }
//
//
//    if ([EditMeInfoHelper shareHelper].imageData)
//    {
//
//        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
//        {
//            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
//            {
//                [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
//                [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
//                [[AFNetworkingHelper sharedNetworkingHelper] postFormDataObjectWithUrl:@"user/update_user_profile.php" theParmeters:parmeters constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
//                 {
//
//                     [formData appendPartWithFileData:[EditMeInfoHelper shareHelper].imageData name:@"avatar" fileName:@"image.jpg" mimeType:@"image/jpeg"];
//                 } sucess:^(id object)
//                 {
//                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
//                     {
//
//                         NSLog(@"编辑个人资料__%@",object);
//                         
//                         
//                         //判断修改个人资料是否完成
//                         NSDictionary *data = [object objectForKey:@"data"];
//                         NSLog(@"--data-------%@---",data);
//                         if ([data count])
//                         {
//                             NSDictionary*task=[data objectForKey:@"task"];
//                             
//                             
//                             NSLog(@"-----task-------%@--",task);
//                             if ([task isEqual:@""])
//                                 
//                             {
//                                 
//                             }
//                             
//                             else
//                             {
//                                 NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
//                                 NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
//                                 
//                                 NSLog(@"------add_gold---%ld",(long)add_gold);
//                                 NSLog(@"------task_id---%ld",(long)task_id);
//                                 if (task_id==1)
//                                 {
//                                     
//                                     [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                                 }
//                             }
//                         }
//                         
//                         
//
//                         
//                         
//                         
//                         
//                         
//                         
//                         [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                     }
//                     
//                 } error:^(NSError *error)
//                 {
//                     //[AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                     
//                 }];
//            }
//        }
//    }
//    else
//    {
//        if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
//        {
//            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
//            {
//                [parmeters setObject:[ZMUserInfo sharedUserInfo].user_id forKey:@"user_id"];
//                [parmeters setObject:[ZMUserInfo sharedUserInfo].sign forKey:@"sign"];
//                
//                
////                NSString *str = [EditMeInfoHelper shareHelper].nickName;
////                
////                NSLog(@"[EditMeInfoHelper shareHelper].nickName  _____%@",str);
////                
////                [parmeters setObject:[EditMeInfoHelper shareHelper].nickName forKey:@"nickname"];
////                
////                [parmeters setObject:[EditMeInfoHelper shareHelper].sex forKey:@"sex"];
////                
////                [parmeters setObject:[EditMeInfoHelper shareHelper].birthday forKey:@"birth"];
////                
////                [parmeters setObject:[EditMeInfoHelper shareHelper].phone forKey:@"phone"];
////                
//                
//                
//                
//                [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/update_user_profile.php" theParmeters:parmeters sucess:^(id object)
//                 {
//                     
//                     [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                     
//                     
//
//                     if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
//                     {
//                         
//                         //判断修改个人资料是否完成
//                         NSDictionary *data = [object objectForKey:@"data"];
//                           if ([data count])
//                           {
//                        NSDictionary*task=[data objectForKey:@"task"];
//                         if ([task isEqual:@""])
//                             
//                         {
//                              [AnyObjectActivityView showWithTitle:@"更新成功" wittImageName:SubmitSucceedVerify withActivityMode:ActivityTopImageView withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                             
//                         }
//                         
//                         else
//                         {
//                             NSInteger add_gold=[[task objectForKey:@"add_gold"]integerValue];
//                             NSInteger task_id=[[task objectForKey:@"task_id"]integerValue];
//                             if (task_id==1)
//                             {
//                                 
//                                 [AnyObjectActivityView showWithTitle:[NSString stringWithFormat:@"%@"@"%ld",@"金币+",(long)add_gold] wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                             }
//                        }
//                    }
//                         
//                        
//                     }
//                     
//                 } error:^(NSError *error)
//                 {
//                     //[AnyObjectActivityView showWithTitle:@"更新失败" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
//                 }];
//            }
//        }
//    }
    
    
    //[self.navigationController popViewControllerAnimated:YES];
}


@end
