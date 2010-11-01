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

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
	}
	return self;
}

//Auto Generate the Get & Set 
@synthesize position;

- (void) dealloc
{
	[position release];
	[super dealloc];
}

@end
