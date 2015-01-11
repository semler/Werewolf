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
@property (nonatomic) long toAttack;
@property (nonatomic) long lastDead;

- (BOOL) banish;
- (BOOL) guard:(long)num;
- (void) attack;
- (void) resetGuard;

@end
