//
//  ReflexAgent.h
//  Pong
//
//  Created by Renato Rodrigues on 12/8/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AIPlayer.h"

@interface ReflexAgent : AIPlayer {
	// A simple reflex agent has no state variables, only constants.
	float attackFactor;	
}

@end

