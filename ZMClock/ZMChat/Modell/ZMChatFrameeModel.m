//
//  ZMChatFrameeModel.m
//  ZMClock
//
//  Created by ZhongMeng on 16/8/18.
//  Copyright © 2016年 ZhongMeng. All rights reserved.
//

#import "ZMChatFrameeModel.h"


#define timeFont [UIFont systemFontOfSize:12.0] //时间的字体大小
#define contentFont [UIFont systemFontOfSize:18.0]//聊天消息字体的大小
#define distance 8 //边距
#define imageH 46 //头像的宽高


////////张锐
@implementation ZMChatFrameeModel

- (instancetype)initWithFrameModel:(ZMChatModell *)modelData timeIsEqual:(BOOL)timeBool{
    
    if (self=[super init]) {
        self.dataModel=modelData;
        CGFloat iphoneW=[UIScreen mainScreen].bounds.size.width;//获取屏幕的宽度
        
        CGSize timeSize=[modelData.time sizeWithAttributes:@{NSFontAttributeName:timeFont}]; //通过时间NSString计算出宽度
        if(!timeBool){//前后时间不相等
            self.timeFrame=CGRectMake(0, 0, iphoneW, timeSize.height);//显示时间的Frame
        }
        else{
            self.timeFrame=CGRectMake(0, 0, iphoneW, 0);
        }
        
        CGRect btnRect=[modelData.desc boundingRectWithSize:CGSizeMake(iphoneW*0.6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:contentFont} context:nil];//发送内容的Frame
        
        if(modelData.person){ //如果是男的发送的话,头像就在右边,文字也在左边,否则头像就在左边,文字也在右边
            self.headImageFrame=CGRectMake(iphoneW-distance-imageH, CGRectGetMaxY(self.timeFrame)+distance, imageH, imageH);//头像的Frame
            //self.btnFrame=CGRectMake(iphoneW-distance-imageH-distance-btnRect.size.width-20*2 , CGRectGetMaxY(self.timeFrame)+distance, btnRect.size.width+20*2, btnRect.size.height+20*2);//按钮内容的Frame(因为在CustomTableViewCell 里面设置了btnFrame里面文字的titleEdgeInsets边距都为20,所以,宽和高都要+20*2,X-20*2)
            
            
            //张锐
            //self.btnFrame=CGRectMake(iphoneW-distance-imageH-distance-btnRect.size.width-20*2 + 60, CGRectGetMaxY(self.timeFrame)+distance, btnRect.size.width+20*2, btnRect.size.height+20*2);
            
            self.btnFrame=CGRectMake(iphoneW-distance-imageH-distance-btnRect.size.width-20*2 + 60,  distance - 15, btnRect.size.width+20*2 , (btnRect.size.height+20*2) - 20);
            
            
        }
        else{
            
            self.headImageFrame=CGRectMake(distance, CGRectGetMaxY(self.timeFrame)+distance,imageH, imageH);
            //self.btnFrame=CGRectMake(distance+imageH+distance, CGRectGetMaxY(self.timeFrame)+distance, btnRect.size.width+20*2, btnRect.size.height+20*2);
            
            //张锐
            //self.btnFrame=CGRectMake(distance+imageH+distance - 60, CGRectGetMaxY(self.timeFrame)+distance, btnRect.size.width+20*2, btnRect.size.height+20*2);
            
            
            
            
            if (modelData.desc.length > 250 || modelData.desc.length == 250) {
                
                self.btnFrame=CGRectMake(distance+imageH+distance - 60, distance - 10 - 90, btnRect.size.width+20*2 + 100, (btnRect.size.height+20*2) - 20);
                
            } else if (modelData.desc.length < 250 && modelData.desc.length > 150){
                
                self.btnFrame=CGRectMake(distance+imageH+distance - 60, distance - 10 - 60, btnRect.size.width+20*2 + 100, (btnRect.size.height+20*2) - 20);
                
            } else {
            
            
                self.btnFrame=CGRectMake(distance+imageH+distance - 60, distance - 10 - 5, btnRect.size.width+20*2 + 100, (btnRect.size.height+20*2) - 20);
            
            }
            
            //self.btnFrame=CGRectMake(distance+imageH+distance - 60, distance - 10, btnRect.size.width+20*2 + 100, (btnRect.size.height+20*2) - 20);
            
            
        }
        self.myself = modelData.person;//是否是自己发的信息
        
        
        //CGFloat  cellH = MAX(CGRectGetMaxY(self.btnFrame), CGRectGetMaxY(self.headImageFrame));//比较输入的内容和头像的Y值哪个大
        
        CGFloat  cellH = CGRectGetMaxY(self.btnFrame);
                                       
        //self.cellHeight = cellH+distance;//返回Cell的高度
        
        
        
       ////////张锐
        if (modelData.desc.length > 250 || modelData.desc.length == 250) {
            
            self.cellHeight = cellH - 90;
            
        } else if (modelData.desc.length < 250 && modelData.desc.length > 150){
        
        
            self.cellHeight = cellH - 60;
        
        } else {
        
            self.cellHeight = cellH - 5;
        }
        
        //self.cellHeight = cellH;
        
    }
    
    return self;
    
}

+ (instancetype)modelFrame:(ZMChatModell *)modelData timeIsEqual:(BOOL)timeBool{
    //    return [[modelFrame alloc]initWithFrameModel:modelData];
    return [[self alloc]initWithFrameModel:modelData timeIsEqual:timeBool];//和上面是一样的
}





@end
