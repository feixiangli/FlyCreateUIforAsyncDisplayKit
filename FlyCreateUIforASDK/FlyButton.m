//
//  FlyButton.m
//  FlyASDK
//
//  Created by 李飞翔 on 16/1/31.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyButton.h"

@implementation FlyButton


-(instancetype)initWithTextButtonFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor TitleColor:(UIColor*)TitleColor Title:(NSString*)Title font:(int)font cornerRadius:(int)cornerRadius Target:(id)Target action:(SEL)Action addView:(UIView*)View
{
    if (self=[super init])
    {
        
        dispatch_async(dispatch_queue_create("FlyTextButton", DISPATCH_QUEUE_CONCURRENT), ^{
            self.frame=frame;
            self.backgroundColor=backgroundColor;
            self.userInteractionEnabled=YES;
            [self addTarget:Target action:Action forControlEvents:ASControlNodeEventTouchUpInside];
            NSDictionary *attrs = @{NSFontAttributeName: [UIFont systemFontOfSize:font],NSForegroundColorAttributeName: TitleColor,};
            NSAttributedString *string = [[NSAttributedString alloc] initWithString:Title attributes:attrs];
            [self setAttributedTitle:string forState:ASControlStateNormal];
            CGSize size =  [self sizeWithText:Title font:font maxSize:CGSizeMake(self.frame.size.width, MAXFLOAT)];
            CGSize size2 =  [self sizeWithText:Title font:font maxSize:CGSizeMake(MAXFLOAT, size.height)];
            self.titleNode.frame=CGRectMake((self.frame.size.width - size2.width)/2,(self.frame.size.height - size.height)/2 , self.frame.size.width, self.frame.size.height);
            
            dispatch_async(dispatch_get_main_queue(),^{
                
                self.layer.masksToBounds=YES;
                self.layer.cornerRadius=cornerRadius;
                [View addSubview:self.view];
                
            });
            
        });
        
    }
    
    return self;
}





-(instancetype)initWithImageButtonFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor NormalImageName:(NSString*)NormalImageName HighlightedImageName:(NSString*)HighlightedImageName  cornerRadius:(int)cornerRadius Target:(id)Target action:(SEL)Action addView:(UIView*)View
{
    if (self=[super init])
    {
        
        dispatch_async(dispatch_queue_create("FlyTextButton", DISPATCH_QUEUE_CONCURRENT), ^{
            
            self.frame=frame;
            self.backgroundColor=backgroundColor;
            self.userInteractionEnabled=YES;
            [self addTarget:Target action:Action forControlEvents:ASControlNodeEventTouchUpInside];
            [self setImage:[UIImage imageNamed:NormalImageName] forState:ASControlStateNormal];
            [self setImage:[UIImage imageNamed:HighlightedImageName] forState:ASControlStateHighlighted];
            self.imageNode.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            
            dispatch_async(dispatch_get_main_queue(),^{
                
                self.layer.masksToBounds=YES;
                self.layer.cornerRadius=cornerRadius;
                [View addSubview:self.view];
                
            });
            
        });
        
    }
    
    return self;
}



-(CGSize)sizeWithText:(NSString*)text font:(int)font maxSize:(CGSize)maxSize
{
    UIFont * font2 = [UIFont systemFontOfSize:font];
    NSDictionary*attrs=@{NSFontAttributeName:font2};
    //传入最大size，传入固定参数NSStringDrawingUsesLineFragmentOrigin，用字典 传入font，Context一般写nil
    return  [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}







@end
