//
//  BaseViewController.h
//  Werewolf
//
//  Created by semler on 14/12/27.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameStatus.h"
#import "PlayerManager.h"
#import "VoteManager.h"

@interface BaseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *playerImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UITextView *positionText;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *playerButtons;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

@property (weak, nonatomic) Player *player;
@property (nonatomic) long vote;

@end
