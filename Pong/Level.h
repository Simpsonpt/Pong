//
//  Level.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Pong.classes.h"

@interface Level : NSObject {
	
	Scene *scene;
	
	Bg *background;
	Middle *md;
	
	Pad *player1pad;
	Pad *player2pad;
	
	Ball *ball;
	Bonus *bonus;
}
@property (nonatomic, readonly) Scene *scene;

@end
