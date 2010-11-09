//
//  Level.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.h"

#import "Retronator.Pong.classes.h"

@interface Level : GameComponent {
	
	Scene *scene;
	
	Bg *background;
	Middle *md;
	
	Pad *topPlayer;
	Pad *bottomPlayer;
	
	Ball *ball;
	Bonus *bonus;
}
//@property (nonatomic, readonly) Scene *scene;
@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Pad *topPlayer;
@property (nonatomic, readonly) Pad *bottomPlayer;
@property (nonatomic, readonly) Ball *ball;

@end
