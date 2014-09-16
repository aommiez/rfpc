//
//  PFMainViewController.h
//  Real Fish Prawn Crab
//
//  Created by issrapong wongyai on 9/15/2557 BE.
//  Copyright (c) 2557 platwo fusion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFMainViewController : UIViewController

@property (strong, nonatomic) IBOutlet NSString *dice1;
@property (strong, nonatomic) IBOutlet NSString *dice2;
@property (strong, nonatomic) IBOutlet NSString *dice3;

@property (strong, nonatomic) IBOutlet NSString *showdice1;
@property (strong, nonatomic) IBOutlet NSString *showdice2;
@property (strong, nonatomic) IBOutlet NSString *showdice3;

@property (strong, nonatomic) IBOutlet NSString *checkLog;

- (IBAction)diceTapped:(id)sender;
- (IBAction)LogdiceTapped:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *mainview1;
@property (strong, nonatomic) IBOutlet UIView *mainview2;
@property (strong, nonatomic) IBOutlet UIView *mainview3;
@property (strong, nonatomic) IBOutlet UIView *mainview4;

@property (strong, nonatomic) IBOutlet UIView *player1;
@property (strong, nonatomic) IBOutlet UIView *player2;
@property (strong, nonatomic) IBOutlet UIView *player3;
@property (strong, nonatomic) IBOutlet UIView *player4;

@property (strong, nonatomic) IBOutlet UIView *border1;
@property (strong, nonatomic) IBOutlet UIView *border2;
@property (strong, nonatomic) IBOutlet UIView *border3;
@property (strong, nonatomic) IBOutlet UIView *border4;

@property (strong, nonatomic) IBOutlet UIView *scoreTxt1;
@property (strong, nonatomic) IBOutlet UIView *scoreTxt2;
@property (strong, nonatomic) IBOutlet UIView *scoreTxt3;
@property (strong, nonatomic) IBOutlet UIView *scoreTxt4;

@property (strong, nonatomic) IBOutlet UIView *coinView1;
@property (strong, nonatomic) IBOutlet UIView *coinView2;
@property (strong, nonatomic) IBOutlet UIView *coinView3;
@property (strong, nonatomic) IBOutlet UIView *coinView4;

@end
