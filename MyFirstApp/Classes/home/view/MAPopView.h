//
//  MAPopView.h
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAPopView : UIImageView

@property(nonatomic ,weak)UIView *contentView;


+(void)popHide;

+(instancetype)showPop:(CGRect )rect;

@end
