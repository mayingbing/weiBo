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

+(void)popHide{
    
    for (UIView *popMenu in CZKeyWindow.subviews) {
        if ([popMenu isKindOfClass:self]) {
            [popMenu removeFromSuperview];
        }
    }
   
}

-(void)setContentView:(UIView *)contentView{
    
    [self.contentView removeFromSuperview];
    
    _contentView = contentView;
    
    contentView.backgroundColor = [UIColor redColor];
    [self addSubview:contentView];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 计算内容视图尺寸
    CGFloat y = 9;
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat w = self.width - 2 * margin;
    CGFloat h = self.height - y - margin;
    
    _contentView.frame = CGRectMake(x, y, w, h);
    
}

@end
