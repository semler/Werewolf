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
#import "MarqueeLabel.h"

@interface CardSettingViewController ()

@property (nonatomic) int villageCount;
@property (nonatomic) int werewolfCount;
@property (nonatomic) int seerCount;
@property (nonatomic) int bodyguardCount;
@property (nonatomic) int madmanCount;
@property (nonatomic) int mediumCount;

@property (weak, nonatomic) IBOutlet MarqueeLabel *label;

@property (weak, nonatomic) IBOutlet UILabel *villageLabal;
@property (weak, nonatomic) IBOutlet UILabel *werewolfLabal;
@property (weak, nonatomic) IBOutlet UILabel *seerLabal;
@property (weak, nonatomic) IBOutlet UILabel *bodyguardLabal;
@property (weak, nonatomic) IBOutlet UILabel *madmanLabal;
@property (weak, nonatomic) IBOutlet UILabel *mediumLabal;
@property (weak, nonatomic) IBOutlet UIButton *minusWerewolfButton;
@property (weak, nonatomic) IBOutlet UIButton *plusWerewolfButton;
@property (weak, nonatomic) IBOutlet UIButton *minusSeerButton;
@property (weak, nonatomic) IBOutlet UIButton *plusSeerButton;
@property (weak, nonatomic) IBOutlet UIButton *minusBodyguardButton;
@property (weak, nonatomic) IBOutlet UIButton *plusBodyguardButton;
@property (weak, nonatomic) IBOutlet UIButton *minusMadmanButton;
@property (weak, nonatomic) IBOutlet UIButton *plusMadmanButton;
@property (weak, nonatomic) IBOutlet UIButton *minusMediumButton;
@property (weak, nonatomic) IBOutlet UIButton *plusMediumButton;

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([GameStatus sharedManager].playerCount == 5) {
        self.villageCount = 1;
        self.werewolfCount = 1;
        self.seerCount = 1;
        self.bodyguardCount = 1;
        self.madmanCount = 1;
        self.mediumCount = 0;
    } else if ([GameStatus sharedManager].playerCount == 6) {
        self.villageCount = 2;
        self.werewolfCount = 2;
        self.seerCount = 1;
        self.bodyguardCount = 1;
        self.madmanCount = 0;
        self.mediumCount = 0;
    } else if ([GameStatus sharedManager].playerCount == 7) {
        self.villageCount = 3;
        self.werewolfCount = 2;
        self.seerCount = 1;
        self.bodyguardCount = 1;
        self.madmanCount = 0;
        self.mediumCount = 0;
    } else if ([GameStatus sharedManager].playerCount == 8) {
        self.villageCount = 2;
        self.werewolfCount = 2;
        self.seerCount = 1;
        self.bodyguardCount = 1;
        self.madmanCount = 1;
        self.mediumCount = 1;
    } else if ([GameStatus sharedManager].playerCount == 9) {
        self.villageCount = 3;
        self.werewolfCount = 2;
        self.seerCount = 1;
        self.bodyguardCount = 1;
        self.madmanCount = 1;
        self.mediumCount = 1;
    } else if ([GameStatus sharedManager].playerCount == 10) {
        self.villageCount = 4;
        self.werewolfCount = 2;
        self.seerCount = 1;
        self.bodyguardCount = 1;
        self.madmanCount = 1;
        self.mediumCount = 1;
    } else if ([GameStatus sharedManager].playerCount == 11) {
        self.villageCount = 4;
        self.werewolfCount = 3;
        self.seerCount = 1;
        self.bodyguardCount = 1;
        self.madmanCount = 1;
        self.mediumCount = 1;
    }
    [self updateLabel];
    
    // アニメーションラベル
    self.label.marqueeType = MLContinuous;
    self.label.scrollDuration = 10.0f;
    self.label.fadeLength = 10.0f;
    self.label.trailingBuffer = 30.0f;
    self.label.text = @"役職を設定してください。すでにプレイヤ数に適化された役職人数が設定されていますが、調整ができます。";
    
    self.label.userInteractionEnabled = YES; // Don't forget this, otherwise the gesture recognizer will fail (UILabel has this as NO by default)
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pauseTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.label addGestureRecognizer:tapRecognizer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    if ([GameStatus sharedManager].playerCount == 5) {
        self.minusWerewolfButton.enabled = NO;
        self.plusWerewolfButton.enabled = NO;
        if (self.seerCount == 0) {
            self.minusSeerButton.enabled = NO;
            self.plusSeerButton.enabled = YES;
        } else if (self.seerCount == 1) {
            self.minusSeerButton.enabled = YES;
            self.plusSeerButton.enabled = NO;
        }
        if (self.bodyguardCount == 0) {
            self.minusBodyguardButton.enabled = NO;
            self.plusBodyguardButton.enabled = YES;
        } else if (self.bodyguardCount == 1) {
            self.minusBodyguardButton.enabled = YES;
            self.plusBodyguardButton.enabled = NO;
        }
        if (self.madmanCount == 0) {
            self.minusMadmanButton.enabled = NO;
            self.plusMadmanButton.enabled = YES;
        } else if (self.madmanCount == 1) {
            self.minusMadmanButton.enabled = YES;
            self.plusMadmanButton.enabled = NO;
        }
        self.minusMediumButton.enabled = NO;
        self.plusMediumButton.enabled = NO;
    } else if ([GameStatus sharedManager].playerCount == 6) {
        self.minusWerewolfButton.enabled = NO;
        self.plusWerewolfButton.enabled = NO;
        self.minusSeerButton.enabled = NO;
        self.plusSeerButton.enabled = NO;
        self.minusBodyguardButton.enabled = NO;
        self.plusBodyguardButton.enabled = NO;
        self.minusMadmanButton.enabled = NO;
        self.plusMadmanButton.enabled = NO;
        self.minusMediumButton.enabled = NO;
        self.plusMediumButton.enabled = NO;
    } else if ([GameStatus sharedManager].playerCount == 7) {
        self.minusWerewolfButton.enabled = NO;
        self.plusWerewolfButton.enabled = NO;
        self.minusSeerButton.enabled = NO;
        self.plusSeerButton.enabled = NO;
        self.minusBodyguardButton.enabled = NO;
        self.plusBodyguardButton.enabled = NO;
        self.minusMadmanButton.enabled = NO;
        self.plusMadmanButton.enabled = NO;
        self.minusMediumButton.enabled = NO;
        self.plusMediumButton.enabled = NO;
    } else if ([GameStatus sharedManager].playerCount == 8) {
        self.minusWerewolfButton.enabled = NO;
        self.plusWerewolfButton.enabled = NO;
        self.minusSeerButton.enabled = NO;
        self.plusSeerButton.enabled = NO;
        self.minusBodyguardButton.enabled = NO;
        self.plusBodyguardButton.enabled = NO;
        if (self.madmanCount == 0) {
            self.minusMadmanButton.enabled = NO;
            self.plusMadmanButton.enabled = YES;
        } else if (self.madmanCount == 1) {
            self.minusMadmanButton.enabled = YES;
            self.plusMadmanButton.enabled = NO;
        }
        if (self.mediumCount == 0) {
            self.minusMediumButton.enabled = NO;
            self.plusMediumButton.enabled = YES;
        } else if (self.mediumCount == 1) {
            self.minusMediumButton.enabled = YES;
            self.plusMediumButton.enabled = NO;
        }
    } else if ([GameStatus sharedManager].playerCount == 9) {
        if (self.werewolfCount == 2) {
            self.minusMadmanButton.enabled = NO;
            self.plusMadmanButton.enabled = YES;
        } else if (self.werewolfCount == 3) {
            self.minusMadmanButton.enabled = YES;
            self.plusMadmanButton.enabled = NO;
        }
        self.minusSeerButton.enabled = NO;
        self.plusSeerButton.enabled = NO;
        self.minusBodyguardButton.enabled = NO;
        self.plusBodyguardButton.enabled = NO;
        if (self.madmanCount == 0) {
            self.minusMadmanButton.enabled = NO;
            self.plusMadmanButton.enabled = YES;
        } else if (self.madmanCount == 1) {
            self.minusMadmanButton.enabled = YES;
            self.plusMadmanButton.enabled = NO;
        }
        if (self.mediumCount == 0) {
            self.minusMediumButton.enabled = NO;
            self.plusMediumButton.enabled = YES;
        } else if (self.mediumCount == 1) {
            self.minusMediumButton.enabled = YES;
            self.plusMediumButton.enabled = NO;
        }
    } else if ([GameStatus sharedManager].playerCount == 10) {
        if (self.werewolfCount == 2) {
            self.minusMadmanButton.enabled = NO;
            self.plusMadmanButton.enabled = YES;
        } else if (self.werewolfCount == 3) {
            self.minusMadmanButton.enabled = YES;
            self.plusMadmanButton.enabled = NO;
        }
        self.minusSeerButton.enabled = NO;
        self.plusSeerButton.enabled = NO;
        self.minusBodyguardButton.enabled = NO;
        self.plusBodyguardButton.enabled = NO;
        if (self.madmanCount == 0) {
            self.minusMadmanButton.enabled = NO;
            self.plusMadmanButton.enabled = YES;
        } else if (self.madmanCount == 1) {
            self.minusMadmanButton.enabled = YES;
            self.plusMadmanButton.enabled = NO;
        }
        if (self.mediumCount == 0) {
            self.minusMediumButton.enabled = NO;
            self.plusMediumButton.enabled = YES;
        } else if (self.mediumCount == 1) {
            self.minusMediumButton.enabled = YES;
            self.plusMediumButton.enabled = NO;
        }
    } else if ([GameStatus sharedManager].playerCount == 11) {
        self.minusWerewolfButton.enabled = NO;
        self.plusWerewolfButton.enabled = NO;
        self.minusSeerButton.enabled = NO;
        self.plusSeerButton.enabled = NO;
        self.minusBodyguardButton.enabled = NO;
        self.plusBodyguardButton.enabled = NO;
        if (self.madmanCount == 0) {
            self.minusMadmanButton.enabled = NO;
            self.plusMadmanButton.enabled = YES;
        } else if (self.madmanCount == 1) {
            self.minusMadmanButton.enabled = YES;
            self.plusMadmanButton.enabled = NO;
        }
        if (self.mediumCount == 0) {
            self.minusMediumButton.enabled = NO;
            self.plusMediumButton.enabled = YES;
        } else if (self.mediumCount == 1) {
            self.minusMediumButton.enabled = YES;
            self.plusMediumButton.enabled = NO;
        }
    }
}

- (IBAction)minusWerewolfButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        //
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
    } else if ([GameStatus sharedManager].playerCount == 9) {
        if (self.werewolfCount > 2) {
            self.werewolfCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 10) {
        if (self.werewolfCount > 2) {
            self.werewolfCount --;
            self.villageCount ++;
        }
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
        if (self.werewolfCount < 3) {
            self.werewolfCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 10) {
        if (self.werewolfCount < 3) {
            self.werewolfCount ++;
            self.villageCount --;
        }
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

- (IBAction)minusBodyguardButtonPressed:(id)sender {
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
        if (self.madmanCount > 0) {
            self.madmanCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 9) {
        if (self.madmanCount > 0) {
            self.madmanCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 10) {
        if (self.madmanCount > 0) {
            self.madmanCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 11) {
        if (self.madmanCount > 0) {
            self.madmanCount --;
            self.villageCount ++;
        }
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
        if (self.madmanCount < 1) {
            self.madmanCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 9) {
        if (self.madmanCount < 1) {
            self.madmanCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 10) {
        if (self.madmanCount < 1) {
            self.madmanCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 11) {
        if (self.madmanCount < 1) {
            self.madmanCount ++;
            self.villageCount --;
        }
    }
    
    [self updateLabel];
}

- (IBAction)minusMediumButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        //
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
        if (self.mediumCount > 0) {
            self.mediumCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 9) {
        if (self.mediumCount > 0) {
            self.mediumCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 10) {
        if (self.mediumCount > 0) {
            self.mediumCount --;
            self.villageCount ++;
        }
    } else if ([GameStatus sharedManager].playerCount == 11) {
        if (self.mediumCount > 0) {
            self.mediumCount --;
            self.villageCount ++;
        }
    }
    
    [self updateLabel];
}

- (IBAction)plusMediumButtonPressed:(id)sender {
    if ([GameStatus sharedManager].playerCount == 5) {
        //
    } else if ([GameStatus sharedManager].playerCount == 6) {
    } else if ([GameStatus sharedManager].playerCount == 7) {
    } else if ([GameStatus sharedManager].playerCount == 8) {
        if (self.mediumCount < 1) {
            self.mediumCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 9) {
        if (self.mediumCount < 1) {
            self.mediumCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 10) {
        if (self.mediumCount < 1) {
            self.mediumCount ++;
            self.villageCount --;
        }
    } else if ([GameStatus sharedManager].playerCount == 11) {
        if (self.mediumCount < 1) {
            self.mediumCount ++;
            self.villageCount --;
        }
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

- (void)pauseTap:(UITapGestureRecognizer *)recognizer {
    MarqueeLabel *label = (MarqueeLabel *)recognizer.view;
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (!label.isPaused) {
            [label pauseLabel];
        } else {
            [label unpauseLabel];
        }
    }
}
@end
