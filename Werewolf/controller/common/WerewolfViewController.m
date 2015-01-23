//
//  WerewolfViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "WerewolfViewController.h"

@interface WerewolfViewController ()

@property (nonatomic) long attack;
@property (nonatomic) NSMutableArray *partner;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation WerewolfViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 仲間探し
    self.partner = [NSMutableArray array];
    if ([GameStatus sharedManager].werewolfCount > 1) {
        for (Player *player in [PlayerManager sharedManager].playerList) {
            if (player.position == 1 && player.playerNum != [GameStatus sharedManager].currentPlayer.playerNum) {
                [self.partner addObject:player];
            }
        }
    }
    
    if ([GameStatus sharedManager].currentTurn == 0) {
        if ([GameStatus sharedManager].werewolfCount == 1) {
            self.commentLabel.text = [NSString stringWithFormat: @"役職確認"];
        } else {
            NSString *partner = [[NSString alloc] init];
            for (Player *player in self.partner) {
                partner = [NSString stringWithFormat: @"%@Player%ld ", partner, player.playerNum + 1];
            }
            self.commentLabel.text = [NSString stringWithFormat: @"役職確認。%@は仲間です！", partner];
        }
        self.positionText.text = @"人狼は毎晩目を覚まし、村の人間を1人ずつ選んで喰い殺していきます。\n人狼同士で協力して人間を喰いつくし、村を全滅させてしまいましょう。\n人狼が正体を見破られないためには、時に予言者などの他の役職を演じて村人たちを欺くことも必要です。";
    } else if ([GameStatus sharedManager].currentTurn == 1) {
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.subView.hidden = NO;
        self.okButton.enabled = NO;
        self.positionText.hidden = YES;
        if ([GameStatus sharedManager].werewolfCount == 1) {    
            self.commentLabel.text = @"襲撃したいプレイヤーの画像を押してください。";
        } else {
            NSString *attack = [[NSString alloc] init];
            for (Player *player in self.partner) {
                if (!player.isBanished && player.attack != 0) {
                    attack = [NSString stringWithFormat: @"%@Player%ld ", attack, player.attack];
                }
            }
            if (attack.length != 0) {
                self.commentLabel.text = [NSString stringWithFormat: @"仲間は %@を襲撃する。", attack];
            } else {
                self.commentLabel.text = @"襲撃したいプレイヤーの画像を押してください。";
            }
            // 仲間のボタンを非活性
            for (UIButton *button in self.playerButtons) {
                for (Player *player in self.partner) {
                    if (button.tag == player.playerNum) {
                        [button setEnabled:NO];
                    }
                }
            }
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

- (IBAction)playerButtonsPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    
    if ([GameStatus sharedManager].currentTurn == 1) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player%ldに投票", button.tag + 1];
        self.okButton.enabled = YES;
        self.vote = button.tag;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player%ldを襲撃", button.tag + 1];
        self.okButton.enabled = YES;
        self.attack = button.tag;
    }
}

- (IBAction)okButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:self.vote];
        player.voteCount ++;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        [VoteManager sharedManager].toAttack = self.attack;
        Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:[GameStatus sharedManager].currentPlayer.playerNum];
        player.attack = self.attack + 1;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
