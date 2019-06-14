//
//  NSString+QRCode.m
// 
//
//  Created by 兵伍 on 2018/4/15.
//  Copyright © 2018年 兵伍. All rights reserved.
//

#import "NSString+QRCode.h"
#import <CoreImage/CoreImage.h>

@implementation NSString(QRCode)

- (UIImage *)ext_qrCodeImageWithWidth:(CGFloat)width {
    if (self.length == 0) {
        NSLog(@"qrcode url nil");
        return nil;
    }
    CIImage *ciImage = [[self class] creatQRcodeWithUrlstring:self];
    UIImage *img = [[self class] changeImageSizeWithCIImage:ciImage andSize:width];
    return img;
}

+ (UIImage *)changeImageSizeWithCIImage:(CIImage *)ciImage andSize:(CGFloat)size{
    CGRect extent = CGRectIntegral(ciImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:ciImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}

+ (CIImage *)creatQRcodeWithUrlstring:(NSString *)urlString{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data  = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *outputImage = [filter outputImage];
    return outputImage;
}
@end
