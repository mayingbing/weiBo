//
//  MACoverView.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MACoverView.h"


@implementation MACoverView

+(instancetype)show{
    
    MACoverView *cover = [[MACoverView alloc]initWithFrame:CZKeyWindow.frame];
    [CZKeyWindow addSubview:cover];
    cover.backgroundColor = [UIColor yellowColor];
    return cover;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self removeFromSuperview];
    
}



@end
