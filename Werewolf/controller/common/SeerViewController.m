//
//  SeerViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "SeerViewController.h"
#import "GameStatus.h"
#import "PlayerManager.h"
#import "VoteManager.h"

@interface SeerViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIButton *player1Button;
@property (weak, nonatomic) IBOutlet UIButton *player2Button;
@property (weak, nonatomic) IBOutlet UIButton *player3Button;
@property (weak, nonatomic) IBOutlet UIButton *player4Button;
@property (weak, nonatomic) IBOutlet UIButton *player5Button;
@property (weak, nonatomic) IBOutlet UIButton *player6Button;
@property (weak, nonatomic) IBOutlet UIButton *player7Button;
@property (weak, nonatomic) IBOutlet UIButton *player8Button;
@property (weak, nonatomic) IBOutlet UIButton *player9Button;
@property (weak, nonatomic) IBOutlet UIButton *player10Button;
@property (weak, nonatomic) IBOutlet UIButton *player11Button;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UIButton *seeButton;

@property (weak, nonatomic) Player *player;
@property (nonatomic) int vote;
@property (nonatomic) int see;
@property (nonatomic) BOOL seeFlg;

- (IBAction)player1ButtonPressed:(id)sender;
- (IBAction)player2ButtonPressed:(id)sender;
- (IBAction)player3ButtonPressed:(id)sender;
- (IBAction)player4ButtonPressed:(id)sender;
- (IBAction)player5ButtonPressed:(id)sender;
- (IBAction)player6ButtonPressed:(id)sender;
- (IBAction)player7ButtonPressed:(id)sender;
- (IBAction)player8ButtonPressed:(id)sender;
- (IBAction)player9ButtonPressed:(id)sender;
- (IBAction)player10ButtonPressed:(id)sender;
- (IBAction)player11ButtonPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;
- (IBAction)seeButtonPressed:(id)sender;

@end

@implementation SeerViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.player = [GameStatus sharedManager].currentPlayer;
    // player画像設定
    self.playerImage.image = self.player.image;
    
    if ([GameStatus sharedManager].playerCount == 5) {
        
        if ([GameStatus sharedManager].currentTurn == 0) {
            self.commentLabel.text = @"預言者です";
            self.subView.hidden = YES;
            self.okButton.enabled = YES;
            self.seeButton.hidden = YES;
        } else if ([GameStatus sharedManager].currentTurn == 1) {
            self.commentLabel.text = @"投票してください";
            self.subView.hidden = NO;
            self.okButton.enabled = NO;
            self.seeButton.hidden = YES;
            [self.player1Button setImage:[PlayerManager sharedManager].player1.image forState:UIControlStateNormal];
            [self.player2Button setImage:[PlayerManager sharedManager].player2.image forState:UIControlStateNormal];
            [self.player3Button setImage:[PlayerManager sharedManager].player3.image forState:UIControlStateNormal];
            [self.player4Button setImage:[PlayerManager sharedManager].player4.image forState:UIControlStateNormal];
            [self.player5Button setImage:[PlayerManager sharedManager].player5.image forState:UIControlStateNormal];
            if (self.player.playerNum != [PlayerManager sharedManager].player1.playerNum) {
                [self.player1Button setEnabled:YES];
            } else {
                [self.player1Button setEnabled:NO];
                self.player1Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player2.playerNum) {
                [self.player2Button setEnabled:YES];
            } else {
                [self.player2Button setEnabled:NO];
                self.player2Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player3.playerNum) {
                [self.player3Button setEnabled:YES];
            } else {
                [self.player3Button setEnabled:NO];
                self.player3Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player4.playerNum) {
                [self.player4Button setEnabled:YES];
            } else {
                [self.player4Button setEnabled:NO];
                self.player4Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player5.playerNum) {
                [self.player5Button setEnabled:YES];
            } else {
                [self.player5Button setEnabled:NO];
                self.player5Button.alpha = 0.5;
            }
            self.player6Button.alpha = 0.5;
            self.player7Button.alpha = 0.5;
            self.player8Button.alpha = 0.5;
            self.player9Button.alpha = 0.5;
            self.player10Button.alpha = 0.5;
            self.player11Button.alpha = 0.5;
            [self.player6Button setEnabled:NO];
            [self.player7Button setEnabled:NO];
            [self.player8Button setEnabled:NO];
            [self.player9Button setEnabled:NO];
            [self.player10Button setEnabled:NO];
            [self.player11Button setEnabled:NO];
            [self setImage];
        } else if ([GameStatus sharedManager].currentTurn == 2) {
            self.commentLabel.text = @"予言したいプレイヤーを選んでください";
            self.subView.hidden = NO;
            self.okButton.enabled = NO;
            self.seeButton.hidden = NO;
            self.seeButton.enabled = NO;
            [self.player1Button setImage:[PlayerManager sharedManager].player1.image forState:UIControlStateNormal];
            [self.player2Button setImage:[PlayerManager sharedManager].player2.image forState:UIControlStateNormal];
            [self.player3Button setImage:[PlayerManager sharedManager].player3.image forState:UIControlStateNormal];
            [self.player4Button setImage:[PlayerManager sharedManager].player4.image forState:UIControlStateNormal];
            [self.player5Button setImage:[PlayerManager sharedManager].player5.image forState:UIControlStateNormal];
            if (self.player.playerNum != [PlayerManager sharedManager].player1.playerNum) {
                [self.player1Button setEnabled:YES];
            } else {
                [self.player1Button setEnabled:NO];
                self.player1Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player2.playerNum) {
                [self.player2Button setEnabled:YES];
            } else {
                [self.player2Button setEnabled:NO];
                self.player2Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player3.playerNum) {
                [self.player3Button setEnabled:YES];
            } else {
                [self.player3Button setEnabled:NO];
                self.player3Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player4.playerNum) {
                [self.player4Button setEnabled:YES];
            } else {
                [self.player4Button setEnabled:NO];
                self.player4Button.alpha = 0.5;
            }
            if (self.player.playerNum != [PlayerManager sharedManager].player5.playerNum) {
                [self.player5Button setEnabled:YES];
            } else {
                [self.player5Button setEnabled:NO];
                self.player5Button.alpha = 0.5;
            }
            self.player6Button.alpha = 0.5;
            self.player7Button.alpha = 0.5;
            self.player8Button.alpha = 0.5;
            self.player9Button.alpha = 0.5;
            self.player10Button.alpha = 0.5;
            self.player11Button.alpha = 0.5;
            [self.player6Button setEnabled:NO];
            [self.player7Button setEnabled:NO];
            [self.player8Button setEnabled:NO];
            [self.player9Button setEnabled:NO];
            [self.player10Button setEnabled:NO];
            [self.player11Button setEnabled:NO];
            [self setImage];
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

- (IBAction)player1ButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player1に投票"];
        self.okButton.enabled = YES;
        self.vote = 1;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player1を予言"];
        if (!self.seeFlg) {
            self.seeButton.enabled = YES;
        }
        self.see = 1;
    }
}

- (IBAction)player2ButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player2に投票"];
        self.okButton.enabled = YES;
        self.vote = 2;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player2を予言"];
        if (!self.seeFlg) {
            self.seeButton.enabled = YES;
        }
        self.see = 2;
    }
}

- (IBAction)player3ButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player3に投票"];
        self.okButton.enabled = YES;
        self.vote = 3;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player3を予言"];
        if (!self.seeFlg) {
            self.seeButton.enabled = YES;
        }
        self.see = 3;
    }
}

- (IBAction)player4ButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player4に投票"];
        self.okButton.enabled = YES;
        self.vote = 4;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player4を予言"];
        if (!self.seeFlg) {
            self.seeButton.enabled = YES;
        }
        self.see = 4;
    }
}

- (IBAction)player5ButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player5に投票"];
        self.okButton.enabled = YES;
        self.vote = 5;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
        self.commentLabel.text = [NSString stringWithFormat:@"Player5を予言"];
        if (!self.seeFlg) {
            self.seeButton.enabled = YES;
        }
        self.see = 5;
    }
}

- (IBAction)player6ButtonPressed:(id)sender {
    self.commentLabel.text = [NSString stringWithFormat:@"Player6に投票"];
    self.okButton.enabled = YES;
    self.vote = 6;
}

- (IBAction)player7ButtonPressed:(id)sender {
    self.commentLabel.text = [NSString stringWithFormat:@"Player7に投票"];
    self.okButton.enabled = YES;
    self.vote = 7;
}

- (IBAction)player8ButtonPressed:(id)sender {
    self.commentLabel.text = [NSString stringWithFormat:@"Player8に投票"];
    self.okButton.enabled = YES;
    self.vote = 8;
}

- (IBAction)player9ButtonPressed:(id)sender {
    self.commentLabel.text = [NSString stringWithFormat:@"Player9に投票"];
    self.okButton.enabled = YES;
    self.vote = 9;
}

- (IBAction)player10ButtonPressed:(id)sender {
    self.commentLabel.text = [NSString stringWithFormat:@"Player10に投票"];
    self.okButton.enabled = YES;
    self.vote = 10;
}

- (IBAction)player11ButtonPressed:(id)sender {
    self.commentLabel.text = [NSString stringWithFormat:@"Player11に投票"];
    self.okButton.enabled = YES;
    self.vote = 11;
}

- (IBAction)okButtonPressed:(id)sender {
    if ([GameStatus sharedManager].currentTurn == 1) {
        //self.player.voteTo = self.vote;
        if (self.vote == 1) {
            [PlayerManager sharedManager].player1.voteCount ++;
        } else if (self.vote == 2) {
            [PlayerManager sharedManager].player2.voteCount ++;
        } else if (self.vote == 3) {
            [PlayerManager sharedManager].player3.voteCount ++;
        } else if (self.vote == 4) {
            [PlayerManager sharedManager].player4.voteCount ++;
        } else if (self.vote == 5) {
            [PlayerManager sharedManager].player5.voteCount ++;
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)seeButtonPressed:(id)sender {
    if ([[VoteManager sharedManager] see:self.see]) {
        self.commentLabel.text = @"人狼です！";
    } else {
        self.commentLabel.text = @"人間です！";
    }
    
    self.seeButton.enabled = NO;
    self.okButton.enabled = YES;
    self.seeFlg = YES;
}

- (void) setImage {
    if ([PlayerManager sharedManager].player1.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player1Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player1Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player2.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player2Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player2Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player3.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player3Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player3Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player4.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player4Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player4Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player5.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player5Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player5Button.enabled = NO;
    }
    
    if ([PlayerManager sharedManager].player1.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player1Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player1Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player2.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player2Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player2Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player3.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player3Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player3Button.enabled = NO;
    } else if ([PlayerManager sharedManager].player4.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player4Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player4Button.enabled = NO;
    }
    if ([PlayerManager sharedManager].player5.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player5Button.frame];
        imageView = [self change: imageView];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
        self.player5Button.enabled = NO;
    }
}

- (UIImageView *) change: (UIImageView *)imageView {
    CGRect frame = imageView.frame;
    frame.origin.x += 10;
    frame.origin.y += 120;
    imageView.frame = frame;
    return imageView;
}
@end
