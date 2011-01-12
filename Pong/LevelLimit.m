//
//  LevelLimit.m
//  Pong
//
//  Created by Renato Rodrigues on 11/29/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "LevelLimit.h"
#import "Retronator.Pong.h"

@implementation LevelLimit

- (id) initWithLimit:(AAHalfPlane *)theLimit isDeadly:(BOOL)isDeadly
{
	self = [super init];
	if (self != nil) {
		limit = [theLimit retain];
		deadly = isDeadly;
	}
	return self;
}

@synthesize scene;

- (AAHalfPlane *) aaHalfPlane {
	return limit;
}

- (HalfPlane *) halfPlane {
	return limit;
}

- (BOOL) collidedWithItem:(id)item {
	if (deadly)
		[scene removeItem:item];
	return !deadly;
}

- (void) dealloc
{
	[scene release];
	[limit release];
	[super dealloc];
}

@end
