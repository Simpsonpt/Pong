//
//  TouchPanelHelper.m
//  GameCore
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TouchPanelHelper.h"

static TouchCollection *touches = nil;

@implementation TouchPanelHelper

+ (void) initialize {
	touches = nil;
}

+ (TouchCollection *) getState {
	return touches;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[touches release];
	touches = [[TouchPanel getState] retain];
}

- (void) dealloc
{
	[touches release];
	[super dealloc];
}


@end

