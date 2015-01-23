//
//  VillagerViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/15.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "VillagerViewController.h"

@interface VillagerViewController ()

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation VillagerViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].currentTurn == 0) {
        self.commentLabel.text = @"役職確認";
        self.positionText.text = @"村人は特殊な能力を持たないただの一般人ですが、このゲームの主人公でもあります。\n他の村人や、特殊能力を持った仲間たちと協力して人狼を処刑し、全滅させましょう。\nもしかするとあなたの1票が、村の命運を大きく左右することになるかも知れません。";
    } else if ([GameStatus sharedManager].currentTurn == 1) {
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = @"寝ています";
        self.positionText.text = @"村人は特殊な能力を持たないただの一般人ですが、このゲームの主人公でもあります。\n他の村人や、特殊能力を持った仲間たちと協力して人狼を処刑し、全滅させましょう。\nもしかするとあなたの1票が、村の命運を大きく左右することになるかも知れません。";
        self.subView.hidden = YES;
        self.okButton.enabled = YES;
        self.positionText.hidden = NO;
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
