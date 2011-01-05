//
//  Gameplay.h
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Pong.classes.h"
#import "GameState.h"

@interface Gameplay:GameState {
	Level *level;
	GameHud *hud;
	Player *topPlayer;
	Player *bottomPlayer;

	GuiRenderer *hudRenderer;
	Renderer *renderer;	
	PhysicsEngine *physics;
}

@property (nonatomic, readonly) Level *level;

- (id) initMultiplayerWithGame:(Game*)theGame levelClass:(Class)levelClass;
- (id) initSinglePlayerWithGame:(Game*)theGame levelClass:(Class)levelClass aiClass:(Class)aiClass;

- (float) calculateCurrentBallSpeed;
- (void) resetLevel;
- (void) reset;

@end

