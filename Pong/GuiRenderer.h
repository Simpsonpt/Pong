//
//  GuiRenderer.h
//  Pong
//
//  Created by Renato Rodrigues on 1/4/11.
//  Copyright 2011 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCore.Scene.h"
#import "Retronator.Pong.classes.h"

//#import "GameCore.Mirage.h"

@interface GuiRenderer : DrawableGameComponent 
{
	SpriteBatch *spriteBatch;
	
	id<IScene> scene;
}

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene;

@end
