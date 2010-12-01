//
//  MovementPhysics.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.classes.h"

@interface MovementPhysics : NSObject {
	
}

+ (void) simulateMovementOn:(id)item withElapsed:(float)elapsed;

@end