//
//  SceneEventArgs.m
//  GameCore
//
//  Created by Renato Rodrigues on 11/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SceneEventArgs.h"


@implementation SceneEventArgs

- (id) initWithItem:(id)theItem;
{
	self = [super init];
	if (self != nil) {
		item = theItem;
	}
	return self;
}

+ (SceneEventArgs*) eventArgsWithItem:(id)theItem {
	return [[[SceneEventArgs alloc] initWithItem:theItem] autorelease];
}

@synthesize item;

@end

