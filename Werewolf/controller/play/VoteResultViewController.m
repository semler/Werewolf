//
//  VoteResultViewController.m
//  Werewolf
//
//  Created by semler on 2014/12/18.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "VoteResultViewController.h"
#import "PlayerManager.h"

@interface VoteResultViewController ()

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
    [self performSegueWithIdentifier:@"toStep2" sender:self];
}
@end
