//
//  MACoverView.h
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MACoverView;
@protocol MACoverViewDelegate <NSObject>

-(void)hidePopView:(MACoverView *)cover;

@end



@interface MACoverView : UIView

@property(nonatomic ,weak)id<MACoverViewDelegate>  delegate;


@property (nonatomic ,assign)BOOL  dimBackground;

+(instancetype)show;

@end
