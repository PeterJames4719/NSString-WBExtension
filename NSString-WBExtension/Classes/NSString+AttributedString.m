//
//  NSString+AttributedString.m
// 
//
//  Created by 兵伍 on 2018/4/17.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString(AttributedString)

- (NSMutableAttributedString *)ext_attributedStringForHilight:(NSString *)subString withFont:(UIFont *)font {
    
    NSMutableAttributedString *richText = [[NSMutableAttributedString alloc] initWithString:self];
    if (subString) {
        NSRange range = [self rangeOfString:subString];
        [richText addAttribute:NSFontAttributeName value:font range:range];
    }
    return richText;
}

- (NSMutableAttributedString *)ext_attributedStringForHilight:(NSString *)subString withColor:(UIColor *)color {
    
    NSMutableAttributedString *richText = [[NSMutableAttributedString alloc] initWithString:self];
    if (subString) {
        NSRange range = [self rangeOfString:subString];
        [richText addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return richText;
}

- (NSMutableAttributedString *)ext_attributedStringForHilightSubStrings:(NSArray *)subStrings withColor:(UIColor *)color {
    
    NSMutableAttributedString *richText = [[NSMutableAttributedString alloc] initWithString:self];
    for (NSString *subString in subStrings) {
        if (subString) {
            NSRange range = [self rangeOfString:subString];
            [richText addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    
    return richText;
}

// 结尾...
- (NSAttributedString *)ext_attributedStringWithLineSpace:(CGFloat)lineSpace {
    return [self ext_attributedStringWithLineSpace:lineSpace lineBreakMode:NSLineBreakByTruncatingTail];
}

- (NSAttributedString *)ext_attributedStringWithLineSpace:(CGFloat)lineSpace lineBreakMode:(NSLineBreakMode)mode {
    NSString *origin = self;
    NSMutableAttributedString *richText = [[NSMutableAttributedString alloc] initWithString:origin];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = mode;
    [paragraphStyle setLineSpacing:lineSpace];
    [richText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, origin.length)];
    return richText;
}

@end
