//
//  MediumViewController.m
//  Werewolf
//
//  Created by semler on 15/1/11.
//  Copyright (c) 2015年 semler. All rights reserved.
//

#import "MediumViewController.h"

@interface MediumViewController ()

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation MediumViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].currentTurn == 0) {
        self.commentLabel.text = @"役職確認";
        self.positionText.text = @"霊媒師は毎晩目を覚まし、その日の昼のターン処刑によって殺された人物が人狼だったのかそうでなかったのかを、司会者から教えてもらえます。\n昼のターンに処刑された人物の本性を知ることができるのは、霊の声が聞けるあなたしかいないのです。";
    } else if ([GameStatus sharedManager].currentTurn == 1) {
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        Player *player = [VoteManager sharedManager].lastDead;
        if (player.position == 1) {
            self.commentLabel.text = @"昼追放されたのは人狼です！";
        } else {
            self.commentLabel.text = @"昼追放されたのは人間です！";
        }
        self.subView.hidden = YES;
        self.okButton.enabled = YES;
        self.positionText.hidden = YES;
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
    }
}

- (IBAction)okButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:self.vote];
        player.voteCount ++;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
