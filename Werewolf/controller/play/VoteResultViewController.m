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

@property (weak, nonatomic) IBOutlet UIImageView *player1Image;
@property (weak, nonatomic) IBOutlet UIImageView *player2Image;
@property (weak, nonatomic) IBOutlet UIImageView *player3Image;
@property (weak, nonatomic) IBOutlet UIImageView *player4Image;
@property (weak, nonatomic) IBOutlet UIImageView *player5Image;

- (IBAction)nextButtonPressed:(id)sender;

@end

@implementation VoteResultViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.player1Image.image = [PlayerManager sharedManager].player1.image;
    self.player2Image.image = [PlayerManager sharedManager].player2.image;
    self.player3Image.image = [PlayerManager sharedManager].player3.image;
    self.player4Image.image = [PlayerManager sharedManager].player4.image;
    self.player5Image.image = [PlayerManager sharedManager].player5.image;
    
    [self setImage];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setImage {
    if ([PlayerManager sharedManager].player1.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player1Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player2.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player2Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player3.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player3Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player4.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player4Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player5.isBanished) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player5Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconExpulsion.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    
    if ([PlayerManager sharedManager].player1.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player1Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player2.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player2Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player3.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player3Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    } else if ([PlayerManager sharedManager].player4.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player4Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
    if ([PlayerManager sharedManager].player5.isAttacked) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.player5Image.frame];
        UIImage *image = [UIImage imageNamed:@"iconKilled.png"];
        imageView.image = image;
        [self.view addSubview:imageView];
    }
}

- (IBAction)nextButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"toStep2" sender:self];
}
@end
