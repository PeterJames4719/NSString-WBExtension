//
//  NSString+Size.h
// 
//
//  Created by 兵伍 on 2018/4/5.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString(Size)
- (CGSize)ext_textSizeWithFont:(UIFont *)font width:(CGFloat)width andLines:(NSInteger)lines;
@end

@interface NSString(Size)
- (CGSize)ext_textSizeWithFont:(UIFont *)font;
- (CGSize)ext_textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineSpace:(CGFloat)lineSpace;
- (CGSize)ext_textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size paragraphStyle:(NSMutableParagraphStyle *)style;
- (CGSize)ext_textSizeWithFont:(UIFont *)font width:(CGFloat)width andLines:(NSInteger)lines;
- (CGSize)ext_textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
@end
