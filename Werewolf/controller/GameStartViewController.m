//
//  ViewController.m
//  Werewolf
//
//  Created by semler on 14-12-2.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "GameStartViewController.h"
#import "GameStatus.h"
#import "PlayerManager.h"

@interface GameStartViewController ()

@property (nonatomic) int playerCount;
@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;

- (IBAction)minusButtonPressed:(id)sender;
- (IBAction)plusButtonPressed:(id)sender;
- (IBAction)startButtonPressed:(id)sender;

@end

@implementation GameStartViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[PlayerManager sharedManager] reset];
    self.playerCount = 5;
    [self updateLabel];
    // ナビゲーションバー非表示
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // タブバー非表示
    if([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]){
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    }
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)minusButtonPressed:(id)sender {
    if (self.playerCount > 5) {
        self.playerCount --;
    }
    [self updateLabel];
}

- (IBAction)plusButtonPressed:(id)sender {
    if (self.playerCount < 11) {
        self.playerCount ++;
    }
    [self updateLabel];
}

- (void) updateLabel {
    self.playerLabel.text = [NSString stringWithFormat:@"%d", self.playerCount];
    if (self.playerCount == 5) {
        self.minusButton.enabled = NO;
        self.plusButton.enabled = YES;
    } else if (self.playerCount == 11) {
        self.minusButton.enabled = YES;
        self.plusButton.enabled = NO;
    } else {
        self.minusButton.enabled = YES;
        self.plusButton.enabled = YES;
    }
}

- (IBAction)startButtonPressed:(id)sender {
    
    [GameStatus sharedManager].playerCount = self.playerCount;
    [GameStatus sharedManager].alivePlayerCount = self.playerCount;
    [self performSegueWithIdentifier:@"toPlayerSetting" sender:self];
    
}
@end
