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

@interface Renderer : DrawableGameComponent 
{	
	AnimatedSprite *explosionSprite;
	
	/*Pads Types*/
	Sprite *padSprite[3];
	
	/*Balls Types*/
	Sprite *ballSprite[4];
	
	/*Static Images*/
	Sprite *playerSprite;
	Sprite *backgroundSprite;
	Sprite *middleSprite;
	
	/*Bonus Types*/
	Sprite *bonusSprite[BonusTypes];

	/*Gameover Sprite*/
	Sprite *gameoverSprite;
	
	/*Graphics*/ 
	SpriteBatch *spriteBatch;
	PrimitiveBatch *primitiveBatch;
	
	/*Gameplay Object*/
	Gameplay *gameplay;
}

- (id) initWithGame:(Game*)theGame gameplay:(Gameplay*)theGameplay;


@end
