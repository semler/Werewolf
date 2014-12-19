//
//  VoteManager.m
//  Werewolf
//
//  Created by semler on 2014/12/18.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "VoteManager.h"
#import "PlayerManager.h"
#import "GameStatus.h"
#import "Player.h"

@interface VoteManager ()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation VoteManager

static VoteManager *voteManager = nil;

+ (VoteManager *)sharedManager{
    if (!voteManager) {
        voteManager = [[VoteManager alloc] init];
    }
    return voteManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray arrayWithObjects:[NSMutableArray array], [PlayerManager sharedManager].player1, [PlayerManager sharedManager].player2, [PlayerManager sharedManager].player3, [PlayerManager sharedManager].player4, [PlayerManager sharedManager].player5, [PlayerManager sharedManager].player6, [PlayerManager sharedManager].player7, [PlayerManager sharedManager].player8, [PlayerManager sharedManager].player9, [PlayerManager sharedManager].player10, [PlayerManager sharedManager].player11, nil];
    }
    return self;
}

- (BOOL) banish {
    // 投票
    for (int i = 1; i <= [GameStatus sharedManager].playerCount; i ++) {
        Player *player = [self.array objectAtIndex:i];
        for (int j = 1; j <= [GameStatus sharedManager].playerCount; j ++) {
            if (player.voteTo == j) {
                Player *player2 = [self.array objectAtIndex:j];
                player2.voteCount ++;
            }
        }
    }
    
    // ステータス更新
    NSMutableArray *players = [NSMutableArray array];
    Player *player;
    Player *temp;
    player = [self.array objectAtIndex:1];
    [players addObject:player];
    for (int i = 2; i <= [GameStatus sharedManager].playerCount ; i ++) {
        if (self.array ) {
            temp = [self.array objectAtIndex:i];
            if (temp.voteCount > player.voteCount) {
                player = temp;
                [players removeAllObjects];
                [players addObject:player];
            } else if (temp.voteCount == player.voteCount) {
                player = temp;
                [players addObject:player];
            }
        }
    }
    if ([players count] == 1) {
        player = [players objectAtIndex:0];
        player.isBanished = YES;
        return YES;
    } else {
        // todo
        return NO;
    }
}

- (BOOL) gameOverJudge {

    return NO;
}

@end
