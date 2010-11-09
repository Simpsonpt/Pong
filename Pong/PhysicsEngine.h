//
//  PhysicsEngine.h
//  Pong
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhysicsEngine : GameComponent {
	// Level
	Level *level;
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

@end
