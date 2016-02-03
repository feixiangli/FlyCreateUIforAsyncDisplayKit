//
//  FlyView.h
//  FlyASDK
//
//  Created by 李飞翔 on 16/1/30.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface FlyView : ASDisplayNode


/**
 在一个fly控件上添加异步控件 ， 要进入dispatch_get_main_queue操作，否则崩溃
 */
-(instancetype)initWithFrame:(CGRect)frame Color:(UIColor*)color cornerRadius:(int)cornerRadius addView:(UIView*)View;


//像这样 one by one

//FlyView * flyview = [[FlyView alloc] initWithFrame:CGRectMake(100, 480, 80, 80) Color:[UIColor purpleColor] cornerRadius:40 addView:self.view];
//
//dispatch_async(dispatch_get_main_queue(), ^{
//    FlyView * flyview2 = [[FlyView alloc] initWithFrame:CGRectMake(0, 0, 70, 70) Color:[UIColor whiteColor] cornerRadius:35 addView:flyview.view];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        FlyView * flyview3 = [[FlyView alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Color:[UIColor blackColor] cornerRadius:30 addView:flyview2.view];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            FlyView * flyview4 = [[FlyView alloc] initWithFrame:CGRectMake(0, 0, 50, 50) Color:[UIColor blueColor] cornerRadius:25 addView:flyview3.view];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                FlyView * flyview5 = [[FlyView alloc] initWithFrame:CGRectMake(0, 0, 40, 40) Color:[UIColor grayColor] cornerRadius:20 addView:flyview4.view];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    FlyView * flyview6 = [[FlyView alloc] initWithFrame:CGRectMake(0, 0, 30, 30) Color:[UIColor greenColor] cornerRadius:15 addView:flyview5.view];
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        FlyView * flyview7 = [[FlyView alloc] initWithFrame:CGRectMake(0, 0, 20, 20) Color:[UIColor purpleColor] cornerRadius:10 addView:flyview6.view];
//                    });
//                });
//            });
//        });
//    });
//});

@end
