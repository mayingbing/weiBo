//
//  MAPopView.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAPopView.h"

@implementation MAPopView



+(instancetype)showPop:(CGRect )rect{
    MAPopView *pop = [[MAPopView alloc]initWithFrame:rect];
    
    pop.image = [UIImage imageWithStretchableName:@"popover_background"];
    
    [CZKeyWindow addSubview:pop];
    
    return pop;
}

-(void)setContentView:(UIView *)contentView{
    
    [self.contentView removeFromSuperview];
    
    _contentView = contentView;
    
    contentView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:contentView];
    
}

@end
