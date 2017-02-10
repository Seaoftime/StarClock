//
//  ZMSubmitViewController.m
//  ZMClock
//
//  Created by ZhongMeng on 16/4/28.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMStorySubmitViewController.h"
#import "ImagePickerHelper.h"

#import "SubmitView.h"

@interface ZMStorySubmitViewController () <SubmitViewDeletage,ImagePickerHelperDeletage>

@property (nonatomic,strong) SubmitView *submitView;

@property (nonatomic,strong) NSMutableArray *imageArray; //!< 存放图片NSData的数组
@property (nonatomic,strong) NSMutableArray *scrollViewImageArray; //!< 存放图片NSData的数组

@end


@implementation ZMStorySubmitViewController


#pragma mark  DataRequest Method
#pragma mark 发布文章
-(void)submitWithTitle:(NSString *)title withContent:(NSString *)content withSource:(NSString *)source
{
    if ([[AFNetworkingHelper sharedNetworkingHelper] isNetWork])
    {
        if ([title isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"标题不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else if ([content isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"内容不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else if ([source isEqualToString:@""])
        {
            [AnyObjectActivityView showWithTitle:@"来源不能为空" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        }
        else
        {
            
            if ([[ZMUserInfo sharedUserInfo] isUserInfo])
            {
                self.activityView = [[AnyObjectActivityView alloc]initWithTitle:@"正在提交，请稍后..." withActivityMode:ActivityModeIndicatorAndText wittImageName:nil withAddedSuperView:kWindow withMargin:ActivityMargin10];
                
                
                
                NSDictionary *p = @{@"user_id":[ZMUserInfo sharedUserInfo].user_id,
                                    @"sign":[ZMUserInfo sharedUserInfo].sign,
                                    @"category_type":@"2",
                                    @"title":title,
                                    @"source":source,
                                    @"content":content};
                [[AFNetworkingHelper sharedNetworkingHelper] postFormDataWithUrl:@"article/content_publish_by_file.php" theParmeters:p theDataArray:self.imageArray sucess:^(id object)
                 {
                     if ([[MainViewControllerHelper sharedMainHelper] submitStatusWith:object])
                     {
                         [self.activityView initResetWithTitle:@"提交成功" withActivityMode:ActivityTopImageView wittImageName:SubmitSucceedVerify withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     }
                     else
                     {
                         NSString *msg = [object objectForKey:@"msg"];
                         [AnyObjectActivityView showWithTitle:msg wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     }
                     
                 } error:^(NSError *error)
                 {
                     [self.activityView initResetWithTitle:@"提交失败" withActivityMode:ActivityTopImageView wittImageName:@"切换明星" withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
                     
                     
                 }];
            }
            
        }
    }
}




#pragma mark  LifeStyle Method
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"发布文章"];
    [self.view addSubview:self.submitView];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}



#pragma mark - Getter / Setter
-(SubmitView*)submitView
{
    if (_submitView == nil)
    {
        _submitView = [[SubmitView alloc]initWithDeletage:self];
        [_submitView resetFrame:CGRectMake(10, 80, kScreen_Width-20, kScreen_Height-80)];
        
    }
    return _submitView;
}

-(NSMutableArray *)imageArray
{
    if (_imageArray == nil)
    {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}


-(NSMutableArray *)scrollViewImageArray
{
    if (_scrollViewImageArray == nil)
    {
        _scrollViewImageArray = [NSMutableArray array];
    }
    return _scrollViewImageArray;
}



#pragma mark - Deletage Method
#pragma mark SubmitViewDeletage 添加图片代理方法
-(void)submitPhotoButton:(ZMButton *)sender
{
    [[ImagePickerHelper sharedImagePickerHelper] initWithImagePickerHelperWithType:3 withEdit:NO withViewController:self setDeletate:self];
}


#pragma mark ImagePickerHelperDeletage 捡取图片代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image
{
    int imageCount = (int)[self.imageArray count];
    if (imageCount <= 9)
    {
        NSString *imageName = [NSString stringWithFormat:@"image%d",imageCount];
        NSDictionary *imageDictionary = @{@"imageDate":[NSString dataFromImage:image],
                                          @"imageName":imageName};
        [self.imageArray addObject:imageDictionary];
           
        [self.scrollViewImageArray addObject:image];
        
        NSLog(@"--a-----------%@",imageName);
        NSLog(@"--q-----------%@",self.imageArray);
        NSLog(@"--qqq-----------%@",imageDictionary);
        
        [self.submitView.submitScrollView setImageArray:self.scrollViewImageArray];
        
    }
    else
    {
        [AnyObjectActivityView showWithTitle:@"最多10张图片" wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
    }
}


#pragma mark - Private Method
#pragma mark 开始发布文章
-(void)navRightBtnAction:(UIButton *)sender
{
    [self submitWithTitle:self.submitView.titleView.inputTextField.text withContent:self.submitView.submitInputView.text withSource:self.submitView.sourceView.inputTextField.text];
}



@end
