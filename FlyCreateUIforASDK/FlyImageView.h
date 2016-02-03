//
//  FlyImageView.h
//  FlyASDK
//
//  Created by 李飞翔 on 16/1/31.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface FlyImageView : ASImageNode
/**
 创建一个异步UI控件FlyImageview
 */
-(instancetype)initWithFrame:(CGRect)frame backgroundColor:(UIColor*)color imageName:(NSString*)imageName cornerRadius:(int)cornerRadius Target:(id)Target action:(SEL)Action addView:(UIView*)View;

@end
