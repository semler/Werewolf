//
//  Player.h
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"

@interface Player : NSObject

// 名前
@property (strong, nonatomic) NSString *name;

// 写真
//@property (strong, nonatomic) UIImage *image;

// 役職
@property (strong, nonatomic) Position *position;

@end

