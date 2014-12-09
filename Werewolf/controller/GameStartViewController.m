//
//  ViewController.m
//  Werewolf
//
//  Created by semler on 14-12-2.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "GameStartViewController.h"
#import "GameStatus.h"

@interface GameStartViewController ()

@property (nonatomic) int playerCount;
@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (strong, nonatomic) IBOutlet UIView *view;

- (IBAction)minusButtonPressed:(id)sender;
- (IBAction)plusButtonPressed:(id)sender;
- (IBAction)startButtonPressed:(id)sender;

@end

@implementation GameStartViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.playerCount = 5;
    self.playerLabel.text = [NSString stringWithFormat:@"%d", self.playerCount];
    // ナビゲーションバー非表示
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // タブバー非表示
    if([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]){
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    }
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)minusButtonPressed:(id)sender {
    if (self.playerCount > 5) {
        self.playerCount --;
    }
    self.playerLabel.text = [NSString stringWithFormat:@"%d", self.playerCount];
}

- (IBAction)plusButtonPressed:(id)sender {
    if (self.playerCount < 11) {
        self.playerCount ++;
    }
    self.playerLabel.text = [NSString stringWithFormat:@"%d", self.playerCount];
}

- (IBAction)startButtonPressed:(id)sender {
    
    [GameStatus sharedManager].playerCount = self.playerCount;
    
    [self performSegueWithIdentifier:@"toPlayerSetting" sender:self];
    
}
@end
