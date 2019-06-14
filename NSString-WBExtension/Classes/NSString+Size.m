//
//  NSString+Size.m
// 
//
//  Created by 兵伍 on 2018/4/5.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSAttributedString(Size)

- (CGSize)ext_textSizeWithFont:(UIFont *)font width:(CGFloat)width andLines:(NSInteger)lines
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.numberOfLines = lines;
    label.font = font;
    label.attributedText = self;
    [label sizeToFit];
    CGSize size = CGSizeMake(ceil(CGRectGetWidth(label.frame)), ceil(CGRectGetHeight(label.frame)));
    return size;
}

- (CGSize)ext_textSizeWithFont:(UIFont *)font width:(CGFloat)width lines:(NSInteger)lines lineSpace:(CGFloat)lineSpace lineBreakMode:(NSLineBreakMode)mode {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = mode;
    [paragraphStyle setLineSpacing:lineSpace];
    NSMutableAttributedString *richText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    [richText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, richText.length)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.numberOfLines = lines;
    label.font = font;
    label.attributedText = self;
    [label sizeToFit];
    CGSize size = CGSizeMake(ceil(CGRectGetWidth(label.frame)), ceil(CGRectGetHeight(label.frame)));
    return size;
}

@end

@implementation NSString(Size)

- (CGSize)ext_textSizeWithFont:(UIFont *)font width:(CGFloat)width andLines:(NSInteger)lines
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.numberOfLines = lines;
    label.font = font;
    label.text = self;
    [label sizeToFit];
    CGSize size = CGSizeMake(ceil(CGRectGetWidth(label.frame)), ceil(CGRectGetHeight(label.frame)));
    return size;
}

- (CGSize)ext_textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineSpace:(CGFloat)lineSpace {
    NSMutableParagraphStyle *paragraphStyle;
    if (lineSpace > 0) {
        paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        // 有行间距时，不能是NSLineBreakByTruncatingTail
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        [paragraphStyle setLineSpacing:lineSpace];
    }
    
   return [self ext_textSizeWithFont:font constrainedToSize:size paragraphStyle:paragraphStyle];
}

- (CGSize)ext_textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    return [self ext_textSizeWithFont:font constrainedToSize:size paragraphStyle:nil];
}

- (CGSize)ext_textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size paragraphStyle:(NSMutableParagraphStyle *)style
{
    CGSize textSize;
    
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                               forKey:NSFontAttributeName];
        textSize = [self sizeWithAttributes:attributes];
    } else {
        //NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        NSStringDrawingOptions option = NSStringDrawingUsesLineFragmentOrigin;
        //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（译者注：字体大小+行间距=行高）
        NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        if (style) {
            [attributes setObject:style forKey:NSParagraphStyleAttributeName];
        }
        CGRect rect = [self boundingRectWithSize:size options:option attributes:attributes context:nil];
        textSize = rect.size;
        
    }
    textSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    return textSize;
}

- (CGSize)ext_textSizeWithFont:(UIFont *)font
{
    CGSize textSize = [self sizeWithAttributes:@{NSFontAttributeName : font}];
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}
@end
