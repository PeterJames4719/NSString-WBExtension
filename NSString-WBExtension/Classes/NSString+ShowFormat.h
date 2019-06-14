//
//  NSString+ShowFormat.h
//  TaoJinApp
//
//  Created by 兵伍 on 2019/4/15.
//  Copyright © 2019年 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(ShowFormat)
// 4位一空格
- (NSString *)ext_bankCardFormat;

- (NSString *)ext_seperateBy:(NSString *)jointor length:(NSInteger)length;
@end


