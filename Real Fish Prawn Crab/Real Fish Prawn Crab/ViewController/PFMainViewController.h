//
//  PFMainViewController.h
//  Real Fish Prawn Crab
//
//  Created by issrapong wongyai on 9/15/2557 BE.
//  Copyright (c) 2557 platwo fusion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFMainViewController : UIViewController

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
@property (strong, nonatomic) IBOutlet UIImageView *diceImg1;
@property (strong, nonatomic) IBOutlet UIImageView *diceImg2;
@property (strong, nonatomic) IBOutlet UIImageView *diceImg3;
- (IBAction)resultTapped:(id)sender;

@end
