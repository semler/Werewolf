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
#import "MediumViewController.h"
#import "MarqueeLabel.h"

@interface CheckPositionViewController ()

@property (weak, nonatomic) IBOutlet MarqueeLabel *label;
@property (strong, nonatomic) IBOutletCollection (UIButton) NSArray *playerButtons;

- (IBAction)playerButtonsPressed:(id)sender;
- (IBAction)nextButtonPressed:(id)sender;

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
    
    // アニメーションラベル
    self.label.marqueeType = MLContinuous;
    self.label.scrollDuration = 10.0f;
    self.label.fadeLength = 10.0f;
    self.label.trailingBuffer = 30.0f;
    self.label.text = @"画像を押して、役職を確認して下さい。全員が確認終わったら、「次へ」ボタンを押してください。";
    
    self.label.userInteractionEnabled = YES; // Don't forget this, otherwise the gesture recognizer will fail (UILabel has this as NO by default)
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pauseTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.label addGestureRecognizer:tapRecognizer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    } else if (player.position == 5) {
        MediumViewController *controller = [[MediumViewController alloc] init];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

- (IBAction)nextButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"toDay" sender:self];
}

- (void)pauseTap:(UITapGestureRecognizer *)recognizer {
    MarqueeLabel *label = (MarqueeLabel *)recognizer.view;
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (!label.isPaused) {
            [label pauseLabel];
        } else {
            [label unpauseLabel];
        }
    }
}
@end
