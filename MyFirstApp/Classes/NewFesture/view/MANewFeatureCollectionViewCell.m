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

@property(nonatomic ,strong)UIButton *shareBtn;
@property(nonatomic ,strong)UIButton *startBtn;

@end

@implementation MANewFeatureCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configShareBtn];
        [self configStartBtn];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    self.shareBtn.center = CGPointMake(self.width * 0.5, self.height * 0.6);
    self.startBtn.center = CGPointMake(self.width * 0.5, self.height * 0.7);
   
}

-(UIImageView *)imageView{
    
    if (_imageView == nil) {
        
        UIImageView *imgView = [[UIImageView alloc]init];
        
        _imageView = imgView;
        
        
        [self.contentView addSubview:imgView];
        [self.contentView sendSubviewToBack:imgView];
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
        self.startBtn.hidden = NO;
    }else{
        self.shareBtn.hidden = YES;
        self.startBtn.hidden = YES;
    }
    
}


-(void)configShareBtn{
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"分享微博" forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        
        _shareBtn = btn;
        
        [self.contentView addSubview:btn];
}

-(void)configStartBtn{
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"开始微博" forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];

        [btn sizeToFit];
        _startBtn = btn;
        [self.contentView addSubview:btn];
    
}



//-(UIButton *)shareBtn{
//    
//    if (_shareBtn == nil) {
//        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setTitle:@"分享微博" forState:UIControlStateNormal];
//        
//        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
//        [btn sizeToFit];
//        
//        _shareBtn = btn;
//        
//        [self.contentView addSubview:btn];
//        
//    }
//    
//    return _shareBtn;
//}
//-(UIButton *)startBtn{
//    if (_startBtn == nil) {
//        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setTitle:@"开始微博" forState:UIControlStateNormal];
//        
//        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
//        btn.frame = CGRectMake(0, 0, 100, 30);
//        btn.center = CGPointMake(self.contentView.width * 0.5, self.contentView.height * 0.75);
//        _startBtn = btn;
//        [self.contentView addSubview:btn];
//        
//        
//        
//            }
//    return _shareBtn;
//}


-(void)share{
    
    self.shareBtn.selected = !self.shareBtn.selected;
    
}

-(void)start{
    
    
    
}


@end
