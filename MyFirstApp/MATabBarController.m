//
//  MATabBarController.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MATabBarController.h"

@interface MATabBarController ()

@end

@implementation MATabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控件
    
    UITableViewController *home = [[UITableViewController alloc]init];
    home.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:home];
    
    UITableViewController *message = [[UITableViewController alloc]init];
    message.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:message];
    
    UITableViewController *discover = [[UITableViewController alloc]init];
    discover.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:discover];
    
    UITableViewController *profile = [[UITableViewController alloc]init];
    profile.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:profile];
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
