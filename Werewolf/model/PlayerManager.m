//
//  PlayerStatus.m
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "PlayerManager.h"
#import "GameStatus.h"
#import "VoteManager.h"

@implementation PlayerManager

static PlayerManager *playerManager = nil;

+ (PlayerManager *)sharedManager{
    if (!playerManager) {
        playerManager = [[PlayerManager alloc] init];
    }
    return playerManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}

// ランダムで役職決定
- (void) gacha {
    //配列を初期化
    self.position = [NSMutableArray array];
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *array0 = [NSMutableArray array];
    NSMutableArray *array1 = [NSMutableArray array];
    NSMutableArray *array2 = [NSMutableArray array];
    NSMutableArray *array3 = [NSMutableArray array];
    NSMutableArray *array4 = [NSMutableArray array];
    NSMutableArray *array5 = [NSMutableArray array];

    for (int i = 0; i < [GameStatus sharedManager].villageCount; i ++) {
        [self random: array subArray:array0];
    }
    for (int i = 0; i < [GameStatus sharedManager].werewolfCount; i ++) {
        [self random: array subArray:array1];
    }
    for (int i = 0; i < [GameStatus sharedManager].seerCount; i ++) {
        [self random: array subArray:array2];
    }
    for (int i = 0; i < [GameStatus sharedManager].bodyguardCount; i ++) {
        [self random: array subArray:array3];
    }
    for (int i = 0; i < [GameStatus sharedManager].madmanCount; i ++) {
        [self random: array subArray:array4];
    }
    for (int i = 0; i < [GameStatus sharedManager].mediumCount; i ++) {
        [self random: array subArray:array5];
    }
    
    for (int i = 0; i < [GameStatus sharedManager].playerCount; i ++) {
        for (int j = 0; j < array0.count; j ++) {
            if ([array0[j] integerValue] == i) {
                [self.position addObject:@(0)];
                break;
            }
        }
        for (int j = 0; j < array1.count; j ++) {
            if ([array1[j] integerValue] == i) {
                [self.position addObject:@(1)];
                break;
            }
        }
        for (int j = 0; j < array2.count; j ++) {
            if ([array2[j] integerValue] == i) {
                [self.position addObject:@(2)];
                break;
            }
        }
        for (int j = 0; j < array3.count; j ++) {
            if ([array3[j] integerValue] == i) {
                [self.position addObject:@(3)];
                break;
            }
        }
        for (int j = 0; j < array4.count; j ++) {
            if ([array4[j] integerValue] == i) {
                [self.position addObject:@(4)];
                break;
            }
        }
        for (int j = 0; j < array5.count; j ++) {
            if ([array5[j] integerValue] == i) {
                [self.position addObject:@(5)];
                break;
            }
        }
    }
    
    Player *player;
    for (int i = 0; i < [GameStatus sharedManager].playerCount; i ++) {
        player = [self.playerList objectAtIndex:i];
        player.position = [self.position[i] intValue];
    }
}

- (void) random:(NSMutableArray*) array subArray:(NSMutableArray*) subArray {
    BOOL flg = NO;
    
    while (!flg) {
        int num = arc4random() % [GameStatus sharedManager].playerCount;
        //要素を検索
        NSUInteger index = [array indexOfObject:@(num)];
        if(index == NSNotFound){
            [array addObject:@(num)];
            [subArray addObject:@(num)];
            flg = YES;
        }
    }
}

- (void) reset {
    for (Player *player in self.playerList) {
        player.voteCount = 0;
        player.isBanished = NO;
        player.isAttacked = NO;
    }
}

- (void) resetVote {
    for (Player *player in self.playerList) {
        player.voteCount = 0;
    }
    [[VoteManager sharedManager].playerArray removeAllObjects];
}

@end
