//
//  CaughtBall.m
//  Pong
//
//  Created by Renato Rodrigues on 11/27/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "CaughtBall.h"

@implementation CaughtBall

- (id) initWithBall:(Ball*)theBall offset:(float)theOffset
{
	self = [super init];
	if (self != nil) {
		ball = [theBall retain];
		offset = theOffset;
	}
	return self;
}

+ (CaughtBall *) caughtBallWithBall:(Ball*)theBall offset:(float)theOffset {
	return [[[CaughtBall alloc] initWithBall:theBall offset:theOffset] autorelease];
}

@synthesize ball, offset;

- (void) dealloc
{
	[ball release];
	[super dealloc];
}

@end
