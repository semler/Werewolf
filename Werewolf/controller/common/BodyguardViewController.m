//
//  BodyguardViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "BodyguardViewController.h"
#import "GameStatus.h"
#import "PlayerManager.h"

@interface BodyguardViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

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

@implementation BodyguardViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.player = [GameStatus sharedManager].currentPlayer;
    // player画像設定
    self.playerImage.image = self.player.image;
    
    if ([GameStatus sharedManager].playerCount == 5) {
        
        if ([GameStatus sharedManager].currentTurn == 0) {
            self.commentLabel.text = @"ボディガードです";
            self.subView.hidden = YES;
            self.okButton.enabled = YES;
        } else {
            self.commentLabel.text = @"投票してください";
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
}

- (IBAction)player2ButtonPressed:(id)sender {
}

- (IBAction)player3ButtonPressed:(id)sender {
}

- (IBAction)player4ButtonPressed:(id)sender {
}

- (IBAction)player5ButtonPressed:(id)sender {
}

- (IBAction)player6ButtonPressed:(id)sender {
}

- (IBAction)player7ButtonPressed:(id)sender {
}

- (IBAction)player8ButtonPressed:(id)sender {
}

- (IBAction)player9ButtonPressed:(id)sender {
}

- (IBAction)player10ButtonPressed:(id)sender {
}

- (IBAction)player11ButtonPressed:(id)sender {
}

- (IBAction)okButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.player.voteTo = self.vote;
    if (self.vote == 1) {
        [PlayerManager sharedManager].player1.voteCount ++;
    } else if (self.vote == 2) {
        [PlayerManager sharedManager].player2.voteCount ++;
    } else if (self.vote == 3) {
        [PlayerManager sharedManager].player3.voteCount ++;
    } else if (self.vote == 4) {
        [PlayerManager sharedManager].player4.voteCount ++;
    } else if (self.vote == 5) {
        [PlayerManager sharedManager].player5.voteCount ++;
    } else if (self.vote == 6) {
        [PlayerManager sharedManager].player6.voteCount ++;
    } else if (self.vote == 7) {
        [PlayerManager sharedManager].player7.voteCount ++;
    } else if (self.vote == 8) {
        [PlayerManager sharedManager].player8.voteCount ++;
    } else if (self.vote == 9) {
        [PlayerManager sharedManager].player9.voteCount ++;
    } else if (self.vote == 10) {
        [PlayerManager sharedManager].player10.voteCount ++;
    } else if (self.vote == 11) {
        [PlayerManager sharedManager].player11.voteCount ++;
    }
}

@end
