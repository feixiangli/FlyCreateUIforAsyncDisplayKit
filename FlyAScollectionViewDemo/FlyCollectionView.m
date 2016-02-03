//
//  FlyCollectionView.m
//  FlyASDK
//
//  Created by 李飞翔 on 16/2/1.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyCollectionView.h"
#import "FlyCreate.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "FlyCollectionCell.h"

#import "FlyAScell.h"

@implementation FlyCollectionView




-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UICollectionViewFlowLayout*flowLayout=[[UICollectionViewFlowLayout alloc]init];
    
//    flowLayout.headerReferenceSize=CGSizeMake(320, 45);//头视图size
    
//    flowLayout.footerReferenceSize=CGSizeMake(320, 59);//脚视图size

//    flowLayout.minimumInteritemSpacing=10;//item之间的最小间隔
    
    //滚动方向
//    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;//水平滚动
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;//垂直滚动



    flowLayout.sectionInset=UIEdgeInsetsMake(10, 17.5, 18, 7.5);
    // iteme之间的间距 top,  left,  bottom,  right
//    
//    
    ASCollectionView * ascview = [[ASCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    ascview.asyncDataSource=self;
    ascview.asyncDelegate=self;
    
    [self.view addSubview:ascview];
    
    //
    
    
    //操纵一组item
//    - (void)insertSections:(NSIndexSet *)sections;
    
    
    //- (void)deleteSections:(NSIndexSet *)sections;

//    - (void)reloadSections:(NSIndexSet *)sections;
    
    
    //- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection;

    
    
    //操纵单个item
//    - (void)insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;

    
    
//- (void)deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
    
//    - (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;

//    - (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

    
    
    //用indexPath拿到cellnode
//    - (ASCellNode *)nodeForItemAtIndexPath:(NSIndexPath *)indexPath;

    
    
//    - (NSIndexPath *)indexPathForNode:(ASCellNode *)cellNode;

    //一个NSArray，拿到当前屏幕的所有cellnode
//    visibleNodes
    
    
    
    //用indexPath拿到cellnode的size
//    - (CGSize)calculatedSizeForNodeAtIndexPath:(NSIndexPath *)indexPath;

    
    
//    **
//    * Determines collection view's current scroll direction. Supports 2-axis collection views.
//    *
//    * @returns a bitmask of ASScrollDirection values.
//    */
//    - (ASScrollDirection)scrollDirection;
//    
//    /**
//     * Determines collection view's scrollable directions.
//     *
//     * @returns a bitmask of ASScrollDirection values.
//     */
//    - (ASScrollDirection)scrollableDirections;

    
    
    //清除所有数据
//    - (void)clearContents;

}
#pragma mark - collectionDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //有几行
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //每行有几个
    return 3;
    
}

- (ASCellNode *)collectionView:(ASCollectionView *)collectionView nodeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FlyCollectionCell * cell=[[FlyCollectionCell alloc] init];
    
    return cell;
}


@end
