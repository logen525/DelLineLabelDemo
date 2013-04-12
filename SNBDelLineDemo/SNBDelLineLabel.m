//
//  SNBDelLineLabel.m
//  SNBDelLineDemo
//
//  Created by Fang Yang on 4/12/13.
//  Copyright (c) 2013 Snowball. All rights reserved.
//

#import "SNBDelLineLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation SNBDelLineLabel
{
    CALayer *animationLayer;
    CAShapeLayer *pathLayer;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupLayers
{
    if (animationLayer != nil) {
        [animationLayer removeFromSuperlayer];
    }
    animationLayer = [CALayer layer];
    animationLayer.frame = self.bounds;
    [self.layer addSublayer:animationLayer];
    
    CGPoint midLeft = CGPointMake(CGRectGetMinX(animationLayer.bounds), CGRectGetMidY(animationLayer.bounds));
    CGPoint midRight = CGPointMake(CGRectGetMaxX(animationLayer.bounds), CGRectGetMidY(animationLayer.bounds));
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:midLeft];
    [path addLineToPoint:midRight];
    
    pathLayer = [CAShapeLayer layer];
    pathLayer.frame = animationLayer.bounds;
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [UIColor blackColor].CGColor;
    pathLayer.lineWidth = 2;
    [animationLayer addSublayer:pathLayer];
}

- (void)startAnimation
{
    [animationLayer removeAllAnimations];
    [pathLayer removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 3.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
}

- (void)addDeleteLine
{
//    if (animationLayer.superlayer != nil) {
        [self setupLayers];
//    }
    
    [self startAnimation];
}
@end
