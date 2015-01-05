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

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation WerewolfViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].currentTurn == 0) {
        self.commentLabel.text = @"人狼です!";
    } else if ([GameStatus sharedManager].currentTurn == 1) {
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = @"襲撃したいプレイヤーを選んでください";
        self.subView.hidden = NO;
        self.okButton.enabled = NO;
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
        self.vote = 1;
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
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
