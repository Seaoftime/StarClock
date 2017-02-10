//
//  TRENetworkTool.m
//
//  Created by TRE on 16/1/30.
//  Copyright © 2016年 TRE. All rights reserved.
//

#import "TRENetworkTool.h"

@implementation TRENetworkTool

// 多文件上传方法
- (void)POSTMoreFileWithUlrString:(NSString *)urlString fileKey:(NSString *)fileKey fileDict:(NSDictionary *)fileDict paramaters:(NSDictionary *)paramaters success:(successBlock)success fause:(fauseBlock)fause
{
    // 网络请求路径
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 1. 创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 1.1 设置请求方法
    request.HTTPMethod = @"POST";
    
    // 1.2 告诉服务器,本次网络请求有文件上传信息.
    NSString *type = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",kBoundary];
    [request setValue:type forHTTPHeaderField:@"Content-Type"];
    
    // 1.3 设置请求体
    request.HTTPBody = [self getHttpBodyWithFileKey:fileKey fileDict:fileDict paramaters:paramaters];
    
    // 2. 发送请求
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // 成功:
        if (data && !error) {
            
            id responseObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            if (!responseObj) { //如果不能解析JSON 数据,
                
                responseObj = data;
            }
            
            // 执行回调.
            if (success) {
                success(responseObj ,response);
            }
            
            
        }else //失败:
        {
            // 执行回调.
            if (fause) {
                fause(error);
            }
        }
        
    }] resume];
}


// 单文件上传方法.
- (void)POSTFileWithUlrString:(NSString *)urlString fileKey:(NSString *)fileKey filePath:(NSString *)filePath fileName:(NSString *)fileName success:(successBlock)success fause:(fauseBlock)fause
{
    
    // 网络请求路径
    NSURL *url = [NSURL URLWithString:urlString];

    // 1. 创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 1.1 设置请求方法
    request.HTTPMethod = @"POST";
    
    // 1.2 告诉服务器,本次网络请求有文件上传信息.
    NSString *type = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",kBoundary];
    [request setValue:type forHTTPHeaderField:@"Content-Type"];
    
    // 1.3 设置请求体
    request.HTTPBody = [self getHttpBodyWithfileKey:fileKey filePath:filePath fileName:fileName];
    
    // 2. 发送请求
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // 成功:
        if (data && !error) {
            
            id responseObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            if (!responseObj) { //如果不能解析JSON 数据,
                
                responseObj = data;
            }
            
            // 执行回调.
            if (success) {
                success(responseObj ,response);
            }
            
            
        }else //失败:
        {
            // 执行回调.
            if (fause) {
                fause(error);
            }
        }
        
        
    }] resume];

}


// 获得多文件上传+多普通参数上传的请求体方法.
// fileKey: 服务器接收文件参数的 key 值.
// fileDict: 文件字典,key:上传文件在服务器中保存的名称;value:上传文件的路径.
// paramaters :普通文本参数字典.
- (NSData *)getHttpBodyWithFileKey:(NSString *)fileKey fileDict:(NSDictionary *)fileDict paramaters:(NSDictionary *)paramaters
{
    // 请求体
    NSMutableData *data = [NSMutableData data];
    
    // 文件参数的拼接.
    // 遍历文件参数字典,取出文件字典中的 key 值 和 value 值.
    [fileDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        // 上传文件在服务器中保存的名称
        NSString *fileName = key;
        // 上传文件的路径
        NSString *filePath = obj;
        
        // 上传文件的请求体格式:
        // 1. 上传文件的上边界
        NSMutableString *headerStrM = [NSMutableString stringWithFormat:@"\r\n--%@\r\n",kBoundary];
        
        [headerStrM appendFormat:@"Content-Disposition: form-data; name=%@; filename=%@\r\n",fileKey,fileName];
        
        [headerStrM appendFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        
        [data appendData:[headerStrM dataUsingEncoding:NSUTF8StringEncoding]];
        
        // 2. 文件内容
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        
        [data appendData:fileData];
        
    }];
    
    // 普通文本参数的拼接
    // 遍历普通文本参数字典,取出普通文本参数字典中的key 和 value值.
    [paramaters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        // 服务器接收文本参数的 key 值
        NSString *paramaterKey = key;
        // 文本内容
        NSString *paramaterValue = obj;
        
        // 拼接普通文本参数请求体格式
        // 普通文本参数的上边界
        NSMutableString *headerS = [NSMutableString stringWithFormat:@"\r\n--%@\r\n",kBoundary];
        
        [headerS appendFormat:@"Content-Disposition: form-data; name=%@\r\n\r\n",paramaterKey];
        
        [data appendData:[headerS dataUsingEncoding:NSUTF8StringEncoding]];
        
        // 普通文本参数
        [data appendData:[paramaterValue dataUsingEncoding:NSUTF8StringEncoding]];
        
    }];
    
    // 请求体下边界的拼接
    NSMutableString *footerStrM = [NSMutableString stringWithFormat:@"\r\n--%@--\r\n",kBoundary];
    
    [data appendData:[footerStrM dataUsingEncoding:NSUTF8StringEncoding]];
    
    return data;
    
}

// 获得单文件上传请求体格式的方法.
// 参数:
// 1. fileKey:服务器接收文件参数的 key 值.
// 2. fileName:上传文件在服务器中保存的名称(可选)
// 3. filePath:上传文件内容(文件路径)
-(NSData *)getHttpBodyWithfileKey:(NSString *)fileKey filePath:(NSString *)filePath fileName:(NSString *)fileName
{
    // 请求体数据
    NSMutableData *data = [NSMutableData data];
    
    // 同步获得本地文件信息的方法.
    NSURLResponse *response = [self getFileResponseWithFilePath:filePath];
    
    // 用户没有指定文件名称
    if (!fileName) {
        
        fileName = response.suggestedFilename;
    }
    
    // 1. 文件的上边界
    NSMutableString *headerStrM = [NSMutableString stringWithFormat:@"\r\n--%@\r\n",kBoundary];
    
    [headerStrM appendFormat:@"Content-Disposition: form-data; name=%@; filename=%@\r\n",fileKey,fileName];
    
    [headerStrM appendFormat:@"Content-Type: %@\r\n\r\n",response.MIMEType];
    
    [data appendData:[headerStrM dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 2. 文件内容
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    [data appendData:fileData];
    
    // 3. 文件的下边界
    NSMutableString *footerStrM = [NSMutableString stringWithFormat:@"\r\n--%@--",kBoundary];
    
    [data appendData:[footerStrM dataUsingEncoding:NSUTF8StringEncoding]];
    
    return data;
}

// 同步获得本地文件响应头信息
- (NSURLResponse *)getFileResponseWithFilePath:(NSString *)filePath
{
    // 动态获取文件类型.
    
    // 1. 获得文件的路径,根据文件路径生成url地址.本地协议名称 file://
    NSString *urlString = [NSString stringWithFormat:@"file://%@",filePath];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // NSUrlSession 没有同步请求的方法!
    // 利用 NSUrlConnection 发送同步请求.
    
    // 定义一块空地址.
    NSURLResponse *response = nil;
    
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    
    return response;
}


-(void)loadWebServerDataWithUrlString:(NSString *)urlString success:(successBlock)success fause:(fauseBlock)fause
{
    // 0. 百分号转译.
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 1. 创建请求
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    
    
    // 2. 发送网络请求
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        // data :服务器返回的数据.
        // response :服务器的响应头.
        // error :连接错误
        // 网络请求完成之后执行当前block中的内容;
        // 提供一个时机:(网络请求完成!)
        
        // 成功:
        if (data && !error) {
            
            id responseObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            
            if (!responseObj) { //如果不能解析JSON 数据,
                
                responseObj = data;
            }
            
            // 执行回调.
            if (success) {
                success(responseObj ,response);
            }

        
        }else //失败:
        {
            // 执行回调.
            if (fause) {
                fause(error);
            }
        }
        
    }] resume];
    
    
}

+(instancetype)sharedNetworkTool
{
    static id _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

@end
