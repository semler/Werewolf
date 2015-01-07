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
        self.playerArray = [NSMutableArray array];
    }
    return self;
}

- (BOOL) banish {
    // ステータス更新
    NSMutableArray *players = [NSMutableArray array];
    [players addObject:[[PlayerManager sharedManager].playerList objectAtIndex:0]];
    
    Player *temp;
    Player *player0;
    for (int i = 1; i < [PlayerManager sharedManager].playerList.count; i ++) {
        player0 = [players objectAtIndex:0];
        temp = [[PlayerManager sharedManager].playerList objectAtIndex:i];
        if (temp.voteCount > player0.voteCount) {
            [players removeAllObjects];
            [players addObject:temp];
        } else if (temp.voteCount == player0.voteCount) {
            [players addObject:temp];
        }
    }
    
    Player *player;
    if ([players count] == 1) {
        player = [players objectAtIndex:0];
        player.isBanished = YES;
        [GameStatus sharedManager].alivePlayerCount --;
        return YES;
    } else {
        for (int i = 0; i < [players count]; i ++) {
            player = [players objectAtIndex:i];
            [self.playerArray addObject:[NSString stringWithFormat:@"Player%@", @(player.playerNum + 1)]];
        }
        
        return NO;
    }
}

- (BOOL) guard:(long)num {
    Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:num];
    if (!player.isGuardedLast) {
        player.isGuarded = YES;
        return YES;
    }
    return NO;
}

- (void) attack {
    Player *player = [[PlayerManager sharedManager].playerList objectAtIndex:self.toAttack];
    if (!player.isGuarded) {
        player.isAttacked = YES;
        [GameStatus sharedManager].alivePlayerCount --;
    }
}

- (void) resetGuard {
    for (Player *player in [PlayerManager sharedManager].playerList) {
        if (player.isGuarded) {
            player.isGuarded = NO;
            player.isGuardedLast = YES;
        } else {
            player.isGuardedLast = NO;
        }
    }
}

@end
