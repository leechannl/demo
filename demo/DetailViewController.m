//
//  DetailViewController.m
//  demo
//
//  Created by mm on 3/26/15.
//  Copyright (c) 2015 Pirate. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, strong) UIImage *menuButton;

@end

@implementation DetailViewController

- (UIImage *)menuButton {


    if (_menuButton != nil) {
        return _menuButton;
    }

    // Setup some sizing variables
    CGFloat spacing     = 4.0f;  // Spacing between each menu button strip
    CGFloat stripHeight = 1.5f;  // Height of each menu button strip, total of 3
    CGFloat width       = 24.0f; // Total button width, also width of each strip
    CGFloat height      = spacing * 2 + stripHeight * 3;

    // Setup the context rect
    CGRect rect = CGRectMake(0.0f, 0.0f, width, height);

    // Passing 0.0f will ensure that the context uses the screen scale (3.0 for iPhone 6 Plus)
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);

    // Fill the button with black
    [[UIColor blackColor] set];

    // Some simple math to render the menu button lines
    for (int i=0;i<3;i++) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0.0f, i * (stripHeight + spacing), rect.size.width, stripHeight)];
        [path fill];
    }

    // Assign complete image while adjusting it to use UIImageRenderingModeAlwaysTemplate
    // UIImageRenderingModeAlwaysTemplate will ensure the image is tinted with the current tint color

    _menuButton = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsEndImageContext();

    return _menuButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[self menuButton]
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(menuPressed)];
}

- (void)menuPressed
{

}

- (void)viewDidDisappear:(BOOL)animated
{
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

@end
