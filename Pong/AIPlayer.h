//
//  AIPlayer.h
//  Pong
//
//  Created by Renato Rodrigues on 12/8/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Player.h"

@interface AIPlayer : Player {
	Level *level;
	
	// AI player properties
	float speed;
	float attackSpeed;
	
	// Quotes
	NSMutableArray *quotes;
	
	@private
	BOOL attack;
	Vector2 *target;
}

- (id) initWithGame:(Game *)theGame scene:(id <IScene>)theScene pad:(Pad *)thePad level:(Level*)theLevel position:(PlayerPosition)thePosition;

//- (id) initWithPad:(Pad *)thePad scene:(id <IScene>)theScene position:(PlayerPosition)thePosition game:(Game*)game;

@property (nonatomic, readonly) Level *level;
@property (nonatomic, readonly) Vector2 *target;

// Percepts
- (NSArray*) getDefenseDangers;
- (NSArray*) getOffenseWeaknesses;

// Actions
- (void) moveTowards:(Vector2*)theTarget;
- (void) attackTowards:(Vector2*)theTarget;

@end
