//
//  Block.m
//  Pong
//
//  Created by Renato Rodrigues on 1/19/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import "Block.h"
#import "Retronator.Pong.h"

@implementation Block

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		width = 84;
		height = 20;
		
		//velocity.y=400;
	}
	return self;
}

@synthesize position, width, height;

- (BOOL) collidingWithItem:(id)item {
	return YES;
}

- (void) collidedWithItem:(id)item 
{
	Pad *pad = [item isKindOfClass:[Pad class]] ? item : nil;
	if(pad) 
	{
		float offset = pad.position.x - position.x;
		float hitPosition = (offset) / width * 2;
		
		// Calculate angle.
		float angle = hitPosition * [Constants getInstance].maximumBallAngle;
		
		pad.position.x=sinf(angle+90);
		pad.position.y=445;
		
		position.x=20;
		position.y=445;
	}
}


@end
