//
//  PlayerStatus.m
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "PlayerManager.h"
#import "GameStatus.h"

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
    }
    
    [PlayerManager sharedManager].player1.position = [self.position[0] intValue];
    [PlayerManager sharedManager].player2.position = [self.position[1] intValue];
    [PlayerManager sharedManager].player3.position = [self.position[2] intValue];
    [PlayerManager sharedManager].player4.position = [self.position[3] intValue];
    [PlayerManager sharedManager].player5.position = [self.position[4] intValue];
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
    self.player1.voteCount = 0;
    self.player2.voteCount = 0;
    self.player3.voteCount = 0;
    self.player4.voteCount = 0;
    self.player5.voteCount = 0;
    self.player6.voteCount = 0;
    self.player7.voteCount = 0;
    self.player8.voteCount = 0;
    self.player9.voteCount = 0;
    self.player10.voteCount = 0;
    self.player11.voteCount = 0;
    self.player1.isAttacked = NO;
    self.player2.isAttacked = NO;
    self.player3.isAttacked = NO;
    self.player4.isAttacked = NO;
    self.player5.isAttacked = NO;
    self.player6.isAttacked = NO;
    self.player7.isAttacked = NO;
    self.player8.isAttacked = NO;
    self.player9.isAttacked = NO;
    self.player10.isAttacked = NO;
    self.player11.isAttacked = NO;
    self.player1.isBanished = NO;
    self.player2.isBanished = NO;
    self.player3.isBanished = NO;
    self.player4.isBanished = NO;
    self.player5.isBanished = NO;
    self.player6.isBanished = NO;
    self.player7.isBanished = NO;
    self.player8.isBanished = NO;
    self.player9.isBanished = NO;
    self.player10.isBanished = NO;
    self.player11.isBanished = NO;
}

@end
