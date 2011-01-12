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
	soundEffects[SoundEffectTypePad] = [self.game.content load:@"Pad"];
	soundEffects[SoundEffectTypeGameSound] = [self.game.content load:@"GameSound"];
	soundEffects[SoundEffectTypeClick] = [self.game.content load:@"Click"];
//	soundEffects[SoundEffectTypeLose] = [self.game.content load:@"Lose"];
//	soundEffects[SoundEffectTypeWin] = [self.game.content load:@"Win"];
}

- (void) play:(SoundEffectType)type {
	[soundEffects[type] play];
}

- (SoundEffectInstance*) createInstance:(SoundEffectType)type {
	return [soundEffects[type] createInstance];
}

/*- (void) playWith:(SoundEffectType)type vol:(NSInteger)volume
{
	[soundEffects[type] playWithVolume:volume];
}*/


+ (void) play:(SoundEffectType)type {
	[instance play:type];
}

+ (SoundEffectInstance*) createInstance:(SoundEffectType)type {
	return [instance createInstance:type];
}

- (void) dealloc
{
	for (int i=0;i<SoundEffectTypes;i++) 
	{
		[soundEffects[i] release];
	}
	[super dealloc];
}


@end

