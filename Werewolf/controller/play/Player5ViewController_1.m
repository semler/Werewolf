//
//  Player5ViewController_1.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "Player5ViewController_1.h"
#import "PlayerManager.h"
#import "GameStatus.h"
#import "AlermViewController.h"
#import "VillagerViewController.h"
#import "WerewolfViewController.h"
#import "SeerViewController.h"
#import "BodyguardViewController.h"
#import "MadmanViewController.h"
#import "voteManager.h"

@interface Player5ViewController_1 ()

@property (weak, nonatomic) IBOutlet UIButton *player1Button;
@property (weak, nonatomic) IBOutlet UIButton *player2Button;
@property (weak, nonatomic) IBOutlet UIButton *player3Button;
@property (weak, nonatomic) IBOutlet UIButton *player4Button;
@property (weak, nonatomic) IBOutlet UIButton *player5Button;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *discussButton;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

- (IBAction)player1ButtonPressed:(id)sender;
- (IBAction)player2ButtonPressed:(id)sender;
- (IBAction)player3ButtonPressed:(id)sender;
- (IBAction)player4ButtonPressed:(id)sender;
- (IBAction)player5ButtonPressed:(id)sender;
- (IBAction)discussButtonPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@property (nonatomic) BOOL discussFlg;

@end

@implementation Player5ViewController_1

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [GameStatus sharedManager].currentTurn = 1;
    
    [self.player1Button setImage:[PlayerManager sharedManager].player1.image forState:UIControlStateNormal];
    [self.player2Button setImage:[PlayerManager sharedManager].player2.image forState:UIControlStateNormal];
    [self.player3Button setImage:[PlayerManager sharedManager].player3.image forState:UIControlStateNormal];
    [self.player4Button setImage:[PlayerManager sharedManager].player4.image forState:UIControlStateNormal];
    [self.player5Button setImage:[PlayerManager sharedManager].player5.image forState:UIControlStateNormal];
    
    if (!self.discussFlg) {
        self.discussButton.enabled = YES;
        self.okButton.enabled = NO;
        self.commentLabel.text = @"朝になりました、議論開始";
    } else {
        self.discussButton.enabled = NO;
        self.okButton.enabled = YES;
        self.commentLabel.text = @"議論終了、投票してください";
    }
    
    [self setImage];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)player1ButtonPressed:(id)sender {
    if (self.discussFlg) {
        [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player1;
        self.player1Button.enabled = NO;
        
        if ([PlayerManager sharedManager].player1.position == 0) {
            VillagerViewController *controller = [[VillagerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player1.position == 1) {
            WerewolfViewController *controller = [[WerewolfViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player1.position == 2) {
            SeerViewController *controller = [[SeerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player1.position == 3) {
            BodyguardViewController *controller = [[BodyguardViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player1.position == 4) {
            MadmanViewController *controller = [[MadmanViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
}

- (IBAction)player2ButtonPressed:(id)sender {
    if (self.discussFlg) {
        [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player2;
        self.player2Button.enabled = NO;
        
        if ([PlayerManager sharedManager].player2.position == 0) {
            VillagerViewController *controller = [[VillagerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player2.position == 1) {
            WerewolfViewController *controller = [[WerewolfViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player2.position == 2) {
            SeerViewController *controller = [[SeerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player2.position == 3) {
            BodyguardViewController *controller = [[BodyguardViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player2.position == 4) {
            MadmanViewController *controller = [[MadmanViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
}

- (IBAction)player3ButtonPressed:(id)sender {
    if (self.discussFlg) {
        [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player3;
        self.player3Button.enabled = NO;
        
        if ([PlayerManager sharedManager].player3.position == 0) {
            VillagerViewController *controller = [[VillagerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player3.position == 1) {
            WerewolfViewController *controller = [[WerewolfViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player3.position == 2) {
            SeerViewController *controller = [[SeerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player3.position == 3) {
            BodyguardViewController *controller = [[BodyguardViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player3.position == 4) {
            MadmanViewController *controller = [[MadmanViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
}

- (IBAction)player4ButtonPressed:(id)sender {
    if (self.discussFlg) {
        [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player4;
        self.player4Button.enabled = NO;
        
        if ([PlayerManager sharedManager].player4.position == 0) {
            VillagerViewController *controller = [[VillagerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player4.position == 1) {
            WerewolfViewController *controller = [[WerewolfViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player4.position == 2) {
            SeerViewController *controller = [[SeerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player4.position == 3) {
            BodyguardViewController *controller = [[BodyguardViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player4.position == 4) {
            MadmanViewController *controller = [[MadmanViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
}

- (IBAction)player5ButtonPressed:(id)sender {
    if (self.discussFlg) {
        [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player5;
        self.player5Button.enabled = NO;
        
        if ([PlayerManager sharedManager].player5.position == 0) {
            VillagerViewController *controller = [[VillagerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player5.position == 1) {
            WerewolfViewController *controller = [[WerewolfViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player5.position == 2) {
            SeerViewController *controller = [[SeerViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player5.position == 3) {
            BodyguardViewController *controller = [[BodyguardViewController alloc] init];
            [self presentViewController:controller animated:YES completion:nil];
        } else if ([PlayerManager sharedManager].player5.position == 4) {
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
        if ([[VoteManager sharedManager] gameOverJudge]) {
            [self performSegueWithIdentifier:@"gameOver" sender:self];
        } else {
            [self performSegueWithIdentifier:@"toResult" sender:self];
        }
    } else {
        NSString *players = [[VoteManager sharedManager].playerArray componentsJoinedByString:@","];
        self.commentLabel.text = [NSString stringWithFormat:@"%@の得票数が同じ", players];
        self.player1Button.enabled = YES;
        self.player2Button.enabled = YES;
        self.player3Button.enabled = YES;
        self.player4Button.enabled = YES;
        self.player5Button.enabled = YES;
        [[VoteManager sharedManager] reset];
    }
    
    [[VoteManager sharedManager] reset];
}

- (void) setImage {
    if ([PlayerManager sharedManager].player1.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player1Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player1Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player2.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player2Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player2Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player3.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player3Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player3Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player4.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player4Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player4Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player5.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player5Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player5Button.enabled = NO;
    }
    
    if ([PlayerManager sharedManager].player1.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player1Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player1Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player2.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player2Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player2Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player3.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player3Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player3Button.enabled = NO;
    } else if ([PlayerManager sharedManager].player4.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player4Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player4Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player5.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player5Button.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player5Button.enabled = NO;
    }
}
@end
