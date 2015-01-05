//
//  BodyguardViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "BodyguardViewController.h"

@interface BodyguardViewController ()

@property (nonatomic) long guard;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation BodyguardViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].currentTurn == 0) {
        self.commentLabel.text = @"ボディガードです!";
    } else if ([GameStatus sharedManager].currentTurn == 1) {
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = @"ボディガードです!";
        self.subView.hidden = YES;
        self.okButton.enabled = YES;
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
        self.commentLabel.text = [NSString stringWithFormat:@"Player%ldを守る", button.tag + 1];
        self.okButton.enabled = YES;
        self.guard = button.tag;
    }
}

- (IBAction)okButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:self.vote];
        player.voteCount ++;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        [[VoteManager sharedManager] resetGuard];
        if (![[VoteManager sharedManager] guard:self.guard]) {
            self.commentLabel.text = @"他のプレイヤーを選んでください！";
            return;
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
