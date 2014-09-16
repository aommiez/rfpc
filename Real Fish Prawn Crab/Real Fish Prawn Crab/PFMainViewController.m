//
//  PFMainViewController.m
//  Real Fish Prawn Crab
//
//  Created by issrapong wongyai on 9/15/2557 BE.
//  Copyright (c) 2557 platwo fusion. All rights reserved.
//

#import "PFMainViewController.h"

@interface PFMainViewController ()

@end

@implementation PFMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mainview1 addSubview:self.player1];
    [self.mainview2 addSubview:self.player2];
    [self.mainview3 addSubview:self.player3];
    [self.mainview4 addSubview:self.player4];
    
    CALayer *border1 = [self.border1 layer];
    [border1 setBorderColor:[UIColor yellowColor].CGColor];
    [border1 setBorderWidth:2.0f];
    [border1 setMasksToBounds:YES];
    [border1 setCornerRadius:3.0f];
    
    CALayer *border2 = [self.border2 layer];
    [border2 setBorderColor:[UIColor yellowColor].CGColor];
    [border2 setBorderWidth:2.0f];
    [border2 setMasksToBounds:YES];
    [border2 setCornerRadius:3.0f];
    
    CALayer *border3 = [self.border3 layer];
    [border3 setBorderColor:[UIColor yellowColor].CGColor];
    [border3 setBorderWidth:2.0f];
    [border3 setMasksToBounds:YES];
    [border3 setCornerRadius:3.0f];
    
    CALayer *border4 = [self.border4 layer];
    [border4 setBorderColor:[UIColor yellowColor].CGColor];
    [border4 setBorderWidth:2.0f];
    [border4 setMasksToBounds:YES];
    [border4 setCornerRadius:3.0f];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (UIEventSubtypeMotionShake) {
        NSLog(@"I'm shaking!");
    }
}

@end
