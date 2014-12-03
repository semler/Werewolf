//
//  PlayerStatus.h
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerStatus : NSObject

@property int playerCount;

+ (PlayerStatus *)sharedManager;



@end
