//
//  DemoView.m
//  demo
//
//  Created by mm on 1/28/15.
//  Copyright (c) 2015 Pirate. All rights reserved.
//

#import "DemoView.h"
#import "DemoLayer.h"

@implementation DemoView

+ (Class)layerClass
{
    return [DemoLayer class];
}

@end
