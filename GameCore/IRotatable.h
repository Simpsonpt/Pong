//
//  IRotatable.h
//  GameCore
//
//  Created by FRI Multimedija on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IRotation.h"
#import "IAngularVelocity.h"

@protocol IRotatable <IRotation, IAngularVelocity>

@end