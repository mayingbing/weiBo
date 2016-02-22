//
//  MANavigationController.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MANavigationController.h"
#import "UIBarButtonItem+Item.h"

@interface MANavigationController ()<UINavigationControllerDelegate>
@property(nonatomic ,strong) id MAdelegate;
@end

@implementation MANavigationController


+(void)initialize{
    
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [item setTitleTextAttributes:att forState:UIControlStateNormal];
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    
    if (self.viewControllers.count != 0) {
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(backPre) forControlEvents:UIControlEventTouchUpInside ];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(backRoot) forControlEvents:UIControlEventTouchUpInside ];
        
    }
    [super pushViewController:viewController animated:animated];
    
}

-(void)backPre{
    
    [self popViewControllerAnimated:YES];
    
    
    
}

-(void)backRoot{
    
    [self popToRootViewControllerAnimated:YES];
    
}
    
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.MAdelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    self.MAdelegate = self.interactivePopGestureRecognizer.delegate;



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
