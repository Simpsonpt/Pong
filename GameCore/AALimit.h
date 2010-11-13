//
//  AALimit.h
//  GameCore
//
//  Created by Renato Rodrigues on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameCore.Scene.Objects.h"
#import "GameCore.Math.h"

@interface AALimit : NSObject <IAxisAlignedHalfPlaneCollider> {
	AxisAlignedHalfPlane *limit;
}

- (id) initWithLimit:(AxisAlignedHalfPlane*)theLimit;

@end
