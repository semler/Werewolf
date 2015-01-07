//
//  Player5ViewController_2.m
//  Werewolf
//
//  Created by semler on 14/12/20.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "NightViewController.h"
#import "PlayerManager.h"
#import "GameStatus.h"
#import "VillagerViewController.h"
#import "WerewolfViewController.h"
#import "SeerViewController.h"
#import "BodyguardViewController.h"
#import "MadmanViewController.h"
#import "VoteManager.h"

@interface NightViewController ()

@property (strong, nonatomic) IBOutletCollection (UIButton) NSArray *playerButtons;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)nextButtonPressed:(id)sender;

@end

@implementation NightViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [GameStatus sharedManager].currentTurn = 2;
    
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

- (IBAction)nextButtonPressed:(id)sender {
    [[VoteManager sharedManager] attack];
    if ([[GameStatus sharedManager] gameOverJudge]) {
        [self performSegueWithIdentifier:@"gameOver" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toStep1" sender:self];
    }
}

@end
