# FlyCreateUIforAsyncDisplayKit
这大概是现在比较全面的ASDKdemo
FlyCreateUIforAsyncDisplayKit

AsyncDisplayKit的使用

ASDK框架是Facebook的UI框架，能够提高UI的流畅性并缩短响应时间。

ASDK基本单元是node（节点）

node是UIView之上的抽象层，因此同时也是CALayer的抽象层。和只能被用在主线程的视图不同，

nodes是线程安全的：你能并行的实例化并设置整个node层级，并且在后台线程里运行。

它可以让你的界面流畅运行和相应，无论多么复杂的界面也可以保证60FPS

AsyncDisplayKit让你将图像解码、调整文字大小并渲染，以及其他高耗时的UI操作移出主线程

*Fly在研究ASDK后，对其进行了基础控件的封装，写了ASTableview和AScollectionview的demo。
*即使从没接触过ASDK，你也可以快速上手。


 安装：

*必须使用cocopods

ASDK github（https://github.com/facebook/AsyncDisplayKit）
pod 'AsyncDisplayKit’ 

然后拖拽 FlyCreateUIforASDK文件夹进你的工程
加入创建控件头文件 FlyCreate.h  和ASDK的头文件  <AsyncDisplayKit/AsyncDisplayKit.h>


//例如创建一个ASDisplayNode的node，这相当于UIKIt的一个View

FlyView * flyview = 
[[FlyView alloc] 
initWithFrame:CGRectMake(100, 480, 80, 80) 
Color:[UIColor purpleColor] 
cornerRadius:40
addView:self.view
];


例如 ： 这是一个ASImageNode的封装

*把线程安全的操作放入工作线程，对view的操作必须在main线程
//
//  FlyImageView.m
//  FlyASDK
//
//  Created by 李飞翔 on 16/1/31.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyImageView.h"

@implementation FlyImageView

-(instancetype)initWithFrame:(CGRect)frame backgroundColor:(UIColor*)color imageName:(NSString*)imageName cornerRadius:(int)cornerRadius Target:(id)Target action:(SEL)Action addView:(UIView*)View
{
    if (self=[super init])
    {
        
        dispatch_async(dispatch_queue_create("FlyImageView", DISPATCH_QUEUE_CONCURRENT), ^{
            
            self.backgroundColor=color;
            self.frame=frame;
            self.userInteractionEnabled=YES;
            self.image=[UIImage imageNamed:imageName];
            [self addTarget:Target action:Action forControlEvents:ASControlNodeEventTouchUpInside];
            
            dispatch_async(dispatch_get_main_queue(),^{
                
                self.layer.masksToBounds=YES;        //这两局layer操作也是异步 ASDK内部对node的layer做了异步处理
                self.layer.cornerRadius=cornerRadius;
                [View addSubview:self.view];
                
            });
        });
        
    }
    
    return self;
    
}
@end



//控件的添加 

 你可以采用[View addSubview:node.view]的方法把一个node添加到一个view上，
也可以 用[nodeTwo addSubnode:node]的方法 在一个node上添加子node，
需要注意的是采用 [View addSubview:node.view] 必须在main线程，
而 addSubnode: 不需要你进行线程判断，ASDK内部已经做了处理，



如果你想详细了解ASDK
http://asyncdisplaykit.org/guide/   （详细讲解了ASDK的原理和使用方法）
http://asyncdisplaykit.org/appledoc/  （API文档）


这大概是现在比较全面的ASDKdemo
欢迎加我的QQ与我讨论（925360157）

2016.2.4—— For Fly 李飞翔
