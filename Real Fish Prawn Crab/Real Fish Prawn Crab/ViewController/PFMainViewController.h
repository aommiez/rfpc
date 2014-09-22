//
//  PFMainViewController.h
//  Real Fish Prawn Crab
//
//  Created by issrapong wongyai on 9/15/2557 BE.
//  Copyright (c) 2557 platwo fusion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PFMainViewController : UIViewController <AVAudioPlayerDelegate>

//audio
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) AVAudioPlayer *audioshakePlayer;

//mainView
@property (strong, nonatomic) IBOutlet UIView *loadingView;

//mainView
@property (strong, nonatomic) IBOutlet UIView *mianView;
@property (strong, nonatomic) IBOutlet UIImageView *maindiceImg1;
@property (strong, nonatomic) IBOutlet UIImageView *maindiceImg2;
@property (strong, nonatomic) IBOutlet UIImageView *maindiceImg3;
- (IBAction)mainTapped:(id)sender;

//image board
@property (strong, nonatomic) IBOutlet UIImageView *boardImg1;
@property (strong, nonatomic) IBOutlet UIImageView *boardImg2;
@property (strong, nonatomic) IBOutlet UIImageView *boardImg3;
@property (strong, nonatomic) IBOutlet UIImageView *boardImg4;
@property (strong, nonatomic) IBOutlet UIImageView *boardImg5;
@property (strong, nonatomic) IBOutlet UIImageView *boardImg6;

//
@property (strong, nonatomic) IBOutlet NSString *dice1;
@property (strong, nonatomic) IBOutlet NSString *dice2;
@property (strong, nonatomic) IBOutlet NSString *dice3;

@property (strong, nonatomic) IBOutlet NSString *showdice1;
@property (strong, nonatomic) IBOutlet NSString *showdice2;
@property (strong, nonatomic) IBOutlet NSString *showdice3;

@property (strong, nonatomic) IBOutlet NSString *checkLog;

- (IBAction)diceTapped:(id)sender;
- (IBAction)LogdiceTapped:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *coinLock;

@property (strong, nonatomic) IBOutlet UIView *border1;
@property (strong, nonatomic) IBOutlet UIView *border2;
@property (strong, nonatomic) IBOutlet UIView *border3;
@property (strong, nonatomic) IBOutlet UIView *border4;

//เขย่า
@property (strong, nonatomic) IBOutlet UIView *shakeView;
- (IBAction)closeshakeTapped:(id)sender;

@property (strong, nonatomic) IBOutlet NSString *checkshake;

//เดิมพัน
@property (strong, nonatomic) IBOutlet UIView *gambleView;
- (IBAction)gambleTapped:(id)sender;

//ดูผลลัพธ์
@property (strong, nonatomic) IBOutlet UIView *resultView;
@property (strong, nonatomic) IBOutlet UIImageView *showdiceImg1;
@property (strong, nonatomic) IBOutlet UIImageView *showdiceImg2;
@property (strong, nonatomic) IBOutlet UIImageView *showdiceImg3;
@property (strong, nonatomic) IBOutlet UIImageView *diceImg1;
@property (strong, nonatomic) IBOutlet UIImageView *diceImg2;
@property (strong, nonatomic) IBOutlet UIImageView *diceImg3;
- (IBAction)resultTapped:(id)sender;

//button board
- (IBAction)boardBt1Tapped:(id)sender;
- (IBAction)boardBt2Tapped:(id)sender;
- (IBAction)boardBt3Tapped:(id)sender;
- (IBAction)boardBt4Tapped:(id)sender;
- (IBAction)boardBt5Tapped:(id)sender;
- (IBAction)boardBt6Tapped:(id)sender;

//check player
@property (strong, nonatomic) IBOutlet NSString *playercheck;

//player1
@property (strong, nonatomic) IBOutlet NSString *player1sum;
@property (strong, nonatomic) IBOutlet NSString *totalbet1sum;

@property (strong, nonatomic) IBOutlet UILabel *board1Txt1;
@property (strong, nonatomic) IBOutlet UILabel *board2Txt1;
@property (strong, nonatomic) IBOutlet UILabel *board3Txt1;
@property (strong, nonatomic) IBOutlet UILabel *board4Txt1;
@property (strong, nonatomic) IBOutlet UILabel *board5Txt1;
@property (strong, nonatomic) IBOutlet UILabel *board6Txt1;

@property (strong, nonatomic) IBOutlet UILabel *previous1;
@property (strong, nonatomic) IBOutlet UILabel *winlose1;
@property (strong, nonatomic) IBOutlet UILabel *balance1;

@property (strong, nonatomic) IBOutlet UILabel *resultwinlose1;

@property (strong, nonatomic) IBOutlet UILabel *totalbet1;
@property (strong, nonatomic) IBOutlet UILabel *balancegamble1;

@property (strong, nonatomic) IBOutlet UIButton *coin501;
@property (strong, nonatomic) IBOutlet UIButton *coin101;
@property (strong, nonatomic) IBOutlet UIButton *coin51;
@property (strong, nonatomic) IBOutlet UIButton *coin11;

- (IBAction)clear1Tapped:(id)sender;

- (IBAction)coin501Tapped:(id)sender;
- (IBAction)coin101Tapped:(id)sender;
- (IBAction)coin51Tapped:(id)sender;
- (IBAction)coin11Tapped:(id)sender;

//player2
@property (strong, nonatomic) IBOutlet NSString *player2sum;
@property (strong, nonatomic) IBOutlet NSString *totalbet2sum;

@property (strong, nonatomic) IBOutlet UILabel *board1Txt2;
@property (strong, nonatomic) IBOutlet UILabel *board2Txt2;
@property (strong, nonatomic) IBOutlet UILabel *board3Txt2;
@property (strong, nonatomic) IBOutlet UILabel *board4Txt2;
@property (strong, nonatomic) IBOutlet UILabel *board5Txt2;
@property (strong, nonatomic) IBOutlet UILabel *board6Txt2;

@property (strong, nonatomic) IBOutlet UILabel *previous2;
@property (strong, nonatomic) IBOutlet UILabel *winlose2;
@property (strong, nonatomic) IBOutlet UILabel *balance2;

@property (strong, nonatomic) IBOutlet UILabel *resultwinlose2;

@property (strong, nonatomic) IBOutlet UILabel *totalbet2;
@property (strong, nonatomic) IBOutlet UILabel *balancegamble2;

@property (strong, nonatomic) IBOutlet UIButton *coin502;
@property (strong, nonatomic) IBOutlet UIButton *coin102;
@property (strong, nonatomic) IBOutlet UIButton *coin52;
@property (strong, nonatomic) IBOutlet UIButton *coin12;

- (IBAction)clear2Tapped:(id)sender;

- (IBAction)coin502Tapped:(id)sender;
- (IBAction)coin102Tapped:(id)sender;
- (IBAction)coin52Tapped:(id)sender;
- (IBAction)coin12Tapped:(id)sender;

//player3
@property (strong, nonatomic) IBOutlet NSString *player3sum;
@property (strong, nonatomic) IBOutlet NSString *totalbet3sum;

@property (strong, nonatomic) IBOutlet UILabel *board1Txt3;
@property (strong, nonatomic) IBOutlet UILabel *board2Txt3;
@property (strong, nonatomic) IBOutlet UILabel *board3Txt3;
@property (strong, nonatomic) IBOutlet UILabel *board4Txt3;
@property (strong, nonatomic) IBOutlet UILabel *board5Txt3;
@property (strong, nonatomic) IBOutlet UILabel *board6Txt3;

@property (strong, nonatomic) IBOutlet UILabel *previous3;
@property (strong, nonatomic) IBOutlet UILabel *winlose3;
@property (strong, nonatomic) IBOutlet UILabel *balance3;

@property (strong, nonatomic) IBOutlet UILabel *resultwinlose3;

@property (strong, nonatomic) IBOutlet UILabel *totalbet3;
@property (strong, nonatomic) IBOutlet UILabel *balancegamble3;

@property (strong, nonatomic) IBOutlet UIButton *coin503;
@property (strong, nonatomic) IBOutlet UIButton *coin103;
@property (strong, nonatomic) IBOutlet UIButton *coin53;
@property (strong, nonatomic) IBOutlet UIButton *coin13;

- (IBAction)clear3Tapped:(id)sender;

- (IBAction)coin503Tapped:(id)sender;
- (IBAction)coin103Tapped:(id)sender;
- (IBAction)coin53Tapped:(id)sender;
- (IBAction)coin13Tapped:(id)sender;

//player4
@property (strong, nonatomic) IBOutlet NSString *player4sum;
@property (strong, nonatomic) IBOutlet NSString *totalbet4sum;

@property (strong, nonatomic) IBOutlet UILabel *board1Txt4;
@property (strong, nonatomic) IBOutlet UILabel *board2Txt4;
@property (strong, nonatomic) IBOutlet UILabel *board3Txt4;
@property (strong, nonatomic) IBOutlet UILabel *board4Txt4;
@property (strong, nonatomic) IBOutlet UILabel *board5Txt4;
@property (strong, nonatomic) IBOutlet UILabel *board6Txt4;

@property (strong, nonatomic) IBOutlet UILabel *previous4;
@property (strong, nonatomic) IBOutlet UILabel *winlose4;
@property (strong, nonatomic) IBOutlet UILabel *balance4;

@property (strong, nonatomic) IBOutlet UILabel *resultwinlose4;

@property (strong, nonatomic) IBOutlet UILabel *totalbet4;
@property (strong, nonatomic) IBOutlet UILabel *balancegamble4;

@property (strong, nonatomic) IBOutlet UIButton *coin504;
@property (strong, nonatomic) IBOutlet UIButton *coin104;
@property (strong, nonatomic) IBOutlet UIButton *coin54;
@property (strong, nonatomic) IBOutlet UIButton *coin14;

- (IBAction)clear4Tapped:(id)sender;

- (IBAction)coin504Tapped:(id)sender;
- (IBAction)coin104Tapped:(id)sender;
- (IBAction)coin54Tapped:(id)sender;
- (IBAction)coin14Tapped:(id)sender;

//dealer
@property NSUserDefaults *SaveData;

@property (strong, nonatomic) IBOutlet NSString *dealersum;

@property (strong, nonatomic) IBOutlet UILabel *dealerwinlose;
@property (strong, nonatomic) IBOutlet UILabel *dealerbalance;
@property (strong, nonatomic) IBOutlet UILabel *dealerbalance1;


@end
