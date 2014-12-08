//
//  GameStatus.h
//  Werewolf
//
//  Created by semler on 14-12-4.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameStatus : NSObject

@property int playerCount;
@property int currentPlayer;






+ (GameStatus *)sharedManager;

@end
