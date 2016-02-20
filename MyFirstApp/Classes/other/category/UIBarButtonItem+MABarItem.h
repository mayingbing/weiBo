//
//  UIBarButtonItem+MABarItem.h
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MABarItem)


+(instancetype)setNavigationBarButtonItemWith:(NSString *)imageName hightlightImageName:(NSString *)hightlightImageName target:(id)target action:(SEL)action;

@end
