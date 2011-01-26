//
//  Scene.m
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Scene.h"
#import "GameCore.Scene.h"
#import "GameCore.Scene.Objects.h"
#import "SceneAction.h"

@implementation Scene

- (id) initWithGame:(Game *)theGame {
	self = [super initWithGame:theGame];
	if (self != nil) {
		items = [[NSMutableArray alloc] init];
		
		actions = [[NSMutableArray alloc] init];
		
		itemAdded = [[Event alloc] init];
		itemRemoved = [[Event alloc] init];
	}
	return self;
}

@synthesize itemAdded, itemRemoved,items;

- (void) addItem:(id)item {
	[actions addObject:[SceneAction actionWithOperation:SceneOperationAdd item:item]];
}

- (void) removeItem:(id)item {
	[actions addObject:[SceneAction actionWithOperation:SceneOperationRemove item:item]];
}

- (void) clear {
	for (id item in items) {
		[self removeItem:item];
	}
}

- (void) removeObjectsAtIndex:(NSMutableIndexSet*)set{
	[items removeObjectsAtIndexes:set];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state 
								   objects:(id *)stackbuf 
									 count:(NSUInteger)len {
    return [items countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	for (int i = 0; i < [actions count]; i++) {
		SceneAction *action = [actions objectAtIndex:i];
		
		// Retain the item so we guarantee it's alive during our operation.
		id item = [action.item retain];
		id<ISceneUser> sceneUser = [item conformsToProtocol:@protocol(ISceneUser)] ? item : nil;
		
		if (action.operation == SceneOperationAdd) {
			[items addObject:item];
			
			if (sceneUser) {
				sceneUser.scene = self;
				if ([sceneUser respondsToSelector:@selector(addedToScene:)]) {
					[sceneUser addedToScene:self];
				}
			}
			
			[itemAdded raiseWithSender:self eventArgs:[SceneEventArgs eventArgsWithItem:item]];
		} else {
			[items removeObject:item];
			
			if (sceneUser) {
				sceneUser.scene = nil;
				if ([sceneUser respondsToSelector:@selector(removedFromScene:)]) {
					[sceneUser removedFromScene:self];
				}
			}
			
			[itemRemoved raiseWithSender:self eventArgs:[SceneEventArgs eventArgsWithItem:item]];
		}
		
		// We've completed work with the item and can now release it.
		[item release];
	}
	
	[actions removeAllObjects];
}

- (void) dealloc
{
	[itemAdded release];
	[itemRemoved release];
	[actions release];
	[items release];
	[super dealloc];
}

@end
