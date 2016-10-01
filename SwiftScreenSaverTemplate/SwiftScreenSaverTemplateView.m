//
//  SwiftScreenSaverTemplateView.m
//  SwiftScreenSaverTemplate
//
//  Created by Robert Burns on 10/1/16.
//  Copyright © 2016 Robert Burns. All rights reserved.
//

#import "SwiftScreenSaverTemplateView.h"

@implementation SwiftScreenSaverTemplateView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
