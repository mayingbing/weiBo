//
//  MAHomeTableViewController.m
//  MyFirstApp
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MAHomeTableViewController.h"
#import "UIBarButtonItem+MABarItem.h"
#import "MATitleButton.h"
#import "MACoverView.h"
#import "MAPopView.h"
#import "MAPopTableViewController.h"
#import "MAScendeViewController.h"


@interface MAHomeTableViewController ()<MACoverViewDelegate>

@property(nonatomic ,strong)MAPopTableViewController *one;
@property(nonatomic ,strong)MAPopView *pop;

@property(nonatomic ,weak)MATitleButton *titleBtn;

@end

@implementation MAHomeTableViewController


-(MAPopTableViewController *)one{
    if (_one == nil) {
        MAPopTableViewController *one = [[MAPopTableViewController alloc]init];
        _one = one;
    }
    
    return _one;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setNavigationBarButtonItemWith:@"navigationbar_friendsearch" hightlightImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(pop)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem setNavigationBarButtonItemWith:@"navigationbar_pop" hightlightImageName:@"navigationbar_pop_highlighted" target:self action:@selector(push)];
    
 
    
    //titleBtn
    
    MATitleButton *titleBtn = [[MATitleButton alloc]initWithFrame:self.navigationItem.titleView.frame];
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    
    self.titleBtn = titleBtn;
    
    
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    
    // 高亮的时候不需要调整图片
    titleBtn.adjustsImageWhenHighlighted = NO;
    
    self.navigationItem.titleView = titleBtn;
    
    [titleBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
}

//-(void)pop{
//    
//    
//    
//}

-(void)push{
    
    self.hidesBottomBarWhenPushed = YES;
    
    MAScendeViewController *scende = [[MAScendeViewController alloc]init];
    
    
    [self.navigationController pushViewController:scende animated:YES];
    
    
}

-(void)Actiondo:(id)sender {
    

}

-(void)click{
    
    _titleBtn.selected = !_titleBtn.selected;
    
    //弹出蒙版
    MACoverView *cover = [MACoverView show];
    cover.delegate = self;
    [cover setDimBackground:self.titleBtn.selected];
    
    
    // 弹出pop菜单
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - 200)*0.5 ;
    CGFloat popH = 200;
    CGFloat popY = 55;
    
    MAPopView *pop = [MAPopView showPop:CGRectMake(popX, popY, popW, popH)];
    _pop = pop;
    pop.contentView = self.one.view;
}

-(void)hidePopView:(MACoverView *)cover{
    
    [MAPopView popHide];
    _titleBtn.selected = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}



@end
