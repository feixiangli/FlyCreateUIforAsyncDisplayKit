//
//  FlyLabel.m
//  FlyASDK
//
//  Created by 李飞翔 on 16/1/31.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyLabel.h"

@implementation FlyLabel

-(instancetype)initWithFrame:(CGRect)frame backgroundColor:(UIColor*)backgroundColor TitleColor:(UIColor*)TitleColor Title:(NSString*)Title font:(int)font cornerRadius:(int)cornerRadius Target:(id)Target action:(SEL)Action addView:(UIView*)View
{

    if (self=[super init])
    {

        dispatch_async(dispatch_queue_create("FlyLabel", DISPATCH_QUEUE_CONCURRENT), ^{
            self.frame=frame;
            self.backgroundColor=backgroundColor;
            self.userInteractionEnabled=YES;
            if (Action!=nil&&Target!=nil) {
                [self addTarget:Target action:Action forControlEvents:ASControlNodeEventTouchUpInside];
            }
            NSDictionary *attrs = @{NSFontAttributeName: [UIFont systemFontOfSize:font],NSForegroundColorAttributeName: TitleColor,};
            NSAttributedString *string = [[NSAttributedString alloc] initWithString:Title attributes:attrs];
            self.attributedString=string;

            CGSize size = [self measure:CGSizeMake(frame.size.width, frame.size.height)];
            CGPoint origin = CGPointMake(roundf(frame.origin.x),roundf(frame.origin.y));
            self.frame = (CGRect){ origin, size };
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





