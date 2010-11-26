//
//  AxisAlignedHalfPlane.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HalfPlane.h"

@interface AxisAlignedHalfPlane : HalfPlane {
	AxisDirection direction;
}

- (id) initWithDirection:(AxisDirection)theDirection distance:(float)theDistance;

+ (AxisAlignedHalfPlane*) axisAlignedHalfPlaneWithDirection:(AxisDirection)theDirection distance:(float)theDistance;

@property (nonatomic) AxisDirection direction;

@end
