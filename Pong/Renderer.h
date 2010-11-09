//
//  Renderer.h
//  Pong
//
//  Created by Renato Rodrigues on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Pong.classes.h"
#import "DrawableGameComponent.h"

#import "GameCore.Graphics.h"

@interface Renderer : DrawableGameComponent {
	// Resources
	ContentManager *content;
	Sprite *padSprite; //*malletShadow;
	Sprite *ballSprite; //*puckShadow;
	
	//Texture2D *background;
	Vector2 *lightPosition;
	
	Sprite *backgroundSprite;
	Sprite *middleSprite;
	//Sprite *padSprite;
	//Sprite *ballSprite;
	Sprite *bonusSprite;
	
	//Graphics 
	SpriteBatch *spriteBatch;
	
	//Level
	Level *level;
	
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

@end
