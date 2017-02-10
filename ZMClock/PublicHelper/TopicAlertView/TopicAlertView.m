//
//  TopicAlertView.m
//  TraBook
//
//  Created by ZhongMeng on 16/4/18.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//



#define AlertViewWidth 300.0
#define fontsize   16.0
#define SpaceSize   100.0
#define ButtonHight 35.0

#define DismissHight 20.0

#import "TopicAlertView.h"
#import "ZMImageView.h"



@interface TopicAlertView () <TopicAlertTableViewDeletage,TopicMoreAlertTableViewDeletage,UITextFieldDelegate>




/**
 提示标头图片视图
 */
@property (nonatomic,strong) ZMImageView *tipHeaderImageview;

/**
 标题UILabel
 */
@property (nonnull,nonatomic,strong) UILabel *titleLabel;


@property (nonnull,nonatomic,strong) ZMButton *actionSheetCancelButton;


@property (nonnull,nonatomic,strong) ZMButton *actionSheetDoneButton;

@property (nonatomic,strong) UIDatePicker *datePicker; //!< 时间选择器


/**
 操作表视图
 */
@property (nonatomic,strong) UIView *alertView;
@property (nonatomic,strong) UIView *lineView;  //!< 分割线

@property (nonatomic,strong) UIView *actionSheetView; //!< 操作表视图
@property (nonatomic,retain) UILabel *datePickerTitle; //!< 时间选择器标题


@end





@implementation TopicAlertView



#pragma mark 弹出的普通弹框
-(instancetype)initWithTitle:(NSString*)title withMessage:(NSString*)message delegate:(id<TopicAlertViewDeletage>)deletage cancelButtonTitle:(NSString*)cancelTitle otherButtonTitle:(NSString*)otherTitle
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    if (self)
    {
        [self setAlertDeletage:deletage];
        [self addSubview:self.alertView];
        [self setBackgroundColor:RGBAlpha(0.0, 0.0, 0.0, 0.3)];
        
        
        //首先获取文本的高度
        CGFloat titleContentHight = [self contentWidthAndHight:message];
        CGFloat contentBackGroundViewHight = titleContentHight + ButtonHight + DismissHight + SpaceSize;
        
        //重新设置背景图标位置
        [self.alertView setFrame:CGRectMake(0, 0, AlertViewWidth, contentBackGroundViewHight)];
        [self.alertView setCenter:self.center];
        [self.tipHeaderImageview.tiptitleLable setText:title];
        
        [self.titleLabel setFrame:CGRectMake(20.0, 60.0, AlertViewWidth-40.0, titleContentHight)];
        [self.titleLabel setText:message];
        
        
        if (cancelTitle)
        {
            [self.cancelButton setFrame:CGRectMake(10, contentBackGroundViewHight-60, 120, 55)];
            [self.cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
            [self.cancelButton setImage:[UIImage imageNamed:cancelTitle] forState:UIControlStateNormal];
            
        
            
            [self.doneButton setFrame:CGRectMake(AlertViewWidth-130, contentBackGroundViewHight-60, 120, 55)];
            [self.doneButton setTitle:otherTitle forState:UIControlStateNormal];
            [self.doneButton setImage:[UIImage imageNamed:otherTitle] forState:UIControlStateNormal];
            [self.doneButton addTarget:self action:@selector(alertViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            [self.doneButton setFrame:CGRectMake(0, contentBackGroundViewHight-55, AlertViewWidth, 55)];
            [self.doneButton setTitle:otherTitle forState:UIControlStateNormal];
            [self.doneButton setImage:[UIImage imageNamed:cancelTitle] forState:UIControlStateNormal];
            [self.doneButton addTarget:self action:@selector(alertViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}





-(void)show
{
    [self.alertView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    
    [UIView animateWithDuration:0.15 animations:^{
        
        [self.alertView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
        [kWindow addSubview:self];
        
    } ];
}

-(void)dismissAlertView
{
    [self.alertView removeFromSuperview];
    [self setAlertView:nil];
    [self removeFromSuperview];
    
}



#pragma mark - 弹出新闹钟重复方式
-(instancetype)initWithTitle:(NSString *)title withTopicTitle:(NSString*)topicTitle setDelegate:(id<TopicAlertViewDeletage>)deletage
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    if (self)
    {
        [self setAlertDeletage:deletage];
        [self addTarget:self action:@selector(dismissTopicAlertView) forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundColor:RGBAlpha(0.0, 0.0, 0.0, 0.3)];
        [self addSubview:self.topicAlertView];
        [self.topicAlertTableView resetTopicArray:[self getTopicArrayWithTitle:topicTitle withType:1]];
        [self.tipHeaderImageview.tiptitleLable setText:title];
        [self.topicAlertTableView setTopicAlertDeletage:self];
        
        
    }
    return self;
}

-(NSMutableArray*)getTopicArrayWithTitle:(NSString*)title withType:(NSInteger)type
{
    NSMutableArray *array = [NSMutableArray array];
    TinkleModel *model1 = [[TinkleModel alloc]init];
    TinkleModel *model2 = [[TinkleModel alloc]init];
    TinkleModel *model3 = [[TinkleModel alloc]init];
    TinkleModel *model4 = [[TinkleModel alloc]init];
    TinkleModel *model5 = [[TinkleModel alloc]init];
    TinkleModel *model6 = [[TinkleModel alloc]init];
    TinkleModel *model7 = [[TinkleModel alloc]init];
    
    switch (type)
    {
        case 1:
        {
            [model1 setRingName:@"只响一次"];
            [model1 setRingId:@"1"];
            if ([title isEqualToString:@"只响一次"])
            {
                [model1 setSelectType:select_type];
            }
            else
            {
                [model1 setSelectType:no_select_type];
            }
            
            
            
            [model2 setRingName:@"周一至周五"];
            [model2 setRingId:@"2"];
            if ([title isEqualToString:@"周一至周五"])
            {
                [model2 setSelectType:select_type];
            }
            else
            {
                [model2 setSelectType:no_select_type];
            }
            
            
            
            [model3 setRingName:@"法定工作日"];
            [model3 setRingId:@"3"];
            if ([title isEqualToString:@"法定工作日"])
            {
                [model3 setSelectType:select_type];
            }
            else
            {
                [model3 setSelectType:no_select_type];
            }
            
            
            
            [model4 setRingName:@"周末"];
            [model4 setRingId:@"4"];
            if ([title isEqualToString:@"周末"])
            {
                [model4 setSelectType:select_type];
            }
            else
            {
                [model4 setSelectType:no_select_type];
            }
            
            
            
            [model5 setRingName:@"自定义"];
            [model5 setRingId:@"5"];
            
            if ([title isEqualToString:@"自定义"])
            {
                [model5 setSelectType:select_type];
            }
            else
            {
                [model5 setSelectType:no_select_type];
            }
            
            [array addObject:model1];
            [array addObject:model2];
            [array addObject:model3];
            [array addObject:model4];
            [array addObject:model5];
        }
            break;
        case 2:
        {
            [model1 setRingName:@"周一"];
            [model1 setRingId:@"1"];
            
            [model2 setRingName:@"周二"];
            [model2 setRingId:@"2"];
            
            
            
            [model3 setRingName:@"周三"];
            [model3 setRingId:@"3"];
            
            
            
            [model4 setRingName:@"周四"];
            [model4 setRingId:@"4"];
            
            
            [model5 setRingName:@"周五"];
            [model5 setRingId:@"5"];
            
            [model6 setRingName:@"周六"];
            [model6 setRingId:@"5"];
            
            
            [model7 setRingName:@"周日"];
            [model7 setRingId:@"5"];
            
            [array addObject:model1];
            [array addObject:model2];
            [array addObject:model3];
            [array addObject:model4];
            [array addObject:model5];
            [array addObject:model6];
            [array addObject:model7];
        }
            break;
    }
    return array;
}



-(void)showTopicAlertView
{
    [self.topicAlertView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    
    [UIView animateWithDuration:0.15 animations:^{
        
        [self.topicAlertView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
        [kWindow addSubview:self];
        
    } ];
}

-(void)dismissTopicAlertView
{
    [self.topicAlertView removeFromSuperview];
    [self setTopicAlertView:nil];
    [self removeFromSuperview];
    
}



#pragma mark - 弹出新闹钟周一....周日重复方式
-(instancetype)initWithMoreTitle:(NSString *)title setDelegate:(id<TopicAlertViewDeletage>)deletage cancelButtonTitle:(NSString*)cancelTitle otherButtonTitle:(NSString*)otherTitle
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    if (self)
    {
        [self setAlertDeletage:deletage];
        [self addTarget:self action:@selector(dismissTopicAlertView) forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundColor:RGBAlpha(0.0, 0.0, 0.0, 0.3)];
        [self addSubview:self.topicMoreAlertView];
        [self.topicMoreAlertView setCenter:self.center];
        [self.topicMoreAlertTableView resetTopicArray:[self getTopicArrayWithTitle:title withType:2]];
        [self.tipHeaderImageview.tiptitleLable setText:title];
        [self.topicMoreAlertTableView setTopicMoreAlertDeletage:self];
        
        
        [self.topicMoreAlertView addSubview:self.cancelButton];
        [self.topicMoreAlertView addSubview:self.doneButton];
        
        if (cancelTitle)
        {
            [self.cancelButton setFrame:CGRectMake(10, 320, 120, 55)];
            [self.cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
            [self.cancelButton setImage:[UIImage imageNamed:cancelTitle] forState:UIControlStateNormal];
            
            
            
            [self.doneButton setFrame:CGRectMake(AlertViewWidth-130, 320, 120, 55)];
            [self.doneButton setTitle:otherTitle forState:UIControlStateNormal];
            [self.doneButton setImage:[UIImage imageNamed:otherTitle] forState:UIControlStateNormal];
            [self.doneButton addTarget:self action:@selector(alertViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            [self.doneButton setFrame:CGRectMake(0, 320, AlertViewWidth, 55)];
            [self.doneButton setTitle:otherTitle forState:UIControlStateNormal];
            [self.doneButton setImage:[UIImage imageNamed:cancelTitle] forState:UIControlStateNormal];
            [self.doneButton addTarget:self action:@selector(alertViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
    }
    return self;
}

-(UIView *)topicMoreAlertView
{
    if (_topicMoreAlertView == nil)
    {
        _topicMoreAlertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AlertViewWidth, 380)];
        [_topicMoreAlertView.layer setBorderWidth:2.0];
        [_topicMoreAlertView.layer setCornerRadius:10.0];
        [_topicMoreAlertView.layer setMasksToBounds:YES];
        [_topicMoreAlertView.layer setBorderColor:[DeepGreen CGColor]];
        [_topicMoreAlertView setCenter:self.center];
        [_topicMoreAlertView setBackgroundColor:PinkColor];
        
        
        [_topicMoreAlertView addSubview:self.topicMoreAlertTableView];
        [_topicMoreAlertView addSubview:self.tipHeaderImageview];
    }
    return _topicMoreAlertView;
}

-(TopicMoreAlertTableView *)topicMoreAlertTableView
{
    if (_topicMoreAlertTableView == nil)
    {
        _topicMoreAlertTableView = [[TopicMoreAlertTableView alloc]initWithFrame:CGRectMake(10, 55, AlertViewWidth-20, 250) style:UITableViewStylePlain];
    }
    return _topicMoreAlertTableView;
}


-(void)showTopicMoreAlertView
{
    [self.topicMoreAlertView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    
    [UIView animateWithDuration:0.15 animations:^{
        
        [self.topicMoreAlertView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
        [kWindow addSubview:self];
        
    } ];
}

-(void)dismissTopicMoreAlertView
{
    [self.topicMoreAlertView removeFromSuperview];
    [self setTopicMoreAlertView:nil];
    [self removeFromSuperview];
    
}




#pragma mark - 弹出输入标签的文本输入框
-(instancetype)initInpputWithTitle:(NSString *)title setDelegate:(id<TopicAlertViewDeletage>)deletage cancelButtonTitle:(NSString*)cancelTitle otherButtonTitle:(NSString*)otherTitle;
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    if (self)
    {
        [self setAlertDeletage:deletage];
        [self aadNotification];
        [self addTarget:self action:@selector(dismissTopicAlertView) forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundColor:RGBAlpha(0.0, 0.0, 0.0, 0.3)];
        [self addSubview:self.inputAlertView];
        [self.inputAlertView setCenter:self.center];
        [self.tipHeaderImageview.tiptitleLable setText:title];

        
        
        [self.inputAlertView addSubview:self.cancelButton];
        [self.inputAlertView addSubview:self.doneButton];
        
        if (cancelTitle)
        {
            [self.cancelButton setFrame:CGRectMake(10, 140, 120, 55)];
            [self.cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
            [self.cancelButton setImage:[UIImage imageNamed:cancelTitle] forState:UIControlStateNormal];
            
            
            
            [self.doneButton setFrame:CGRectMake(AlertViewWidth-130, 140, 120, 55)];
            [self.doneButton setTitle:otherTitle forState:UIControlStateNormal];
            [self.doneButton setImage:[UIImage imageNamed:otherTitle] forState:UIControlStateNormal];
            [self.doneButton addTarget:self action:@selector(topicInputAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            [self.doneButton setFrame:CGRectMake(0, 140, AlertViewWidth, 55)];
            [self.doneButton setTitle:otherTitle forState:UIControlStateNormal];
            [self.doneButton setImage:[UIImage imageNamed:cancelTitle] forState:UIControlStateNormal];
        }
        
        
    }
    return self;
}

-(void)showInpputAlertView
{
    [self.inputAlertView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    
    [UIView animateWithDuration:0.15 animations:^{
        
        [self.inputAlertView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
        [kWindow addSubview:self];
        
    } ];
}




-(void)dismissInpputAlertView
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.inputAlertView removeFromSuperview];
    [self setInputAlertView:nil];
    [self removeFromSuperview];
}








-(UIView*)inputAlertView
{
    if (_inputAlertView == nil)
    {
        _inputAlertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AlertViewWidth, 200)];
        [_inputAlertView.layer setBorderWidth:2.0];
        [_inputAlertView.layer setCornerRadius:10.0];
        [_inputAlertView.layer setMasksToBounds:YES];
        [_inputAlertView.layer setBorderColor:[DeepGreen CGColor]];
        [_inputAlertView setCenter:self.center];
        [_inputAlertView setBackgroundColor:PinkColor];
        
        
        [_inputAlertView addSubview:self.inputTextFiedld];
        [_inputAlertView addSubview:self.tipHeaderImageview];
    }
    return _inputAlertView;
}


-(UITextField *)inputTextFiedld
{
    if (_inputTextFiedld == nil)
    {
        _inputTextFiedld = [[UITextField alloc]initWithFrame:CGRectMake(10, 70, AlertViewWidth-20, 40)];
        [_inputTextFiedld setBackgroundColor:[UIColor whiteColor]];
        [_inputTextFiedld.layer setBorderWidth:1.0];
        [_inputTextFiedld.layer setCornerRadius:5];
        [_inputTextFiedld.layer setBorderColor:[LineViewColor CGColor]];
        [_inputTextFiedld.layer setMasksToBounds:YES];
        [_inputTextFiedld setTintColor:MainColor];
        [_inputTextFiedld setDelegate:self];
    }
    return _inputTextFiedld;
}


-(void)aadNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWilShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWilHide:) name:UIKeyboardWillHideNotification object:nil];
}




#pragma mark 通知方法
-(void)keyboardWilShow:(NSNotification *)notification
{
    /**
     获取键盘升起时的动画时间
     */
    float AnimationDuration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    /**
     获取键盘的位置
     */
    CGRect keyBoardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    CGFloat keyBoard_Y = keyBoardRect.origin.y;
    
    
    [UIView animateWithDuration:AnimationDuration animations:^{
        
        [self.inputAlertView setFrame:CGRectMake(kScreen_Width/2-AlertViewWidth/2, keyBoard_Y - 200, AlertViewWidth, 200)];
    }];
    
    
    
    
}

-(void)keyboardWilHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.1 animations:^{
        
        [self.inputAlertView setCenter:self.center];
        
    }];
}




#pragma mark UITextFieldDelegate 文本输入框的代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark 
-(void)topicInputAction:(ZMButton*)sender
{
    if (![self.inputTextFiedld.text isEqualToString:@""])
    {
        if ([self.alertDeletage respondsToSelector:@selector(topicInputAlertButton:)])
        {
            [self.alertDeletage topicInputAlertButton:self.inputTextFiedld.text];
        }
        
        [self dismissTopicAlertView];
    }
}





#pragma mark -  时间弹出框（注册选择）
/**
 Type:创建的时间弹出框类型
 deletage:设置代理对象
 */
-(instancetype)initWithDatePickerType:(int)type setDeletage:(id<TopicAlertViewDeletage>)deletage
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    [self setBackgroundColor:AlertViewBackGroundColor];
    if (self)
    {
        [self setAlertDeletage:deletage];
        [self setBackgroundColor:RGBAlpha(0, 0, 0, 0.3)];
        
        [self.actionSheetView setFrame:CGRectMake(0, kScreen_Height - 250, kScreen_Width, 250.0)];
        //[self.actionSheetView setCenter:self.center];
        [self.actionSheetView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.actionSheetView];
        
        [self.datePickerTitle setFrame:CGRectMake(0, 0, kScreen_Width, 50.0)];
        [self.actionSheetView addSubview:self.datePickerTitle];
        [self.lineView setFrame:CGRectMake(0, 50, kScreen_Width, 1.0)];
        [self.actionSheetView addSubview:self.lineView];
        
        
        
        
        [self.datePicker setFrame:CGRectMake(0, 50.0, kScreen_Width, 150)];
        [self.datePicker setDatePickerMode:UIDatePickerModeDate];
        [self initDatePicker:self.datePicker withType:2];
        

        
        
        
        /*
         NSDate *maximumDate; // default is nil
         设置显示的最大时间是当天，超出范围（最小时间或最大时间），会自动回滚到最近的时间
         */
        switch (type)
        {
            case 1:
            {
                [self.datePicker setMinimumDate:[NSDate date]];
            }
                break;
            case 2:
            {
                [self.datePicker setMaximumDate:[NSDate date]];
            }
                break;
        }
        
        [self.datePicker addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
        [self.actionSheetView addSubview:self.datePicker];
        
        
        [self.actionSheetCancelButton setFrame:CGRectMake(0, 200, kScreen_Width/2, 50)];
        [self.actionSheetView addSubview:self.actionSheetCancelButton];
        
        [self.actionSheetDoneButton setFrame:CGRectMake(kScreen_Width/2, 200, kScreen_Width/2, 50)];
        [self.actionSheetView addSubview:self.actionSheetDoneButton];
    }
    return self;
}




-(void)showDateActionSheetView
{
    [self.actionSheetView setTransform:CGAffineTransformMakeScale(0.5, 0.5)];
    
    [UIView animateWithDuration:0.15 animations:^{
        
        [self.actionSheetView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
        [kWindow addSubview:self];
        
    } ];
}

-(void)dismissDateActionSheetView
{
    [self.actionSheetView removeFromSuperview];
    [self setActionSheetView:nil];
    [self removeFromSuperview];
    
}






#pragma mark - Getter / Setter
-(UIView *)alertView
{
    if (_alertView == nil)
    {
        _alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AlertViewWidth, 200)];
        [_alertView.layer setBorderWidth:2.0];
        [_alertView.layer setCornerRadius:10.0];
        [_alertView.layer setMasksToBounds:YES];
        [_alertView.layer setBorderColor:[DeepGreen CGColor]];
        [_alertView setCenter:self.center];
        [_alertView setBackgroundColor:PinkColor];
        
        [_alertView addSubview:self.tipHeaderImageview];
        [_alertView addSubview:self.titleLabel];
        [_alertView addSubview:self.cancelButton];
        [_alertView addSubview:self.doneButton];
    }
    return _alertView;
}



-(UIView *)topicAlertView
{
    if (_topicAlertView == nil)
    {
        _topicAlertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AlertViewWidth, 280)];
        [_topicAlertView.layer setBorderWidth:2.0];
        [_topicAlertView.layer setCornerRadius:10.0];
        [_topicAlertView.layer setMasksToBounds:YES];
        [_topicAlertView.layer setBorderColor:[DeepGreen CGColor]];
        [_topicAlertView setCenter:self.center];
        [_topicAlertView setBackgroundColor:PinkColor];
        
        [_topicAlertView addSubview:self.tipHeaderImageview];
        [_topicAlertView addSubview:self.topicAlertTableView];
      
        
    }
    return _topicAlertView;
}


-(ZMImageView *)tipHeaderImageview
{
    if (_tipHeaderImageview == nil)
    {
        _tipHeaderImageview = [[ZMImageView alloc]initWithAlertViewFrame:CGRectMake(0,0, AlertViewWidth, 50)];
        [_tipHeaderImageview setDrawImageName:@"提示框标头"];
    }
    return _tipHeaderImageview;
}


-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        //文本标签
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20.0, 60.0, AlertViewWidth-40.0, 20)];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:fontsize]];
        [_titleLabel setTextColor:TipAlertViewolor];
        [_titleLabel setNumberOfLines:0];
        [self.alertView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}


-(UIView *)lineView
{
    if (_lineView == nil)
    {
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:LineViewColor];
    }
    return _lineView;
}


-(ZMButton *)cancelButton
{
    if (_cancelButton == nil)
    {
        _cancelButton = [[ZMButton alloc]init];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTag:1];
        [_cancelButton addTarget:self action:@selector(alertViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}



-(ZMButton *)actionSheetCancelButton
{
    if (_actionSheetCancelButton == nil)
    {
        _actionSheetCancelButton = [[ZMButton alloc]init];
        [_actionSheetCancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_actionSheetCancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_actionSheetCancelButton addTarget:self action:@selector(datePickerAction:) forControlEvents:UIControlEventTouchUpInside];
        [_actionSheetCancelButton.layer setBorderColor:[LineViewColor CGColor]];
        [_actionSheetCancelButton.layer setBorderWidth:1.0];
        [_actionSheetCancelButton setTag:1];
    }
    return _actionSheetCancelButton;
}





-(ZMButton *)doneButton
{
    if (_doneButton == nil)
    {
        _doneButton = [[ZMButton alloc]init];
        [_doneButton setTitle:@"确定" forState:UIControlStateNormal];
        [_doneButton setTag:2];
        
    }
    return _doneButton;
}



-(ZMButton *)actionSheetDoneButton
{
    if (_actionSheetDoneButton == nil)
    {
        _actionSheetDoneButton = [[ZMButton alloc]init];
        [_actionSheetDoneButton setTitle:@"确定" forState:UIControlStateNormal];
        [_actionSheetDoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_actionSheetDoneButton addTarget:self action:@selector(datePickerAction:) forControlEvents:UIControlEventTouchUpInside];
        [_actionSheetDoneButton.layer setBorderColor:[LineViewColor CGColor]];
        [_actionSheetDoneButton.layer setBorderWidth:1.0];
        [_actionSheetDoneButton setTag:2];
    }
    return _actionSheetDoneButton;
}








-(UIView *)actionSheetView
{
    if (_actionSheetView == nil)
    {
        _actionSheetView = [[UIView alloc]init];
    }
    return _actionSheetView;
}


-(UILabel *)datePickerTitle
{
    if (_datePickerTitle == nil)
    {
        _datePickerTitle = [[UILabel alloc]init];
        [_datePickerTitle setTextColor:MainColor];
        [_datePickerTitle setFont:[UIFont systemFontOfSize:18.0]];
        [_datePickerTitle setTextAlignment:NSTextAlignmentCenter];
    }
    return _datePickerTitle;
}


-(UIDatePicker*)datePicker
{
    if (_datePicker == nil)
    {
        _datePicker = [[UIDatePicker alloc] init];
    }
    return _datePicker;
}


-(TopicAlertTableView *)topicAlertTableView
{
    if (_topicAlertTableView == nil)
    {
        _topicAlertTableView = [[TopicAlertTableView alloc]initWithFrame:CGRectMake(10, 55, AlertViewWidth-20, 200) style:UITableViewStylePlain];
    }
    return _topicAlertTableView;
}

#pragma mark - Deletage Method
-(void)topicAlertTableViewSelectRowAtIndexPathWithModel:(TinkleModel*)model
{
    if ([self.alertDeletage respondsToSelector:@selector(topicAlertSelectRowAtIndexPathWithModel:)])
    {
        [self.alertDeletage topicAlertSelectRowAtIndexPathWithModel:model];
    }
    
    [self dismissTopicAlertView];
}




-(void)topicMoreAlertTableViewSelectRowAtIndexPathWithModel:(TinkleModel*)model
{
    if ([self.alertDeletage respondsToSelector:@selector(topicAlertSelectRowAtIndexPathWithModel:)])
    {
        [self.alertDeletage topicMoreAlertSelectRowAtIndexPathWithModel:model];
    }
}

#pragma mark - Private Method
#pragma mark  按钮的响应方法
-(void)alertViewButtonAction:(ZMButton*)sender
{
    [self dismissAlertView];
    if ([self.alertDeletage respondsToSelector:@selector(topicAlertButton:)])
    {
        [self.alertDeletage topicAlertButton:sender];
    }
}



#pragma mark  时间选择器触发方法
-(void)datePickerDateChanged:(UIDatePicker*)dateObject
{
    [self initDatePicker:dateObject withType:1];
}



#pragma mark  时间选择器按钮触发方法
-(void)datePickerAction:(ZMButton*)sender
{
    [self initDatePicker:self.datePicker withType:1];
    switch (sender.tag)
    {
        case 1:
        {
            [self dismissAlertView];
        }
            break;
        case 2:
        {
            if ([self.alertDeletage respondsToSelector:@selector(topicAlertDatePicker:)])
            {
                [self.alertDeletage topicAlertDatePicker:sender];
            }
            [self dismissAlertView];
        }
            break;
    }
}





#pragma mark  计算“内容”文本高度
-(CGFloat)contentWidthAndHight:(NSString*)content
{
    //=========得到content的内容高度===========
    NSDictionary *AttriButes = @{NSFontAttributeName: [UIFont systemFontOfSize:fontsize]};
    CGSize ContentSize = [content boundingRectWithSize:CGSizeMake(AlertViewWidth-40.0/*两边间隙20*2*/, MAXFLOAT)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:AttriButes
                                               context:nil].size;
    //译文本高度
    return ContentSize.height;
}




#pragma mark 初始化时间格式的内容
-(void)initDatePicker:(UIDatePicker*)dateObject withType:(int)type
{
    //首先格式化时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    //然后再根据不同类型显示不同时间
    switch (type)
    {
        case 1:
        {
            if (dateObject)
            {
                NSString *nowtimeStr = [formatter stringFromDate:dateObject.date];
                [self.actionSheetDoneButton setDatePickerDate:nowtimeStr];
                [self.datePickerTitle setText:nowtimeStr];
            }
        }
            break;
        case 2:
        {
            
            NSString *nowtimeStr = [formatter stringFromDate:[NSDate date]];
            [self.datePickerTitle setText:nowtimeStr];
        }
            break;
    }
}






@end
