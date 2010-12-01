//
//  AAHalfPlane.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HalfPlane.h"

@interface AAHalfPlane : HalfPlane {
	AxisDirection direction;
}

- (id) initWithDirection:(AxisDirection)theDirection distance:(float)theDistance;

+ (AAHalfPlane*) aaHalfPlaneWithDirection:(AxisDirection)theDirection distance:(float)theDistance;

@property (nonatomic) AxisDirection direction;

@end
