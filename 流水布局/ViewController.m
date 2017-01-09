//
//  ViewController.m
//  流水布局
//
//  Created by liuxingchen on 17/1/9.
//  Copyright © 2017年 liuxingchen. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "FlowLayout.h"
@interface ViewController ()<UICollectionViewDataSource>

@end
static NSString * const ID = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //函数式编程思想(高聚合):把很多功能放在一个函数块(block块)去处理 多见于swift
    FlowLayout *layout = ({
        FlowLayout *layout = [[FlowLayout alloc]init];
        //设置水平滚动
        layout.scrollDirection  =  UICollectionViewScrollDirectionHorizontal;
        //设置cell的尺寸
        layout.itemSize = CGSizeMake(160, 160);
        CGFloat margin = ([UIScreen mainScreen].bounds.size.width - 160) *0.5;
        //设置内边距
        layout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
        //设置最小行间距
        layout.minimumLineSpacing = 50;
        layout;
    });
    UICollectionView *collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor blueColor];
        collectionView.center = self.view.center;
        collectionView.bounds =CGRectMake(0, 0, self.view.bounds.size.width, 200);
        [self.view addSubview:collectionView];
        collectionView;
        
    });
    
    //关闭水平滚动条
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.dataSource = self;
    //注册nib
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
}
//有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
//cell样式
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"%ld",indexPath.item + 1];
    cell.image = [UIImage imageNamed:imageName];
    return cell;
}
@end
