//
//  SceneAction.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SceneAction.h"

@implementation SceneAction

@synthesize operation, item;

+ (SceneAction*) actionWithOperation:(SceneOperation)theOperation item:(id)theItem {
	SceneAction *action = [[[SceneAction alloc] init] autorelease];
	action.operation = theOperation;
	action.item = theItem;
	return action;
}

- (void) dealloc
{
	[item release];
	[super dealloc];
}


@end
