//
//  Explosion.m
//  Pong
//
//  Created by Renato Rodrigues on 11/30/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "Explosion.h"
#import "GameCore.Scene.Objects.h"
//#import "GameCore.Everywhere.h"
#import "Retronator.Pong.h"

@implementation Explosion

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		lifetime = [[Lifetime alloc] initWithStart:0 duration:1];
		random = [Random int];
	}
	return self;
}

@synthesize position,lifetime,random, scene;

- (void) updateWithGameTime:(GameTime *)gameTime 
{
	/*Remove Explosion from the Scene*/
	if (lifetime) 
	{
		[lifetime updateWithGameTime:gameTime];
		if (!lifetime.isAlive) 
		{
			[lifetime release];
			lifetime = nil;
			[scene removeItem:self];
		}
	}
	
}

- (void) dealloc
{
	[lifetime release];
	[position release];
	[super dealloc];
}

@end
