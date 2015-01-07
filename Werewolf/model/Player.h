//
//  Player.h
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Player : NSObject

// 写真
@property (strong, nonatomic) UIImage *image;
// 役職
// 0:村人1:人狼2:預言者3:ボディガード4:狂人5:霊媒師
@property (nonatomic) int position;

// player番号
@property (nonatomic) long playerNum;
// 票数
@property (nonatomic) int voteCount;
// 追放
@property (nonatomic) BOOL isBanished;
// 襲撃
@property (nonatomic) BOOL isAttacked;
// 守られる
@property (nonatomic) BOOL isGuarded;
@property (nonatomic) BOOL isGuardedLast;

@end

