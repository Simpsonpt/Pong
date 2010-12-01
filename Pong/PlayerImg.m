//
//  PlayerImg.m
//  Pong
//
//  Created by Renato Rodrigues on 11/26/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "PlayerImg.h"
#import "Retronator.Pong.h"

@implementation PlayerImg

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
	}
	return self;
}

@synthesize position;

- (void) dealloc
{
	[position release];
	[super dealloc];
}

@end
