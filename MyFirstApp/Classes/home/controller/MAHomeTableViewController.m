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

@interface MAHomeTableViewController ()

@property(nonatomic ,strong)MAPopTableViewController *one;

@property(nonatomic ,weak)MATitleButton *titleBtn;

@end

@implementation MAHomeTableViewController

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

-(void)pop{
    
    
    
}

-(void)push{
    
    
    
}

-(void)click{
    
    _titleBtn.selected = !_titleBtn.selected;
    
    //弹出蒙版
    MACoverView *cover = [MACoverView show];
    
    // 弹出pop菜单
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - 200)*0.5 ;
    CGFloat popH = 200;
    CGFloat popY = 55;
    
    MAPopView *pop = [MAPopView showPop:CGRectMake(popX, popY, popW, popH)];
   
    pop.contentView = self.one.view;
    
    

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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
