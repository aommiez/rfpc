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
    
    self.coinLock.image = [UIImage imageNamed:@"coin_off.png"];
    
    CALayer *border1 = [self.border1 layer];
    [border1 setBorderColor:RGB(190, 29, 45).CGColor];
    [border1 setBorderWidth:2.0f];
    [border1 setMasksToBounds:YES];
    [border1 setCornerRadius:5.0f];
    
    CALayer *border2 = [self.border2 layer];
    [border2 setBorderColor:RGB(28, 116, 188).CGColor];
    [border2 setBorderWidth:2.0f];
    [border2 setMasksToBounds:YES];
    [border2 setCornerRadius:5.0f];
    
    CALayer *border3 = [self.border3 layer];
    [border3 setBorderColor:RGB(58, 181, 74).CGColor];
    [border3 setBorderWidth:2.0f];
    [border3 setMasksToBounds:YES];
    [border3 setCornerRadius:5.0f];
    
    CALayer *border4 = [self.border4 layer];
    [border4 setBorderColor:RGB(248, 237, 50).CGColor];
    [border4 setBorderWidth:2.0f];
    [border4 setMasksToBounds:YES];
    [border4 setCornerRadius:5.0f];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

//shake
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (UIEventSubtypeMotionShake) {
        
        NSLog(@"%@",self.checkshake);
        
        if ([self.checkshake isEqualToString:@"1"]) {
            if (self.checkLog.length == 0) {
                int number1 = (arc4random()%6)+1; //Generates Number from 1 to 100.
                NSString *string1 = [NSString stringWithFormat:@"%i", number1];
                self.dice1 = string1;
                
                int number2 = (arc4random()%6)+1; //Generates Number from 1 to 100.
                NSString *string2 = [NSString stringWithFormat:@"%i", number2];
                self.dice2 = string2;
                
                int number3 = (arc4random()%6)+1; //Generates Number from 1 to 100.
                NSString *string3 = [NSString stringWithFormat:@"%i", number3];
                self.dice3 = string3;
                
                self.checkshake = @"shake";
                
            } else {
                
                if ([self.checkLog isEqualToString:@"1"]) {
                    self.dice1 = @"2"; self.dice2 = @"3"; self.dice3 = @"4";
                    self.checkLog = @"2";
                } else if ([self.checkLog isEqualToString:@"2"]) {
                    self.dice1 = @"3"; self.dice2 = @"6"; self.dice3 = @"1";
                    self.checkLog = @"3";
                } else if ([self.checkLog isEqualToString:@"3"]) {
                    self.dice1 = @"1"; self.dice2 = @"1"; self.dice3 = @"6";
                    self.checkLog = @"4";
                } else if ([self.checkLog isEqualToString:@"4"]) {
                    self.dice1 = @"6"; self.dice2 = @"5"; self.dice3 = @"4";
                    self.checkLog = @"5";
                } else if ([self.checkLog isEqualToString:@"5"]) {
                    self.dice1 = @"4"; self.dice2 = @"1"; self.dice3 = @"5";
                    self.checkLog = @"6";
                } else if ([self.checkLog isEqualToString:@"6"]) {
                    self.dice1 = @"5"; self.dice2 = @"5"; self.dice3 = @"6";
                    self.checkLog = @"7";
                } else if ([self.checkLog isEqualToString:@"7"]) {
                    self.dice1 = @"2"; self.dice2 = @"1"; self.dice3 = @"5";
                    self.checkLog = @"8";
                } else if ([self.checkLog isEqualToString:@"8"]) {
                    self.dice1 = @"6"; self.dice2 = @"6"; self.dice3 = @"5";
                    self.checkLog = @"9";
                } else if ([self.checkLog isEqualToString:@"9"]) {
                    self.dice1 = @"2"; self.dice2 = @"2"; self.dice3 = @"3";
                    self.checkLog = @"10";
                } else if ([self.checkLog isEqualToString:@"10"]) {
                    self.dice1 = @"1"; self.dice2 = @"2"; self.dice3 = @"6";
                    self.checkLog = @"11";
                } else if ([self.checkLog isEqualToString:@"11"]) {
                    self.dice1 = @"4"; self.dice2 = @"5"; self.dice3 = @"1";
                    self.checkLog = @"12";
                } else if ([self.checkLog isEqualToString:@"12"]) {
                    self.dice1 = @"1"; self.dice2 = @"1"; self.dice3 = @"2";
                    self.checkLog = @"13";
                } else if ([self.checkLog isEqualToString:@"13"]) {
                    self.dice1 = @"6"; self.dice2 = @"3"; self.dice3 = @"5";
                    self.checkLog = @"14";
                } else if ([self.checkLog isEqualToString:@"14"]) {
                    self.dice1 = @"3"; self.dice2 = @"3"; self.dice3 = @"1";
                    self.checkLog = @"15";
                } else if ([self.checkLog isEqualToString:@"15"]) {
                    self.dice1 = @"6"; self.dice2 = @"6"; self.dice3 = @"2";
                    self.checkLog = @"16";
                } else if ([self.checkLog isEqualToString:@"16"]) {
                    self.dice1 = @"5"; self.dice2 = @"4"; self.dice3 = @"6";
                    self.checkLog = @"17";
                } else if ([self.checkLog isEqualToString:@"17"]) {
                    self.dice1 = @"3"; self.dice2 = @"6"; self.dice3 = @"5";
                    self.checkLog = @"18";
                } else if ([self.checkLog isEqualToString:@"18"]) {
                    self.dice1 = @"2"; self.dice2 = @"2"; self.dice3 = @"3";
                    self.checkLog = @"19";
                } else if ([self.checkLog isEqualToString:@"19"]) {
                    self.dice1 = @"4"; self.dice2 = @"6"; self.dice3 = @"3";
                    self.checkLog = @"20";
                } else if ([self.checkLog isEqualToString:@"20"]) {
                    self.dice1 = @"3"; self.dice2 = @"3"; self.dice3 = @"1";
                    self.checkLog = @"1";
                }
                
                self.checkshake = @"shake";
                
            }
            
            NSLog(@"%@ %@ %@",self.dice1,self.dice2,self.dice3);
        }
    }
}

//open
- (IBAction)diceTapped:(id)sender {
    self.checkshake = @"1";
    [self.view addSubview:self.shakeView];
}

//Lock
- (IBAction)LogdiceTapped:(id)sender {
    if (self.checkLog.length == 0) {
        self.checkLog = @"1";
self.coinLock.image = [UIImage imageNamed:@"coin_on.png"];
    } else {
        self.checkLog = @"";
        self.coinLock.image = [UIImage imageNamed:@"coin_off.png"];
    }
}

//shake

- (IBAction)closeshakeTapped:(id)sender {
    if ([self.checkshake isEqualToString:@"shake"]) {
        [self.shakeView removeFromSuperview];
        [self.view addSubview:self.gambleView];
    } else {
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:@"Please shake again."
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

- (IBAction)gambleTapped:(id)sender {
    [self.gambleView removeFromSuperview];
    [self.view addSubview:self.resultView];
    
    if ([self.dice1 isEqualToString:@"1"]) {
        self.diceImg1.image = [UIImage imageNamed:@"dice_1.png"];
    } else if ([self.dice1 isEqualToString:@"2"]) {
        self.diceImg1.image = [UIImage imageNamed:@"dice_2.png"];
    } else if ([self.dice1 isEqualToString:@"3"]) {
        self.diceImg1.image = [UIImage imageNamed:@"dice_3.png"];
    } else if ([self.dice1 isEqualToString:@"4"]) {
        self.diceImg1.image = [UIImage imageNamed:@"dice_4.png"];
    } else if ([self.dice1 isEqualToString:@"5"]) {
        self.diceImg1.image = [UIImage imageNamed:@"dice_5.png"];
    } else if ([self.dice1 isEqualToString:@"6"]) {
        self.diceImg1.image = [UIImage imageNamed:@"dice_6.png"];
    }
    
    if ([self.dice2 isEqualToString:@"1"]) {
        self.diceImg2.image = [UIImage imageNamed:@"dice_1.png"];
    } else if ([self.dice2 isEqualToString:@"2"]) {
        self.diceImg2.image = [UIImage imageNamed:@"dice_2.png"];
    } else if ([self.dice2 isEqualToString:@"3"]) {
        self.diceImg2.image = [UIImage imageNamed:@"dice_3.png"];
    } else if ([self.dice2 isEqualToString:@"4"]) {
        self.diceImg2.image = [UIImage imageNamed:@"dice_4.png"];
    } else if ([self.dice2 isEqualToString:@"5"]) {
        self.diceImg2.image = [UIImage imageNamed:@"dice_5.png"];
    } else if ([self.dice2 isEqualToString:@"6"]) {
        self.diceImg2.image = [UIImage imageNamed:@"dice_6.png"];
    }
    
    if ([self.dice3 isEqualToString:@"1"]) {
        self.diceImg3.image = [UIImage imageNamed:@"dice_1.png"];
    } else if ([self.dice3 isEqualToString:@"2"]) {
        self.diceImg3.image = [UIImage imageNamed:@"dice_2.png"];
    } else if ([self.dice3 isEqualToString:@"3"]) {
        self.diceImg3.image = [UIImage imageNamed:@"dice_3.png"];
    } else if ([self.dice3 isEqualToString:@"4"]) {
        self.diceImg3.image = [UIImage imageNamed:@"dice_4.png"];
    } else if ([self.dice3 isEqualToString:@"5"]) {
        self.diceImg3.image = [UIImage imageNamed:@"dice_5.png"];
    } else if ([self.dice3 isEqualToString:@"6"]) {
        self.diceImg3.image = [UIImage imageNamed:@"dice_6.png"];
    }

}

//result
- (IBAction)resultTapped:(id)sender {
    [self.resultView removeFromSuperview];
}

//    if ([self.dice1 isEqualToString:@"1"]) {
//        self.showdice1 = @"เต้า";
//    } else if ([self.dice1 isEqualToString:@"2"]) {
//        self.showdice1 = @"ปู";
//    } else if ([self.dice1 isEqualToString:@"3"]) {
//        self.showdice1 = @"ปลา";
//    } else if ([self.dice1 isEqualToString:@"4"]) {
//        self.showdice1 = @"ไก่";
//    } else if ([self.dice1 isEqualToString:@"5"]) {
//        self.showdice1 = @"กุ้ง";
//    } else if ([self.dice1 isEqualToString:@"6"]) {
//        self.showdice1 = @"เสือ";
//    }
//
//    if ([self.dice2 isEqualToString:@"1"]) {
//        self.showdice2 = @"เต้า";
//    } else if ([self.dice2 isEqualToString:@"2"]) {
//        self.showdice2 = @"ปู";
//    } else if ([self.dice2 isEqualToString:@"3"]) {
//        self.showdice2 = @"ปลา";
//    } else if ([self.dice2 isEqualToString:@"4"]) {
//        self.showdice2 = @"ไก่";
//    } else if ([self.dice2 isEqualToString:@"5"]) {
//        self.showdice2 = @"กุ้ง";
//    } else if ([self.dice2 isEqualToString:@"6"]) {
//        self.showdice2 = @"เสือ";
//    }
//
//    if ([self.dice3 isEqualToString:@"1"]) {
//        self.showdice3 = @"เต้า";
//    } else if ([self.dice3 isEqualToString:@"2"]) {
//        self.showdice3 = @"ปู";
//    } else if ([self.dice3 isEqualToString:@"3"]) {
//        self.showdice3 = @"ปลา";
//    } else if ([self.dice3 isEqualToString:@"4"]) {
//        self.showdice3 = @"ไก่";
//    } else if ([self.dice3 isEqualToString:@"5"]) {
//        self.showdice3 = @"กุ้ง";
//    } else if ([self.dice3 isEqualToString:@"6"]) {
//        self.showdice3 = @"เสือ";
//    }
//
//    NSString *print = [NSString stringWithFormat:@"%@%@%@%@%@",self.showdice1,@"\n",self.showdice2,@"\n",self.showdice3];
//
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:print
//                               delegate:nil
//                      cancelButtonTitle:@"OK"
//                      otherButtonTitles:nil] show];

@end
