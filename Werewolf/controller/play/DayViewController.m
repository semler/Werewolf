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
#import "voteManager.h"

@interface DayViewController ()

@property (strong, nonatomic) IBOutletCollection (UIButton) NSArray *playerButtons;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *discussButton;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)discussButtonPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

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
            imageView = [[UIImageView alloc] initWithFrame:imageView.frame];
            UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
            imageView.image = image;
            [self.view addSubview:imageView];
        } else if (player.isAttacked) {
            imageView = [[UIImageView alloc] initWithFrame:imageView.frame];
            UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
            imageView.image = image;
            [self.view addSubview:imageView];
        }
    }
    
    if (!self.discussFlg) {
        self.discussButton.enabled = YES;
        self.okButton.enabled = NO;
        self.commentLabel.text = @"朝になりました、議論開始";
    } else {
        self.discussButton.enabled = NO;
        self.okButton.enabled = YES;
        self.commentLabel.text = @"議論終了、投票してください";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        }
    }
}

- (IBAction)discussButtonPressed:(id)sender {
    self.discussFlg = YES;
    
    AlermViewController *controller = [[AlermViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)okButtonPressed:(id)sender {
    
    if ([[VoteManager sharedManager] banish]) {
        if ([[GameStatus sharedManager] gameOverJudge]) {
            [self performSegueWithIdentifier:@"gameOver" sender:self];
        } else {
            [self performSegueWithIdentifier:@"toResult" sender:self];
        }
    } else {
        NSString *players = [[VoteManager sharedManager].playerArray componentsJoinedByString:@","];
        self.commentLabel.text = [NSString stringWithFormat:@"%@の得票数が同じ", players];
        for (UIButton *button in self.playerButtons) {
            button.enabled = YES;
        }
        [[PlayerManager sharedManager] resetVote];
    }
    
    [[PlayerManager sharedManager] resetVote];
}
@end
