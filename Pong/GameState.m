//
//  GameState.m
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import "GameState.h"

@implementation GameState

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		pong = (Pong*)self.game;
	}
	return self;
}

- (void) activate {}
- (void) deactivate {}

@end

