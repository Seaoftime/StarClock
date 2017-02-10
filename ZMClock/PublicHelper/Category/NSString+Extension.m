//
//  NSString+Extension.m
//  GaGaHi
//
//  Created by IOSDevoper on 15/8/10.
//  Copyright (c) 2015年 Zonyet. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

-(BOOL)isChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (NSString *)FilterString{
    NSString *realString;
    realString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    realString = [realString stringByReplacingOccurrencesOfString:@"," withString:@""];
    realString = [realString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    realString = [realString stringByReplacingOccurrencesOfString:@"'" withString:@""];
    realString = [realString stringByReplacingOccurrencesOfString:@"&" withString:@""];
    realString = [realString stringByReplacingOccurrencesOfString:@"(" withString:@""];
    realString = [realString stringByReplacingOccurrencesOfString:@")" withString:@""];
    realString = [realString stringByReplacingOccurrencesOfString:@"." withString:@""];
    realString = [realString stringByReplacingOccurrencesOfString:@"+" withString:@""];
    return [realString lowercaseString];
}

- (CGSize)getSizeWithFont:(CGFloat)font maxWidth:(CGFloat)maxWidth
{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.lineSpacing = 1.5;
    //=========得到content的内容size===========
    NSDictionary *AttriButes = @{NSFontAttributeName:[UIFont systemFontOfSize:font],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize ContentSize = [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                         attributes:AttriButes
                                            context:nil].size;
    return ContentSize;
}

- (NSString *)getNull
{
    NSString * trimingString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (self && ![trimingString isEqualToString:@""]) {
        return self;
    }
    
    return NULL;
}

- (NSString *)cleanJsonHeadStrWithStr:(NSString *)jsonStr
{
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    
    jsonStr = [jsonStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return jsonStr;
}

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}



+(NSData*)dataFromImage:(UIImage*)image
{
    /*把图片转换成NSData的数据类型，并以PNG类型去压缩
     encodedImageString = [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
     */
    
    //该法方法是把图片以JPEG图片格式转换成“Base64Encoding”
    NSData *encodedImageString = UIImageJPEGRepresentation(image,1.0);
    
//    NSString *encodedImageString = [UIImageJPEGRepresentation(image,0.2) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    
    return encodedImageString;
}


+(NSString*)base64StringFromImage:(UIImage*)image
{
    /*把图片转换成NSData的数据类型，并以PNG类型去压缩
     encodedImageString = [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
     */
    
    //该法方法是把图片以JPEG图片格式转换成“Base64Encoding”
//    NSData *encodedImageString = UIImageJPEGRepresentation(image,1);
    
        NSString *encodedImageString = [UIImageJPEGRepresentation(image,1) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    
    return encodedImageString;
}


@end


