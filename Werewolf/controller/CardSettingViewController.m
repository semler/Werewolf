//
//  CardSettingViewController.m
//  Werewolf
//
//  Created by semler on 14-12-8.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "CardSettingViewController.h"

@interface CardSettingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *villageLabal;
@property (weak, nonatomic) IBOutlet UILabel *werewolfLabal;
@property (weak, nonatomic) IBOutlet UILabel *seerLabal;
@property (weak, nonatomic) IBOutlet UILabel *bodyguardLabal;
@property (weak, nonatomic) IBOutlet UILabel *madmanLabal;
@property (weak, nonatomic) IBOutlet UILabel *mediumLabal;

- (IBAction)minusWerewolfButtonPressed:(id)sender;
- (IBAction)plusWerewolfButtonPressed:(id)sender;
- (IBAction)minusSeerButtonPressed:(id)sender;
- (IBAction)plusSeerButtonPressed:(id)sender;
- (IBAction)minusBodyguardButtonPressed:(id)sender;
- (IBAction)plusBodyguardButtonPressed:(id)sender;
- (IBAction)minusMadmanButtonPressed:(id)sender;
- (IBAction)plusMadmanButtonPressed:(id)sender;
- (IBAction)minusMediumButtonPressed:(id)sender;
- (IBAction)plusMediumButtonPressed:(id)sender;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)startGameButtonPressed:(id)sender;

@end

@implementation CardSettingViewController

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

- (IBAction)minusWerewolfButtonPressed:(id)sender {
}

- (IBAction)plusWerewolfButtonPressed:(id)sender {
}

- (IBAction)minusSeerButtonPressed:(id)sender {
}

- (IBAction)plusSeerButtonPressed:(id)sender {
}

- (IBAction)minusbodyguardButtonPressed:(id)sender {
}

- (IBAction)plusBodyguardButtonPressed:(id)sender {
}

- (IBAction)minusMadmanButtonPressed:(id)sender {
}

- (IBAction)plusMadmanButtonPressed:(id)sender {
}

- (IBAction)minusMediumButtonPressed:(id)sender {
}

- (IBAction)plusMediumButtonPressed:(id)sender {
}

- (IBAction)backButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"back" sender:self];
}

- (IBAction)startGameButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"startGame" sender:self];
}
@end
