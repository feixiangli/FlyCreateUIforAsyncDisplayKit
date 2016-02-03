//
//  FlyCollectionCell.m
//  FlyASDK
//
//  Created by 李飞翔 on 16/2/3.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyCollectionCell.h"
#import "FlyCreate.h"
@implementation FlyCollectionCell
-(instancetype)init
{
    if (self=[super init]) {
        
        FlyButton * button = [[FlyButton alloc] initWithImageButtonFrame:CGRectMake(0, 0, 100, 100) backgroundColor:[UIColor blueColor] NormalImageName:nil HighlightedImageName:nil cornerRadius:10 Target:self action:@selector(click) addView:nil];
        [self addSubnode:button];
        self.backgroundColor=[UIColor grayColor];
        
    }
    return self;
}

-(void)click
{
    NSLog(@"123");
}



#pragma mark - 计算当前Cell的总高度和总宽度 (累加计算出得所有subNode的内容需要的宽度和高度)
- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
    
    return CGSizeMake(70, 200);
    
}


#pragma mark - 从新计算并设置 当前Cell内部所有subNode的frame
- (void)layout
{
    //    label.frame=CGRectMake(0, 0, 100, 30);
    NSLog(@"布局UI");
    
}

-(void)layoutDidFinish
{
    NSLog(@"布局完成");
}

@end
