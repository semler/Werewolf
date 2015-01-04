//
//  BaseViewController.m
//  Werewolf
//
//  Created by semler on 14/12/27.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.player = [GameStatus sharedManager].currentPlayer;
    self.playerImageView.image = self.player.image;
    
    if ([GameStatus sharedManager].currentTurn == 0) {
        self.subView.hidden = YES;
        self.okButton.enabled = YES;
    } else if ([GameStatus sharedManager].currentTurn == 1) {
        self.commentLabel.text = @"投票してください";
        self.subView.hidden = NO;
        self.okButton.enabled = NO;
    } else if ([GameStatus sharedManager].currentTurn == 2) {
    }
    [self setPlayerImage];
    [self setStatus];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setPlayerImage {
    Player *player;
    for (UIButton* button in self.playerButtons) {
        player = [[PlayerManager sharedManager].playerList objectAtIndex:button.tag];
        [button setImage:player.image forState:UIControlStateNormal];
        
        if (player != nil && player.playerNum != self.player.playerNum) {
            [button setEnabled:YES];
        } else {
            [button setEnabled:NO];
            button.alpha = 0.5;
        }
    }
}

- (void) setStatus {
    Player *player;
    for (UIButton* button in self.playerButtons) {
        player = [[PlayerManager sharedManager].playerList objectAtIndex:button.tag];
        UIImageView *imageView;
        UIImage *image;
        
        if (player.isBanished) {
            imageView = [[UIImageView alloc] initWithFrame:button.frame];
            imageView = [self resetFrame: imageView];
            image = [UIImage imageNamed:@"iconExpulsion.png"];
            imageView.image = image;
            [self.view addSubview:imageView];
            button.enabled = NO;
        } else if (player.isAttacked) {
            imageView = [[UIImageView alloc] initWithFrame:button.frame];
            imageView = [self resetFrame: imageView];
            image = [UIImage imageNamed:@"iconKilled.png"];
            imageView.image = image;
            [self.view addSubview:imageView];
            button.enabled = NO;
        }
    }
}

- (UIImageView *) resetFrame: (UIImageView *)imageView {
    CGRect frame = imageView.frame;
    frame.origin.x += 10;
    frame.origin.y += 120;
    imageView.frame = frame;
    return imageView;
}

@end
