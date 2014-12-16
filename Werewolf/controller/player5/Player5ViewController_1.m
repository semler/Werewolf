//
//  Player5ViewController_1.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "Player5ViewController_1.h"
#import "PlayerManager.h"
#import "GameStatus.h"
#import "AlermViewController.h"
#import "VillagerViewController.h"
#import "WerewolfViewController.h"
#import "SeerViewController.h"
#import "BodyguardViewController.h"
#import "MadmanViewController.h"

@interface Player5ViewController_1 ()

@property (weak, nonatomic) IBOutlet UIButton *player1Button;
@property (weak, nonatomic) IBOutlet UIButton *player2Button;
@property (weak, nonatomic) IBOutlet UIButton *player3Button;
@property (weak, nonatomic) IBOutlet UIButton *player4Button;
@property (weak, nonatomic) IBOutlet UIButton *player5Button;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *discussButton;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

- (IBAction)player1ButtonPressed:(id)sender;
- (IBAction)player2ButtonPressed:(id)sender;
- (IBAction)player3ButtonPressed:(id)sender;
- (IBAction)player4ButtonPressed:(id)sender;
- (IBAction)player5ButtonPressed:(id)sender;
- (IBAction)discussButtonPressed:(id)sender;
- (IBAction)okButtonPressed:(id)sender;

@property (nonatomic) BOOL discussFlg;

@end

@implementation Player5ViewController_1

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [GameStatus sharedManager].currentTurn = 1;
    
    [self.player1Button setImage:[PlayerManager sharedManager].player1.image forState:UIControlStateNormal];
    [self.player2Button setImage:[PlayerManager sharedManager].player2.image forState:UIControlStateNormal];
    [self.player3Button setImage:[PlayerManager sharedManager].player3.image forState:UIControlStateNormal];
    [self.player4Button setImage:[PlayerManager sharedManager].player4.image forState:UIControlStateNormal];
    [self.player5Button setImage:[PlayerManager sharedManager].player5.image forState:UIControlStateNormal];
    
    if (!self.discussFlg) {
        self.discussButton.enabled = YES;
        self.okButton.enabled = NO;
        self.commentLabel.text = @"朝になりました、議論開始";
    } else {
        self.discussButton.enabled = NO;
        self.okButton.enabled = YES;
        self.commentLabel.text = @"議論終了、投票してください";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)player1ButtonPressed:(id)sender {
    if (self.discussFlg) {
    
    }
}

- (IBAction)player2ButtonPressed:(id)sender {
    if (self.discussFlg) {
        
    }
}

- (IBAction)player3ButtonPressed:(id)sender {
    if (self.discussFlg) {
        
    }
}

- (IBAction)player4ButtonPressed:(id)sender {
    if (self.discussFlg) {
        
    }
}

- (IBAction)player5ButtonPressed:(id)sender {
    if (self.discussFlg) {
        
    }
}

- (IBAction)discussButtonPressed:(id)sender {
    self.discussFlg = YES;
    
    AlermViewController *controller = [[AlermViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)okButtonPressed:(id)sender {
}
@end
