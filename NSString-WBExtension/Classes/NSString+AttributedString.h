//
//  NSString+AttributedString.h
// 
//
//  Created by 兵伍 on 2018/4/17.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(AttributedString)

// 高亮字体
- (NSMutableAttributedString *)ext_attributedStringForHilight:(NSString *)subString withFont:(UIFont *)font;

// 高亮颜色
- (NSMutableAttributedString *)ext_attributedStringForHilight:(NSString *)subString withColor:(UIColor *)color;
- (NSMutableAttributedString *)ext_attributedStringForHilightSubStrings:(NSArray *)subStrings withColor:(UIColor *)color;

// 行距
- (NSAttributedString *)ext_attributedStringWithLineSpace:(CGFloat)lineSpace;
- (NSAttributedString *)ext_attributedStringWithLineSpace:(CGFloat)lineSpace lineBreakMode:(NSLineBreakMode)mode;


@end
