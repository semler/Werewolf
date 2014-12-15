//
//  GameStatus.h
//  Werewolf
//
//  Created by semler on 14-12-4.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameStatus : NSObject

@property (nonatomic) int playerCount;
@property (nonatomic) int currentPlayerInt;
@property (strong, nonatomic) Player *currentPlayer;
@property (nonatomic) int currentTurn;

@property (nonatomic) int villageCount;
@property (nonatomic) int werewolfCount;
@property (nonatomic) int seerCount;
@property (nonatomic) int bodyguardCount;
@property (nonatomic) int madmanCount;
@property (nonatomic) int mediumCount;






+ (GameStatus *)sharedManager;

@end
