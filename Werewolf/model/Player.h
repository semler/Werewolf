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
// 1:村人2:人狼3:預言者4:ボディガード5:狂人6:霊媒師
@property (nonatomic) int position;

@end

