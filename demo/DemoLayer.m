//
//  DemoLayer.m
//  demo
//
//  Created by mm on 1/28/15.
//  Copyright (c) 2015 Pirate. All rights reserved.
//

#import "DemoLayer.h"

@implementation DemoLayer

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key
{
    NSLog(@"adding animation: %@", [anim debugDescription]);
    [super addAnimation:anim forKey:key];
}

@end
