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
//#import "WerewolfViewController.h"
//#import "SeerViewController.h"
//#import "BodyGuardViewController.h"
//#import "MadmanViewController.h"

@interface Player5ViewController_0 ()


@property (weak, nonatomic) IBOutlet UIImageView *player1View;
@property (weak, nonatomic) IBOutlet UIImageView *player2View;
@property (weak, nonatomic) IBOutlet UIImageView *player3View;
@property (weak, nonatomic) IBOutlet UIImageView *player4View;
@property (weak, nonatomic) IBOutlet UIImageView *player5View;

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
    
    self.player1View.image = [PlayerManager sharedManager].player1.image;
    self.player2View.image = [PlayerManager sharedManager].player2.image;
    self.player3View.image = [PlayerManager sharedManager].player3.image;
    self.player4View.image = [PlayerManager sharedManager].player4.image;
    self.player5View.image = [PlayerManager sharedManager].player5.image;
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
        VillagerViewController *controller = [[VillagerViewController alloc] init];
        [self presentViewController:controller animated:YES completion:nil];
    } else if ([PlayerManager sharedManager].player1.position == 2) {
        VillagerViewController *controller = [[VillagerViewController alloc] init];
        [self presentViewController:controller animated:YES completion:nil];
    } else if ([PlayerManager sharedManager].player1.position == 3) {
        VillagerViewController *controller = [[VillagerViewController alloc] init];
        [self presentViewController:controller animated:YES completion:nil];
    } else if ([PlayerManager sharedManager].player1.position == 4) {
        VillagerViewController *controller = [[VillagerViewController alloc] init];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

- (IBAction)player2ButtonPressed:(id)sender {
}

- (IBAction)player3ButtonPressed:(id)sender {
}

- (IBAction)player4ButtonPressed:(id)sender {
}

- (IBAction)player5ButtonPressed:(id)sender {
}

- (IBAction)okButtonPressed:(id)sender {
}
@end
