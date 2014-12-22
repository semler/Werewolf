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
        self.playerArray = [NSMutableArray array];
    }
    return self;
}

- (BOOL) banish {
    // 投票
//    for (int i = 1; i <= [GameStatus sharedManager].playerCount; i ++) {
//        Player *player = [self.array objectAtIndex:i];
//        if (player.isAttacked == NO && player.isBanished == NO){
//            for (int j = 1; j <= [GameStatus sharedManager].playerCount; j ++) {
//                if (player.voteTo == j) {
//                    Player *player2 = [self.array objectAtIndex:j];
//                    player2.voteCount ++;
//                }
//            }
//        }
//    }
    
    // ステータス更新
    NSMutableArray *players = [NSMutableArray array];
    [players addObject:[PlayerManager sharedManager].player1];
    Player *player;
    
    player = [players objectAtIndex:0];
    if([PlayerManager sharedManager].player2.voteCount > player.voteCount) {
        [players removeAllObjects];
        [players addObject:[PlayerManager sharedManager].player2];
    } else if ([PlayerManager sharedManager].player2.voteCount == player.voteCount) {
        [players addObject:[PlayerManager sharedManager].player2];
    }
    player = [players objectAtIndex:0];
    if([PlayerManager sharedManager].player3.voteCount > player.voteCount) {
        [players removeAllObjects];
        [players addObject:[PlayerManager sharedManager].player3];
    } else if ([PlayerManager sharedManager].player3.voteCount == player.voteCount) {
        [players addObject:[PlayerManager sharedManager].player3];
    }
    player = [players objectAtIndex:0];
    if([PlayerManager sharedManager].player4.voteCount > player.voteCount) {
        [players removeAllObjects];
        [players addObject:[PlayerManager sharedManager].player4];
    } else if ([PlayerManager sharedManager].player4.voteCount == player.voteCount) {
        [players addObject:[PlayerManager sharedManager].player4];
    }
    player = [players objectAtIndex:0];
    if([PlayerManager sharedManager].player5.voteCount > player.voteCount) {
        [players removeAllObjects];
        [players addObject:[PlayerManager sharedManager].player5];
    } else if ([PlayerManager sharedManager].player5.voteCount == player.voteCount) {
        [players addObject:[PlayerManager sharedManager].player5];
    }


//    Player *temp;
//    player = [self.array objectAtIndex:1];
//    [players addObject:player];
//    for (int i = 2; i <= [GameStatus sharedManager].playerCount; i ++) {
//        if (self.array ) {
//            temp = [self.array objectAtIndex:i];
//            if (temp.voteCount > player.voteCount) {
//                player = temp;
//                [players removeAllObjects];
//                [players addObject:player];
//            } else if (temp.voteCount == player.voteCount) {
//                player = temp;
//                [players addObject:player];
//            }
//        }
//    }
    
    Player *player2;
    if ([players count] == 1) {
        player2 = [players objectAtIndex:0];
        
        if (player2.playerNum == 1) {
            [PlayerManager sharedManager].player1.isBanished = YES;
        } else if (player2.playerNum == 2) {
            [PlayerManager sharedManager].player2.isBanished = YES;
        } else if (player2.playerNum == 3) {
            [PlayerManager sharedManager].player3.isBanished = YES;
        } else if (player2.playerNum == 4) {
            [PlayerManager sharedManager].player4.isBanished = YES;
        } else if (player2.playerNum == 5) {
            [PlayerManager sharedManager].player5.isBanished = YES;
        }
        
        if (player2.position == 0) {
            [GameStatus sharedManager].villageCount --;
        } else if (player2.position == 1) {
            [GameStatus sharedManager].werewolfCount --;
        } else if (player2.position == 2) {
            [GameStatus sharedManager].seerCount --;
        } else if (player2.position == 3) {
            [GameStatus sharedManager].bodyguardCount --;
        } else if (player2.position == 4) {
            [GameStatus sharedManager].madmanCount --;
        }
        [GameStatus sharedManager].alivePlayerCount --;
        
        return YES;
    } else {
        for (int i = 0; i < [players count]; i ++) {
            Player *player2 = [players objectAtIndex:i];
            [self.playerArray addObject:[NSString stringWithFormat:@"Player%@", @(player2.playerNum)]];
        }
        
        return NO;
    }
}

- (BOOL) gameOverJudge {
    if([GameStatus sharedManager].werewolfCount == 0) {
        return YES;
    }
    
    if ([GameStatus sharedManager].alivePlayerCount <= [GameStatus sharedManager].werewolfCount * 2) {
        return YES;
    }
    return NO;
}

- (BOOL) see:(int)num {
    Player *player = [self.array objectAtIndex:num];
    if (player.position == 1) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) guard:(int)num {
    Player *player;
    if (num == 1) {
        player = [PlayerManager sharedManager].player1;
        if (!player.isGuardedLast) {
            player.isGuarded = YES;
            return YES;
        }
    } else if (num == 2) {
        player = [PlayerManager sharedManager].player2;
        if (!player.isGuardedLast) {
            player.isGuarded = YES;
            return YES;
        }
    } else if (num == 3) {
        player = [PlayerManager sharedManager].player3;
        if (!player.isGuardedLast) {
            player.isGuarded = YES;
            return YES;
        }
    } else if (num == 4) {
        player = [PlayerManager sharedManager].player4;
        if (!player.isGuardedLast) {
            player.isGuarded = YES;
            return YES;
        }
    } else if (num == 5) {
        player = [PlayerManager sharedManager].player5;
        if (!player.isGuardedLast) {
            player.isGuarded = YES;
            return YES;
        }
    }
    return NO;
}

- (void) attack {
    Player *player;
    
    if (self.toAttack == 1) {
        player = [PlayerManager sharedManager].player1;
        if (!player.isGuarded) {
            player.isAttacked = YES;
            [GameStatus sharedManager].alivePlayerCount --;
        }
    } else if (self.toAttack == 2) {
        player = [PlayerManager sharedManager].player2;
        if (!player.isGuarded) {
            player.isAttacked = YES;
            [GameStatus sharedManager].alivePlayerCount --;
        }
    } else if (self.toAttack == 3) {
        player = [PlayerManager sharedManager].player3;
        if (!player.isGuarded) {
            player.isAttacked = YES;
            [GameStatus sharedManager].alivePlayerCount --;
        }
    } else if (self.toAttack == 4) {
        player = [PlayerManager sharedManager].player4;
        if (!player.isGuarded) {
            player.isAttacked = YES;
            [GameStatus sharedManager].alivePlayerCount --;
        }
    } else if (self.toAttack == 5) {
        player = [PlayerManager sharedManager].player5;
        if (!player.isGuarded) {
            player.isAttacked = YES;
            [GameStatus sharedManager].alivePlayerCount --;
        }
    }
    
}

- (void) reset {
    //[self.playerArray removeAllObjects];
    [PlayerManager sharedManager].player1.voteCount = 0;
    [PlayerManager sharedManager].player2.voteCount = 0;
    [PlayerManager sharedManager].player3.voteCount = 0;
    [PlayerManager sharedManager].player4.voteCount = 0;
    [PlayerManager sharedManager].player5.voteCount = 0;
    [PlayerManager sharedManager].player6.voteCount = 0;
    [PlayerManager sharedManager].player7.voteCount = 0;
    [PlayerManager sharedManager].player8.voteCount = 0;
    [PlayerManager sharedManager].player9.voteCount = 0;
    [PlayerManager sharedManager].player10.voteCount = 0;
    [PlayerManager sharedManager].player11.voteCount = 0;
}

- (void) resetGuard {
    if ([PlayerManager sharedManager].player1.isGuarded) {
        [PlayerManager sharedManager].player1.isGuarded = NO;
        [PlayerManager sharedManager].player1.isGuardedLast = YES;
    } else {
        [PlayerManager sharedManager].player1.isGuardedLast = NO;
    }
    if ([PlayerManager sharedManager].player2.isGuarded) {
        [PlayerManager sharedManager].player2.isGuarded = NO;
        [PlayerManager sharedManager].player2.isGuardedLast = YES;
    } else {
        [PlayerManager sharedManager].player2.isGuardedLast = NO;
    }
    if ([PlayerManager sharedManager].player3.isGuarded) {
        [PlayerManager sharedManager].player3.isGuarded = NO;
        [PlayerManager sharedManager].player3.isGuardedLast = YES;
    } else {
        [PlayerManager sharedManager].player3.isGuardedLast = NO;
    }
    if ([PlayerManager sharedManager].player4.isGuarded) {
        [PlayerManager sharedManager].player4.isGuarded = NO;
        [PlayerManager sharedManager].player4.isGuardedLast = YES;
    } else {
        [PlayerManager sharedManager].player4.isGuardedLast = NO;
    }
    if ([PlayerManager sharedManager].player5.isGuarded) {
        [PlayerManager sharedManager].player5.isGuarded = NO;
        [PlayerManager sharedManager].player5.isGuardedLast = YES;
    } else {
        [PlayerManager sharedManager].player5.isGuardedLast = NO;
    }
}

@end
