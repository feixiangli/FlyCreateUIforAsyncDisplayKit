//
//  FlyAScell.m
//  FlyASDK
//
//  Created by 李飞翔 on 16/2/1.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyAScell.h"
#import "Flycell2.h"
#import "FlyLabel.h"
@implementation FlyAScell
{
    FlyLabel * label ;
}
-(instancetype)init
{
    if (self=[super init]) {
        
        label =[[FlyLabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50) backgroundColor:[UIColor greenColor] TitleColor:[UIColor colorWithRed: arc4random()%100*0.01 green:arc4random()%100*0.01 blue:arc4random()%100*0.01 alpha:1] Title:@"123456" font:14 cornerRadius:2 Target:nil action:nil addView:nil];
        [self addSubnode:label];
        
    }
    
    self.backgroundColor=[UIColor colorWithRed: arc4random()%100*0.01 green:arc4random()%100*0.01 blue:arc4random()%100*0.01 alpha:1] ;


    
    return self;
}


#pragma mark - 计算当前Cell的总高度和总宽度 (累加计算出得所有subNode的内容需要的宽度和高度)
- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{

    return CGSizeMake(100, 100);
    
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

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"滑动结束");
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"滑动");

}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"点击结束");

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击");

    
}



























@end
