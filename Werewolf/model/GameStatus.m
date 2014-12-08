//
//  GameStatus.m
//  Werewolf
//
//  Created by semler on 14-12-4.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "GameStatus.h"

@implementation GameStatus

static GameStatus *gameStatus = nil;

+ (GameStatus *)sharedManager{
    if (!gameStatus) {
        gameStatus = [[GameStatus alloc] init];
    }
    return gameStatus;
}

- (id)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}

@end
