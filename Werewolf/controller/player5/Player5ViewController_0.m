//
//  Player5ViewController_0.m
//  Werewolf
//
//  Created by semler on 14/12/13.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "Player5ViewController_0.h"
#import "PlayerManager.h"
#import "GameStatus.h"
#import "VillagerViewController.h"
#import "WerewolfViewController.h"
#import "SeerViewController.h"
#import "BodyguardViewController.h"
#import "MadmanViewController.h"

@interface Player5ViewController_0 ()

@property (weak, nonatomic) IBOutlet UIButton *player1Button;
@property (weak, nonatomic) IBOutlet UIButton *player2Button;
@property (weak, nonatomic) IBOutlet UIButton *player3Button;
@property (weak, nonatomic) IBOutlet UIButton *player4Button;
@property (weak, nonatomic) IBOutlet UIButton *player5Button;

- (IBAction)player1ButtonPressed:(id)sender;
- (IBAction)player2ButtonPressed:(id)sender;
- (IBAction)player3ButtonPressed:(id)sender;
- (IBAction)player4ButtonPressed:(id)sender;
- (IBAction)player5ButtonPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation Player5ViewController_0

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [GameStatus sharedManager].currentTurn = 0;
    
    [self.player1Button setImage:[PlayerManager sharedManager].player1.image forState:UIControlStateNormal];
    [self.player2Button setImage:[PlayerManager sharedManager].player2.image forState:UIControlStateNormal];
    [self.player3Button setImage:[PlayerManager sharedManager].player3.image forState:UIControlStateNormal];
    [self.player4Button setImage:[PlayerManager sharedManager].player4.image forState:UIControlStateNormal];
    [self.player5Button setImage:[PlayerManager sharedManager].player5.image forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)player1ButtonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player1;
    
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

- (IBAction)player2ButtonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player2;
    
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

- (IBAction)player3ButtonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player3;
    
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

- (IBAction)player4ButtonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player4;
    
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

- (IBAction)player5ButtonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = [PlayerManager sharedManager].player5;
    
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

- (IBAction)okButtonPressed:(id)sender {
}
@end
