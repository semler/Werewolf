//
//  VoteManager.h
//  Werewolf
//
//  Created by semler on 2014/12/18.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoteManager : NSObject

+ (VoteManager *)sharedManager;

@property (strong, nonatomic) NSMutableArray *playerArray;
@property (nonatomic) int toAttack;

- (BOOL) banish;
- (BOOL) gameOverJudge;
- (BOOL) see:(int)num;
- (BOOL) guard:(int)num;
- (void) attack;
- (void) reset;
- (void) resetGuard;

@end
