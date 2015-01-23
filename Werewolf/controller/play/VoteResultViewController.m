//
//  VoteResultViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/18.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "VoteResultViewController.h"
#import "PlayerManager.h"
#import "MarqueeLabel.h"
#import "VoteManager.h"
#import "Player.h"

@interface VoteResultViewController ()

@property (weak, nonatomic) IBOutlet MarqueeLabel *label;

@property (strong, nonatomic) IBOutletCollection (UIImageView) NSArray *playerImages;

- (IBAction)nextButtonPressed:(id)sender;

@end

@implementation VoteResultViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Player * player;
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
    
    // アニメーションラベル
    self.label.marqueeType = MLContinuous;
    self.label.scrollDuration = 10.0f;
    self.label.fadeLength = 10.0f;
    self.label.trailingBuffer = 30.0f;
    player = [VoteManager sharedManager].lastDead;
    self.label.text = [NSString stringWithFormat: @"Player%ldが追放されました。「次へ」ボタンを押して、夜のタンに進んでください。", player.playerNum + 1];
    
    self.label.userInteractionEnabled = YES; // Don't forget this, otherwise the gesture recognizer will fail (UILabel has this as NO by default)
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pauseTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.label addGestureRecognizer:tapRecognizer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"toNight" sender:self];
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
