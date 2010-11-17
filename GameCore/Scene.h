//
//  Scene.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IScene.h"

@interface Scene : NSObject <IScene> {
	NSMutableArray *items;
}

//- (void) addItem:(id)item;
//- (void) removeObjectsAtIndex:(id)item;

@end
