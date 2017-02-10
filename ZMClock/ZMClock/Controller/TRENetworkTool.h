//

#import <Foundation/Foundation.h>
#define kBoundary @"boundary"

// 1. 定义block类型
// 如果服务器返回的是JSON数据,那么直接传递给外界解析之后的 OC 数据. ---> 帮用户自动解析JSON数据.
// 如果是其他数据类型,直接将二进制数据返回给用户.

// 1.1 成功回调
// obj: OC数据 / NSData
// response: 服务器的响应头信息
typedef void(^successBlock)(id obj, NSURLResponse *response);

// 1.2 失败回调
typedef void(^fauseBlock)(NSError *error);


@interface TRENetworkTool : NSObject

// 网络请求完成之后,成功回调!失败回调!

// 多文件+多普通参数 上传方法.
// fileKey :服务器接收文件参数的 key 值.
// fileDict :文件参数字典(key:文件名, value:文件路径)
// paramaters :普通文本参数字典(key:服务器接收文本参数的key值,value:文本参数内容)
- (void)POSTMoreFileWithUlrString:(NSString *)urlString fileKey:(NSString *)fileKey fileDict:(NSDictionary *)fileDict paramaters:(NSDictionary *)paramaters success:(successBlock)success fause:(fauseBlock)fause;



// 单文件上传的方法
// urlString :网络接口
// fileKey :服务器接收文件参数的 key 值.
// filePath :上传文件的路径
// fileName :上传文件在服务器中保存的名称(可选)
- (void)POSTFileWithUlrString:(NSString *)urlString fileKey:(NSString *)fileKey filePath:(NSString *)filePath fileName:(NSString *)fileName success:(successBlock)success fause:(fauseBlock)fause;


// 同步获得本地文件响应头信息
- (NSURLResponse *)getFileResponseWithFilePath:(NSString *)filePath;

// 单例
+(instancetype)sharedNetworkTool;

// 发送普通网络请求.(没有参数/GET请求)
// urlString: 网络接口.
// success: 成功回调
// fause :失败回调
-(void)loadWebServerDataWithUrlString:(NSString *)urlString success:(successBlock)success fause:(fauseBlock)fause;

@end
