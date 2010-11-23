//
//  AnimatedSpriteFrame.h
//  GameCore
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Graphics.classes.h"

@interface AnimatedSpriteFrame : NSObject {
	Sprite *sprite;
	NSTimeInterval start;
}

- (id) initWithSprite:(Sprite*)theSprite start:(NSTimeInterval)theStart;
+ (id) frameWithSprite:(Sprite*)theSprite start:(NSTimeInterval)theStart;

@property (nonatomic, readonly) Sprite *sprite;
@property (nonatomic, readonly) NSTimeInterval start;

@end

