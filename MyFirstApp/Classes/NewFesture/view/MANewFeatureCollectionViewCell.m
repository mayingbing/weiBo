//
//  MANewFeatureCollectionViewCell.m
//  MyFirstApp
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MANewFeatureCollectionViewCell.h"


@interface MANewFeatureCollectionViewCell ()


@property(nonatomic ,weak)UIImageView *imageView;

@end

@implementation MANewFeatureCollectionViewCell


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
}

-(UIImageView *)imageView{
    
    if (_imageView == nil) {
        
        UIImageView *imgView = [[UIImageView alloc]init];
        
        _imageView = imgView;
        
        
        [self.contentView addSubview:imgView];
    }
    return _imageView;
    
}

-(void)setImage:(UIImage *)image{
    _image = image;
    
    self.imageView.image = image;
}

@end
