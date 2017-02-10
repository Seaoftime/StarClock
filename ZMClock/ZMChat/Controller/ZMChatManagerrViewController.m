//
//  ZMChatManagerrViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/19.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//


//聊天管理
#import "ZMChatManagerrViewController.h"

#import "ZMChatManagerrTableViewCell1.h"
#import "ZMChatManagerrTableViewCell2.h"
#import "ZMChatManagerMessageChangeViewController.h"
#import "ZMChatManagerChangeViewController2.h"
#import "ImagePickerHelper.h"


@interface ZMChatManagerrViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ImagePickerHelperDeletage>


@property (nonatomic, strong) UITableView *chatManagerTableView;
@property (nonatomic, strong) NSMutableArray *dataArray1;
@property (nonatomic, strong) NSMutableArray *dataArray2;





@end

@implementation ZMChatManagerrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.title = @"聊天管理";

    //[self getRobotAndUsersInfomation];
    
    
    
    self.dataArray1 = [NSMutableArray arrayWithObjects:@"管家头像",@"",@"",@"", @"我的聊天头像", nil];
    self.dataArray2 = [NSMutableArray arrayWithObjects:@"",@"管家昵称",@"管家称呼我", @"",@"", nil];
    
    
    [self setNavRightBtnImage:@""];
    [self addChatManagerTableView];


}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.chatManagerTableView reloadData];



}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

    [self.chatManagerTableView reloadData];



}





#pragma mark -----------------------更新机器人和当前用户的部分信息

- (void)getRobotAndUsersInfomation
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([[ZMUserInfo sharedUserInfo] isUserInfo])
        {
            NSDictionary *parmeters = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id, @"sign":[ZMUserInfo sharedUserInfo].sign, @"user_avatar":@"",@"robot_avatar":@"",@"robot_nickname":[NSUserDefaults standardUserDefaults].robot_Nickname, @"robot_wanted_name":[NSUserDefaults standardUserDefaults].youWantListen_Nickname };
            
            [[AFNetworkingHelper sharedNetworkingHelper] postWithUrl:@"user/get_user_info.php" theParmeters:parmeters sucess:^(id object)
             {
                 if ([[MainViewControllerHelper sharedMainHelper] statusWith:object])
                 {
                     
                     
                     NSLog(@"%@",object);
                     
                    // NSDictionary *data = [object objectForKey:@"data"];
                     
                     
                     
                     
                     
                     
                     
                 }
             } error:^(NSError *error){}];
        }
    }



}





#pragma mark -----------------------------------------UI


#pragma mark - 设置右侧按钮图标
- (void)setNavRightBtnImage:(NSString*)imageName
{
    [self.baseNavigation.rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
}

#pragma mark - 右侧按钮触发的方法
- (void)navRightBtnAction:(UIButton*)sender
{
    
}




#pragma mark ---------------------------------- TableView
- (void)addChatManagerTableView
{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64 )];
    
    [self.view addSubview:tableView];
    self.chatManagerTableView = tableView;
    tableView.backgroundColor = RGB(235, 235, 235);
    tableView.dataSource = self;
    tableView.delegate = self;
    //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.chatManagerTableView.tableFooterView = [UIView new];
    
    
}



#pragma mark ----------------- tableViewDelegate && dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0 || indexPath.row == 4) {
        //带头像
        static NSString *strId = @"cellId1";
        ZMChatManagerrTableViewCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:strId];
        
        if (!cell1){
            
            cell1 = [[[NSBundle mainBundle] loadNibNamed:@"ZMChatManagerrTableViewCell1" owner:self options:nil] lastObject];
        }
        cell1.backgroundColor = [UIColor whiteColor];
        
        
        //ZMSearchSonngModell *searchSongModel = [self.searchDataArray objectAtIndex:indexPath.row];
        
        //[cell updateSearchSongCellWith:searchSongModel];
        
        cell1.cellLb1.text = self.dataArray1[indexPath.row];
        
        
        NSString *sss = [NSUserDefaults standardUserDefaults].robot_AvatarImgStr;
        
        NSString *sssUser = [NSUserDefaults standardUserDefaults].userr_AvatarImgStr;
        
        
        if (sss == nil || sss == NULL || [sss isKindOfClass:[NSNull class]]) {
            
            if (indexPath.row == 0) {
                cell1.imageV1.image = IMAGE(@"girl.jpeg");
            }
            
            
        }else {
            
            if (indexPath.row == 0) {
                
                NSData *decodeImgData = [[NSData alloc] initWithBase64EncodedString:sss options:NSDataBase64DecodingIgnoreUnknownCharacters];
                UIImage *sssImg = [UIImage imageWithData:decodeImgData];
                
                
                cell1.imageV1.image = sssImg;
                
            }
            
        }
        
        
        if (sssUser == nil || sssUser == NULL || [sssUser isKindOfClass:[NSNull class]]) {
            
            
            
            if (indexPath.row == 4) {
                NSString *headerStt = [NSUserDefaults standardUserDefaults].mainUserHeadPortaitStr;
                
                if (headerStt == nil || headerStt == NULL || [headerStt isKindOfClass:[NSNull class]]) {
                    
                    
                }else {
                    [cell1.imageV1 sd_setImageWithURL:[NSURL URLWithString:headerStt]];
                }
            }
            
            
            
            
        }else {
            
            if (indexPath.row == 4) {
                
                NSData *decodeUserImgData = [[NSData alloc] initWithBase64EncodedString:sssUser options:NSDataBase64DecodingIgnoreUnknownCharacters];
                UIImage *sssUserImg = [UIImage imageWithData:decodeUserImgData];
                
                
                cell1.imageV1.image = sssUserImg;
                
            }
            
        }

        
        
        
        
        
        return cell1;
    }else {
    
        static NSString *strId = @"cellId2";
        
        ZMChatManagerrTableViewCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:strId];
        
        if (!cell2){
            
            cell2 = [[[NSBundle mainBundle] loadNibNamed:@"ZMChatManagerrTableViewCell2" owner:self options:nil] lastObject];
        }
        cell2.backgroundColor = [UIColor  whiteColor];
        
        cell2.cellLb21.text = self.dataArray2[indexPath.row];
        
        if (indexPath.row == 1) {
            
            NSString *nick = [NSUserDefaults standardUserDefaults].robot_Nickname;
            
            
            if (nick == nil || nick == NULL || [nick isKindOfClass:[NSNull class]]) {
                
                
            }else {

                cell2.cellLb22.text = nick;
                cell2.cellLb22.textAlignment = NSTextAlignmentRight;
                
            }
            
        }
        
        
        if (indexPath.row == 2) {
            
            NSString *nickk = [NSUserDefaults standardUserDefaults].youWantListen_Nickname;
            
            if (nickk == nil || nickk == NULL || [nickk isKindOfClass:[NSNull class]]) {
                
                
            }else {
                
                cell2.cellLb22.text = nickk;
                cell2.cellLb22.textAlignment = NSTextAlignmentRight;
                
            }
            
        }

        
        if (indexPath.row == 3) {
            cell2.backgroundColor = RGB(235, 235, 235);
            
            
            
            cell2.imageV2.image = IMAGE(@"");
        }
        
        
        
        //ZMSearchSonngModell *searchSongModel = [self.searchDataArray objectAtIndex:indexPath.row];
        
        //[cell updateSearchSongCellWith:searchSongModel];
        
        
        return cell2;
    }
    
    
    
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (indexPath.row == 0 || indexPath.row == 4) {
        
        return 80;

    }else if (indexPath.row == 3){
        return 30;
    
    }else {
    
        return 50;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == 4 ) {
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                {
                                    
                                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                    
                                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                    picker.delegate = self;
                                    //设置选择后的图片可被编辑
                                    picker.allowsEditing = YES;
                                    [self presentViewController:picker animated:YES completion:^{
                                        
                                        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
                                    }];
                                    
                                    
                                    
                                }]];
        
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                {
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){}]];
        [self presentViewController:actionSheet animated:YES completion:^{}];
        
        
        
        
        
        
        
        
        
        
        
    }else if (indexPath.row == 0){
    
    
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

    
    
        
    
    
    }else {
        ZMChatManagerMessageChangeViewController *changeVC = [[ZMChatManagerMessageChangeViewController alloc] init];
        
        ZMChatManagerChangeViewController2 *changeVC2 = [[ZMChatManagerChangeViewController2 alloc] init];

        
        
        if (indexPath.row == 1) {
            changeVC.title = @"管家昵称";
            [self.navigationController pushViewController:changeVC animated:YES];
        }
        
        if(indexPath.row == 2) {
        
            changeVC2.title = @"管家称呼我";
            [self.navigationController pushViewController:changeVC2 animated:YES];
        }
        
        
        
        
    }

    
    
}


#pragma mark -------------------------------------头像选择代理


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        UIImage *tempImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
        
        
        NSData *imgData = UIImageJPEGRepresentation(tempImage, .2f);
        NSString *encodeImgStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        //[NSUserDefaults standardUserDefaults].robot_AvatarImgStr = encodeImgStr;
        
        
        [NSUserDefaults standardUserDefaults].userr_AvatarImgStr = encodeImgStr;
        
        
    }];
    
    
    [self.chatManagerTableView reloadData];

    
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image
{

    NSData *imgData = UIImageJPEGRepresentation(image, .2f);
    NSString *encodeImgStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    [NSUserDefaults standardUserDefaults].robot_AvatarImgStr = encodeImgStr;
    
    


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
