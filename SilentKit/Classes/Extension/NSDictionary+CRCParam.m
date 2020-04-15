//
//  NSDictionary+CRCParam.m
//
//  Created by allen on 16/4/7.
//  Copyright © 2016年 com.juwang. All rights reserved.
//

#import "NSDictionary+CRCParam.h"
#import <CommonCrypto/CommonDigest.h>

@interface NSString (SHA1Addiction)
- (NSString*) stringFromSHA1;
@end

@implementation NSString (SHA1Addiction)
- (NSString*) stringFromSHA1
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *outStr = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH*2];
    for (int i = 0 ; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [outStr appendFormat:@"%02x",digest[i]];
    }
    return outStr;
}
@end

@implementation NSDictionary (CRCParam)

- (NSDictionary *)CRCParam{
    //key排序
    NSMutableArray* dicKeyMArr = [[self allKeys] mutableCopy];
    NSArray* sortedDicKeyMArr = [dicKeyMArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString* objStr1 = (NSString*) obj1;
        NSString* objStr2 = (NSString*) obj2;
        return [objStr1 compare:objStr2];
    }];
    //拼接字符串
    NSMutableString* CRCStr = [NSMutableString new];
    for (NSString* dicKey in sortedDicKeyMArr) {
        NSString* keyValueStr = [NSString stringWithFormat:@"%@=%@",dicKey,[self valueForKey:dicKey]?:@""];
        [CRCStr appendFormat:@"&%@",keyValueStr];
    }
    [CRCStr appendString:@"----"];
    NSString* SHA1Str = [[CRCStr substringWithRange:NSMakeRange(1, CRCStr.length-1)] stringFromSHA1];
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:self];
    [mDic setValue:SHA1Str forKey:@"crc"];
    return [mDic copy];
}

@end
