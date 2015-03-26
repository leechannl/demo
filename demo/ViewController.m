//
//  ViewController.m
//  demo
//
//  Created by mm on 1/24/15.
//  Copyright (c) 2015 Pirate. All rights reserved.
//

#import "ViewController.h"
#import "DemoView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *grayView;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"Animation demo";

    DemoView *demoView = [DemoView new];
    demoView.frame = CGRectMake(16, 10, 10, 10);
    demoView.backgroundColor = [UIColor redColor];

    NSLog(@"outside animation block: %@",
          [demoView actionForLayer:self.view.layer forKey:@"position"]);


    [UIView animateWithDuration:1.0 animations:^{
        NSLog(@"inside animation block: %@",
              [demoView actionForLayer:self.view.layer forKey:@"position"]);
        demoView.layer.position = CGPointMake(100, 100);
    }];

    [self.view addSubview:demoView];

    self.view1 = [UIView new];
    self.view1.frame = CGRectMake(100, 300, 100, 100);
    self.view1.backgroundColor = [UIColor blueColor];
    self.view1.hidden = NO;

    self.view2 = [UIView new];
    self.view2.frame = CGRectMake(100, 300, 100, 100);
    self.view2.backgroundColor = [UIColor cyanColor];
    self.view2.hidden = YES;

    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    if ([self.navigationItem prompt]) {
        [self.navigationItem setPrompt:nil];
        self.navigationItem.title = @"Animation demo";
    } else {
        [self.navigationItem setPrompt:@"Newwork unavailable"];
        self.navigationItem.title = @"Animation demo(Newwork unavailable)";
    }
    if (self.grayView.layer.opacity == 0) {
        self.grayView.layer.opacity = 1;
    } else {
        self.grayView.layer.opacity = 0;
    }
    if (self.view1.hidden) {
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0;
        transition.endProgress = 1.0;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        transition.duration = 1.0;
        
        [self.view1.layer addAnimation:transition forKey:@"transition"];
        [self.view2.layer addAnimation:transition forKey:@"transition"];

        self.view1.hidden = NO;
        self.view2.hidden = YES;
    } else {
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0;
        transition.endProgress = 1.0;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromTop;
        transition.duration = 1.0;
        
        [self.view1.layer addAnimation:transition forKey:@"transition"];
        [self.view2.layer addAnimation:transition forKey:@"transition"];

        self.view1.hidden = YES;
        self.view2.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
