//
//  ViewController.m
//  Werewolf
//
//  Created by semler on 14-12-2.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "GameStartViewController.h"

@interface GameStartViewController ()

- (IBAction)startButtonPressed:(id)sender;

@end

@implementation GameStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"startGame" sender:self];
    
}
@end
