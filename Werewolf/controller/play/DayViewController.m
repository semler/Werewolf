//
//  Player5ViewController_1.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "DayViewController.h"
#import "PlayerManager.h"
#import "GameStatus.h"
#import "AlermViewController.h"
#import "VillagerViewController.h"
#import "WerewolfViewController.h"
#import "SeerViewController.h"
#import "BodyguardViewController.h"
#import "MadmanViewController.h"
#import "MediumViewController.h"
#import "voteManager.h"
#import "MarqueeLabel.h"

@interface DayViewController ()

@property (weak, nonatomic) IBOutlet MarqueeLabel *label;

@property (strong, nonatomic) IBOutletCollection (UIButton) NSArray *playerButtons;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *discussButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)discussButtonPressed:(id)sender;
- (IBAction)nextButtonPressed:(id)sender;

@property (nonatomic) BOOL discussFlg;

@end

@implementation DayViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [GameStatus sharedManager].currentTurn = 1;
    
    Player *player;
    for (UIButton *button in self.playerButtons) {
        player = [[PlayerManager sharedManager].playerList objectAtIndex:button.tag];
        [button setImage:player.image forState:UIControlStateNormal];
        
        UIImageView *imageView;
        if (player.isBanished) {
            button.enabled = NO;
            imageView = [[UIImageView alloc] initWithFrame:button.frame];
            UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
            imageView.image = image;
            [self.view addSubview:imageView];
        } else if (player.isAttacked) {
            button.enabled = NO;
            imageView = [[UIImageView alloc] initWithFrame:button.frame];
            UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
            imageView.image = image;
            [self.view addSubview:imageView];
        }
    }
    
    // アニメーションラベル
    self.label.marqueeType = MLContinuous;
    self.label.scrollDuration = 10.0f;
    self.label.fadeLength = 10.0f;
    self.label.trailingBuffer = 30.0f;
    if (!self.discussFlg) {
        self.discussButton.enabled = YES;
        self.nextButton.enabled = NO;
        self.label.text = @"朝になりました。「議論」ボタンを押して、議論してください。";
    } else {
        self.discussButton.enabled = NO;
        self.nextButton.enabled = YES;
        self.label.text = @"議論終了。プレイヤーの画像を押して、投票を行ってください、全員投票が終わったら「次へ」進んでください。";
    }
    
    self.label.userInteractionEnabled = YES; // Don't forget this, otherwise the gesture recognizer will fail (UILabel has this as NO by default)
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pauseTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.label addGestureRecognizer:tapRecognizer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playerButtonsPressed:(id)sender {
    if (self.discussFlg) {
        UIButton *button = (UIButton *)sender;
        Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:button.tag];
        [GameStatus sharedManager].currentPlayer = player;
        button.enabled = NO;
        
        if (player.position == 0) {
            VillagerViewController *controller = [[VillagerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if (player.position == 1) {
            WerewolfViewController *controller = [[WerewolfViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if (player.position == 2) {
            SeerViewController *controller = [[SeerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if (player.position == 3) {
            BodyguardViewController *controller = [[BodyguardViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if (player.position == 4) {
            MadmanViewController *controller = [[MadmanViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if (player.position == 5) {
            MediumViewController *controller = [[MediumViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
}

- (IBAction)discussButtonPressed:(id)sender {
    self.discussFlg = YES;
    
    AlermViewController *controller = [[AlermViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)nextButtonPressed:(id)sender {
    
    if ([[VoteManager sharedManager] banish]) {
        if ([[GameStatus sharedManager] gameOverJudge]) {
            [self performSegueWithIdentifier:@"gameOver" sender:self];
        } else {
            [self performSegueWithIdentifier:@"toResult" sender:self];
        }
    } else {
        NSString *players = [[VoteManager sharedManager].playerArray componentsJoinedByString:@","];
        self.commentLabel.text = [NSString stringWithFormat:@"%@の得票数が同じです。もう一度投票を行ってください。", players];
        for (UIButton *button in self.playerButtons) {
            button.enabled = YES;
        }
        [[PlayerManager sharedManager] resetVote];
    }
    
    [[PlayerManager sharedManager] resetVote];
}

- (void)pauseTap:(UITapGestureRecognizer *)recognizer {
    MarqueeLabel *label = (MarqueeLabel *)recognizer.view;
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (!label.isPaused) {
            [label pauseLabel];
        } else {
            [label unpauseLabel];
        }
    }
}
@end
