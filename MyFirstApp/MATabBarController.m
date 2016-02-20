//
//  MATabBarController.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MATabBarController.h"
#import "UIImage+MAimageRender.h"

@interface MATabBarController ()

@end

@implementation MATabBarController


+(void)initialize{
    
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
//    NSMutableDictionary *attFont = [NSMutableDictionary dictionary];
//    attFont[NSFontAttributeName] = [UIFont systemFontOfSize:20];
//    [item setTitleTextAttributes:attFont forState:UIControlStateSelected];
   
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控件
    
    UITableViewController *home = [[UITableViewController alloc]init];
    home.view.backgroundColor = [UIColor redColor];
    
    [self setAllChildViewControllerWith:home imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected" title:@"首页"];
    
    
    UITableViewController *message = [[UITableViewController alloc]init];
    message.view.backgroundColor = [UIColor yellowColor];
    [self setAllChildViewControllerWith:message imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected" title:@"消息"];
    
    UITableViewController *discover = [[UITableViewController alloc]init];
    discover.view.backgroundColor = [UIColor greenColor];
    [self setAllChildViewControllerWith:discover imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected" title:@"发现"];
    
    UITableViewController *profile = [[UITableViewController alloc]init];
    profile.view.backgroundColor = [UIColor blueColor];
    [self setAllChildViewControllerWith:profile imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected" title:@"我的"];
}

-(void)setAllChildViewControllerWith:(UITableViewController *)vc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title{
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    vc.tabBarItem.selectedImage = [UIImage imageRenderingModeAlwaysOriginalWithImageName:selectedImageName];
    vc.tabBarItem.title = title;
    
    
    [self addChildViewController:vc];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
