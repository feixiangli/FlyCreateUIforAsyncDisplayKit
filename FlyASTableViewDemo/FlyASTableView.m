//
//  FlyASTableView.m
//  FlyASDK
//
//  Created by 李飞翔 on 16/2/1.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyASTableView.h"
#import "FlyCreate.h"
#import "FlyAScell.h"
@interface FlyASTableView ()<ASTableViewDelegate,ASTableViewDataSource>

@end

@implementation FlyASTableView
{
    ASTableView * _tableView ;
    NSMutableArray  * pathArray;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    pathArray=[[NSMutableArray alloc] init];
    [self createTableView];

}

-(void)createTableView
{
    
    
    _tableView =[[ASTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.asyncDataSource=self;
    _tableView.asyncDelegate=self;
    
    
    UIBarButtonItem * UIBarButtonItem1=[[UIBarButtonItem alloc] initWithTitle:@"chaRu" style:UIBarButtonItemStylePlain target:self action:@selector(chaRuRow)];
    
    UIBarButtonItem * UIBarButtonItem2=[[UIBarButtonItem alloc] initWithTitle:@"reload" style:UIBarButtonItemStylePlain target:self action:@selector(reload)];
    
    self.navigationItem.rightBarButtonItems=@[UIBarButtonItem1,UIBarButtonItem2];

    
    UIBarButtonItem * UIBarButtonItem3=[[UIBarButtonItem alloc] initWithTitle:@"delete" style:UIBarButtonItemStylePlain target:self action:@selector(delete)];

    UIBarButtonItem * UIBarButtonItem4=[[UIBarButtonItem alloc] initWithTitle:@"move" style:UIBarButtonItemStylePlain target:self action:@selector(move)];

    self.navigationItem.leftBarButtonItems=@[UIBarButtonItem3,UIBarButtonItem4];

    
    [self.view addSubview:_tableView];
    
    
}

-(void)chaRuRow
{
    [_tableView beginUpdates];
    
    NSLog(@"%@",pathArray[0]);
    [_tableView insertRowsAtIndexPaths:@[pathArray[0]] withRowAnimation:UITableViewRowAnimationLeft];
    
//    nodeForRowAtIndexPath
    FlyAScell * cell=(FlyAScell*)[_tableView nodeForRowAtIndexPath:pathArray[0]];
    //根据indexpaths拿到对应cell；
    
    
//    indexPathForNode
   NSIndexPath*paths2= [_tableView indexPathForNode:cell];
    //根据cell拿到对应indexpath
    
    //    visibleNodes  这个数组 包含了当前屏幕上的所有cell
    NSLog(@"%lu",[_tableView visibleNodes].count) ;
    
    
//调用这个方法会删除所有cell上的所有控件
//    [_tableView clearContents];
    

    
    [_tableView endUpdates];
    
    
   
}



-(void)move
{
    [_tableView beginUpdates];
    
    [_tableView moveSection:0 toSection:1];
    
    [_tableView endUpdates];
}

-(void)reload
{
    
//    NSIndexSet * set = [[NSIndexSet alloc] initw];
    [_tableView beginUpdates];
    
    
    NSMutableIndexSet * set = [[NSMutableIndexSet alloc] init];
    
    [set addIndex:0];
    
    [set addIndex:1];

    [_tableView reloadSections:set withRowAnimation:UITableViewRowAnimationRight];

    [_tableView endUpdates];
    
}

-(void)delete
{
    [_tableView beginUpdates];

    NSIndexSet * set = [[NSIndexSet alloc] initWithIndex:0];
        
    [_tableView deleteSections:set withRowAnimation:UITableViewRowAnimationBottom];
        
  
    [_tableView endUpdates];
}
-(void)charuSection
{
    [_tableView beginUpdates];
    
//    UITableViewRowAnimationFade,
//    UITableViewRowAnimationRight,           // slide in from right (or out to right)
//    UITableViewRowAnimationLeft,
//    UITableViewRowAnimationTop,
//    UITableViewRowAnimationBottom,
//    UITableViewRowAnimationNone,            // available in iOS 3.0
//    UITableViewRowAnimationMiddle,          // available in iOS 3.2.  attempts to keep cell centered in the space it will/did occupy
//    UITableViewRowAnimationAutomatic = 100
    
    NSIndexSet * set = [[NSIndexSet alloc] initWithIndex:0];
    
    [_tableView insertSections:set withRowAnimation:UITableViewRowAnimationTop];
    
    [_tableView endUpdates];
    
}


#pragma mark - tableViewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //组数
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //每组行数
    return 3;
}


-(ASCellNode *)tableView:(ASTableView *)tableView nodeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FlyAScell * cell = [[FlyAScell alloc] init];
    NSLog(@"indexPath %@",indexPath);
    [pathArray addObject:indexPath];
    return cell;
}

-(void)tableView:(ASTableView *)tableView didEndDisplayingNode:(ASCellNode *)node forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell被删除");
}

-(void)tableView:(ASTableView *)tableView willDisplayNodeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell将显示");
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //分组头标题
    return [NSString stringWithFormat:@"%long",section];
}
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //分组头脚标题
    return [NSString stringWithFormat:@"%long",section];
}


-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //分组 脚视图
    return nil;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //分组 头视图
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    
    //分组 脚 高度
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    //分组 头 高度
    return 30;
}
















@end
