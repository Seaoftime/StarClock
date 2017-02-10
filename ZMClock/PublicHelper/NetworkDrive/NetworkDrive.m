//
//  NetworkDrive.m
//  Translation
//
//  Created by yaolizhi on 14/12/18.
//  Copyright (c) 2014年 ZhongYeKeJiJiShuBu. All rights reserved.
//

#import "NetworkDrive.h"

#define TimeInterval 10.0  //超时时间

@implementation NetworkDrive

static NetworkDrive *sharedNetworkDrive = nil; //第一步：静态实例，并初始化。

+(NetworkDrive*)sharedInstance    //第二步：实例构造检查静态实例是否为nil
{
    static dispatch_once_t once;
    
    dispatch_once(&once,^{
        
        sharedNetworkDrive = [[self alloc]init];
        
    });
    
    return sharedNetworkDrive;
}

#pragma mark ************* Get的方法 *************
/**
 Get请求
 */
-(void)GetWithUrl:(NSString *)Url Sucess:(SucessBlock)SucessBlock Error:(ErrorBlock)ErrorBlock
{
    //请求地址格式化
    NSURL *URL = [NSURL URLWithString:[Url URLEncodedString]];
    //请求初始化，可以在这针对缓存，超时做出一些设置
    NSURLRequest *Request = [[NSURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:TimeInterval];
    
    //创建一个新的队列（开启新线程）
    NSOperationQueue *Queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:Request
                                       queue:Queue
                           completionHandler:^(NSURLResponse *Response, NSData *Data, NSError *Error)
    {
        if (Error == nil)
        {
            NSDictionary *ResDict = [NSJSONSerialization JSONObjectWithData:Data
                                                                    options:NSJSONReadingAllowFragments error:nil];
            dispatch_async(dispatch_get_main_queue(),^{
                SucessBlock(ResDict);
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(),^{
                ErrorBlock(Error);
            });
        }
    }];
}

#pragma mark ************* Post的方法 *************
/**
 Post请求
 */
-(void)PostWithUrl:(NSString *)Url TheParmeter:(NSDictionary *)Parmerte Sucess:(SucessBlock)SucessBlock Error:(ErrorBlock)ErrorBlock
{
    NSURL *URL = [NSURL URLWithString:[Url URLEncodedString]];
    //请求初始化，可以在这针对缓存，超时做出一些设置
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:TimeInterval];
    //解析请求参数，用NSDictionary来存参数，通过自定义的函数ParseParams把它解析成一个post格式的字符串
    NSString *ParseParamsResult = [self ParseParams:Parmerte];
    NSData *PostData = [ParseParamsResult dataUsingEncoding:NSUTF8StringEncoding];
    
    [Request setHTTPMethod:@"POST"];
    [Request setHTTPBody:PostData];
    
    //创建一个新的队列（开启新线程）
    NSOperationQueue *Queue = [NSOperationQueue new];
    //发送异步请求，请求完以后返回的数据，通过completionHandler参数来调用
    [NSURLConnection sendAsynchronousRequest:Request queue:Queue completionHandler:^(NSURLResponse *Response, NSData *Data, NSError *ConnectionError)
    {
        if (ConnectionError == nil)
        {
            NSDictionary *ResDict = [NSJSONSerialization JSONObjectWithData:Data
                                                                    options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(),^{
                
                SucessBlock(ResDict);
                
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(),^{
                
                ErrorBlock(ConnectionError);
                
            });
        }

    }];
}


#pragma mark ************* Put的方法 *************
/**
 Put请求
 */
-(void)PutWithUrl:(NSString *)Url TheParmeter:(NSDictionary *)Parmerte Sucess:(SucessBlock)SucessBlock Error:(ErrorBlock)ErrorBlock
{
    NSURL *URL = [NSURL URLWithString:[Url URLEncodedString]];
    //请求初始化，可以在这针对缓存，超时做出一些设置
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:TimeInterval];
    //解析请求参数，用NSDictionary来存参数，通过自定义的函数parseParams把它解析成一个post格式的字符串
    NSString *parseParamsResult = [self ParseParams:Parmerte];
    NSData *postData = [parseParamsResult dataUsingEncoding:NSUTF8StringEncoding];
    
    [Request setHTTPMethod:@"PUT"];
    [Request setHTTPBody:postData];
    
    //创建一个新的队列（开启新线程）
    NSOperationQueue *Queue = [NSOperationQueue new];
    //发送异步请求，请求完以后返回的数据，通过completionHandler参数来调用
    [NSURLConnection sendAsynchronousRequest:Request queue:Queue completionHandler:^(NSURLResponse *Response, NSData *Data, NSError *ConnectionError)
     {
         if (ConnectionError == nil)
         {
             NSDictionary *ResDict = [NSJSONSerialization JSONObjectWithData:Data
                                                                     options:NSJSONReadingMutableContainers error:nil];
             dispatch_async(dispatch_get_main_queue(),^{
                 SucessBlock(ResDict);
             });
         }
         else
         {
             dispatch_async(dispatch_get_main_queue(),^{
                 ErrorBlock(ConnectionError);
             });
         }
         
     }];
}



#pragma mark ************* Delete的方法 *************
/**
 Delete方式请求
 */
-(void)DeleteWithUrl:(NSString *)Url Sucess:(SucessBlock)SucessBlock Error:(ErrorBlock)ErrorBlock
{
    //请求地址格式化
    NSURL *URL = [NSURL URLWithString:[Url URLEncodedString]];
    //请求初始化，可以在这针对缓存，超时做出一些设置
    NSURLRequest *Request = [[NSURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:TimeInterval];
    
    //创建一个新的队列（开启新线程）
    NSOperationQueue *Queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:Request
                                       queue:Queue
                           completionHandler:^(NSURLResponse *Response, NSData *Data, NSError *Error)
     {
         if (Error == nil)
         {
             NSDictionary *ResDict = [NSJSONSerialization JSONObjectWithData:Data
                                                                     options:NSJSONReadingAllowFragments error:nil];
             
             dispatch_async(dispatch_get_main_queue(),^{
                 SucessBlock(ResDict);
             });

         }
         else
         {
             dispatch_async(dispatch_get_main_queue(),^{
                 ErrorBlock(Error);
             });
         }
     }];
}










#pragma mark *********** 把NSDictionary解析成“JSON”格式的NSString字符串 ***********
-(NSString *)ParseParams:(NSDictionary *)Params
{
    NSString *KeyValueFormat = nil;
    NSMutableString *Result = [[NSMutableString alloc]init];
    //实例化一个key枚举器用来存放dictionary的key
    NSEnumerator *keyEnum = [Params keyEnumerator];
    id key;
    while (key = [keyEnum nextObject])
    {
        KeyValueFormat = [NSString stringWithFormat:@"%@=%@&",key,[Params valueForKey:key]];
        [Result appendString:KeyValueFormat];
    }
    return Result;
}


#pragma mark *********** 封装成“JSON”格式的错误参数数据 ***********
-(NSData*)DataParams:(NSDictionary *)Params
{
    NSError *Error = [NSError errorWithDomain:@"这是错误信息" code:504 userInfo:nil];
    NSData *JsonData = [NSJSONSerialization dataWithJSONObject:Params options:NSJSONWritingPrettyPrinted error:&Error];
    return JsonData;
}
  

@end
