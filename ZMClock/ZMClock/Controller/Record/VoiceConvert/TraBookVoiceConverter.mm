//
//  VoiceConverter.m
//  Jeans
//
//  Created by Jeans Huang on 12-7-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TraBookVoiceConverter.h"

#import "wav.h"
#import "interf_dec.h"
#import "dec_if.h"
#import "interf_enc.h"
#import "amrFileCodec.h"

@implementation TraBookVoiceConverter


+ (int)isMP3File:(NSString *)filePath
{
    const char *_filePath = [filePath cStringUsingEncoding:NSASCIIStringEncoding];
    return isMP3File(_filePath);
}

+ (int)isAMRFile:(NSString *)filePath
{
    const char *_filePath = [filePath cStringUsingEncoding:NSASCIIStringEncoding];
    return isAMRFile(_filePath);
}

+ (int)amrToWav:(NSString*)amrPath wavSavePath:(NSString*)savePath
{
    
    if (EM_DecodeAMRFileToWAVEFile([amrPath cStringUsingEncoding:NSASCIIStringEncoding], [savePath cStringUsingEncoding:NSASCIIStringEncoding]))
    {
        return 0; // success  //因为成功就只有种情况，而失败有很多种情况
    }
    else
    {
        return 1;   // failed
    }
}

+ (int)wavToAmr:(NSString*)wavPath amrSavePath:(NSString*)savePath
{
    
    if (EM_EncodeWAVEFileToAMRFile([wavPath cStringUsingEncoding:NSASCIIStringEncoding], [savePath cStringUsingEncoding:NSASCIIStringEncoding], 1, 16))
    {
        return 0;   // success
    }
    else
    {
        return 1;   // failed
    }
}
    
    
@end
