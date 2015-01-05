//
//  MadmanViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "MadmanViewController.h"
#import "GameStatus.h"
#import "PlayerManager.h"

@interface MadmanViewController ()

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation MadmanViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].currentTurn == 0) {
        self.commentLabel.text = @"狂人です!";
    } else if ([GameStatus sharedManager].currentTurn == 1) {
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = @"狂人です!";
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
