//
//  NSDictionary+Extension.m
//  ShowMe
//
//  Created by 123 on 2018/12/14.
//  Copyright © 2018 nkl. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

-(NSString*)dictionaryToJson
{
    NSError *parseError =nil;
    
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&parseError];
    
//    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSString * encodeStr = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
    
    return encodeStr;
}

@end
