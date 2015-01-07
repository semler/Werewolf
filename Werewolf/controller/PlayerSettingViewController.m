//
//  PlayerSettingViewController.m
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "PlayerSettingViewController.h"
#import "PlayerViewController.h"
#import "PlayerManager.h"
#import "GameStatus.h"

@interface PlayerSettingViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *playerButtons;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)startButtonPressed:(id)sender;
- (IBAction)backButtonPressed:(id)sender;

@end

@implementation PlayerSettingViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // playerList初期化
    [PlayerManager sharedManager].playerList = [NSMutableArray array];
    for (int i = 0; i < 11; i ++) {
        Player *player = [[Player alloc] init];
        player.playerNum = i;
        [[PlayerManager sharedManager].playerList addObject:player];
    }
    
    NSString *path;
    for (UIButton* button in self.playerButtons) {
        path = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], [NSString stringWithFormat:@"player%ld.jpg", button.tag]];
        
        Player *player;
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [button setImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
            player = [[PlayerManager sharedManager].playerList objectAtIndex:button.tag];
            player.image = [UIImage imageWithContentsOfFile:path];
        }
        
        if ([GameStatus sharedManager].playerCount == 5) {
            if (button.tag > 4) {
                button.alpha = 0.5;
                button.enabled = NO;
            } else {
                button.alpha = 1;
                button.enabled = YES;
            }
        } else if ([GameStatus sharedManager].playerCount == 6) {
            //
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
    [GameStatus sharedManager].currentPlayerInt = button.tag;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)startButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"toCardSetting" sender:self];
}

- (IBAction)backButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"back" sender:self];
}
@end
