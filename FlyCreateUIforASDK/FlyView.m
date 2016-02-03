//
//  FlyView.m
//  FlyASDK
//
//  Created by 李飞翔 on 16/1/30.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyView.h"

@implementation FlyView


-(instancetype)initWithFrame:(CGRect)frame Color:(UIColor*)color cornerRadius:(int)cornerRadius addView:(UIView*)View
{
    if (self=[super init])
    {

            dispatch_async(dispatch_queue_create("FlyView", DISPATCH_QUEUE_CONCURRENT), ^{
                
                self.backgroundColor=color;
                self.frame=frame;
                self.userInteractionEnabled=YES;
                dispatch_async(dispatch_get_main_queue(),^{
                    self.layer.masksToBounds=YES;
                    self.layer.cornerRadius=cornerRadius;
                    [View addSubview:self.view];
                    
                });
            });

    }
    
    return self;
    
}

@end
