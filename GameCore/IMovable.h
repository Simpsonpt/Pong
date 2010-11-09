//
//  IMovable.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IPosition.h"
#import "IVelocity.h"

@protocol IMovable <IPosition, IVelocity>

@end
