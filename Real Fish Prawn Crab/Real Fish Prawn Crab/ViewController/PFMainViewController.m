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
        self.SaveData = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //audio
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"gamesound"
                                         ofType:@"mp3"]];
    
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]
                    initWithContentsOfURL:url
                    error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        self.audioPlayer.delegate = self;
        [self.audioPlayer prepareToPlay];
    }
    
    [self.audioPlayer play];
    
    //
    
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
    
    self.boardImg1.image = [UIImage imageNamed:@"borad_1.png"];
    self.boardImg2.image = [UIImage imageNamed:@"borad_2.png"];
    self.boardImg3.image = [UIImage imageNamed:@"borad_3.png"];
    self.boardImg4.image = [UIImage imageNamed:@"borad_4.png"];
    self.boardImg5.image = [UIImage imageNamed:@"borad_5.png"];
    self.boardImg6.image = [UIImage imageNamed:@"borad_6.png"];
    
    if ([[self.SaveData objectForKey:@"dealerbalance"] length] == 0) {
        self.dealerbalance.text = @"0";
        self.dealerbalance1.text = @"0";
    } else {
        self.dealerbalance.text = [self.SaveData objectForKey:@"dealerbalance"];
        self.dealerbalance1.text = [self.SaveData objectForKey:@"dealerbalance"];
    }
    
    if ([[self.SaveData objectForKey:@"player1balance"] length] == 0) {
        self.previous1.text = @"0";
    } else {
        self.previous1.text = [self.SaveData objectForKey:@"player1balance"];
    }
    
    if ([[self.SaveData objectForKey:@"player2balance"] length] == 0) {
        self.previous2.text = @"0";
    } else {
        self.previous2.text = [self.SaveData objectForKey:@"player2balance"];
    }
    
    if ([[self.SaveData objectForKey:@"player3balance"] length] == 0) {
        self.previous3.text = @"0";
    } else {
        self.previous3.text = [self.SaveData objectForKey:@"player3balance"];
    }
    
    if ([[self.SaveData objectForKey:@"player4balance"] length] == 0) {
        self.previous4.text = @"0";
    } else {
        self.previous4.text = [self.SaveData objectForKey:@"player4balance"];
    }
    
    self.winlose1.text = @"0";
    self.winlose2.text = @"0";
    self.winlose3.text = @"0";
    self.winlose4.text = @"0";
    
    self.balance1.text = @"0";
    self.balance2.text = @"0";
    self.balance3.text = @"0";
    self.balance4.text = @"0";
    
    self.resultwinlose1.text = @"";
    self.resultwinlose2.text = @"";
    self.resultwinlose3.text = @"";
    self.resultwinlose4.text = @"";
    
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
                
                self.boardImg1.image = [UIImage imageNamed:@"borad_1.png"];
                self.boardImg2.image = [UIImage imageNamed:@"borad_2.png"];
                self.boardImg3.image = [UIImage imageNamed:@"borad_3.png"];
                self.boardImg4.image = [UIImage imageNamed:@"borad_4.png"];
                self.boardImg5.image = [UIImage imageNamed:@"borad_5.png"];
                self.boardImg6.image = [UIImage imageNamed:@"borad_6.png"];
                
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
                
                self.boardImg1.image = [UIImage imageNamed:@"borad_1.png"];
                self.boardImg2.image = [UIImage imageNamed:@"borad_2.png"];
                self.boardImg3.image = [UIImage imageNamed:@"borad_3.png"];
                self.boardImg4.image = [UIImage imageNamed:@"borad_4.png"];
                self.boardImg5.image = [UIImage imageNamed:@"borad_5.png"];
                self.boardImg6.image = [UIImage imageNamed:@"borad_6.png"];
                
            }
        }
    }
}

//open
- (IBAction)diceTapped:(id)sender {
    self.checkshake = @"1";
    [self.view addSubview:self.shakeView];
    
    self.dealerwinlose.text = @"";
    
    self.winlose1.text = @"0";
    self.winlose2.text = @"0";
    self.winlose3.text = @"0";
    self.winlose4.text = @"0";
    
    self.balance1.text = @"0";
    self.balance2.text = @"0";
    self.balance3.text = @"0";
    self.balance4.text = @"0";
    
    self.resultwinlose1.text = @"";
    self.resultwinlose2.text = @"";
    self.resultwinlose3.text = @"";
    self.resultwinlose4.text = @"";
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
        
        self.totalbet1.text = @"";
        self.totalbet2.text = @"";
        self.totalbet3.text = @"";
        self.totalbet4.text = @"";
        
        self.board1Txt1.text = @""; self.board1Txt2.text = @"";
        self.board1Txt3.text = @""; self.board1Txt4.text = @"";
        
        self.board2Txt1.text = @""; self.board2Txt2.text = @"";
        self.board2Txt3.text = @""; self.board2Txt4.text = @"";
        
        self.board3Txt1.text = @""; self.board3Txt2.text = @"";
        self.board3Txt3.text = @""; self.board3Txt4.text = @"";
        
        self.board4Txt1.text = @""; self.board4Txt2.text = @"";
        self.board4Txt3.text = @""; self.board4Txt4.text = @"";
        
        self.board5Txt1.text = @""; self.board5Txt2.text = @"";
        self.board5Txt3.text = @""; self.board5Txt4.text = @"";
        
        self.board6Txt1.text = @""; self.board6Txt2.text = @"";
        self.board6Txt3.text = @""; self.board6Txt4.text = @"";
        
        self.player1sum = @"";   self.player2sum = @"";
        self.player3sum = @"";   self.player4sum = @"";
        
        self.previous1.text = [self.SaveData objectForKey:@"player1balance"];
        self.previous2.text = [self.SaveData objectForKey:@"player2balance"];
        self.previous3.text = [self.SaveData objectForKey:@"player3balance"];
        self.previous4.text = [self.SaveData objectForKey:@"player4balance"];
        
        [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
        [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
        [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
        [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
        
        [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
        [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
        [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
        [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
        
        [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
        [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
        [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
        [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
        
        [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
        [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
        [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
        [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
        
    } else {
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:@"Please shake again."
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

//board gamble

- (IBAction)boardBt1Tapped:(id)sender {
    
    //player1
    if ([self.playercheck isEqualToString:@"player1coin50"]) {
        if ([self.board1Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board1Txt1.text = @"50";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt1.text.intValue + 50;
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board1Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin10"]) {
        if ([self.board1Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board1Txt1.text = @"10";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt1.text.intValue + 10;
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board1Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin5"]) {
        if ([self.board1Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board1Txt1.text = @"5";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt1.text.intValue + 5;
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board1Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin1"]) {
        if ([self.board1Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board1Txt1.text = @"1";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt1.text.intValue + 1;
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board1Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player2
    if ([self.playercheck isEqualToString:@"player2coin50"]) {
        if ([self.board1Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board1Txt2.text = @"50";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt2.text.intValue + 50;
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board1Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin10"]) {
        if ([self.board1Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board1Txt2.text = @"10";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt2.text.intValue + 10;
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board1Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin5"]) {
        if ([self.board1Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board1Txt2.text = @"5";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt2.text.intValue + 5;
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board1Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin1"]) {
        if ([self.board1Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board1Txt2.text = @"1";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt2.text.intValue + 1;
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board1Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player3
    if ([self.playercheck isEqualToString:@"player3coin50"]) {
        if ([self.board1Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board1Txt3.text = @"50";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt3.text.intValue + 50;
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board1Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin10"]) {
        if ([self.board1Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board1Txt3.text = @"10";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt3.text.intValue + 10;
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board1Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin5"]) {
        if ([self.board1Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board1Txt3.text = @"5";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt3.text.intValue + 5;
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board1Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin1"]) {
        if ([self.board1Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board1Txt3.text = @"1";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt3.text.intValue + 1;
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board1Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player4
    if ([self.playercheck isEqualToString:@"player4coin50"]) {
        if ([self.board1Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board1Txt4.text = @"50";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt4.text.intValue + 50;
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board1Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin10"]) {
        if ([self.board1Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board1Txt4.text = @"10";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt4.text.intValue + 10;
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board1Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin5"]) {
        if ([self.board1Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board1Txt4.text = @"5";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt4.text.intValue + 5;
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board1Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin1"]) {
        if ([self.board1Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board1Txt4.text = @"1";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board1Txt4.text.intValue + 1;
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board1Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
}

- (IBAction)boardBt2Tapped:(id)sender {
    
    //player1
    if ([self.playercheck isEqualToString:@"player1coin50"]) {
        if ([self.board2Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board2Txt1.text = @"50";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt1.text.intValue + 50;
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board2Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin10"]) {
        if ([self.board2Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board2Txt1.text = @"10";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt1.text.intValue + 10;
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board2Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin5"]) {
        if ([self.board2Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board2Txt1.text = @"5";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt1.text.intValue + 5;
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board2Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin1"]) {
        if ([self.board2Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board2Txt1.text = @"1";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt1.text.intValue + 1;
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board2Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player2
    if ([self.playercheck isEqualToString:@"player2coin50"]) {
        if ([self.board2Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board2Txt2.text = @"50";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt2.text.intValue + 50;
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board2Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin10"]) {
        if ([self.board2Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board2Txt2.text = @"10";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt2.text.intValue + 10;
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board2Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin5"]) {
        if ([self.board2Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board2Txt2.text = @"5";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt2.text.intValue + 5;
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board2Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin1"]) {
        if ([self.board2Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board2Txt2.text = @"1";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt2.text.intValue + 1;
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board2Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player3
    if ([self.playercheck isEqualToString:@"player3coin50"]) {
        if ([self.board2Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board2Txt3.text = @"50";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt3.text.intValue + 50;
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board2Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin10"]) {
        if ([self.board2Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board2Txt3.text = @"10";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt3.text.intValue + 10;
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board2Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin5"]) {
        if ([self.board2Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board2Txt3.text = @"5";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt3.text.intValue + 5;
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board2Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin1"]) {
        if ([self.board2Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board2Txt3.text = @"1";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt3.text.intValue + 1;
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board2Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player4
    if ([self.playercheck isEqualToString:@"player4coin50"]) {
        if ([self.board2Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board2Txt4.text = @"50";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt4.text.intValue + 50;
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board2Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin10"]) {
        if ([self.board2Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board2Txt4.text = @"10";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt4.text.intValue + 10;
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board2Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin5"]) {
        if ([self.board2Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board2Txt4.text = @"5";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt4.text.intValue + 5;
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board2Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin1"]) {
        if ([self.board2Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board2Txt4.text = @"1";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board2Txt4.text.intValue + 1;
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board2Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
}

- (IBAction)boardBt3Tapped:(id)sender {
    //player1
    if ([self.playercheck isEqualToString:@"player1coin50"]) {
        if ([self.board3Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board3Txt1.text = @"50";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt1.text.intValue + 50;
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board3Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin10"]) {
        if ([self.board3Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board3Txt1.text = @"10";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt1.text.intValue + 10;
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board3Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin5"]) {
        if ([self.board3Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board3Txt1.text = @"5";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt1.text.intValue + 5;
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board3Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin1"]) {
        if ([self.board3Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board3Txt1.text = @"1";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt1.text.intValue + 1;
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board3Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player2
    if ([self.playercheck isEqualToString:@"player2coin50"]) {
        if ([self.board3Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board3Txt2.text = @"50";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt2.text.intValue + 50;
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board3Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin10"]) {
        if ([self.board3Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board3Txt2.text = @"10";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt2.text.intValue + 10;
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board3Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin5"]) {
        if ([self.board3Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board3Txt2.text = @"5";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt2.text.intValue + 5;
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board3Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin1"]) {
        if ([self.board3Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board3Txt2.text = @"1";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt2.text.intValue + 1;
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board3Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player3
    if ([self.playercheck isEqualToString:@"player3coin50"]) {
        if ([self.board3Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board3Txt3.text = @"50";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt3.text.intValue + 50;
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board3Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin10"]) {
        if ([self.board3Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board3Txt3.text = @"10";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt3.text.intValue + 10;
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board3Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin5"]) {
        if ([self.board3Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board3Txt3.text = @"5";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt3.text.intValue + 5;
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board3Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin1"]) {
        if ([self.board3Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board3Txt3.text = @"1";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt3.text.intValue + 1;
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board3Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player4
    if ([self.playercheck isEqualToString:@"player4coin50"]) {
        if ([self.board3Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board3Txt4.text = @"50";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt4.text.intValue + 50;
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board3Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin10"]) {
        if ([self.board3Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board3Txt4.text = @"10";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt4.text.intValue + 10;
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board3Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin5"]) {
        if ([self.board3Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board3Txt4.text = @"5";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt4.text.intValue + 5;
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board3Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin1"]) {
        if ([self.board3Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board3Txt4.text = @"1";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board3Txt4.text.intValue + 1;
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board3Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }

}

- (IBAction)boardBt4Tapped:(id)sender {
    //player1
    if ([self.playercheck isEqualToString:@"player1coin50"]) {
        if ([self.board4Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board4Txt1.text = @"50";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt1.text.intValue + 50;
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board4Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin10"]) {
        if ([self.board4Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board4Txt1.text = @"10";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt1.text.intValue + 10;
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board4Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin5"]) {
        if ([self.board4Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board4Txt1.text = @"5";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt1.text.intValue + 5;
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board4Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin1"]) {
        if ([self.board4Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board4Txt1.text = @"1";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt1.text.intValue + 1;
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board4Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player2
    if ([self.playercheck isEqualToString:@"player2coin50"]) {
        if ([self.board4Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board4Txt2.text = @"50";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt2.text.intValue + 50;
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board4Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin10"]) {
        if ([self.board4Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board4Txt2.text = @"10";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt2.text.intValue + 10;
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board4Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin5"]) {
        if ([self.board4Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board4Txt2.text = @"5";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt2.text.intValue + 5;
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board4Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin1"]) {
        if ([self.board4Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board4Txt2.text = @"1";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt2.text.intValue + 1;
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board4Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player3
    if ([self.playercheck isEqualToString:@"player3coin50"]) {
        if ([self.board4Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board4Txt3.text = @"50";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt3.text.intValue + 50;
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board4Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin10"]) {
        if ([self.board4Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board4Txt3.text = @"10";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt3.text.intValue + 10;
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board4Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin5"]) {
        if ([self.board4Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board4Txt3.text = @"5";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt3.text.intValue + 5;
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board4Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin1"]) {
        if ([self.board4Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board4Txt3.text = @"1";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt3.text.intValue + 1;
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board4Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player4
    if ([self.playercheck isEqualToString:@"player4coin50"]) {
        if ([self.board4Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board4Txt4.text = @"50";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt4.text.intValue + 50;
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board4Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin10"]) {
        if ([self.board4Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board4Txt4.text = @"10";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt4.text.intValue + 10;
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board4Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin5"]) {
        if ([self.board4Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board4Txt4.text = @"5";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt4.text.intValue + 5;
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board4Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin1"]) {
        if ([self.board4Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board4Txt4.text = @"1";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board4Txt4.text.intValue + 1;
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board4Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }

}

- (IBAction)boardBt5Tapped:(id)sender {
    //player1
    if ([self.playercheck isEqualToString:@"player1coin50"]) {
        if ([self.board5Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board5Txt1.text = @"50";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt1.text.intValue + 50;
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board5Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin10"]) {
        if ([self.board5Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board5Txt1.text = @"10";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt1.text.intValue + 10;
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board5Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin5"]) {
        if ([self.board5Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board5Txt1.text = @"5";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt1.text.intValue + 5;
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board5Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin1"]) {
        if ([self.board5Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board5Txt1.text = @"1";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt1.text.intValue + 1;
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board5Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player2
    if ([self.playercheck isEqualToString:@"player2coin50"]) {
        if ([self.board5Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board5Txt2.text = @"50";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt2.text.intValue + 50;
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board5Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin10"]) {
        if ([self.board5Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board5Txt2.text = @"10";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt2.text.intValue + 10;
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board5Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin5"]) {
        if ([self.board5Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board5Txt2.text = @"5";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt2.text.intValue + 5;
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board5Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin1"]) {
        if ([self.board5Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board5Txt2.text = @"1";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt2.text.intValue + 1;
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board5Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player3
    if ([self.playercheck isEqualToString:@"player3coin50"]) {
        if ([self.board5Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board5Txt3.text = @"50";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt3.text.intValue + 50;
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board5Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin10"]) {
        if ([self.board5Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board5Txt3.text = @"10";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt3.text.intValue + 10;
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board5Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin5"]) {
        if ([self.board5Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board5Txt3.text = @"5";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt3.text.intValue + 5;
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board5Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin1"]) {
        if ([self.board5Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board5Txt3.text = @"1";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt3.text.intValue + 1;
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board5Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player4
    if ([self.playercheck isEqualToString:@"player4coin50"]) {
        if ([self.board5Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board5Txt4.text = @"50";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt4.text.intValue + 50;
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board5Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin10"]) {
        if ([self.board5Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board5Txt4.text = @"10";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt4.text.intValue + 10;
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board5Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin5"]) {
        if ([self.board5Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board5Txt4.text = @"5";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt4.text.intValue + 5;
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board5Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin1"]) {
        if ([self.board5Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board5Txt4.text = @"1";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board5Txt4.text.intValue + 1;
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board5Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }

}

- (IBAction)boardBt6Tapped:(id)sender {
    //player1
    if ([self.playercheck isEqualToString:@"player1coin50"]) {
        if ([self.board6Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board6Txt1.text = @"50";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt1.text.intValue + 50;
            int totalbet = self.totalbet1.text.intValue + 50;
            self.board6Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin10"]) {
        if ([self.board6Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board6Txt1.text = @"10";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt1.text.intValue + 10;
            int totalbet = self.totalbet1.text.intValue + 10;
            self.board6Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin5"]) {
        if ([self.board6Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board6Txt1.text = @"5";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt1.text.intValue + 5;
            int totalbet = self.totalbet1.text.intValue + 5;
            self.board6Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player1coin1"]) {
        if ([self.board6Txt1.text isEqualToString:@""]) {
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board6Txt1.text = @"1";
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt1.text.intValue + 1;
            int totalbet = self.totalbet1.text.intValue + 1;
            self.board6Txt1.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet1.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player2
    if ([self.playercheck isEqualToString:@"player2coin50"]) {
        if ([self.board6Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board6Txt2.text = @"50";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt2.text.intValue + 50;
            int totalbet = self.totalbet2.text.intValue + 50;
            self.board6Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin10"]) {
        if ([self.board6Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board6Txt2.text = @"10";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt2.text.intValue + 10;
            int totalbet = self.totalbet2.text.intValue + 10;
            self.board6Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin5"]) {
        if ([self.board6Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board6Txt2.text = @"5";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt2.text.intValue + 5;
            int totalbet = self.totalbet2.text.intValue + 5;
            self.board6Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player2coin1"]) {
        if ([self.board6Txt2.text isEqualToString:@""]) {
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board6Txt2.text = @"1";
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt2.text.intValue + 1;
            int totalbet = self.totalbet2.text.intValue + 1;
            self.board6Txt2.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet2.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player3
    if ([self.playercheck isEqualToString:@"player3coin50"]) {
        if ([self.board6Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board6Txt3.text = @"50";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt3.text.intValue + 50;
            int totalbet = self.totalbet3.text.intValue + 50;
            self.board6Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin10"]) {
        if ([self.board6Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board6Txt3.text = @"10";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt3.text.intValue + 10;
            int totalbet = self.totalbet3.text.intValue + 10;
            self.board6Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin5"]) {
        if ([self.board6Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board6Txt3.text = @"5";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt3.text.intValue + 5;
            int totalbet = self.totalbet3.text.intValue + 5;
            self.board6Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player3coin1"]) {
        if ([self.board6Txt3.text isEqualToString:@""]) {
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board6Txt3.text = @"1";
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt3.text.intValue + 1;
            int totalbet = self.totalbet3.text.intValue + 1;
            self.board6Txt3.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet3.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
    //player4
    if ([self.playercheck isEqualToString:@"player4coin50"]) {
        if ([self.board6Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board6Txt4.text = @"50";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt4.text.intValue + 50;
            int totalbet = self.totalbet4.text.intValue + 50;
            self.board6Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin10"]) {
        if ([self.board6Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board6Txt4.text = @"10";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt4.text.intValue + 10;
            int totalbet = self.totalbet4.text.intValue + 10;
            self.board6Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin5"]) {
        if ([self.board6Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board6Txt4.text = @"5";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt4.text.intValue + 5;
            int totalbet = self.totalbet4.text.intValue + 5;
            self.board6Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    if ([self.playercheck isEqualToString:@"player4coin1"]) {
        if ([self.board6Txt4.text isEqualToString:@""]) {
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board6Txt4.text = @"1";
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        } else {
            int sum1 = self.board6Txt4.text.intValue + 1;
            int totalbet = self.totalbet4.text.intValue + 1;
            self.board6Txt4.text = [NSString stringWithFormat:@"%i",sum1];
            self.totalbet4.text = [NSString stringWithFormat:@"%i",totalbet];
        }
    }
    
}

//clear player1

- (IBAction)clear1Tapped:(id)sender {
    self.totalbet1.text = @"0";
    self.board1Txt1.text = @"";
    self.board2Txt1.text = @"";
    self.board3Txt1.text = @"";
    self.board4Txt1.text = @"";
    self.board5Txt1.text = @"";
    self.board6Txt1.text = @"";
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    self.playercheck = @"";
}

//clear player2

- (IBAction)clear2Tapped:(id)sender {
    self.totalbet2.text = @"0";
    self.board1Txt2.text = @"";
    self.board2Txt2.text = @"";
    self.board3Txt2.text = @"";
    self.board4Txt2.text = @"";
    self.board5Txt2.text = @"";
    self.board6Txt2.text = @"";
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    self.playercheck = @"";
}

//clear player3

- (IBAction)clear3Tapped:(id)sender {
    self.totalbet3.text = @"0";
    self.board1Txt3.text = @"";
    self.board2Txt3.text = @"";
    self.board3Txt3.text = @"";
    self.board4Txt3.text = @"";
    self.board5Txt3.text = @"";
    self.board6Txt3.text = @"";
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    self.playercheck = @"";
}

//clear player4

- (IBAction)clear4Tapped:(id)sender {
    self.totalbet4.text = @"0";
    self.board1Txt4.text = @"";
    self.board2Txt4.text = @"";
    self.board3Txt4.text = @"";
    self.board4Txt4.text = @"";
    self.board5Txt4.text = @"";
    self.board6Txt4.text = @"";
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    self.playercheck = @"";
}

//coin gamble player1

- (IBAction)coin501Tapped:(id)sender {
    [self.coin501 setImage:[UIImage imageNamed:@"select_red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player1coin50";
}

- (IBAction)coin101Tapped:(id)sender {
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"select_red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player1coin10";
}

- (IBAction)coin51Tapped:(id)sender {
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"select_red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player1coin5";
}

- (IBAction)coin11Tapped:(id)sender {
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"select_red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player1coin1";
}

//coin gamble player2

- (IBAction)coin502Tapped:(id)sender {
    [self.coin502 setImage:[UIImage imageNamed:@"select_blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player2coin50";
}

- (IBAction)coin102Tapped:(id)sender {
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"select_blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player2coin10";
}

- (IBAction)coin52Tapped:(id)sender {
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"select_blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player2coin5";
}

- (IBAction)coin12Tapped:(id)sender {
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"select_blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player2coin1";
}

//coin gamble player3

- (IBAction)coin503Tapped:(id)sender {
    [self.coin503 setImage:[UIImage imageNamed:@"select_green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player3coin50";
}

- (IBAction)coin103Tapped:(id)sender {
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"select_green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player3coin10";
}

- (IBAction)coin53Tapped:(id)sender {
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"select_green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player3coin5";
}

- (IBAction)coin13Tapped:(id)sender {
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"select_green_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player3coin1";
}

//coin gamble player4

- (IBAction)coin504Tapped:(id)sender {
    [self.coin504 setImage:[UIImage imageNamed:@"select_yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player4coin50";
}

- (IBAction)coin104Tapped:(id)sender {
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"select_yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player4coin10";
}

- (IBAction)coin54Tapped:(id)sender {
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"select_yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"yellow_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player4coin5";
}

- (IBAction)coin14Tapped:(id)sender {
    [self.coin504 setImage:[UIImage imageNamed:@"yellow_coin_50"] forState:UIControlStateNormal];
    [self.coin104 setImage:[UIImage imageNamed:@"yellow_coin_10"] forState:UIControlStateNormal];
    [self.coin54 setImage:[UIImage imageNamed:@"yellow_coin_05"] forState:UIControlStateNormal];
    [self.coin14 setImage:[UIImage imageNamed:@"select_yellow_coin_01"] forState:UIControlStateNormal];
    
    [self.coin501 setImage:[UIImage imageNamed:@"red_coin_50"] forState:UIControlStateNormal];
    [self.coin101 setImage:[UIImage imageNamed:@"red_coin_10"] forState:UIControlStateNormal];
    [self.coin51 setImage:[UIImage imageNamed:@"red_coin_05"] forState:UIControlStateNormal];
    [self.coin11 setImage:[UIImage imageNamed:@"red_coin_01"] forState:UIControlStateNormal];
    
    [self.coin502 setImage:[UIImage imageNamed:@"blue_coin_50"] forState:UIControlStateNormal];
    [self.coin102 setImage:[UIImage imageNamed:@"blue_coin_10"] forState:UIControlStateNormal];
    [self.coin52 setImage:[UIImage imageNamed:@"blue_coin_05"] forState:UIControlStateNormal];
    [self.coin12 setImage:[UIImage imageNamed:@"blue_coin_01"] forState:UIControlStateNormal];
    
    [self.coin503 setImage:[UIImage imageNamed:@"green_coin_50"] forState:UIControlStateNormal];
    [self.coin103 setImage:[UIImage imageNamed:@"green_coin_10"] forState:UIControlStateNormal];
    [self.coin53 setImage:[UIImage imageNamed:@"green_coin_05"] forState:UIControlStateNormal];
    [self.coin13 setImage:[UIImage imageNamed:@"green_coin_01"] forState:UIControlStateNormal];
    
    self.playercheck = @"player4coin1";
}

//gamble

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
    
    self.totalbet1sum = self.totalbet1.text;
    self.totalbet2sum = self.totalbet2.text;
    self.totalbet3sum = self.totalbet3.text;
    self.totalbet4sum = self.totalbet4.text;

}

//result
- (IBAction)resultTapped:(id)sender {
    [self.resultView removeFromSuperview];
    
    //image
    
    if ([self.dice1 isEqualToString:@"1"]) {
        self.boardImg1.image = [UIImage imageNamed:@"select_borad_1.png"];
    }
    
    if ([self.dice1 isEqualToString:@"2"]) {
        self.boardImg2.image = [UIImage imageNamed:@"select_borad_2.png"];
    }
    
    if ([self.dice1 isEqualToString:@"3"]) {
        self.boardImg3.image = [UIImage imageNamed:@"select_borad_3.png"];
    }
    
    if ([self.dice1 isEqualToString:@"4"]) {
        self.boardImg4.image = [UIImage imageNamed:@"select_borad_4.png"];
    }
    
    if ([self.dice1 isEqualToString:@"5"]) {
        self.boardImg5.image = [UIImage imageNamed:@"select_borad_5.png"];
    }
    
    if ([self.dice1 isEqualToString:@"6"]) {
        self.boardImg6.image = [UIImage imageNamed:@"select_borad_6.png"];
    }
    
    //
    
    if ([self.dice2 isEqualToString:@"1"]) {
        self.boardImg1.image = [UIImage imageNamed:@"select_borad_1.png"];
    }
    
    if ([self.dice2 isEqualToString:@"2"]) {
        self.boardImg2.image = [UIImage imageNamed:@"select_borad_2.png"];
    }
    
    if ([self.dice2 isEqualToString:@"3"]) {
        self.boardImg3.image = [UIImage imageNamed:@"select_borad_3.png"];
    }
    
    if ([self.dice2 isEqualToString:@"4"]) {
        self.boardImg4.image = [UIImage imageNamed:@"select_borad_4.png"];
    }
    
    if ([self.dice2 isEqualToString:@"5"]) {
        self.boardImg5.image = [UIImage imageNamed:@"select_borad_5.png"];
    }
    
    if ([self.dice2 isEqualToString:@"6"]) {
        self.boardImg6.image = [UIImage imageNamed:@"select_borad_6.png"];
    }
    
    //
    
    if ([self.dice3 isEqualToString:@"1"]) {
        self.boardImg1.image = [UIImage imageNamed:@"select_borad_1.png"];
    }
    
    if ([self.dice3 isEqualToString:@"2"]) {
        self.boardImg2.image = [UIImage imageNamed:@"select_borad_2.png"];
    }
    
    if ([self.dice3 isEqualToString:@"3"]) {
        self.boardImg3.image = [UIImage imageNamed:@"select_borad_3.png"];
    }
    
    if ([self.dice3 isEqualToString:@"4"]) {
        self.boardImg4.image = [UIImage imageNamed:@"select_borad_4.png"];
    }
    
    if ([self.dice3 isEqualToString:@"5"]) {
        self.boardImg5.image = [UIImage imageNamed:@"select_borad_5.png"];
    }
    
    if ([self.dice3 isEqualToString:@"6"]) {
        self.boardImg6.image = [UIImage imageNamed:@"select_borad_6.png"];
    }
    
    //player1
    
    if (![self.board1Txt1.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"1"] || [self.dice2 isEqualToString:@"1"] || [self.dice3 isEqualToString:@"1"]) {
            
            if ([self.dice1 isEqualToString:@"1"]) {
                int sum = self.player1sum.intValue + self.board1Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"1"]) {
                int sum = self.player1sum.intValue + self.board1Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"1"]) {
                int sum = self.player1sum.intValue + self.board1Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player1sum.intValue - self.board1Txt1.text.intValue;
            self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board2Txt1.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"2"] || [self.dice2 isEqualToString:@"2"] || [self.dice3 isEqualToString:@"2"]) {
            
            if ([self.dice1 isEqualToString:@"2"]) {
                int sum = self.player1sum.intValue + self.board2Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"2"]) {
                int sum = self.player1sum.intValue + self.board2Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"2"]) {
                int sum = self.player1sum.intValue + self.board2Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player1sum.intValue - self.board2Txt1.text.intValue;
            self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board3Txt1.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"3"] || [self.dice2 isEqualToString:@"3"] || [self.dice3 isEqualToString:@"3"]) {
            
            if ([self.dice1 isEqualToString:@"3"]) {
                int sum = self.player1sum.intValue + self.board3Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"3"]) {
                int sum = self.player1sum.intValue + self.board3Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"3"]) {
                int sum = self.player1sum.intValue + self.board3Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player1sum.intValue - self.board3Txt1.text.intValue;
            self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board4Txt1.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"4"] || [self.dice2 isEqualToString:@"4"] || [self.dice3 isEqualToString:@"4"]) {
            
            if ([self.dice1 isEqualToString:@"4"]) {
                int sum = self.player1sum.intValue + self.board4Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"4"]) {
                int sum = self.player1sum.intValue + self.board4Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"4"]) {
                int sum = self.player1sum.intValue + self.board4Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player1sum.intValue - self.board4Txt1.text.intValue;
            self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board5Txt1.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"5"] || [self.dice2 isEqualToString:@"5"] || [self.dice3 isEqualToString:@"5"]) {
            
            if ([self.dice1 isEqualToString:@"5"]) {
                int sum = self.player1sum.intValue + self.board5Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"5"]) {
                int sum = self.player1sum.intValue + self.board5Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"5"]) {
                int sum = self.player1sum.intValue + self.board5Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player1sum.intValue - self.board5Txt1.text.intValue;
            self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board6Txt1.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"6"] || [self.dice2 isEqualToString:@"6"] || [self.dice3 isEqualToString:@"6"]) {
            
            if ([self.dice1 isEqualToString:@"6"]) {
                int sum = self.player1sum.intValue + self.board6Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"6"]) {
                int sum = self.player1sum.intValue + self.board6Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"6"]) {
                int sum = self.player1sum.intValue + self.board6Txt1.text.intValue;
                self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player1sum.intValue - self.board6Txt1.text.intValue;
            self.player1sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    //player2
    
    if (![self.board1Txt2.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"1"] || [self.dice2 isEqualToString:@"1"] || [self.dice3 isEqualToString:@"1"]) {
            
            if ([self.dice1 isEqualToString:@"1"]) {
                int sum = self.player2sum.intValue + self.board1Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"1"]) {
                int sum = self.player2sum.intValue + self.board1Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"1"]) {
                int sum = self.player2sum.intValue + self.board1Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player2sum.intValue - self.board1Txt2.text.intValue;
            self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board2Txt2.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"2"] || [self.dice2 isEqualToString:@"2"] || [self.dice3 isEqualToString:@"2"]) {
            
            if ([self.dice1 isEqualToString:@"2"]) {
                int sum = self.player2sum.intValue + self.board2Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"2"]) {
                int sum = self.player2sum.intValue + self.board2Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"2"]) {
                int sum = self.player2sum.intValue + self.board2Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player2sum.intValue - self.board2Txt2.text.intValue;
            self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board3Txt2.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"3"] || [self.dice2 isEqualToString:@"3"] || [self.dice3 isEqualToString:@"3"]) {
            
            if ([self.dice1 isEqualToString:@"3"]) {
                int sum = self.player2sum.intValue + self.board3Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"3"]) {
                int sum = self.player2sum.intValue + self.board3Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"3"]) {
                int sum = self.player2sum.intValue + self.board3Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player2sum.intValue - self.board3Txt2.text.intValue;
            self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board4Txt2.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"4"] || [self.dice2 isEqualToString:@"4"] || [self.dice3 isEqualToString:@"4"]) {
            
            if ([self.dice1 isEqualToString:@"4"]) {
                int sum = self.player2sum.intValue + self.board4Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"4"]) {
                int sum = self.player2sum.intValue + self.board4Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"4"]) {
                int sum = self.player2sum.intValue + self.board4Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player2sum.intValue - self.board4Txt2.text.intValue;
            self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board5Txt2.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"5"] || [self.dice2 isEqualToString:@"5"] || [self.dice3 isEqualToString:@"5"]) {
            
            if ([self.dice1 isEqualToString:@"5"]) {
                int sum = self.player2sum.intValue + self.board5Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"5"]) {
                int sum = self.player2sum.intValue + self.board5Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"5"]) {
                int sum = self.player2sum.intValue + self.board5Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player2sum.intValue - self.board5Txt2.text.intValue;
            self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board6Txt2.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"6"] || [self.dice2 isEqualToString:@"6"] || [self.dice3 isEqualToString:@"6"]) {
            
            if ([self.dice1 isEqualToString:@"6"]) {
                int sum = self.player2sum.intValue + self.board6Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"6"]) {
                int sum = self.player2sum.intValue + self.board6Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"6"]) {
                int sum = self.player2sum.intValue + self.board6Txt2.text.intValue;
                self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player2sum.intValue - self.board6Txt2.text.intValue;
            self.player2sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    //player3
    
    if (![self.board1Txt3.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"1"] || [self.dice2 isEqualToString:@"1"] || [self.dice3 isEqualToString:@"1"]) {
            
            if ([self.dice1 isEqualToString:@"1"]) {
                int sum = self.player3sum.intValue + self.board1Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"1"]) {
                int sum = self.player3sum.intValue + self.board1Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"1"]) {
                int sum = self.player3sum.intValue + self.board1Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player3sum.intValue - self.board1Txt3.text.intValue;
            self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board2Txt3.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"2"] || [self.dice2 isEqualToString:@"2"] || [self.dice3 isEqualToString:@"2"]) {
            
            if ([self.dice1 isEqualToString:@"2"]) {
                int sum = self.player3sum.intValue + self.board2Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"2"]) {
                int sum = self.player3sum.intValue + self.board2Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"2"]) {
                int sum = self.player3sum.intValue + self.board2Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player3sum.intValue - self.board2Txt3.text.intValue;
            self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board3Txt3.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"3"] || [self.dice2 isEqualToString:@"3"] || [self.dice3 isEqualToString:@"3"]) {
            
            if ([self.dice1 isEqualToString:@"3"]) {
                int sum = self.player3sum.intValue + self.board3Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"3"]) {
                int sum = self.player3sum.intValue + self.board3Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"3"]) {
                int sum = self.player3sum.intValue + self.board3Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player3sum.intValue - self.board3Txt3.text.intValue;
            self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board4Txt3.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"4"] || [self.dice2 isEqualToString:@"4"] || [self.dice3 isEqualToString:@"4"]) {
            
            if ([self.dice1 isEqualToString:@"4"]) {
                int sum = self.player3sum.intValue + self.board4Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"4"]) {
                int sum = self.player3sum.intValue + self.board4Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"4"]) {
                int sum = self.player3sum.intValue + self.board4Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player3sum.intValue - self.board4Txt3.text.intValue;
            self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board5Txt3.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"5"] || [self.dice2 isEqualToString:@"5"] || [self.dice3 isEqualToString:@"5"]) {
            
            if ([self.dice1 isEqualToString:@"5"]) {
                int sum = self.player3sum.intValue + self.board5Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"5"]) {
                int sum = self.player3sum.intValue + self.board5Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"5"]) {
                int sum = self.player3sum.intValue + self.board5Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player3sum.intValue - self.board5Txt3.text.intValue;
            self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board6Txt3.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"6"] || [self.dice2 isEqualToString:@"6"] || [self.dice3 isEqualToString:@"6"]) {
            
            if ([self.dice1 isEqualToString:@"6"]) {
                int sum = self.player3sum.intValue + self.board6Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"6"]) {
                int sum = self.player3sum.intValue + self.board6Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"6"]) {
                int sum = self.player3sum.intValue + self.board6Txt3.text.intValue;
                self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player3sum.intValue - self.board6Txt3.text.intValue;
            self.player3sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }

    //player4
    
    if (![self.board1Txt4.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"1"] || [self.dice2 isEqualToString:@"1"] || [self.dice3 isEqualToString:@"1"]) {
            
            if ([self.dice1 isEqualToString:@"1"]) {
                int sum = self.player4sum.intValue + self.board1Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"1"]) {
                int sum = self.player4sum.intValue + self.board1Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"1"]) {
                int sum = self.player4sum.intValue + self.board1Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player4sum.intValue - self.board1Txt4.text.intValue;
            self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board2Txt4.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"2"] || [self.dice2 isEqualToString:@"2"] || [self.dice3 isEqualToString:@"2"]) {
            
            if ([self.dice1 isEqualToString:@"2"]) {
                int sum = self.player4sum.intValue + self.board2Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"2"]) {
                int sum = self.player4sum.intValue + self.board2Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"2"]) {
                int sum = self.player4sum.intValue + self.board2Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player4sum.intValue - self.board2Txt4.text.intValue;
            self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board3Txt4.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"3"] || [self.dice2 isEqualToString:@"3"] || [self.dice3 isEqualToString:@"3"]) {
            
            if ([self.dice1 isEqualToString:@"3"]) {
                int sum = self.player4sum.intValue + self.board3Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"3"]) {
                int sum = self.player4sum.intValue + self.board3Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"3"]) {
                int sum = self.player4sum.intValue + self.board3Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player4sum.intValue - self.board3Txt4.text.intValue;
            self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board4Txt4.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"4"] || [self.dice2 isEqualToString:@"4"] || [self.dice3 isEqualToString:@"4"]) {
            
            if ([self.dice1 isEqualToString:@"4"]) {
                int sum = self.player4sum.intValue + self.board4Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"4"]) {
                int sum = self.player4sum.intValue + self.board4Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"4"]) {
                int sum = self.player4sum.intValue + self.board4Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player4sum.intValue - self.board4Txt4.text.intValue;
            self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board5Txt4.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"5"] || [self.dice2 isEqualToString:@"5"] || [self.dice3 isEqualToString:@"5"]) {
            
            if ([self.dice1 isEqualToString:@"5"]) {
                int sum = self.player4sum.intValue + self.board5Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"5"]) {
                int sum = self.player4sum.intValue + self.board5Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"5"]) {
                int sum = self.player4sum.intValue + self.board5Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player4sum.intValue - self.board5Txt4.text.intValue;
            self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    if (![self.board6Txt4.text isEqualToString:@""]) {
        
        if ([self.dice1 isEqualToString:@"6"] || [self.dice2 isEqualToString:@"6"] || [self.dice3 isEqualToString:@"6"]) {
            
            if ([self.dice1 isEqualToString:@"6"]) {
                int sum = self.player4sum.intValue + self.board6Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice2 isEqualToString:@"6"]) {
                int sum = self.player4sum.intValue + self.board6Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            if ([self.dice3 isEqualToString:@"6"]) {
                int sum = self.player4sum.intValue + self.board6Txt4.text.intValue;
                self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
            }
            
        } else {
            int sum = self.player4sum.intValue - self.board6Txt4.text.intValue;
            self.player4sum = [[NSString alloc] initWithFormat:@"%i",sum];
        }
    }
    
    //
    
    if (self.player1sum.intValue > 0) {
        self.winlose1.text = [[NSString alloc] initWithFormat:@"%@%@",@"+",self.player1sum];
        self.resultwinlose1.text = [[NSString alloc] initWithFormat:@"%@%@",@"+",self.player1sum];
    } else if (self.player1sum.intValue == 0) {
        self.winlose1.text = self.player1sum;
        self.resultwinlose1.text = @"Tie";
    } else {
        self.winlose1.text = self.player1sum;
        self.resultwinlose1.text = self.player1sum;
    }
    
    if (self.player2sum.intValue > 0) {
        self.winlose2.text = [[NSString alloc] initWithFormat:@"%@%@",@"+",self.player2sum];
        self.resultwinlose2.text = [[NSString alloc] initWithFormat:@"%@%@",@"+",self.player2sum];
    } else if (self.player2sum.intValue == 0) {
        self.winlose2.text = self.player2sum;
        self.resultwinlose2.text = @"Tie";
    } else {
        self.winlose2.text = self.player2sum;
        self.resultwinlose2.text = self.player2sum;
    }
    
    if (self.player3sum.intValue > 0) {
        self.winlose3.text = [[NSString alloc] initWithFormat:@"%@%@",@"+",self.player3sum];
        self.resultwinlose3.text = [[NSString alloc] initWithFormat:@"%@%@",@"+",self.player3sum];
    } else if (self.player3sum.intValue == 0) {
        self.winlose3.text = self.player3sum;
        self.resultwinlose3.text = @"Tie";
    }else {
        self.winlose3.text = self.player3sum;
        self.resultwinlose3.text = self.player3sum;
    }
    
    if (self.player4sum.intValue > 0) {
        self.winlose4.text = [[NSString alloc] initWithFormat:@"%@%@",@"+",self.player4sum];
        self.resultwinlose4.text = [[NSString alloc] initWithFormat:@"%@%@",@"+",self.player4sum];
    } else if (self.player4sum.intValue == 0) {
        self.winlose4.text = self.player4sum;
        self.resultwinlose4.text = @"Tie";
    }else {
        self.winlose4.text = self.player4sum;
        self.resultwinlose4.text = self.player4sum;
    }
    
    //
    
    if ([[self.SaveData objectForKey:@"player1balance"] length] == 0) {
        self.previous1.text = @"0";
    } else {
        self.previous1.text = [self.SaveData objectForKey:@"player1balance"];
    }
    
    if ([[self.SaveData objectForKey:@"player2balance"] length] == 0) {
        self.previous2.text = @"0";
    } else {
        self.previous2.text = [self.SaveData objectForKey:@"player2balance"];
    }
    
    if ([[self.SaveData objectForKey:@"player3balance"] length] == 0) {
        self.previous3.text = @"0";
    } else {
        self.previous3.text = [self.SaveData objectForKey:@"player3balance"];
    }
    
    if ([[self.SaveData objectForKey:@"player4balance"] length] == 0) {
        self.previous4.text = @"0";
    } else {
        self.previous4.text = [self.SaveData objectForKey:@"player4balance"];
    }
    
    //
    
    int total1 = self.previous1.text.intValue + self.player1sum.intValue;
    if (total1 > 0) {
        self.balance1.text = [[NSString alloc] initWithFormat:@"%@%i",@"+",total1];
    } else {
        self.balance1.text = [[NSString alloc] initWithFormat:@"%i",total1];
    }
    
    int total2 = self.previous2.text.intValue + self.player2sum.intValue;
    if (total2 > 0) {
        self.balance2.text = [[NSString alloc] initWithFormat:@"%@%i",@"+",total2];
    } else {
        self.balance2.text = [[NSString alloc] initWithFormat:@"%i",total2];
    }
    
    int total3 = self.previous3.text.intValue + self.player3sum.intValue;
    if (total3 > 0) {
        self.balance3.text = [[NSString alloc] initWithFormat:@"%@%i",@"+",total3];
    } else {
        self.balance3.text = [[NSString alloc] initWithFormat:@"%i",total3];
    }
    
    int total4 = self.previous4.text.intValue + self.player4sum.intValue;
    if (total4 > 0) {
        self.balance4.text = [[NSString alloc] initWithFormat:@"%@%i",@"+",total4];
    } else {
        self.balance4.text = [[NSString alloc] initWithFormat:@"%i",total4];
    }
    
    //
    
    int balance = 0 - (self.player1sum.intValue + self.player2sum.intValue + self.player3sum.intValue + self.player4sum.intValue);
    
    if (balance > 0) {
        self.dealerwinlose.text = [[NSString alloc] initWithFormat:@"%@%i",@"+",balance];
    } else {
        self.dealerwinlose.text = [[NSString alloc] initWithFormat:@"%i",balance];
    }
    
    int total0 = [[self.SaveData objectForKey:@"dealerbalance"] intValue] + balance;
    if (total0 > 0) {
        self.dealerbalance.text = [[NSString alloc] initWithFormat:@"%@%i",@"+",total0];
        self.dealerbalance1.text = [[NSString alloc] initWithFormat:@"%@%i",@"+",total0];
    } else {
        self.dealerbalance.text = [[NSString alloc] initWithFormat:@"%i",total0];
        self.dealerbalance1.text = [[NSString alloc] initWithFormat:@"%i",total0];
    }
    
    //
    
    [self.SaveData setObject:self.dealerbalance.text forKey:@"dealerbalance"];
    [self.SaveData setObject:self.balance1.text forKey:@"player1balance"];
    [self.SaveData setObject:self.balance2.text  forKey:@"player2balance"];
    [self.SaveData setObject:self.balance3.text  forKey:@"player3balance"];
    [self.SaveData setObject:self.balance4.text  forKey:@"player4balance"];
    [self.SaveData synchronize];

}

@end
