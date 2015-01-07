//
//  GameOverViewController.m
//  Werewolf
//
//  Created by semler on 14/12/20.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "GameOverViewController.h"
#import "PlayerManager.h"
#import "GameStatus.h"
#import "Player.h"

@interface GameOverViewController ()

@property (strong, nonatomic) IBOutletCollection (UIImageView) NSArray *playerImages;
@property (strong, nonatomic) IBOutletCollection (UIImageView) NSArray *positionImages;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)endButtonPressed:(id)sender;

@end

@implementation GameOverViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Player *player;
    for (UIImageView *imageView in self.playerImages) {
        player = [[PlayerManager sharedManager].playerList objectAtIndex:imageView.tag];
        imageView.image = player.image;
        
        UIImageView *imageView2;
        if (player.isBanished) {
            imageView2 = [[UIImageView alloc] initWithFrame:imageView.frame];
            UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
            imageView2.image = image;
            [self.view addSubview:imageView2];
        } else if (player.isAttacked) {
            imageView2 = [[UIImageView alloc] initWithFrame:imageView.frame];
            UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
            imageView2.image = image;
            [self.view addSubview:imageView2];
        }
    }
    
    [self setPosition];
    
    if([GameStatus sharedManager].werewolfCount == 0) {
        self.label.text = @"ゲーム終了！村人の勝利です！";
    } else if ([GameStatus sharedManager].alivePlayerCount <= [GameStatus sharedManager].werewolfCount * 2) {
        self.label.text = @"ゲーム終了！人狼の勝利です！";
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

- (void) setPosition {
    Player *player;
    for (UIImageView *imageView in self.positionImages) {
        player = [[PlayerManager sharedManager].playerList objectAtIndex:imageView.tag];
        if (player.position == 0) {
            imageView.image = [UIImage imageNamed:@"iconMurabito.png"];
        } else if (player.position == 1) {
            imageView.image = [UIImage imageNamed:@"iconJinro.png"];
        } else if (player.position == 2) {
            imageView.image = [UIImage imageNamed:@"iconUranai.png"];
        } else if (player.position == 3) {
            imageView.image = [UIImage imageNamed:@"iconGuard.png"];
        } else if (player.position == 4) {
            imageView.image = [UIImage imageNamed:@"iconUragiri.png"];
        }
    }
}

- (IBAction)endButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"theEnd" sender:self];
}

@end
