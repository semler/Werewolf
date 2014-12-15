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

@property (weak, nonatomic) IBOutlet UIImageView *player1Image;
@property (weak, nonatomic) IBOutlet UIImageView *player2Image;
@property (weak, nonatomic) IBOutlet UIImageView *player3Image;
@property (weak, nonatomic) IBOutlet UIImageView *player4Image;
@property (weak, nonatomic) IBOutlet UIImageView *player5Image;
@property (weak, nonatomic) IBOutlet UIImageView *player6Image;
@property (weak, nonatomic) IBOutlet UIImageView *player7Image;
@property (weak, nonatomic) IBOutlet UIImageView *player8Image;
@property (weak, nonatomic) IBOutlet UIImageView *player9Image;
@property (weak, nonatomic) IBOutlet UIImageView *player10Image;
@property (weak, nonatomic) IBOutlet UIImageView *player11Image;
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
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:path1]) {
            [self.player1Image setImage:[UIImage imageWithContentsOfFile:path1]];
            Player *player1 = [[Player alloc] init];
            player1.image = self.player1Image.image;
            [PlayerManager sharedManager].player1 = player1;
        } else {
            //
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path2]) {
            [self.player2Image setImage:[UIImage imageWithContentsOfFile:path2]];
            Player *player2 = [[Player alloc] init];
            player2.image = self.player2Image.image;
            [PlayerManager sharedManager].player2 = player2
            ;
        } else {
            //
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path3]) {
            [self.player3Image setImage:[UIImage imageWithContentsOfFile:path3]];
            Player *player4 = [[Player alloc] init];
            player4.image = self.player3Image.image;
            [PlayerManager sharedManager].player3 = player4;
        } else {
            //
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path4]) {
            [self.player4Image setImage:[UIImage imageWithContentsOfFile:path4]];
            Player *player4 = [[Player alloc] init];
            player4.image = self.player4Image.image;
            [PlayerManager sharedManager].player4 = player4;
        } else {
            //
        }
        if ([[NSFileManager defaultManager] fileExistsAtPath:path5]) {
            [self.player5Image setImage:[UIImage imageWithContentsOfFile:path5]];
            Player *player5 = [[Player alloc] init];
            player5.image = self.player5Image.image;
            [PlayerManager sharedManager].player5 = player5;
        } else {
            //
        }
        
        self.player6Image.alpha = 0.3;
        self.player7Image.alpha = 0.3;
        self.player8Image.alpha = 0.3;
        self.player9Image.alpha = 0.3;
        self.player10Image.alpha = 0.3;
        self.player11Image.alpha = 0.3;
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
    [GameStatus sharedManager].currentPlayer = 1;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player2ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 2;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player3ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 3;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player4ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 4;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player5ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 5;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player6ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 6;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player7ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 7;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player8ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 8;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player9ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 9;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player10ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 10;
    
    PlayerViewController *viewController = [[PlayerViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)player11ButttonPressed:(id)sender {
    [GameStatus sharedManager].currentPlayer = 11;
    
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
