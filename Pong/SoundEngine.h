//
//  SoundEngine.h
//  Pong
//
//  Created by Patricia Rodrigues on 12/21/10.
//  Copyright 2010 Pathon Project. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Audio.h"
#import "Retronator.Pong.classes.h"

@interface SoundEngine : GameComponent {
	SoundEffect *soundEffects[SoundEffectTypes];
}

+ (void) initializeWithGame:(Game*)game;
+ (void) play:(SoundEffectType)type;
+ (SoundEffectInstance*) createInstance:(SoundEffectType)type;

/*- (void) playWith:(SoundEffectType)type vol:(NSInteger)volume;*/


@end
