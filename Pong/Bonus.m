//
//  Bonus.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Bonus.h"
#import "Retronator.Pong.h"

@implementation Bonus

- (id) initWithType:(BonusType)theType {
	return [self initWithType:theType duration:0];
}

- (id) initWithType:(BonusType)theType duration:(NSTimeInterval)theDuration;
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];

		mass = 1;
		radius = 11;
		
		type = theType;
		duration = theDuration;
	}
	return self;
}

@synthesize position,velocity,type,lifetime,scene,mass,radius;

- (BOOL) collidingWithItem:(id)item {
	return [item isKindOfClass:[Ball class]];
}

- (void) activateWithParent:(Ball *)theParent 
{
	active = YES;
	parent = [theParent retain];
	if(duration) 
	{
		lifetime = [[Lifetime alloc] initWithStart:0 duration:duration];
	}
}

- (void) deactivate {
	active = NO;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	if (lifetime) {
		[lifetime updateWithGameTime:gameTime];
		if (!lifetime.isAlive) {
			[lifetime release];
			lifetime = nil;
			[self deactivate];
		}
	}
}

- (void) dealloc
{
	[scene release];
	[lifetime release];
	[parent release];
	[position release];
	[super dealloc];
}

@end

