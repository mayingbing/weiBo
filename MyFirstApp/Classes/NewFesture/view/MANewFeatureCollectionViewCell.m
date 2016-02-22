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

@property(nonatomic ,weak)UIButton *shareBtn;
@property(nonatomic ,weak)UIButton *startBtn;

@end

@implementation MANewFeatureCollectionViewCell

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    self.shareBtn.center = CGPointMake(self.width * 0.5, self.height * 0.6);
    self.startBtn.center = CGPointMake(self.width * 0.5, self.height * 0.8);
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

-(void)currentPage:(NSIndexPath *)indexPath count:(int)count{
    
    if (indexPath.row == count-1) {
        self.shareBtn.hidden = NO;
        self.shareBtn.hidden = NO;
        
        
    }else{
        self.shareBtn.hidden = YES;
        self.shareBtn.hidden = YES;
    }
    
}


-(UIButton *)shareBtn{
    
    if (_shareBtn == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"分享微博" forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        _shareBtn = btn;
        
        [self addSubview:btn];
        
           }
    
    return _shareBtn;
}
-(UIButton *)startBtn{
    if (_startBtn == nil) {
        
        
        
        
        
        
        
            }
    return _shareBtn;
}


-(void)share{
    
    self.shareBtn.selected = !self.shareBtn.selected;
    
}

-(void)start{
    
    
    
}


@end
