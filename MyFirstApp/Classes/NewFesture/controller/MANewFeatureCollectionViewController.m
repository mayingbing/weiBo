//
//  MANewFeatureCollectionViewController.m
//  MyFirstApp
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MANewFeatureCollectionViewController.h"
#import "MANewFeatureCollectionViewCell.h"

@interface MANewFeatureCollectionViewController ()

@property(nonatomic ,weak)UIPageControl *control;

@end

@implementation MANewFeatureCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    // Register cell classes
    [self.collectionView registerClass:[MANewFeatureCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self setupPageControl];
    
}

-(void)setupPageControl{
    
    UIPageControl *control = [[UIPageControl alloc]init];
    _control = control;
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor yellowColor];
    control.currentPageIndicatorTintColor = [UIColor redColor];
    control.center = CGPointMake(self.view.width *0.5, self.view.height-50);
    
    [self.view addSubview:control];
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    _control.currentPage = page;
    
}



-(instancetype)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    
    layout.minimumLineSpacing = 0;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    return self;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MANewFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor yellowColor];
    
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row+1];
    
    UIImage *img = [UIImage imageNamed:imageName];
    
    [cell currentPage:indexPath count:4];
    
    [cell setImage:img];
    
   // cell.image = img;
    [cell layoutSubviews];
    return cell;
}

#pragma mark <UICollectionViewDelegate>



@end
