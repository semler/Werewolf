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

@property (weak, nonatomic) IBOutlet UIImageView *player1Image;
@property (weak, nonatomic) IBOutlet UIImageView *player2Image;
@property (weak, nonatomic) IBOutlet UIImageView *player3Image;
@property (weak, nonatomic) IBOutlet UIImageView *player4Image;
@property (weak, nonatomic) IBOutlet UIImageView *player5Image;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *player1Position;
@property (weak, nonatomic) IBOutlet UIImageView *player2Position;
@property (weak, nonatomic) IBOutlet UIImageView *player3Position;
@property (weak, nonatomic) IBOutlet UIImageView *player4Position;
@property (weak, nonatomic) IBOutlet UIImageView *player5Position;


- (IBAction)endButtonPressed:(id)sender;

@end

@implementation GameOverViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.player1Image.image = [PlayerManager sharedManager].player1.image;
    self.player2Image.image = [PlayerManager sharedManager].player2.image;
    self.player3Image.image = [PlayerManager sharedManager].player3.image;
    self.player4Image.image = [PlayerManager sharedManager].player4.image;
    self.player5Image.image = [PlayerManager sharedManager].player5.image;
    
    if ([PlayerManager sharedManager].player1.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player1Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player2.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player2Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player3.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player3Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player4.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player4Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player5.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player5Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    
    if ([PlayerManager sharedManager].player1.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player1Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player2.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player2Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player3.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player3Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    } else if ([PlayerManager sharedManager].player4.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player4Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player5.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player5Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    
    [self setPosition:[PlayerManager sharedManager].player1 imageView:self.player1Position];
    [self setPosition:[PlayerManager sharedManager].player2 imageView:self.player2Position];
    [self setPosition:[PlayerManager sharedManager].player3 imageView:self.player3Position];
    [self setPosition:[PlayerManager sharedManager].player4 imageView:self.player4Position];
    [self setPosition:[PlayerManager sharedManager].player5 imageView:self.player5Position];
    
    if([GameStatus sharedManager].werewolfCount == 0) {
        self.label.text = @"ゲーム終了！村人の勝利です！";
    }
    
    if ([GameStatus sharedManager].alivePlayerCount <= [GameStatus sharedManager].werewolfCount * 2) {
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

- (void) setPosition:(Player *)player imageView:(UIImageView *)imageView {
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

- (IBAction)endButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"theEnd" sender:self];
}
@end
