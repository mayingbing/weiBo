//
//  MACoverView.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MACoverView.h"


@implementation MACoverView

-(void)setDimBackground:(BOOL)dimBackground{
    
    _dimBackground = dimBackground;
    
    if (dimBackground) {
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
    }else{
        self.alpha = 1;
        self.backgroundColor = [UIColor clearColor];
    }

    
    
}

+(instancetype)show{
    
    MACoverView *cover = [[MACoverView alloc]initWithFrame:CZKeyWindow.frame];
    [CZKeyWindow addSubview:cover];
    cover.backgroundColor = [UIColor yellowColor];
    return cover;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self removeFromSuperview];
    
    if ([_delegate respondsToSelector:@selector(hidePopView:)]) {
        [_delegate hidePopView:self];
    }
    
}



@end
