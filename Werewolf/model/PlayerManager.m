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

- (void) gacha {
    //配列を初期化
    self.position = [NSMutableArray array];
    //要素になる数字
    NSInteger num;
    
    //要素を満たすまで繰り返す
    while (self.position.count < 3) {
        //乱数
        num = arc4random() % 3;
        
        //要素を検索
        NSUInteger index = [self.position indexOfObject:@(num)];
        
        if(index == NSNotFound){
            [self.position addObject:@(num)];
        }
    }
}







@end
