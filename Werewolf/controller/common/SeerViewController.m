//
//  SeerViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "SeerViewController.h"

@interface SeerViewController ()

@property (nonatomic) BOOL seeFlg;
@property (nonatomic) long see;

@property (weak, nonatomic) IBOutlet UIButton *seeButton;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)seeButtonPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation SeerViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].currentTurn == 0) {
        self.commentLabel.text = @"役職確認";
        self.positionText.text = @"予言者は毎晩目を覚まし、自分が人狼だと疑っている人物を1人指定してその人物が人狼かそうでないかを司会者から教えてもらえます。\n人狼を見つけることが出来ればぐっと有利になれますが、その能力ゆえ人狼に襲われやすい役職でもあるのです。";
    } else if ([GameStatus sharedManager].currentTurn == 1) {
        self.seeButton.enabled = NO;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = @"予言したプレイヤーの画像を押してください。";
        self.subView.hidden = NO;
        self.seeButton.enabled = YES;
        self.okButton.enabled = NO;
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
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player%ldを予言", button.tag + 1];
        if (!self.seeFlg) {
            self.seeButton.enabled = YES;
        }
        self.see = button.tag;
    }
}

- (IBAction)okButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:self.vote];
        player.voteCount ++;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)seeButtonPressed:(id)sender {
    Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:self.see];
    
    if (player.position == 1) {
        self.commentLabel.text = @"人狼です！";
    } else {
        self.commentLabel.text = @"人間です！";
    }
    
    self.seeButton.enabled = NO;
    self.okButton.enabled = YES;
    self.seeFlg = YES;
}
@end
