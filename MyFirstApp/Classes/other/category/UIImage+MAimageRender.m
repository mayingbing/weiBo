//
//  UIImage+MAimageRender.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIImage+MAimageRender.h"

@implementation UIImage (MAimageRender)

+(instancetype)imageRenderingModeAlwaysOriginalWithImageName:(NSString *)imageName{
    
    UIImage *img = [UIImage imageNamed:imageName];
    
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

+ (instancetype)imageWithStretchableName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
