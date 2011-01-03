//
//  SoundEngine.m
//  Pong
//
//  Created by Patricia Rodrigues on 12/21/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import "SoundEngine.h"

#import "Retronator.Xni.Framework.Content.h"

SoundEngine *instance;

@implementation SoundEngine

+ (void) initializeWithGame:(Game*)game {
	instance = [[SoundEngine alloc] initWithGame:game];
	[game.components addComponent:instance];
}

- (void) initialize {
	soundEffects[SoundEffectTypeExplo] = [self.game.content load:@"Explo"];
	soundEffects[SoundEffectTypeExplo] = [self.game.content load:@"Loop"];
	soundEffects[SoundEffectTypePad] = [self.game.content load:@"Pad"];
//	soundEffects[SoundEffectTypeLose] = [self.game.content load:@"Lose"];
//	soundEffects[SoundEffectTypeWin] = [self.game.content load:@"Win"];
}

- (void) play:(SoundEffectType)type {
	[soundEffects[type] play];
}

+ (void) play:(SoundEffectType)type {
	[instance play:type];
}

- (void) dealloc
{
	for (int i = 0; i < SoundEffectTypes; i++) {
		[soundEffects[i] release];
	}
	[super dealloc];
}


@end

