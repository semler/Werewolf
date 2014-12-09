//
//  CardSettingViewController.m
//  Werewolf
//
//  Created by semler on 14-12-8.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "CardSettingViewController.h"
#import "GameStatus.h"
#import "PlayerManager.h"

@interface CardSettingViewController ()

@property (nonatomic) int villageCount;
@property (nonatomic) int werewolfCount;
@property (nonatomic) int seerCount;
@property (nonatomic) int bodyguardCount;
@property (nonatomic) int madmanCount;
@property (nonatomic) int mediumCount;
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
- (IBAction)minusbodyguardButtonPressed:(id)sender;
- (IBAction)plusBodyguardButtonPressed:(id)sender;
- (IBAction)minusMadmanButtonPressed:(id)sender;
- (IBAction)plusMadmanButtonPressed:(id)sender;
- (IBAction)minusMediumButtonPressed:(id)sender;
- (IBAction)plusMediumButtonPressed:(id)sender;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)startGameButtonPressed:(id)sender;

@end

@implementation CardSettingViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].playerCount == 5) {
        self.villageCount = 1;
        self.werewolfCount = 1;
        self.seerCount = 1;
        self.bodyguardCount = 1;
        self.madmanCount = 1;
        self.mediumCount = 0;
        [self updateLabel];
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

- (void) updateLabel {
    self.villageLabal.text = [NSString stringWithFormat:@"%d", self.villageCount];
    self.werewolfLabal.text = [NSString stringWithFormat:@"%d", self.werewolfCount];
    self.seerLabal.text = [NSString stringWithFormat:@"%d", self.seerCount];
    self.bodyguardLabal.text = [NSString stringWithFormat:@"%d", self.bodyguardCount];
    self.madmanLabal.text = [NSString stringWithFormat:@"%d", self.madmanCount];
    self.mediumLabal.text = [NSString stringWithFormat:@"%d", self.mediumCount];
}

- (IBAction)minusWerewolfButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        //
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)plusWerewolfButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        //
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)minusSeerButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        if (self.seerCount > 0) {
            self.seerCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)plusSeerButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        if (self.seerCount < 1) {
            self.seerCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)minusbodyguardButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        if (self.bodyguardCount > 0) {
            self.bodyguardCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)plusBodyguardButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        if (self.bodyguardCount < 1) {
            self.bodyguardCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)minusMadmanButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        if (self.madmanCount > 0) {
            self.madmanCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)plusMadmanButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        if (self.madmanCount < 1) {
            self.madmanCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)minusMediumButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        //
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)plusMediumButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        //
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
    } else if ([GameStatus sharedManager].playerCount == 10) {
    } else if ([GameStatus sharedManager].playerCount == 11) {
    }
    
    [self updateLabel];
}

- (IBAction)backButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"back" sender:self];
}

- (IBAction)startGameButtonPressed:(id)sender {
    [GameStatus sharedManager].villageCount = self.villageCount;
    [GameStatus sharedManager].werewolfCount = self.werewolfCount;
    [GameStatus sharedManager].seerCount = self.seerCount;
    [GameStatus sharedManager].bodyguardCount = self.bodyguardCount;
    [GameStatus sharedManager].madmanCount = self.madmanCount;
    [GameStatus sharedManager].mediumCount = self.mediumCount;
    
    // 役職決定
    [[PlayerManager sharedManager] gacha];
    
    if ([GameStatus sharedManager].playerCount == 5) {
        [self performSegueWithIdentifier:@"startGame5" sender:self];
    } else if ([GameStatus sharedManager].playerCount == 6) {
        [self performSegueWithIdentifier:@"startGame6" sender:self];
    } else if ([GameStatus sharedManager].playerCount == 7) {
        [self performSegueWithIdentifier:@"startGame7" sender:self];
    } else if ([GameStatus sharedManager].playerCount == 8) {
        [self performSegueWithIdentifier:@"startGame8" sender:self];
    } else if ([GameStatus sharedManager].playerCount == 9) {
        [self performSegueWithIdentifier:@"startGame9" sender:self];
    } else if ([GameStatus sharedManager].playerCount == 10) {
        [self performSegueWithIdentifier:@"startGame10" sender:self];
    } else if ([GameStatus sharedManager].playerCount == 11) {
        [self performSegueWithIdentifier:@"startGame11" sender:self];
    }
}
@end
