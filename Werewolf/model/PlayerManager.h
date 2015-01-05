//
//  PlayerStatus.h
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerManager : NSObject

@property (strong, nonatomic) NSMutableArray *position;
@property (strong, nonatomic) NSMutableArray *playerList;

+ (PlayerManager *)sharedManager;

- (void) gacha;

- (void) reset;

@end
