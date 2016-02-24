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

#import "AFNetworking.h"
#import "MAAccount.h"
#import "MAAccountTool.h"

#import "CZStatus.h"
#import "CZPhoto.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"


#import "MAHTTPTool.h"
#import "MAWebStatuses.h"
#import "MAResultStatues.h"


@interface MAHomeTableViewController ()<MACoverViewDelegate>

@property(nonatomic ,strong)MAPopTableViewController *one;
@property(nonatomic ,strong)MAPopView *pop;

@property(nonatomic ,strong)NSMutableArray *statuses;

@property(nonatomic ,weak)MATitleButton *titleBtn;

@end

@implementation MAHomeTableViewController

-(NSMutableArray *)statuses{
    if (_statuses == nil) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}
-(MAPopTableViewController *)one{
    if (_one == nil) {
        MAPopTableViewController *one = [[MAPopTableViewController alloc]init];
        _one = one;
    }
    
    return _one;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationItem];
    
    // 添加下拉刷新控件
    
    [self.tableView addHeaderWithTarget:self action:@selector(receiveWebData)];
     // 添加上拉刷新控件
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatus)];
    // 自动下拉刷新
    
    [self.tableView headerBeginRefreshing];
}

-(void)loadMoreStatus{
    
        NSString *maxIdStr = nil;
        if (self.statuses.count) { // 有微博数据，才需要下拉刷新
            long long maxId = [[[self.statuses lastObject] idstr] longLongValue] - 1;
            maxIdStr = [NSString stringWithFormat:@"%lld",maxId];
        }
    
    [MAWebStatuses moreStatusWithMaxId:maxIdStr success:^(NSArray *dataArr) {
        [self.tableView headerEndRefreshing];
        
        [self.statuses addObjectsFromArray:dataArr];
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

-(void)receiveWebData{
    NSString * SinceId = nil;
    if (self.statuses.count) {
        SinceId= [self.statuses[0] idstr];
    }

    [MAWebStatuses receiveWebStatusesWithSinceId:SinceId success:^(NSArray *statuse) {
        // 结束下拉刷新
        [self.tableView headerEndRefreshing];
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuse.count)];
        // 把最新的微博数插入到最前面
        [self.statuses insertObjects:statuse atIndexes:indexSet];
        
        // 刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        
    }];
  
}
-(void)setNavigationItem{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setNavigationBarButtonItemWith:@"navigationbar_friendsearch" hightlightImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(leftClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem setNavigationBarButtonItemWith:@"navigationbar_pop" hightlightImageName:@"navigationbar_pop_highlighted" target:self action:@selector(rightClick)];
    
    
    
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

-(void)leftClick{
    
}

-(void)rightClick{
    
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
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    CZStatus *status = self.statuses[indexPath.row];
    cell.textLabel.text = status.user.name;
    
    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    cell.detailTextLabel.text = status.text;
    
    return cell;
}

@end
