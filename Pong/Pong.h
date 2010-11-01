//
//  Pong.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.h"

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Input.Touch.h"

#import "Retronator.Pong.classes.h"

@interface Pong : Game {
	GraphicsDeviceManager *graphics;
	
	Renderer *renderer;
	
	Level *currentLevel;
	
	// Levels
	NSMutableArray *levels;
}

- (void) loadLevel:(Level*) level;

@end

