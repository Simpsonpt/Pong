//
//  AIRenderer.h
//  Pong
//
//  Created by Renato Rodrigues on 12/8/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.h"
#import "GameCore.Graphics.h"
#import "Retronator.Pong.classes.h"

@interface AIRenderer : DrawableGameComponent 
{
	PrimitiveBatch *primitiveBatch;
	
	AIPlayer *aiPlayer;
}

- (id) initWithGame:(Game *)theGame aiPlayer:(AIPlayer*)theAIPlayer;

@end
