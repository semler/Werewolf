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

@property (weak, nonatomic) IBOutlet UIButton *player1Button;
@property (weak, nonatomic) IBOutlet UIButton *player2Button;
@property (weak, nonatomic) IBOutlet UIButton *player3Button;
@property (weak, nonatomic) IBOutlet UIButton *player4Button;
@property (weak, nonatomic) IBOutlet UIButton *player5Button;
@property (weak, nonatomic) IBOutlet UIButton *player6Button;
@property (weak, nonatomic) IBOutlet UIButton *player7Button;
@property (weak, nonatomic) IBOutlet UIButton *player8Button;
@property (weak, nonatomic) IBOutlet UIButton *player9Button;
@property (weak, nonatomic) IBOutlet UIButton *player10Button;
@property (weak, nonatomic) IBOutlet UIButton *player11Button;

- (IBAction)player1ButttonPressed:(id)sender;
- (IBAction)player2ButttonPressed:(id)sender;
- (IBAction)player3ButttonPressed:(id)sender;
- (IBAction)player4ButttonPressed:(id)sender;
- (IBAction)player5ButttonPressed:(id)sender;
- (IBAction)player6ButttonPressed:(id)sender;
- (IBAction)player7ButttonPressed:(id)sender;
- (IBAction)player8ButttonPressed:(id)sender;
- (IBAction)player9ButttonPressed:(id)sender;
- (IBAction)player10ButttonPressed:(id)sender;
- (IBAction)player11ButttonPressed:(id)sender;

- (IBAction)startButtonPressed:(id)sender;
- (IBAction)backButtonPressed:(id)sender;

@end

@implementation PlayerSettingViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].playerCount == 5) {
        NSString *path1 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player1.jpg"];
        NSString *path2 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player2.jpg"];
        NSString *path3 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player3.jpg"];
        NSString *path4 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player4.jpg"];
        NSString *path5 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player5.jpg"];
        NSString *path6 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player6.jpg"];
        NSString *path7 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player7.jpg"];
        NSString *path8 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player8.jpg"];
        NSString *path9 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player9.jpg"];
        NSString *path10 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player10.jpg"];
        NSString *path11 = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"], @"player11.jpg"];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:path1]) {
            [self.player1Button setImage:[UIImage imageWithContentsOfFile:path1] forState:UIControlStateNormal];
            Player *player1 = [[Player alloc] init];
            player1.image = self.player1Button.currentImage;
            player1.playerNum = 1;
            [PlayerManager sharedManager].player1 = player1;
        } else {
            Player *player1 = [[Player alloc] init];
            player1.image = self.player1Button.currentImage;
            player1.playerNum = 1;
            [PlayerManager sharedManager].player1 = player1;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path2]) {
            [self.player2Button setImage:[UIImage imageWithContentsOfFile:path2]  forState:UIControlStateNormal];
            Player *player2 = [[Player alloc] init];
            player2.image = self.player2Button.currentImage;
            player2.playerNum = 2;
            [PlayerManager sharedManager].player2 = player2;
        } else {
            Player *player2 = [[Player alloc] init];
            player2.image = self.player2Button.currentImage;
            player2.playerNum = 2;
            [PlayerManager sharedManager].player2 = player2;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path3]) {
            [self.player3Button setImage:[UIImage imageWithContentsOfFile:path3]  forState:UIControlStateNormal];
            Player *player3 = [[Player alloc] init];
            player3.image = self.player3Button.currentImage;
            player3.playerNum = 3;
            [PlayerManager sharedManager].player3 = player3;
        } else {
            Player *player3 = [[Player alloc] init];
            player3.image = self.player3Button.currentImage;
            player3.playerNum = 3;
            [PlayerManager sharedManager].player3 = player3;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path4]) {
            [self.player4Button setImage:[UIImage imageWithContentsOfFile:path4]  forState:UIControlStateNormal];
            Player *player4 = [[Player alloc] init];
            player4.image = self.player4Button.currentImage;
            player4.playerNum = 4;
            [PlayerManager sharedManager].player4 = player4;
        } else {
            Player *player4 = [[Player alloc] init];
            player4.image = self.player4Button.currentImage;
            player4.playerNum = 4;
            [PlayerManager sharedManager].player4 = player4;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path5]) {
            [self.player5Button setImage:[UIImage imageWithContentsOfFile:path5]  forState:UIControlStateNormal];
            Player *player5 = [[Player alloc] init];
            player5.image = self.player5Button.currentImage;
            player5.playerNum = 5;
            [PlayerManager sharedManager].player5 = player5;
        } else {
            Player *player5 = [[Player alloc] init];
            player5.image = self.player5Button.currentImage;
            player5.playerNum = 5;
            [PlayerManager sharedManager].player5 = player5;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path6]) {
            [self.player6Button setImage:[UIImage imageWithContentsOfFile:path6]  forState:UIControlStateNormal];
            Player *player6 = [[Player alloc] init];
            player6.image = self.player6Button.currentImage;
            player6.playerNum = 6;
            [PlayerManager sharedManager].player6 = player6;
        } else {
            Player *player6 = [[Player alloc] init];
            player6.image = self.player6Button.currentImage;
            player6.playerNum = 6;
            [PlayerManager sharedManager].player6 = player6;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path7]) {
            [self.player7Button setImage:[UIImage imageWithContentsOfFile:path7]  forState:UIControlStateNormal];
            Player *player7 = [[Player alloc] init];
            player7.image = self.player7Button.currentImage;
            player7.playerNum = 7;
            [PlayerManager sharedManager].player7 = player7;
        } else {
            Player *player7 = [[Player alloc] init];
            player7.image = self.player7Button.currentImage;
            player7.playerNum = 7;
            [PlayerManager sharedManager].player7 = player7;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path8]) {
            [self.player8Button setImage:[UIImage imageWithContentsOfFile:path8]  forState:UIControlStateNormal];
            Player *player8 = [[Player alloc] init];
            player8.image = self.player8Button.currentImage;
            player8.playerNum = 8;
            [PlayerManager sharedManager].player8 = player8;
        } else {
            Player *player8 = [[Player alloc] init];
            player8.image = self.player8Button.currentImage;
            player8.playerNum = 8;
            [PlayerManager sharedManager].player8 = player8;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path9]) {
            [self.player9Button setImage:[UIImage imageWithContentsOfFile:path9]  forState:UIControlStateNormal];
            Player *player9 = [[Player alloc] init];
            player9.image = self.player9Button.currentImage;
            player9.playerNum = 9;
            [PlayerManager sharedManager].player9 = player9;
        } else {
            Player *player9 = [[Player alloc] init];
            player9.image = self.player9Button.currentImage;
            player9.playerNum = 9;
            [PlayerManager sharedManager].player9 = player9;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path10]) {
            [self.player10Button setImage:[UIImage imageWithContentsOfFile:path10]  forState:UIControlStateNormal];
            Player *player10 = [[Player alloc] init];
            player10.image = self.player10Button.currentImage;
            player10.playerNum = 10;
            [PlayerManager sharedManager].player10 = player10;
        } else {
            Player *player10 = [[Player alloc] init];
            player10.image = self.player10Button.currentImage;
            player10.playerNum = 10;
            [PlayerManager sharedManager].player10 = player10;
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path11]) {
            [self.player11Button setImage:[UIImage imageWithContentsOfFile:path11]  forState:UIControlStateNormal];
            Player *player11 = [[Player alloc] init];
            player11.image = self.player11Button.currentImage;
            player11.playerNum = 11;
            [PlayerManager sharedManager].player11 = player11;
        } else {
            Player *player11 = [[Player alloc] init];
            player11.image = self.player11Button.currentImage;
            player11.playerNum = 11;
            [PlayerManager sharedManager].player11 = player11;
        }
        
        self.player6Button.alpha = 0.5;
        self.player7Button.alpha = 0.5;
        self.player8Button.alpha = 0.5;
        self.player9Button.alpha = 0.5;
        self.player10Button.alpha = 0.5;
        self.player11Button.alpha = 0.5;
        [self.player6Button setEnabled:NO];
        [self.player7Button setEnabled:NO];
        [self.player8Button setEnabled:NO];
        [self.player9Button setEnabled:NO];
        [self.player10Button setEnabled:NO];
        [self.player11Button setEnabled:NO];
    } else if ([GameStatus sharedManager].playerCount == 6) {
    
    } else if ([GameStatus sharedManager].playerCount == 7) {
        
    } else if ([GameStatus sharedManager].playerCount == 8) {
        
    } else if ([GameStatus sharedManager].playerCount == 9) {
        
    } else if ([GameStatus sharedManager].playerCount == 10) {
        
    } else if ([GameStatus sharedManager].playerCount == 11) {
        
    }
    
    //[[PlayerManager sharedManager].playerList addObject: [PlayerManager sharedManager].player1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)player1ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 1;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player2ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 2;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player3ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 3;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player4ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 4;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player5ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 5;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player6ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 6;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player7ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 7;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player8ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 8;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player9ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 9;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player10ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 10;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player11ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayerInt = 11;
    
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
