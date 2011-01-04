//
//  GameState.h
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Pong.classes.h"

@interface GameState : GameComponent 
{
	Pong *pong;
}

- (void) activate;
- (void) deactivate;

@end
