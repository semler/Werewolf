//
//  Player5ViewController_0.m
//  Werewolf
//
//  Created by semler on 14/12/13.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "CheckPositionViewController.h"
#import "PlayerManager.h"
#import "GameStatus.h"
#import "VillagerViewController.h"
#import "WerewolfViewController.h"
#import "SeerViewController.h"
#import "BodyguardViewController.h"
#import "MadmanViewController.h"

@interface CheckPositionViewController ()

@property (strong, nonatomic) IBOutletCollection (UIButton) NSArray *playerButtons;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@end

@implementation CheckPositionViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [GameStatus sharedManager].currentTurn = 0;
    
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

- (IBAction)okButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"toStep1" sender:self];
}
@end
