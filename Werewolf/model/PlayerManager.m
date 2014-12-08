//
//  PlayerStatus.m
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

static PlayerManager *playerStatus = nil;

+ (PlayerManager *)sharedManager{
    if (!playerStatus) {
        playerStatus = [[PlayerManager alloc] init];
    }
    return playerStatus;
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
