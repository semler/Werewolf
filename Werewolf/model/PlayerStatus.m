//
//  PlayerStatus.m
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import "PlayerStatus.h"

@implementation PlayerStatus

static PlayerStatus *playerStatus = nil;

+ (PlayerStatus *)sharedManager{
    if (!playerStatus) {
        playerStatus = [[PlayerStatus alloc] init];
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
