//
//  NSDictionary+ValidateValue.m
//
//  Created by allen on 16/4/7.
//  Copyright © 2016年 com.juwang. All rights reserved.
//

#import "NSDictionary+ValidateValue.h"

#import "JRSwizzle.h"
@implementation NSDictionary (ValidateValue)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [[self class] jr_swizzleMethod:@selector(valueForKey:) withMethod:@selector(validateValueForKey:) error:nil];
        [[self class] jr_swizzleMethod:@selector(valueForKeyPath:) withMethod:@selector(validateValueForKeyPath:) error:nil];
    });
}

- (id)validateValueForKey:(NSString *)key{
    id value = [self validateValueForKey:key];
    if ([value isMemberOfClass:[NSNull class]]) {
        value = NULL;
    }
    if ([value isKindOfClass:[NSString class]] && [value isEqualToString:@"null"] ) {
        value = NULL;
    }
    return value;
}

-(id)validateValueForKeyPath:(NSString *)key{
    id value = [self validateValueForKeyPath:key];
    if ([value isMemberOfClass:[NSNull class]]) {
        value = NULL;
    }
    if ([value isKindOfClass:[NSString class]] && [value isEqualToString:@"null"] ) {
        value = NULL;
    }
    return value;
}

+(instancetype)dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
{
    NSUInteger keyCnt = 0, valueCnt = 0;
    __unsafe_unretained id *objPtr = objects; // 指向objects初始位置
    __unsafe_unretained id *keyPtr = keys;    // 指向keys初始位置
    // 遍历找到为key nil的位置
    for (   ; keyCnt < cnt; keyCnt ++, objPtr++) {
        if (*objPtr == 0)
        {
            break;
        }
    }
    // 遍历找到为key nil的位置
    for (   ; valueCnt < cnt; valueCnt ++, keyPtr++) {
        if (*keyPtr == 0) // 遍历找到为key nil的位置
        {
            break;
        }
    }
    // 找到最小值
    NSUInteger minCnt = MIN(keyCnt, valueCnt);
    // 构造合适的key,object array
    NSArray *vs = [NSArray arrayWithObjects:objects count:minCnt];
    NSArray *ks = [NSArray arrayWithObjects:keys count:minCnt];
    // 用下面的方法构造
    return [self dictionaryWithObjects:vs forKeys:ks];
}

+(instancetype)dictionaryWithObjectsAndKeys:(id)firstObject, ...
{
    NSMutableArray *objects = [[NSMutableArray alloc] init];
    NSMutableArray *keys = [[NSMutableArray alloc] init];
    id eachObject;
    va_list argumentList;
    if (firstObject)
    {
        [objects addObject: firstObject];
        va_start(argumentList, firstObject);
        NSUInteger index = 1;
        while ((eachObject = va_arg(argumentList, id)))
        {
            (index++ & 0x01) ? [keys addObject: eachObject] : [objects addObject: eachObject];
        }
        va_end(argumentList);
    }
    
    if (objects.count == keys.count)
    {
        // 直接写空 跳到最后返回
    }
    else
    {
        (objects.count < keys.count)?[keys removeLastObject]:[objects removeLastObject];
    }
    
    return [self dictionaryWithObjects:objects forKeys:keys];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
