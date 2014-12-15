//
//  VillagerViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/15.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "VillagerViewController.h"
#import "GameStatus.h"
#import "PlayerManager.h"

@interface VillagerViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIButton *okButton;


- (IBAction)okButtonPressed:(id)sender;

@end

@implementation VillagerViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].playerCount == 5) {
        // player画像設定
        self.playerImage.image = [GameStatus sharedManager].currentPlayer.image;
        
        if ([GameStatus sharedManager].currentTurn == 0) {
            self.commentLabel.text = @"村人です";
            self.subView.hidden = YES;
            
            
            
            
        
        } else if ([GameStatus sharedManager].currentTurn == 1) {
        
        
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

- (IBAction)okButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
