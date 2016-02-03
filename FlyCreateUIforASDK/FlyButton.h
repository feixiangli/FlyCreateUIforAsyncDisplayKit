//
//  FlyButton.h
//  FlyASDK
//
//  Created by 李飞翔 on 16/1/31.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface FlyButton : ASButtonNode
/**
 创建一个异步UI控件 文字按钮
 */
-(instancetype)initWithTextButtonFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor TitleColor:(UIColor*)TitleColor Title:(NSString*)Title font:(int)font cornerRadius:(int)cornerRadius Target:(id)Target action:(SEL)Action addView:(UIView*)View;

/**
 创建一个异步UI控件 图片按钮
 */
-(instancetype)initWithImageButtonFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor NormalImageName:(NSString*)NormalImageName HighlightedImageName:(NSString*)HighlightedImageName  cornerRadius:(int)cornerRadius Target:(id)Target action:(SEL)Action addView:(UIView*)View;




@end
