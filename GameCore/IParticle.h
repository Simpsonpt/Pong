//
//  IParticle.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IMovable.h"
#import "IMass.h"
#import "IParticleCollider.h"

@protocol IParticle <IMovable, IMass, IParticleCollider>

@end
