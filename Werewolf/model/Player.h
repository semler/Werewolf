//
//  Player.h
//  Werewolf
//
//  Created by semler on 14-12-3.
//  Copyright (c) 2014年 semler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Position.h"

@interface Player : NSObject

// 写真
@property (strong, nonatomic) UIImage *image;

// 役職
@property (strong, nonatomic) Position *position;

@end

