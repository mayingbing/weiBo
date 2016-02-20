//
//  MATabBarController.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MATabBarController.h"
#import "UIImage+MAimageRender.h"
#import "MAHomeTableViewController.h"
#import "MAMessageTableViewController.h"
#import "MADiscoverTableViewController.h"
#import "MAProfileTableViewController.h"
#import "MANavigationController.h"

@interface MATabBarController ()

@end

@implementation MATabBarController


+(void)initialize{
    
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];

   
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控件
    
    MAHomeTableViewController *home = [[MAHomeTableViewController alloc]init];
    home.view.backgroundColor = [UIColor redColor];
    [self setAllChildViewControllerWith:home imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected" title:@"首页"];
    
    
    MAMessageTableViewController *message = [[MAMessageTableViewController alloc]init];
    [self setAllChildViewControllerWith:message imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected" title:@"消息"];
    
    MADiscoverTableViewController *discover = [[MADiscoverTableViewController alloc]init];
    discover.view.backgroundColor = [UIColor cyanColor];
    [self setAllChildViewControllerWith:discover imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected" title:@"发现"];
    
    MAProfileTableViewController *profile = [[MAProfileTableViewController alloc]init];    [self setAllChildViewControllerWith:profile imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected" title:@"我的"];
}

-(void)setAllChildViewControllerWith:(UITableViewController *)vc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title{
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    vc.tabBarItem.selectedImage = [UIImage imageRenderingModeAlwaysOriginalWithImageName:selectedImageName];
    vc.tabBarItem.title = title;
    
    MANavigationController *homeNav = [[MANavigationController alloc]initWithRootViewController:vc];
    
    
    
    [self addChildViewController:homeNav];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
