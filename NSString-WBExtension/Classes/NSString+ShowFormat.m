//
//  NSString+ShowFormat.m
//  TaoJinApp
//
//  Created by 兵伍 on 2019/4/15.
//  Copyright © 2019年 兵伍. All rights reserved.
//

#import "NSString+ShowFormat.h"

@implementation NSString(ShowFormat)

- (NSString *)ext_bankCardFormat {
    return [self ext_seperateBy:@" " length:4];
}

- (NSString *)ext_seperateBy:(NSString *)jointor length:(NSInteger)length {
    NSString *tmpStr = [self stringByReplacingOccurrencesOfString:jointor withString:@""];
    
    NSInteger size = (tmpStr.length / length);
    
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    for (NSInteger n = 0;n < size; n++) {
        [tmpStrArr addObject:[tmpStr substringWithRange:NSMakeRange(n*length, length)]];
    }
    
    [tmpStrArr addObject:[tmpStr substringWithRange:NSMakeRange(size*length, (tmpStr.length % length))]];
    
    tmpStr = [tmpStrArr componentsJoinedByString:jointor];
    
    return tmpStr;
}
@end
