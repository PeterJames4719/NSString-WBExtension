//
//  NSString+QRCode.h
// 
//
//  Created by 兵伍 on 2018/4/15.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(QRCode)
- (UIImage *)ext_qrCodeImageWithWidth:(CGFloat)width;
@end
