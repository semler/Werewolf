//
//  PlayerStatus.h
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerManager : NSObject

@property (strong, nonatomic) Player *player1;
@property (strong, nonatomic) Player *player2;
@property (strong, nonatomic) Player *player3;
@property (strong, nonatomic) Player *player4;
@property (strong, nonatomic) Player *player5;
@property (strong, nonatomic) Player *player6;
@property (strong, nonatomic) Player *player7;
@property (strong, nonatomic) Player *player8;
@property (strong, nonatomic) Player *player9;
@property (strong, nonatomic) Player *player10;
@property (strong, nonatomic) Player *player11;

@property (strong, nonatomic) NSMutableArray *position;
@property (strong, nonatomic) NSMutableArray *playerList;

+ (PlayerManager *)sharedManager;

- (void) gacha;

- (void) reset;

@end
