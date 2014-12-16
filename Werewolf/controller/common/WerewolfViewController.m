//
//  WerewolfViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/16.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "WerewolfViewController.h"
#import "GameStatus.h"
#import "PlayerManager.h"

@interface WerewolfViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@property (weak, nonatomic) IBOutlet UILabel *comentLabel;

@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIView *player1Button;
@property (weak, nonatomic) IBOutlet UIView *player2Button;
@property (weak, nonatomic) IBOutlet UIView *player3Button;
@property (weak, nonatomic) IBOutlet UIView *player4Button;
@property (weak, nonatomic) IBOutlet UIView *player5Button;
@property (weak, nonatomic) IBOutlet UIView *player6Button;
@property (weak, nonatomic) IBOutlet UIView *player7Button;
@property (weak, nonatomic) IBOutlet UIView *player8Button;
@property (weak, nonatomic) IBOutlet UIView *player9Button;
@property (weak, nonatomic) IBOutlet UIView *player10Button;
@property (weak, nonatomic) IBOutlet UIView *player11Button;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

- (IBAction)player1ButtonPressed:(id)sender;
- (IBAction)player2ButtonPressed:(id)sender;
- (IBAction)player3ButtonPressed:(id)sender;
- (IBAction)player4ButtonPressed:(id)sender;
- (IBAction)player5ButtonPressed:(id)sender;
- (IBAction)player6ButtonPressed:(id)sender;
- (IBAction)player7ButtonPressed:(id)sender;
- (IBAction)player8ButtonPressed:(id)sender;
- (IBAction)player9ButtonPressed:(id)sender;
- (IBAction)player10ButtonPressed:(id)sender;
- (IBAction)player11ButtonPressed:(id)sender;

- (IBAction)okButtonPressed:(id)sender;

@end

@implementation WerewolfViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].playerCount == 5) {
        // player画像設定
        self.playerImage.image = [GameStatus sharedManager].currentPlayer.image;
        
        if ([GameStatus sharedManager].currentTurn == 0) {
            self.comentLabel.text = @"人狼です";
            self.subView.hidden = YES;
            self.okButton.enabled = YES;
        } else if ([GameStatus sharedManager].currentTurn == 1) {
            //            self.player1View.image = [PlayerManager sharedManager].player1.image;
            //            self.player2View.image = [PlayerManager sharedManager].player2.image;
            //            self.player3View.image = [PlayerManager sharedManager].player3.image;
            //            self.player4View.image = [PlayerManager sharedManager].player4.image;
            //            self.player5View.image = [PlayerManager sharedManager].player5.image;
            //            self.player6View.alpha = 0.3;
            //            self.player7View.alpha = 0.3;
            //            self.player8View.alpha = 0.3;
            //            self.player9View.alpha = 0.3;
            //            self.player10View.alpha = 0.3;
            //            self.player11View.alpha = 0.3;
            //            [self.player6Button setEnabled:NO];
            //            [self.player7Button setEnabled:NO];
            //            [self.player8Button setEnabled:NO];
            //            [self.player9Button setEnabled:NO];
            //            [self.player10Button setEnabled:NO];
            //            [self.player11Button setEnabled:NO];
            
        }
        
        
        
        
        
        
        
        
        
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
}

- (IBAction)player2ButtonPressed:(id)sender {
}

- (IBAction)player3ButtonPressed:(id)sender {
}

- (IBAction)player4ButtonPressed:(id)sender {
}

- (IBAction)player5ButtonPressed:(id)sender {
}

- (IBAction)player6ButtonPressed:(id)sender {
}

- (IBAction)player7ButtonPressed:(id)sender {
}

- (IBAction)player8ButtonPressed:(id)sender {
}

- (IBAction)player9ButtonPressed:(id)sender {
}

- (IBAction)player10ButtonPressed:(id)sender {
}

- (IBAction)player11ButtonPressed:(id)sender {
}

- (IBAction)okButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
