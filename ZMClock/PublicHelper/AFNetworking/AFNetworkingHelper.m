//
//  AFNetworkingHelper.m
//  TryCan
//
//  Created by yaolizhi on 15/5/1.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "AFNetworkingHelper.h"
#import "AnyObjectActivityView.h"

@implementation AFNetworkingHelper

-(instancetype)init
{
    self = [super init];
    return self;
}
static AFNetworkingHelper *networkingHelper = nil;

+ (instancetype)sharedNetworkingHelper
{
    
    
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        networkingHelper = [[self alloc]init];
        
    });
    
    return networkingHelper;
}


//get请求
- (void)getWithUrl:(NSString *)url
            sucess:(SucessBlock)sucessBlock
             error:(ErrorBlock)errorBlock {
    
    url = [NSString stringWithFormat:@"%@%@",BaseUrl,url];
    [self GET:
     [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          //        NSLog(@"json: %@",responseObject);
          //判断code 条件即可
          sucessBlock(responseObject);
          
      } failure:^(AFHTTPRequestOperation *operation, NSError *error){
          
          NSLog(@"Error getting character detail:%@",[error localizedDescription])
          ;
          
          errorBlock(error);
          
      }];
    
    
    
}

//post请求
- (void)postWithUrl:(NSString *)url
       theParmeters:(id )parmertes
             sucess:(SucessBlock)sucessBlock
              error:(ErrorBlock)errorBlock
{
    url = [NSString stringWithFormat:@"%@%@",BaseUrl,url];
        [self POST:
     [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
    parameters:parmertes
       success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
           //判断code 条件即可
           sucessBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        
        
                  NSLog(@"Error getting character detail:%@",[error localizedDescription]);
        
      
        
           errorBlock(error);
    }];
    
}



//post请求
- (void)postFormDataObjectWithUrl:(NSString *)url
       theParmeters:(id )parmertes
constructingBodyWithBlock:(constructingBodyWithBlock)constructingBodyWithBlock
             sucess:(SucessBlock)sucessBlock
              error:(ErrorBlock)errorBlock
{
    url = [NSString stringWithFormat:@"%@%@",BaseUrl,url];
    
    [self POST:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parmertes constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
     {
         constructingBodyWithBlock(formData);
         
     } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
         sucessBlock(responseObject);
         
     } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error)
     {
         NSLog(@"Error getting character detail:%@",[error localizedDescription]);
         errorBlock(error);
     }];
    
}


/**
 表单上传
 */
-(void)postFormDataWithUrl:(NSString *)url
              theParmeters:(id )parmertes
              theDataArray:(NSArray*)dataArray
                     sucess:(SucessBlock)sucessBlock
                      error:(ErrorBlock)errorBlock
{
    url = [NSString stringWithFormat:@"%@%@",BaseUrl,url];
    [self POST:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parmertes constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
    {
        for (NSDictionary *itemData in dataArray)
        {
            NSData *iamgeData = [itemData objectForKey:@"imageDate"];
            NSString *imageName = [itemData objectForKey:@"imageName"];
            [formData appendPartWithFileData:iamgeData name:imageName fileName:@"image.jpg" mimeType:@"image/jpeg"];
        }
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        sucessBlock(responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error)
    {
        NSLog(@"Error getting character detail:%@",[error localizedDescription]);
        errorBlock(error);
    }];
}







//put 请求
- (void)putWithUrl:(NSString *)url
      theParmeters:(NSDictionary *)parmertes
            sucess:(SucessBlock)sucessBlock
             error:(ErrorBlock)errorBlock
{
    [self PUT:
     [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
   parameters:parmertes
      success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
          
          //        NSLog(@"json: %@",responseObject);
          //判断code 条件即可
          sucessBlock(responseObject);
          
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          
          NSLog(@"Error getting character detail:%@",[error localizedDescription]
                );
          
          errorBlock(error);
      }];
    
}

//PATCH 请求
- (void)patchWithUrl:(NSString *)url
        theParmeters:(NSDictionary *)parmertes
              sucess:(SucessBlock)sucessBlock
               error:(ErrorBlock)errorBlock
{
    
    [self PATCH:
     [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
     parameters:parmertes
        success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
            
            //        NSLog(@"json: %@",responseObject);
            //判断code 条件即可
            sucessBlock(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"Error getting character detail:%@",[error localizedDescription]
                  );
            
            errorBlock(error);
        }];
    
}

//DELETE 请求
- (void)deleteWithUrl:(NSString *)url
         theParmeters:(NSDictionary *)parmertes
               sucess:(SucessBlock)sucessBlock
                error:(ErrorBlock)errorBlock
{
    [self DELETE:
     [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
      parameters:parmertes
         success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
             
             //        NSLog(@"json: %@",responseObject);
             //判断code 条件即可
             sucessBlock(responseObject);
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             NSLog(@"Error getting character detail:%@",[error localizedDescription]
                   );
             
             errorBlock(error);
         }];
    
}


#pragma mark -  检查网络是否正常
-(BOOL)connectedToNetWork;
{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        NSLog(@"无法连接到网络");
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && ! needsConnection) ? YES : NO;
}

-(BOOL)isNetWork
{
    if ([networkingHelper connectedToNetWork])
    {
        return YES;
    }
    else
    {
         [AnyObjectActivityView showWithTitle:NetWorkFail wittImageName:nil withActivityMode:ActivityModeText withAddedSuperView:kWindow withMargin:ActivityMargin10 withafterDelay:ActivityAfterDelayTime1];
        return NO;
    }
}












#pragma mark -  返回“NSMutableURLRequest”
/**
 涂抹翻译请求
 */
+(NSMutableURLRequest*)drawPostWithUrl:(NSString *)url
                          theParmeters:(NSDictionary *)parmertes
{
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:20];
    //解析请求参数，用NSDictionary来存参数，通过自定义的函数ParseParams把它解析成一个post格式的字符串
    NSString *ParseParamsResult = [AFNetworkingHelper ParseParams:parmertes];
    NSData *PostData = [ParseParamsResult dataUsingEncoding:NSUTF8StringEncoding];
    
    [Request setHTTPMethod:@"POST"];
    [Request setHTTPBody:PostData];
    
    return Request;
}



#pragma mark - 把NSDictionary解析成“JSON”格式的NSString字符串
+ (NSString *)ParseParams:(NSDictionary *)Params
{
    NSString *KeyValueFormat = nil;
    NSMutableString *Result = [[NSMutableString alloc] init];
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

@end
