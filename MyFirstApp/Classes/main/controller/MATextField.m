//
//  MATextField.m
//  MyFirstApp
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MATextField.h"

@implementation MATextField

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:14];
        self.background = [UIImage imageWithStretchableName:@"searchbar_textfield_background"];
        self.placeholder = @"大家都在搜";
        UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        
        img.width += 10;
        img.contentMode = UIViewContentModeCenter;
        
        
        self.leftView =img;
        
        
        
        self.leftViewMode = UITextFieldViewModeAlways;
    }
   
    return self;
    
}

@end
