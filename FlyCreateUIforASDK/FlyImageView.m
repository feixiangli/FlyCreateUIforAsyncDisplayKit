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
                
                self.layer.masksToBounds=YES;//这里也是异步 ASDK内部做了异步处理
                self.layer.cornerRadius=cornerRadius;//这里也是异步 ASDK内部做了异步处理
                [View addSubview:self.view];
                
            });
        });
        
    }
    
    return self;
    
}
@end
