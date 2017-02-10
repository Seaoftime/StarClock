//
//  AFNetworkingHelper.h
//  TryCan
//
//  Created by yaolizhi on 15/5/1.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"



//#define BaseUrl @"http://192.168.1.115/serverpro/"  //线下
#define BaseUrl @"http://192.168.1.111/serverpro/"  //线下

//#define BaseUrl @"http://192.168.1.222/serverpro/"
//#define BaseUrl @"http://192.168.1.106/serverpro/"


//#define BaseUrl  @"http://115.29.78.223/serverpro/"  //线上


typedef  void (^SucessBlock)(id object);

typedef void (^constructingBodyWithBlock)(id <AFMultipartFormData> formData);

typedef  void (^ErrorBlock)( NSError *error);

@interface AFNetworkingHelper : AFHTTPRequestOperationManager


-(instancetype)init;

+ (instancetype)sharedNetworkingHelper;


- (void)getWithUrl:(NSString *)url
            sucess:(SucessBlock)sucessBlock
             error:(ErrorBlock)errorBlock;


- (void)postWithUrl:(NSString *)url
       theParmeters:(id )parmertes
             sucess:(SucessBlock)sucessBlock
              error:(ErrorBlock)errorBlock;

- (void)postFormDataObjectWithUrl:(NSString *)url
                     theParmeters:(id )parmertes
        constructingBodyWithBlock:(constructingBodyWithBlock)constructingBodyWithBlock
                           sucess:(SucessBlock)sucessBlock
                            error:(ErrorBlock)errorBlock;



-(void)postFormDataWithUrl:(NSString *)url
              theParmeters:(id )parmertes
              theDataArray:(NSArray*)dataArray
                    sucess:(SucessBlock)sucessBlock
                     error:(ErrorBlock)errorBlock;





- (void)putWithUrl:(NSString *)url
      theParmeters:(NSDictionary *)parmertes
            sucess:(SucessBlock)sucessBlock
             error:(ErrorBlock)errorBlock;

- (void)patchWithUrl:(NSString *)url
        theParmeters:(NSDictionary *)parmertes
              sucess:(SucessBlock)sucessBlock
               error:(ErrorBlock)errorBlock;


#pragma mark -  检查网络是否正常
-(BOOL)isNetWork;




#pragma mark -  涂抹翻译请求
/**
涂抹翻译请求
 */
+(NSMutableURLRequest*)drawPostWithUrl:(NSString *)url
                          theParmeters:(NSDictionary *)parmertes;


#pragma mark - 把NSDictionary解析成“JSON”格式的NSString字符串
/**
 把NSDictionary解析成“JSON”格式的NSString字符串
 */
+(NSString *)ParseParams:(NSDictionary *)Params;

@end





