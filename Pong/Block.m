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
		width = 35;
		height = 30;
		
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
		pad.position.x=155;
		//printf("Offset: %f\n",offset);
		pad.position.y=445;
		
		//printf("Pad Position: X: %f Y: %f",pad.position.x,pad.position.y);
		if(position.x<100)
		{
			position.x=20;
			position.y=445;
		}
		else 
		{
			position.x=299;
			position.y=445;
		}
	}
	Ball *ball = [item isKindOfClass:[Ball class]] ? item : nil;
	if(ball) 
	{
		position.x+=10;
		if(position.x>335)
			position.x=30;
	}
}


@end
