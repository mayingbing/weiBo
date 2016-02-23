//
//  MARootTool.m
//  MyFirstApp
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MARootTool.h"
#import "MATabBarController.h"
#import "MANewFeatureCollectionViewController.h"

@implementation MARootTool
+(void)chooseVersion:(UIWindow *)window{
    //获取当前版本号
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    //获取上一版本号
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"Version"];
    
    if([currentVersion isEqualToString:lastVersion]){
        
        MATabBarController *tabBarVc = [[MATabBarController alloc]init];
        
        window.rootViewController = tabBarVc;
    }else{
        
        MANewFeatureCollectionViewController *newFestureVC = [[MANewFeatureCollectionViewController alloc]init];
        
        window.rootViewController = newFestureVC;
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"Version"];
        
    }
    
}
@end
