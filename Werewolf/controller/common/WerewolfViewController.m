//
//  WerewolfViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "WerewolfViewController.h"
#import "GameStatus.h"
#import "PlayerManager.h"

@interface WerewolfViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@property (weak, nonatomic) IBOutlet UILabel *comentLabel;

@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIButton *player1Button;
@property (weak, nonatomic) IBOutlet UIButton *player2Button;
@property (weak, nonatomic) IBOutlet UIButton *player3Button;
@property (weak, nonatomic) IBOutlet UIButton *player4Button;
@property (weak, nonatomic) IBOutlet UIButton *player5Button;
@property (weak, nonatomic) IBOutlet UIButton *player6Button;
@property (weak, nonatomic) IBOutlet UIButton *player7Button;
@property (weak, nonatomic) IBOutlet UIButton *player8Button;
@property (weak, nonatomic) IBOutlet UIButton *player9Button;
@property (weak, nonatomic) IBOutlet UIButton *player10Button;
@property (weak, nonatomic) IBOutlet UIButton *player11Button;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

@property (weak, nonatomic) Player *player;
@property (nonatomic) int vote;

- (IBAction)player1ButtonPressed:(id)sender;
- (IBAction)player2ButtonPressed:(id)sender;
- (IBAction)player3ButtonPressed:(id)sender;
- (IBAction)player4ButtonPressed:(id)sender;
- (IBAction)player5ButtonPressed:(id)sender;
- (IBAction)player6ButtonPressed:(id)sender;
- (IBAction)player7ButtonPressed:(id)sender;
- (IBAction)player8ButtonPressed:(id)sender;
- (IBAction)player9ButtonPressed:(id)sender;
- (IBAction)player10ButtonPressed:(id)sender;
- (IBAction)player11ButtonPressed:(id)sender;

- (IBAction)okButtonPressed:(id)sender;

@end

@implementation WerewolfViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.player = [GameStatus sharedManager].currentPlayer;
    // player画像設定
    self.playerImage.image = self.player.image;
    
    if ([GameStatus sharedManager].playerCount == 5) {
        
        if ([GameStatus sharedManager].currentTurn == 0) {
            self.comentLabel.text = @"人狼です";
            self.subView.hidden = YES;
            self.okButton.enabled = YES;
        } else {
            self.comentLabel.text = @"投票してください";
            self.subView.hidden = NO;
            self.okButton.enabled = NO;
            [self.player1Button setImage:[PlayerManager sharedManager].player1.image forState:UIControlStateNormal];
            [self.player2Button setImage:[PlayerManager sharedManager].player2.image forState:UIControlStateNormal];
            [self.player3Button setImage:[PlayerManager sharedManager].player3.image forState:UIControlStateNormal];
            [self.player4Button setImage:[PlayerManager sharedManager].player4.image forState:UIControlStateNormal];
            [self.player5Button setImage:[PlayerManager sharedManager].player5.image forState:UIControlStateNormal];
            if (self.player.playerNum != [PlayerManager sharedManager].player1.playerNum) {
                [self.player1Button setEnabled:YES];
            } else {
                [self.player1Button setEnabled:NO];
                self.player1Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player2.playerNum) {
                [self.player2Button setEnabled:YES];
            } else {
                [self.player2Button setEnabled:NO];
                self.player2Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player3.playerNum) {
                [self.player3Button setEnabled:YES];
            } else {
                [self.player3Button setEnabled:NO];
                self.player3Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player4.playerNum) {
                [self.player4Button setEnabled:YES];
            } else {
                [self.player4Button setEnabled:NO];
                self.player4Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player5.playerNum) {
                [self.player5Button setEnabled:YES];
            } else {
                [self.player5Button setEnabled:NO];
                self.player5Button.alpha = 0.5;
            }
            self.player6Button.alpha = 0.5;
            self.player7Button.alpha = 0.5;
            self.player8Button.alpha = 0.5;
            self.player9Button.alpha = 0.5;
            self.player10Button.alpha = 0.5;
            self.player11Button.alpha = 0.5;
            [self.player6Button setEnabled:NO];
            [self.player7Button setEnabled:NO];
            [self.player8Button setEnabled:NO];
            [self.player9Button setEnabled:NO];
            [self.player10Button setEnabled:NO];
            [self.player11Button setEnabled:NO];
            
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)player1ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player1に投票"];
    self.okButton.enabled = YES;
    self.vote = 1;
}

- (IBAction)player2ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player2に投票"];
    self.okButton.enabled = YES;
    self.vote = 2;
}

- (IBAction)player3ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player3に投票"];
    self.okButton.enabled = YES;
    self.vote = 3;
}

- (IBAction)player4ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player4に投票"];
    self.okButton.enabled = YES;
    self.vote = 4;
}

- (IBAction)player5ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player5に投票"];
    self.okButton.enabled = YES;
    self.vote = 5;
}

- (IBAction)player6ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player6に投票"];
    self.okButton.enabled = YES;
    self.vote = 6;
}

- (IBAction)player7ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player7に投票"];
    self.okButton.enabled = YES;
    self.vote = 7;
}

- (IBAction)player8ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player8に投票"];
    self.okButton.enabled = YES;
    self.vote = 8;
}

- (IBAction)player9ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player9に投票"];
    self.okButton.enabled = YES;
    self.vote = 9;
}

- (IBAction)player10ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player10に投票"];
    self.okButton.enabled = YES;
    self.vote = 10;
}

- (IBAction)player11ButtonPressed:(id)sender {
    self.comentLabel.text = [NSString stringWithFormat:@"Player11に投票"];
    self.okButton.enabled = YES;
    self.vote = 11;
}

- (IBAction)okButtonPressed:(id)sender {
    self.player.voteTo = self.vote;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
