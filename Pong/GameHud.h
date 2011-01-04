//
//  GameHud.h
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Content.h"
#import "GameCore.Mirage.h"
#import "GameCore.Scene.h"
#import "Retronator.Pong.classes.h"

@interface GameHud : GameComponent {
	Scene *scene;
	
	Label *playerScore[2];
	
	Color *playerColor[2];
	float playerOpacity[2];
	
	PlayerPosition lastScore;
}

@property (nonatomic, readonly) id<IScene> scene;

- (void) changePlayerScoreFor:(PlayerPosition)position to:(int)value;

@end

